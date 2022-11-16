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
        <title> Setting Details </title>

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

        <!-- VALIDATION ============================================= -->
        <style>
            label.error{
                color: red;
            }
        </style>
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
                    <h4 class="breadcrumb-title">Setting Details</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="list">Setting List</a></li>
                        <li>Setting Details</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Setting Detail</h4>
                                <c:if test="${success}">
                                    <h6 class="alert-success">${action} successful!</h6>
                                </c:if>
                            </div>
                            <div class="widget-inner">
                                <form class="edit-profile m-b30" id="milestone-detail" action="detail" method="POST">
                                    <input type="hidden" name="action" value="${action}" id="action">
                                    <div class="">
                                        <c:if test="${action == 'edit'}">
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label">Id</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" type="text" value="${setting.setting_id}" readonly="true" name="setting_id" id="setting_id">
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Title</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" value="${setting.setting_title}" name="title" id="title">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Type</label>
                                            <div class="col-sm-3">
                                                <select name="type" class="form-control selectComboboxCheck"
                                                        <c:if test="${requestScope.setting.type_id.setting_id ne -1 and action ne 'add'}">
                                                            disabled
                                                        </c:if>
                                                        >
                                                    <option value="-1"> None </option>
                                                    <c:forEach items="${requestScope.types}" var="t"> 

                                                        <option value="${t.setting_id}"
                                                                <c:if test="${requestScope.setting.type_id.setting_id eq t.setting_id}">
                                                                    selected
                                                                </c:if>
                                                                > ${t.setting_title} </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Value</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" value="${setting.setting_value}" name="value" id="value">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Display Order</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" value="${setting.display_order}" name="order" id="order">
                                            </div>
                                        </div>

                                        <div class="seperator"></div>

                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Description</label>
                                            <div class="col-sm-7">
                                                <textarea class="form-control" type="text" name="description">${setting.description}</textarea>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Status</label>
                                            <div class="col-sm-7 row">
                                                <div class="form-check ml-3 row col-3">
                                                    <input class="form-check-input mt-3" type="radio" name="status" value="active"
                                                           <c:if test="${requestScope.setting.status == true}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label class="col-form-label mt-1">Active</label>
                                                </div>
                                                <div class="form-check ml-3 row col-3">
                                                    <input class="form-check-input mt-3" type="radio" name="status" value="inactive"
                                                           <c:if test="${requestScope.setting.status == false}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label class="col-form-label mt-1">Inactive</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="">
                                            <div class="row">
                                                <div class="col-sm-2">
                                                </div>
                                                <div class="col-sm-7">
                                                    <c:if test="${action == 'edit'}">
                                                        <button type="submit" class="btn">Save changes</button>
                                                    </c:if>
                                                    <c:if test="${action == 'add'}">
                                                        <button type="submit" class="btn">Add new</button>
                                                    </c:if>
                                                    <button type="reset" class="btn-secondry"><a href="list" style="color: white">Cancel</a></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="../../view/admin/assets/js/settingdetailvalidation.js" type="text/javascript"></script>
    </body>

</html>
