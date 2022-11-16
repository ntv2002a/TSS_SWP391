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
            <form class="col-12 row" action="list" method="POST" id="filter">
                <div class="container-fluid">
                    <div class="db-breadcrumb">
                        <h4 class="breadcrumb-title">Setting List</h4>
                        <ul class="db-breadcrumb-list">
                            <li><a href="../../manage/dashboard/view"><i class="fa fa-home"></i>Home</a></li>
                            <li>Setting List</li>
                        </ul>
                    </div>	
                    <div class="row">
                        <!-- Your Profile Views Chart -->
                        <div class="col-lg-12 m-b30">
                            <div class="widget-box">
                                <div class="wc-title row">
                                <h4 class="center pt-2 float-left">Setting List</h4>
                                
                                <div class="btn btn-success btn-outline-primary ml-auto mr-3 row col-2 float-right"><a href="detail">
                                        <i class="fa fa-plus-circle" style="font-size:18px"></i>
                                        <spam clas="mb-5">Add new setting</spam></a>
                                </div>
                            </div>
                                <div class="container-fluid row ml-5 mt-5">
                                    <div class="col-lg-12 col-12 col-md-12 col-sm-12 row">
                                        <div class="form-group row col-4">
                                            <label class="col-sm-3 col-form-label">Type:</label>
                                            <div class="col-sm-9">
                                                <select name="type" onchange="document.getElementById('filter').submit();">
                                                    <option value="-1"> All </option>
                                                    <c:forEach items="${requestScope.types}" var="t">

                                                        <option value="${t.setting_id}" 
                                                                <c:if test="${param.type eq t.setting_id or requestScope.type_id eq t.setting_id}"> selected </c:if>
                                                                    >
                                                                ${t.setting_title}
                                                        </option>

                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row col-4 ml-0">
                                            <label class="col-sm-3 col-form-label">Status:</label>
                                            <div class="col-sm-9">
                                                <select name="status" onchange="document.getElementById('filter').submit();">
                                                    <option value="both" <c:if test="${param.status eq 'both' or requestScope.status eq null}"> selected </c:if> > Both </option>
                                                    <option value="active" <c:if test="${param.status eq 'active' or requestScope.status eq 'active'}"> selected </c:if> > Active </option>
                                                    <option value="inactive" <c:if test="${param.status eq 'inactive' or requestScope.status eq 'inactive'}"> selected </c:if> > Inactive </option>
                                                    </select>
                                                </div>                                       
                                            </div>

                                            <div class="search-box col-lg-3 col-3 col-md-3 col-sm-3 d-inline">
                                                <i class="fa fa-search ml-3"></i>
                                                <input type="text" class="form-control" placeholder="Title" name="title"
                                                <c:choose>
                                                    <c:when test="${empty param.title && requestScope.title ne null}">
                                                        value="${requestScope.title}"
                                                    </c:when>
                                                    <c:otherwise>
                                                        value="${param.title}"
                                                    </c:otherwise>
                                                </c:choose>
                                                >
                                        </div>

                                        <div class="search-box col-lg-1 col-1 col-md-1 col-sm-1">
                                            <input class="btn pl-3 pr-3" type="submit" value="Search">
                                        </div>

                                    </div>
                                </div>
                                <div class="widget-inner">
                                    <table class="table table-hover table-bordered sortable">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Type</th>
                                                <th>Title</th>
                                                <th>Value</th>
                                                <th>Order</th>
                                                <th class="sorttable_nosort">Status</th>
                                                <th colspan="2" class="sorttable_nosort" style="text-align: center">Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.settings}" var="s">
                                                <tr>
                                                    <td id="id">${s.setting_id}</td>
                                                    <td >${s.type_id.setting_title}</td>
                                                    <td>${s.setting_title}</td>
                                                    <td>${s.setting_value}</td>
                                                    <td>${s.display_order}</td>
                                                    <td>
                                                        <c:if test="${s.status}">
                                                            Active
                                                        </c:if>
                                                        <c:if test="${not s.status}">
                                                            Inactive
                                                        </c:if>
                                                    </td>
                                                    <td class="text-center" id="status_change_${s.setting_id}">
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

                                                        <a href="detail?id=${s.setting_id}" class="p-2" title="Edit" data-toggle="tooltip"><i class="material-icons fa">&#xf044;</i></a>
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
