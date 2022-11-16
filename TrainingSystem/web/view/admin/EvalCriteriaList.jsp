<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../../view/admin/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title> Eval Criteria List </title>

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
            <form action="list" method="POST" id="filter">
                <div class="container-fluid">
                    <div class="db-breadcrumb">
                        <h4 class="breadcrumb-title">Eval Criteria List</h4>
                        <ul class="db-breadcrumb-list">
                            <li><a href="../../manage/dashboard/view"><i class="fa fa-home"></i>Home</a></li>
                            <li>Eval Criteria List</li>
                        </ul>
                    </div>	
                    <div class="row">
                        <!-- Your Profile Views Chart -->
                        <div class="col-lg-12 m-b30">
                            <div class="widget-box">
                                <div class="wc-title row">
                                    <h4>Eval Criteria List</h4>
                                    <div class="btn btn-success btn-outline-primary ml-auto mr-3 row col-2"><a href="detail?action=add">
                                        <i class="fa fa-plus-circle" style="font-size:18px"></i>
                                        <spam clas="mb-5">Add new eval criteria</spam></a>
                                </div>
                                </div>
                                <div class="container-fluid row ml-5 mt-5">
                                    <div class="col-lg-12 col-12 col-md-12 col-sm-12 row">
                                        <div class="form-group row col-2 ml-0 p-0 m-0">
                                            <label class="col-sm-4 col-3 p-0 m-0">Subject:</label>
                                            <div class="col-sm-2 m-0 col-8">
                                                <select class="p-0 m-0" name="subject" onchange="document.getElementById('filter').submit();">
                                                    <option value="-1"> All </option>
                                                    <c:forEach items="${requestScope.subjects}" var="s">

                                                        <option value="${s.id}" 
                                                                <c:if test="${param.subject_id eq s.id or requestScope.subject_id eq s.id}"> selected </c:if>
                                                                    >
                                                                ${s.code}
                                                        </option>

                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row col-3 ml-0 p-0 m-0">
                                            <label class="col-sm-5 col-5 p-0 m-0">Assignment:</label>
                                            <div class="col-sm-7 p-0 m-0 col-7">
                                                <select name="assignment" onchange="document.getElementById('filter').submit();">
                                                    <option value="-1"> All </option>
                                                    <c:forEach items="${requestScope.assess}" var="a">

                                                        <option value="${a.ass_id}" 
                                                                <c:if test="${param.ass_id eq a.ass_id or requestScope.ass_id eq a.ass_id}"> selected </c:if>
                                                                    >
                                                                ${a.title}
                                                        </option>

                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row col-2 ml-0 p-0 m-0">
                                            <label class="col-sm-5 col-3">Status:</label>
                                            <div class="col-sm-2 col-8 m-0">
                                                <select name="status" onchange="document.getElementById('filter').submit();">
                                                    <option value="both" <c:if test="${param.status eq 'both' or requestScope.status eq null}"> selected </c:if> > Both </option>
                                                    <option value="active" <c:if test="${param.status eq 'active' or requestScope.status eq 'active'}"> selected </c:if> > Active </option>
                                                    <option value="inactive" <c:if test="${param.status eq 'inactive' or requestScope.status eq 'inactive'}"> selected </c:if> > Inactive </option>
                                                    </select>
                                                </div>                                       
                                            </div>

                                            <div class="form-group row col-3 ml-0">
                                                <div class="search-box col-lg-10 col-10 col-md-10 col-sm-10 d-inline mr-0 pr-0">
                                                    <i class="fa fa-search ml-3"></i>
                                                    <input type="text" class="form-control" placeholder="Criteria Name" name="criteria_name"
                                                    <c:choose>
                                                        <c:when test="${empty param.criteria_name && requestScope.criteria_name ne null}">
                                                            value="${requestScope.criteria_name}"
                                                        </c:when>
                                                        <c:otherwise>
                                                            value="${param.criteria_name}"
                                                        </c:otherwise>
                                                    </c:choose>
                                                    >
                                            </div>

                                            <div class="search-box col-lg-1 col-1 col-md-1 col-sm-1 p-0 m-0">
                                                <input class="btn pl-3 pr-3" type="submit" value="Search">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-inner">
                                    <table class="table table-hover table-bordered sortable">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Assignment</th>
                                                <th>Milestone</th>
                                                <th>Name</th>
                                                <th class="sorttable_nosort">Status</th>
                                                <th>Description</th>
                                                <th>Subject</th>
                                                <th colspan="2" class="sorttable_nosort" style="text-align: center">Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.eval_criterias}" var="ec">
                                                <tr>
                                                    <td id="id">${ec.criteria_id}</td>
                                                    <td>${ec.ass_id.title}</td>
                                                    <td>${ec.milestone_id.title}</td>
                                                    <td>${ec.criteria_name}</td>
                                                    <td>
                                                        <c:if test="${ec.status}">
                                                            Active
                                                        </c:if>
                                                        <c:if test="${not ec.status}">
                                                            Inactive
                                                        </c:if>
                                                    </td>
                                                    <td>${ec.description}</td>
                                                    <td>${ec.ass_id.subject_id.name}</td>
                                                    <td class="text-center" id="status_change_${ec.criteria_id}">
                                                        <c:if test="${ec.status}">
                                                            <a href="modelStatus" data-toggle="modal" data-target="#modelStatus"
                                                               class="p-2 inactiveStatus" title="Edit" data-toggle="tooltip" style="cursor: pointer">
                                                                <i class="material-icons fa fa-toggle-on" style="color: green"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${not ec.status}">
                                                            <a href="modelStatus" data-toggle="modal" data-target="#modelStatus"
                                                               class="p-2 activeStatus" title="Edit" data-toggle="tooltip" style="cursor: pointer">
                                                                <i class="material-icons fa fa-toggle-off"></i>
                                                            </a>
                                                        </c:if>

                                                        <a href="detail?id=${ec.criteria_id}&action=edit" class="p-2" title="Edit" data-toggle="tooltip"><i class="material-icons fa">&#xf044;</i></a>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                    <div id="pagination"></div>
                                </div>
                            </div>
                            <!-- Modal -->
                            <div id="modelStatus" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->

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
                                            <button type="submit" class="btn btn-primary" onclick="document.getElementById('filter').submit()">Save changes</button>
                                        </div>

                                        <input type="hidden" name="status_change" id="status_change">
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </form>
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
        <script src="../../view/admin/assets/vendors/chart/chart.min.js"></script>
        <script src="../../view/admin/assets/js/admin.js"></script>
        <script>
                                                pagger_render("pagination",${requestScope.pageindex},${requestScope.totalpage}, 2, "list?");

                                                $(document).ready(function () {
                                                    $('table .activeStatus').on('click', function () {
                                                        var id = $(this).parent().parent().find('#id').text();

                                                        $('#modelStatus .modal-body').children().text('Do you want to activate status ');
                                                        $('#modelStatus #status_change').val("activate_" + id);
                                                    });
                                                    $('table .inactiveStatus').on('click', function () {
                                                        var id = $(this).parent().parent().find('#id').text();

                                                        $('#modelStatus .modal-body').children().text('Do you want to deactivate status ');
                                                        $('#modelStatus #status_change').val("deactivate_" + id);
                                                    });
                                                });


        </script>
    </body>

</html>
