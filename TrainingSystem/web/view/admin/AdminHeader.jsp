<%-- 
    Document   : AdminHeader
    Created on : Sep 21, 2022, 9:54:17 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />
        <title>User Profile Page</title>
        <link rel="icon" href="../../view/admin/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../../view/admin/assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../../view/admin/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="../../view/admin/assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="../../view/admin/assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="../../view/admin/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="../../view/admin/assets/css/color/color-1.css">
         <style>        <%@include file="../../view/admin/assets/css/assets.css"%>
        </style>
        <style>        <%@include file="../../view/admin/assets/vendors/calendar/fullcalendar.css"%>
        </style>
        <style>        <%@include file="../../view/admin/assets/css/typography.css"%>
        </style>
        <style>        <%@include file="../../view/admin/assets/css/style.css"%>
        </style>
        <style>        <%@include file="../../view/admin/assets/css/shortcodes/shortcodes.css"%>
        </style>
        <style>        <%@include file="../../view/admin/assets/css/color/color-1.css"%>
        </style>
        <style>        <%@include file="../../view/admin/assets/css/dashboard.css"%>        </style>
    </head>
    <body>
        <header class="ttr-header">
            <div class="ttr-header-wrapper">
                <!--sidebar menu toggler start -->
                <div class="ttr-toggle-sidebar ttr-material-button">
                    <i class="ti-close ttr-open-icon"></i>
                    <i class="ti-menu ttr-close-icon"></i>
                </div>
                <!--sidebar menu toggler end -->
                <!--logo start -->
                <div class="ttr-logo-box">
                    <div>
                        <a href="../../manage/dashboard/view" class="ttr-logo">
                            <img alt="" class="ttr-logo-mobile" src="../../view/admin/assets/images/logo-mobile.png" width="30" height="30">
                            <img alt="" class="ttr-logo-desktop" src="../../view/admin/assets/images/logo-white.png" width="160" height="27">
                        </a>
                    </div>
                </div>
                <!--logo end -->
                <div class="ttr-header-menu">
                    <!-- header left menu start -->
                    <ul class="ttr-header-navigation">
                        <li>
                            <a href="/TrainingSystem/home" class="ttr-material-button ttr-submenu-toggle">HOME</a>
                        </li>
                        <li>
                            <a href="#" class="ttr-material-button ttr-submenu-toggle">QUICK MENU <i class="fa fa-angle-down"></i></a>
                            <div class="ttr-header-submenu">
                                <ul>
                                    <li><a href="../../manage/user/list">User List</a></li>
                                    <li><a href="../../manage/setting/list">Setting List</a></li>
                                    <li><a href="../../manage/subject/list">Subject List</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <!-- header left menu end -->
                </div>
                <div class="ttr-header-right ttr-with-seperator">
                    <!-- header right menu start -->
                    <ul class="ttr-header-navigation">
                        <li>
                            <a href="#" class="ttr-material-button ttr-search-toggle"><i class="fa fa-search"></i></a>
                        </li>

                        <li>
                            <c:if test="${sessionScope.user.avatarurl == '' ||  sessionScope.user.avatarurl == null}">
                                <a href="#" class="ttr-material-button ttr-submenu-toggle"><span class="ttr-user-avatar"><img alt="avatar" style="width: 100%; height: 100%" src="/TrainingSystem/img/avatarDefault.jpg" width="32" height="32"></span></a>
                            </c:if>
                            <c:if test="${sessionScope.user.avatarurl != '' &&  sessionScope.user.avatarurl != null}">
                                <a href="#" class="ttr-material-button ttr-submenu-toggle"><span class="ttr-user-avatar"><img alt="avatar" src="/TrainingSystem/img/${sessionScope.user.avatarurl}" width="32" height="32" style="width: 100%; height: 100%"></span></a>
                            </c:if>
                            <div class="ttr-header-submenu">
                                <ul>
                                    <li><a href="../../profile?role=member">My profile</a></li>
                                    <li><a href="../../logout">Logout</a></li>
                                </ul>
                            </div>
                        </li>

                    </ul>
                    <!-- header right menu end -->
                </div>
                <!--header search panel start -->
                <div class="ttr-search-bar">
                    <form class="ttr-search-form">
                        <div class="ttr-search-input-wrapper">
                            <input type="text" name="qq" placeholder="search something..." class="ttr-search-input">
                            <button type="submit" name="search" class="ttr-search-submit"><i class="ti-arrow-right"></i></button>
                        </div>
                        <span class="ttr-search-close ttr-search-toggle">
                            <i class="ti-close"></i>
                        </span>
                    </form>
                </div>
                <!--header search panel end -->
            </div>
        </header>
    </body>
</html>
