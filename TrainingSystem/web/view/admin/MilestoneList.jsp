<%-- 
    Document   : MilestoneList
    Created on : Oct 7, 2022, 4:40:58 PM
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Milestone List Page</title>
        <!-- FAVICONS ICON ============================================= -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="shortcut icon" type="image/x-icon" href="../../view/admin/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title> Milestone List </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="../../view/admin/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="../../view/admin/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="../../view/admin/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="../../view/admin/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="../../view/admin/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="../../view/admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="../../view/admin/assets/css/color/color-1.css">

        <!-- PAGINATION ============================================= -->
        <link href="../../view/admin/assets/css/pagination.css" rel="stylesheet" type="text/css"/>
        <script src="../../view/admin/assets/js/pagination.js" type="text/javascript"></script>

        <!-- SORTTABLE ============================================= -->
        <script src="../../view/admin/assets/js/sorttable.js" type="text/javascript"></script>
        <link href="../../view/admin/assets/css/sorttable.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">

        <!-- header start -->
        <%@include file="./AdminHeader.jsp"%>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <%@include file="./Navbar.jsp"%>
        <!-- Left sidebar menu end -->

        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">User List</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="../../manage/dashboard/view"><i class="fa fa-home"></i>Home</a></li>
                        <li>Milestone List</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title row">
                                    <h4 class="center pt-2 float-left">Milestone List</h4>
                                <div class="btn btn-success btn-outline-primary ml-auto mr-3 row col-2"><a href="detail">
                                        <i class="fa fa-plus-circle" style="font-size:18px"></i>
                                        <spam clas="mb-5">Add new milestone</spam></a>
                                </div>
                            </div>
                            <c:if test="${success != null}">
                                <h6 class="alert-success pl-5">Add successful!</h6>
                            </c:if>
                            <div class="container-fluid row ml-5 mt-5">
                                <div class="col-lg-12 col-12 col-md-12 col-sm-12 row">
                                    <form class="col-12 row" action="list" method="GET" id="filter">
                                        <div class="form-group row col-4 ml-0 p-0 m-0">
                                            <div class="col-sm-8 p-0 m-0 col-8">
                                                <select class="p-0 m-0" name="class" onchange="document.getElementById('filter').submit();">
                                                    <option value="-1" 
                                                            <c:if test="${classId == -1}"> selected </c:if>
                                                                >---Select class---</option>
                                                    <c:forEach var="class_mile" items="${classes}"> 
                                                        <option 
                                                            <c:if test="${classId == class_mile.getClass_id()}"> selected </c:if>
                                                            value="${class_mile.getClass_id()}"
                                                            >${class_mile.getClass_code()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row col-4 ml-0 p-0 m-0">
                                            <div class="col-sm-8 col-8 m-0">
                                                <select name="status" onchange="document.getElementById('filter').submit();">
                                                    <option value="-1" <c:if test="${status == -1}"> selected </c:if>>---Select status---</option>
                                                    <option value="0" <c:if test="${status == 0}"> selected </c:if>>Open</option>
                                                    <option value="1" <c:if test="${status == 1}"> selected </c:if>>In Progress</option>
                                                    <option value="2" <c:if test="${status == 2}"> selected </c:if>>Closed</option>
                                                    </select>
                                                </div>                                       
                                            </div>

                                            <div class="form-group row col-4 ml-0">
                                                <div class="search-box col-lg-10 col-10 col-md-10 col-sm-10 d-inline mr-0 pr-0">
                                                    <i class="fa fa-search ml-3"></i>
                                                    <input type="text" class="form-control" placeholder="Search&hellip;" name="search"
                                                    <c:if test="${search != null}">
                                                        value ="${search}"
                                                    </c:if>
                                                    >
                                            </div>

                                            <div class="search-box col-lg-2 col-1 col-md-2 col-sm-2 p-0 m-0">
                                                <input class="btn pl-3 pr-3" type="submit" value="Search">
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                            <div class="widget-inner">
                                <div id="setting_list">
                                    <table class="table table-striped table-hover table-bordered sortable">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Title</th>
                                                <th>Assignment</th>
                                                <th>Class</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Status</th>
                                                <th class="text-center sorttable_nosort">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="milestone" items="${milestones}">
                                                <tr>
                                                    <td id="id">${milestone.getId()}</td>
                                                    <td id="name">${milestone.getTitle()}</td>
                                                    <td>${milestone.getAss().getTitle()}</td>
                                                    <td>${milestone.getClass_milestone().getClass_code()}</td>
                                                    <td>${milestone.getFrom_date()}</td>
                                                    <td>${milestone.getTo_date()}</td>
                                                    <c:if test="${milestone.getStatus() == 0}">
                                                        <td id="status">Open</td>
                                                    </c:if>
                                                    <c:if test="${milestone.getStatus() == 1}">
                                                        <td id="status">In Progress</td>
                                                    </c:if>
                                                        <c:if test="${milestone.getStatus() == 2}">
                                                        <td id="status">Closed</td>
                                                    </c:if>
                                                    <td class="text-center">
                                                        <a href="modelStatus" data-toggle="modal" data-target="#modelStatus" 
                                                               class="p-2 updateStatus" title="Edit" data-toggle="tooltip">
                                                            <i class='material-icons fas fa-cogs'></i>
                                                        </a>
                                                        <a href="detail?milestoneId=${milestone.getId()}" class="p-2" title="Edit" data-toggle="tooltip"><i class="material-icons fas">&#xf044;</i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- Modal -->
                            <div id="modelStatus" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <form action="list" method="GET">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title left">Warning</h4>
                                                <button type="button" class="close right" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <p></p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </div>
                                        <input type="hidden" name="milestoneId" id="milestoneId">
                                        <input type="hidden" name="updateStatus" id="updateStatus">
                                        <input type="hidden" name="ass" id="ass" value="${assId}">
                                        <input type="hidden" name="class" id="class" value="${classId}">
                                        <input type="hidden" name="class" id="status" value="${status}">
                                        <input type="hidden" name="search" id="search" value="${search}">
                                        <input type="hidden" name="page" id="page" value="${pageindex}">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
                <div id="pagination"></div>
            </div>
        </main>
        <div class="ttr-overlay"></div>

        <!-- External JavaScripts -->
        <script src="../../view/admin/assets/js/jquery.min.js"></script>
        <script src="../../view/admin/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="../../view/admin/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="../../view/admin/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="../../view/admin/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="../../view/admin/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="../../view/admin/assets/vendors/counter/waypoints-min.js"></script>
        <script src="../../view/admin/assets/vendors/counter/counterup.min.js"></script>
        <script src="../../view/admin/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="../../view/admin/assets/vendors/masonry/masonry.js"></script>
        <script src="../../view/admin/assets/vendors/masonry/filter.js"></script>
        <script src="../../view/admin/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src='../../view/admin/assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="../../view/admin/assets/js/functions.js"></script>
        <script src="../../view/admin/assets/vendors/chart/chart.min.js"></script>
        <script src="../../view/admin/assets/js/admin.js"></script>
        <script>
                                                    pagger_render("pagination",${pageindex},${totalpage}, 2, 'list?ass=${assId}&class=${classId}&search=${search}');
        </script>
        <script>
            $(document).ready(function () {
                $('table .updateStatus').on('click', function () {
                    var id = $(this).parent().parent().find('#id').text();
                    var name = $(this).parent().parent().find('#name').text();
                    var status = $(this).parent().parent().find('#status').text();
                    if(status === 'Open'){
                        $('#modelStatus .modal-body').children().text('Do you want to change ' + name + ' to In Progress');
                        $('#modelStatus #milestoneId').val(id);
                        $('#modelStatus #updateStatus').val('0');
                    }
                    if(status === 'In Progress'){
                        $('#modelStatus .modal-body').children().text('Do you want to change ' + name + ' to Closed');
                        $('#modelStatus #milestoneId').val(id);
                        $('#modelStatus #updateStatus').val('1');
                    }
                    if(status === 'Closed'){
                        $('#modelStatus .modal-body').children().text('Do you want to change ' + name + ' to Open');
                        $('#modelStatus #milestoneId').val(id);
                        $('#modelStatus #updateStatus').val('2');
                    }
                });
            });
        </script>
    </body>
</html>
