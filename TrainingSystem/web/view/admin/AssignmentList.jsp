
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <!-- META ============================================= -->

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../../view/admin/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title> Setting List </title>

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
                    <h4 class="breadcrumb-title">Assignment List</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="../../manage/dashboard/view"><i class="fa fa-home"></i>Home</a></li>
                        <li>Assignment List</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">

                            <div class="wc-title row">
                                <h4>Assignment List</h4>
                                <div class="btn btn-success btn-outline-primary ml-auto mr-3 row col-2"><a href="detail">
                                        <i class="fa fa-plus-circle" style="font-size:18px"></i>
                                        <spam clas="mb-5">Add new assignment</spam></a>
                                </div>
                                <c:if test="${success != null}">
                                    <h6 class="alert-success">Update successful!</h6>
                                </c:if> 
                            </div>
                            <c:if test="${success != null}">
                                <h6 class="alert-success">Update successful!</h6>
                            </c:if> 
                            <div class="container-fluid row ml-5 mt-5">
                                <div class="col-lg-12 col-12 col-md-12 col-sm-12 row">

                                    <form class="col-12 row" action="list" method="GET" id="filter">

                                        <div class="form-group row col-4 ">

                                            <div class="col-sm-8">
                                                <select class="form-control" name="subject" onchange="document.getElementById('filter').submit();">

                                                    <option value="-1" 
                                                            <c:if test=""> selected </c:if>
                                                                >All Subject</option>
                                                    <c:forEach items="${requestScope.sub}" var="su" >                                            
                                                        <option 
                                                            <c:if test="${su.id == subject}"> selected </c:if>
                                                            value="${su.id}"
                                                            >${su.code}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row col-4 ml-0">

                                            <div class="col-sm-9">
                                                <select class="form-control" name="status" onchange="document.getElementById('filter').submit();">

                                                    <option value="-1" <c:if test="${status == -1}"> selected </c:if>>All Status</option>
                                                    <option value="1" <c:if test="${status == 1}"> selected </c:if>>Active</option>
                                                    <option value="0" <c:if test="${status == 0}"> selected </c:if>>Inactive</option>                                                    
                                                    </select>
                                                </div>                                       
                                            </div>

                                            <div class="search-box col-lg-3 col-3 col-md-3 col-sm-3 d-inline">
                                                <i class="fa fa-search ml-3"></i>
                                                <input type="text" class="form-control" placeholder="Search&hellip;" name="search"
                                                <c:if test="${search != null}">
                                                    value ="${search}"
                                                </c:if>
                                                >
                                        </div>

                                        <div class="search-box col-lg-1 col-1 col-md-1 col-sm-1">
                                            <input class="btn pl-3 pr-3" type="submit" value="Search">
                                        </div>

                                    </form>
                                </div>
                            </div>

                            <div class="widget-inner">

                                <table class="table table-hover table-bordered sortable">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Subject</th>
                                            <th>Title</th>
                                            <th>Body</th>
                                            <th>Weight</th>
                                            <th class="sorttable_nosort">Status</th>
                                            <th colspan="2" class="sorttable_nosort" style="text-align: center">Action</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.ass}" var="s">
                                            <tr>
                                                <td>${s.ass_id}</td>
                                                <td>${s.subject_name}</td>
                                                <td>${s.title}</td>
                                                <td>${s.ass_body}</td>
                                                <td>${s.eval_weight}</td>
                                                <c:if test="${s.status == true}">
                                                    <td>Active</td>
                                                </c:if>
                                                <c:if test="${s.status == false}">
                                                    <td>Inactive</td>
                                                </c:if>
                                                
                                                <td class="text-center" id="status_change_${ec.criteria_id}">
                                                    <c:if test="${s.status}">
                                                        <a href="modelStatus" data-toggle="modal" data-target="#modelStatus"
                                                           class="p-2 inactiveStatus" title="Edit" data-toggle="tooltip" style="cursor: pointer">
                                                            <i class="material-icons fa fa-toggle-on" style="color: green"></i>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${not s.status}">
                                                        <a href="modelStatus" data-toggle="modal" data-target="#modelStatus"
                                                           class="p-2 activeStatus" title="Edit" data-toggle="tooltip" style="cursor: pointer">
                                                            <i class="material-icons fa fa-toggle-off"></i>
                                                        </a>
                                                    </c:if>
                                                    <a href="detail?ass_id=${s.ass_id}" class="p-2" title="Edit" data-toggle="tooltip"><i class="material-icons fa">&#xf044;</i></a>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>


                                <div id="pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
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
    <script src="../../view/admin/assets/vendors/chart/chart.min.js"></script>
    <script src="../../view/admin/assets/js/admin.js"></script>
    <script>
                                                    pagger_render("pagination",${requestScope.pageindex},${requestScope.totalpage}, 2, "list?");

                                                    function changeStatus(setting_id, action) {
                                                        var changed = document.getElementById("status_change_" + setting_id);

                                                        const input = document.createElement("input");
                                                        input.setAttribute("name", "status_change");
                                                        input.setAttribute("type", "hidden");
                                                        input.setAttribute("value", action + "_" + setting_id);

                                                        changed.appendChild(input);

                                                        document.getElementById("filter").submit();
                                                    }
    </script>
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
                <input type="hidden" name="userId" id="userId">
                <input type="hidden" name="updateStatus" id="updateStatus">
                <input type="hidden" name="role" id="role" value="${role}">
                <input type="hidden" name="status" id="status" value="${status}">
                <input type="hidden" name="search" id="search" value="${search}">
                <input type="hidden" name="page" id="page" value="${pageindex}">
            </form>
        </div>
    </div>
</body>

</html>
