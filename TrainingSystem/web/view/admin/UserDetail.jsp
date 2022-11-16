<%-- 
    Document   : UserDetail
    Created on : Sep 24, 2022, 10:07:52 AM
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Detail Page</title>
        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../../view/admin/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title> User Detail </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <style>
            .error{
                color: red;
                font-size: 14px
            }
        </style>
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
                    <h4 class="breadcrumb-title">User Profile</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="list">User List</a></li>
                        <li>User Profile</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>User Profile</h4>
                                <c:if test="${success != null}">
                                    <h6 class="alert-success">Update successful!</h6>
                                </c:if>
                            </div>
                            <div class="widget-inner">
                                <form class="edit-profile m-b30" id="user-detail" action="detail" method="POST">
                                    <div class="">
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Id</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" value="${user.getId()}" readonly="true" name="userId">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Full Name *</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" value="${user.getFullname()}" name="fullName">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Email</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" readonly="true" value="${user.getEmail()}" name="email" id="email">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Phone No. *</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" value="${user.getMobile()}" name="phone" id="phone">
                                            </div>
                                        </div>                                       

                                        <div class="seperator"></div>

                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Role</label>
                                            <div class="col-sm-7 row">
                                                <c:forEach var="role" items="${roles}">
                                                    <div class="form-check ml-3 row col-3">
                                                        <input class="form-check-input mt-3" type="checkbox" name="role" value="${role.getSetting_id()}"
                                                               <c:forEach var="userRole" items="${userRoles}">
                                                                   <c:if test="${role.getSetting_id() == userRole.value}">
                                                                       checked
                                                                   </c:if>
                                                               </c:forEach>>
                                                        <label class="col-form-label mt-1">${role.getSetting_title()}</label>
                                                    </div>  
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Status</label>
                                            <div class="col-sm-7 row">
                                                <div class="form-check ml-3 row col-3">
                                                    <input class="form-check-input mt-3" type="radio" name="status" value="1"
                                                           <c:if test="${user.getStatus() == 1}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label class="col-form-label mt-1">Active</label>
                                                </div>
                                                <div class="form-check ml-3 row col-3">
                                                    <input class="form-check-input mt-3" type="radio" name="status" value="0"
                                                           <c:if test="${user.getStatus() == 0}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label class="col-form-label mt-1">Inactive</label>
                                                </div>
                                                <div class="form-check ml-3 row col-3">
                                                    <input class="form-check-input mt-3" type="radio" name="status" value="2"
                                                           <c:if test="${user.getStatus() == 2}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label class="col-form-label mt-1">Unverified</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Note</label>
                                            <div class="col-sm-7">
                                                <textarea class="form-control" type="text" name="note">${user.getNote()}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="">
                                            <div class="row">
                                                <div class="col-sm-2">
                                                </div>
                                                <div class="col-sm-7">
                                                    <button type="submit" class="btn">Save changes</button>
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
        <script src="../../view/admin/assets/js/functions.js"></script>
        <script src="../../view/admin/assets/vendors/chart/chart.min.js"></script>
        <script src="../../view/admin/assets/js/admin.js"></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="../../view/admin/assets/js/validation.js"></script>
    </body>
</html>
