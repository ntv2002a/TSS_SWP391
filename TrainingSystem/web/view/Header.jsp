<%-- 
    Document   : Header
    Created on : Sep 15, 2022, 9:19:56 AM
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        <link rel="icon" href="/TrainingSystem/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="/TrainingSystem/assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/css/typography.css">

        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/css/shortcodes/shortcodes.css">

        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="/TrainingSystem/assets/css/color/color-1.css">
        <link href="/TrainingSystem/view/admin/assets/css/dashboard.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/vendors/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/vendors/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/vendors/revolution/css/navigation.css">
    </head>
    <body>
        <!-- Header Top ==== -->
        <header class="header rs-nav header-transparent">
            <div class="top-bar">
                <div class="container">
                    <div class="row d-flex justify-content-between">
                        <div class="topbar-left">
                            <ul>
                                <li><a href="faq-1.html"><i class="fa fa-question-circle"></i>Ask a Question</a></li>
                                <li><a href="javascript:;"><i class="fa fa-envelope-o"></i>Support@website.com</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
            <div class="sticky-header navbar-expand-lg">
                <div class="menu-bar clearfix">
                    <div class="container clearfix">
                        <!-- Header Logo ==== -->
                        <div class="menu-logo">
                            <a href="/TrainingSystem/home"><img src="/TrainingSystem/assets/images/logo-white.png" alt=""></a>
                        </div>
                        <!-- Mobile Nav Button ==== -->
                        <button class="navbar-toggler collapsed menuicon justify-content-end" type="button" data-toggle="collapse" data-target="#menuDropdown" aria-controls="menuDropdown" aria-expanded="false" aria-label="Toggle navigation">
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>
                        <!-- Author Nav ==== -->
                        <div class="secondary-menu">
                            <div class="secondary-inner">
                                <ul class="">
                                    <!-- Search Button ==== -->
                                    <li class="search-btn mt-3"><button id="quik-search-btn" type="button" class="btn-link"><i class="fa fa-search"></i></button></li>
                                            <c:if test="${sessionScope.user eq null}">
                                        <li class="ml-2 mt-3" style="color: white"><a style="color: white" href="/TrainingSystem/Register">Register</a></li>
                                        <li class="ml-2 mt-3" style="color: white"><a style="color: white" href="/TrainingSystem/Login">Login</a></li>        
                                        </c:if>
                                        <c:if test="${sessionScope.user ne null}">
                                        <li class="pt-2 ml-3">
                                            <c:if test="${sessionScope.user.avatarurl == '' ||  sessionScope.user.avatarurl == null}">
                                                <a href="#" class="ttr-material-button ttr-submenu-toggle"><span class="ttr-user-avatar"><img alt="avatar" style="width: 100%; height: 100%" src="/TrainingSystem/img/avatarDefault.jpg" width="32" height="32"></span></a>
                                            </c:if>
                                            <c:if test="${sessionScope.user.avatarurl != '' &&  sessionScope.user.avatarurl != null}">
                                                <a href="#" class="ttr-material-button ttr-submenu-toggle"><span class="ttr-user-avatar"><img alt="avatar" style="width: 100%; height: 100%" src="/TrainingSystem/img/${sessionScope.user.avatarurl}" width="32" height="32"></span></a>
                                            </c:if>
                                            <div class="nav navbar-nav ttr-header-submenu">
                                                <ul>
                                                    <li><a href="/TrainingSystem/profile">My profile</a></li>
                                                    <li><a href="/TrainingSystem/logout">Logout</a></li>
                                                </ul>
                                            </div>
                                        </li>    
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                        <!-- Search Box ==== -->
                        <div class="nav-search-bar">
                            <form action="#">
                                <input name="search" value="" type="text" class="form-control" placeholder="Type to search">
                                <span><i class="ti-search"></i></span>
                            </form>
                            <span id="search-remove"><i class="ti-close"></i></span>
                        </div>
                        <!-- Navigation Menu ==== -->
                        <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
                            <div class="menu-logo">
                                <a href="index.html"><img src="/TrainingSystem/assets/images/logo.png" alt=""></a>
                            </div>
                            <ul class="nav navbar-nav">	
                                <li class="active"><a href="/TrainingSystem/home">Home</a>
                                </li>
                                <li><a href="javascript:;">Pages <i class="fa fa-chevron-down"></i></a>
                                    <ul class="sub-menu">
                                        <li><a href="/TrainingSystem/contact/list">Contact List<i class="fa fa-angle-right"></i></a>
                                        <li><a href="/TrainingSystem/class/list">Class List<i class="fa fa-angle-right"></i></a>
                                        </li>
                                        <li><a href="/TrainingSystem/manage/trainee/list">Trainee List<i class="fa fa-angle-right"></i></a></li>
                                        <li><a href="/TrainingSystem/schedulelist">Schedule List<i class="fa fa-angle-right"></i></a></li>
                                        <li><a href="/TrainingSystem/team/list">Team List<i class="fa fa-angle-right"></i></a>
                                    </ul>
                                </li>
                                <li><a href="/TrainingSystem/manage/dashboard/view">Dashboard</a></li>
                            </ul>
                        </div>
                        <!-- Navigation Menu END ==== -->
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Top END ==== -->
    </body>
</html>
