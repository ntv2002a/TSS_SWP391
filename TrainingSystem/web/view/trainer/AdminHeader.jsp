<%-- 
    Document   : trainerHeader
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
        <link rel="icon" href="../../view/trainer/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../../view/trainer/assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/color/color-1.css">
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
        <style>
            .ttr-header{
	position: fixed;
	z-index: 99;
	width: 100%;
	left: 0;
	top: 0;
	font-size: 14px;
	height: 60px;
	font-weight: 400;

	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ff8814+0,db4b24+100 */
	background: #ff8814; /* Old browsers */
	background: -moz-linear-gradient(left, #ff8814 0%, #db4b24 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(left, #ff8814 0%,#db4b24 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(to right, #4c1864 0%,#3f189a 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ff8814', endColorstr='#db4b24',GradientType=1 ); /* IE6-9 */
            
	-webkit-box-shadow: 2px 2px 5px 0px rgba(0,0,0,0.2);
	-moz-box-shadow: 2px 2px 5px 0px rgba(0,0,0,0.2);
	box-shadow: 2px 2px 5px 0px rgba(0,0,0,0.2);

	-webkit-transition: top 300ms cubic-bezier(0.215, 0.610, 0.355, 1.000); 
	-moz-transition: top 300ms cubic-bezier(0.215, 0.610, 0.355, 1.000); 
	-o-transition: top 300ms cubic-bezier(0.215, 0.610, 0.355, 1.000); 
	transition: top 300ms cubic-bezier(0.215, 0.610, 0.355, 1.000); /* easeOutCubic */
}
        </style>
    </head>
    <body>
        <header class="ttr-header" style="background-color: linear-gradient(45deg, #4c1864 0%,#3f189a 100%)">
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
                        <a href="../../manage/dashboard/view" style="color: white;" class="ttr-logo">
                            Trainer Page
                        </a>
                    </div>
                </div>
                <!--logo end -->
                <div class="ttr-header-menu">
                    <!-- header left menu start -->
                    <ul class="ttr-header-navigation">
                        <li>
                            <a href="/TrainingSystem/manage/dashboard/view" class="ttr-material-button ttr-submenu-toggle">HOME</a>
                        </li>
                        <li>
                            <a href="#" class="ttr-material-button ">Eval List </a>
                        </li>
                    </ul>
                    <!-- header left menu end -->
                </div>
                <div class="ttr-header-right ttr-with-seperator">
                    <!-- header right menu start -->
                    <ul class="ttr-header-navigation">

                        <li>
                            <a href="#" class="ttr-material-button ttr-submenu-toggle"><span class="ttr-user-avatar"><img alt="" src="../../img/${sessionScope.user.avatarurl}" width="32" height="32" style="width: 100%; height: 100%"></span></a>
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
