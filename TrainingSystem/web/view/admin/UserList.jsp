<%-- 
    Document   : UserList
    Created on : Sep 22, 2022, 10:32:31 AM
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List Page</title>
        <!-- FAVICONS ICON ============================================= -->

        <link rel="shortcut icon" type="image/x-icon" href="../../view/admin/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title> User List </title>

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
                        <li>User List</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>User List</h4>
                            </div>
                            <div class="container-fluid row ml-5 mt-5">
                                <div class="col-lg-12 col-12 col-md-12 col-sm-12 row">
                                    <form class="col-12 row" action="list" method="GET" id="filter">
                                        <div class="form-group row col-4">
                                            <div class="col-sm-9">
                                                <select name="role" onchange="document.getElementById('filter').submit();">
                                                    <option value="-1" 
                                                            <c:if test="${role == -1}"> selected </c:if>
                                                                >---Select role---</option>
                                                    <c:forEach var="setting" items="${settings}">                                            
                                                        <option 
                                                            <c:if test="${role == setting.setting_id}"> selected </c:if>
                                                            value="${setting.getSetting_id()}"
                                                            >${setting.getSetting_title()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row col-4 ml-0">
                                            <div class="col-sm-9">
                                                <select name="status" onchange="document.getElementById('filter').submit();">
                                                    <option value="-1" <c:if test="${status == -1}"> selected </c:if>>---Select status---</option>
                                                    <option value="1" <c:if test="${status == 1}"> selected </c:if>>Active</option>
                                                    <option value="0" <c:if test="${status == 0}"> selected </c:if>>Inactive</option>
                                                    <option value="2" <c:if test="${status == 2}"> selected </c:if>>Unverified</option>
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
                                <div id="setting_list">
                                    <table class="table table-striped table-hover table-bordered sortable">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Full Name</th>
                                                <th>Email</th>
                                                <th>Mobile</th>
                                                <th>Role</th>
                                                <th>Status</th>
                                                <th class="text-center sorttable_nosort">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${users}">
                                                <tr>
                                                    <td id="id">${user.getId()}</td>
                                                    <td id="name">${user.getFullname()}</td>
                                                    <td>${user.getEmail()}</td>
                                                    <td>${user.getMobile()}</td>
                                                    <td>${user.getRole()}</td>
                                                    <c:if test="${user.getStatus() == 1}">
                                                        <td>Active</td>
                                                    </c:if>
                                                    <c:if test="${user.getStatus() == 0}">
                                                        <td>Inactive</td>
                                                    </c:if>
                                                    <c:if test="${user.getStatus() == 2}">
                                                        <td>Unverified</td>
                                                    </c:if>
                                                    <td class="text-center">
                                                        <c:if test="${user.getStatus() == 1}">
                                                            <a href="modelStatus" data-toggle="modal" data-target="#modelStatus" 
                                                               class="p-2 inactiveStatus" title="Edit" data-toggle="tooltip">
                                                                <i class="material-icons fa fa-toggle-on" style="color: green"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${user.getStatus() != 1}">
                                                            <a href="modelStatus" data-toggle="modal" data-target="#modelStatus" 
                                                               class="p-2 activeStatus" title="Edit" data-toggle="tooltip">
                                                                <i class="material-icons fa fa-toggle-off"></i>
                                                            </a>
                                                        </c:if>
                                                        <a href="detail?userId=${user.getId()}" class="p-2" title="Edit" data-toggle="tooltip"><i class="material-icons fa">&#xf044;</i></a>
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
                                        <input type="hidden" name="userId" id="userId">
                                        <input type="hidden" name="updateStatus" id="updateStatus">
                                        <input type="hidden" name="role" id="role" value="${role}">
                                        <input type="hidden" name="status" id="status" value="${status}">
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
            pagger_render("pagination",${pageindex},${totalpage}, 2, 'list?role=${role}&status=${status}&search=${search}');
        </script>
        <script>
            $(document).ready(function (){
                $('table .activeStatus').on('click', function (){
                    var id = $(this).parent().parent().find('#id').text();
                    var name = $(this).parent().parent().find('#name').text();
                    $('#modelStatus .modal-body').children().text('Do you want to active status '+name);
                    $('#modelStatus #userId').val(id);
                    $('#modelStatus #updateStatus').val('0');
                });
                $('table .inactiveStatus').on('click', function (){
                    var id = $(this).parent().parent().find('#id').text();
                    var name = $(this).parent().parent().find('#name').text();
                    $('#modelStatus .modal-body').children().text('Do you want to inactive status '+name);
                    $('#modelStatus #userId').val(id);
                    $('#modelStatus #updateStatus').val('1');
                });
            });
        </script>
    </body>
</html>
