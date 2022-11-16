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
        <title> System Permission </title>

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
                    <h4 class="breadcrumb-title">System Permission</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="../../manage/dashboard/view"><i class="fa fa-home"></i>Home</a></li>
                        <li>System Permission</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>System Permission</h4>
                            </div>
                            <div class="widget-inner">
                                <div id="setting_list">
                                    <input type="hidden" id="totalPages" value="${requestScope.totalpage}">  
                                    <form class="col-12 row" method="POST" action="permission" id="permission">
                                        <table class="table table-hover table-bordered sortable">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                        <c:forEach items="${requestScope.roles}" var="r">
                                                        <th class="sorttable_nosort">${r.setting_title}</th>
                                                        </c:forEach>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.screens}" var="s">
                                                    <tr>
                                                        <td>
                                                            ${s.setting_title}
                                                        </td>
                                                        <c:forEach items="${requestScope.roles}" var="r">
                                                            <c:set var = "flag" value = "false"/>
                                                            <c:forEach items="${requestScope.perms}" var="p">
                                                                <c:if test="${(p.screen_id eq s.setting_id) and (p.role_id eq r.setting_id)}">
                                                                    <c:set var = "flag" value = "true"/>
                                                                    <td>
                                                                        <input type="checkbox" id="get_data_${s.setting_id}_${r.setting_id}" name="${s.setting_id}_${r.setting_id}" value="1"
                                                                               <c:if test="${p.get_all_data}">
                                                                                   checked
                                                                               </c:if>
                                                                               <c:if test="${r.setting_id == 11}">
                                                                                   disabled
                                                                               </c:if>
                                                                               >
                                                                        <label for="get_data_${s.setting_id}_${r.setting_id}">Get Data</label><br>
                                                                        <input type="checkbox" id="can_delete_${s.setting_id}_${r.setting_id}" name="${s.setting_id}_${r.setting_id}" value="2"
                                                                               <c:if test="${p.can_delete}">
                                                                                   checked
                                                                               </c:if>
                                                                               <c:if test="${r.setting_id == 11}">
                                                                                   disabled
                                                                               </c:if>
                                                                               >
                                                                        <label for="can_delete_${s.setting_id}_${r.setting_id}">Can Delete</label><br>
                                                                        <input type="checkbox" id="can_add_${s.setting_id}_${r.setting_id}" name="${s.setting_id}_${r.setting_id}" value="3"
                                                                               <c:if test="${p.can_add}">
                                                                                   checked
                                                                               </c:if>
                                                                               <c:if test="${r.setting_id == 11}">
                                                                                   disabled
                                                                               </c:if>
                                                                               >
                                                                        <label for="can_add_${s.setting_id}_${r.setting_id}">Can Add</label><br>
                                                                        <input type="checkbox" id="can_edit_${s.setting_id}_${r.setting_id}" name="${s.setting_id}_${r.setting_id}" value="4"
                                                                               <c:if test="${p.can_edit}">
                                                                                   checked
                                                                               </c:if>
                                                                               <c:if test="${r.setting_id == 11}">
                                                                                   disabled
                                                                               </c:if>
                                                                               >
                                                                        <label for="can_edit_${s.setting_id}_${r.setting_id}">Can Edit</label><br>
                                                                    </td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${not flag}">
                                                                <td></td>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="col-12">
                                            <button type="submit" form="permission" class="btn">Save changes</button>
                                            ${requestScope.confirm}
                                        </div>
                                        <input type="hidden" name="page" value="${requestScope.pageindex}"/>
                                    </form>
                                </div>

                            </div>
                            <div id="pagination"></div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
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
            pagger_render("pagination",${requestScope.pageindex},${requestScope.totalpage}, 2, "permission?");

        </script>
    </body>

</html>
