<%-- 
    Document   : Navbar
    Created on : Sep 21, 2022, 9:48:47 PM
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
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/color/color-1.css">

       
    </head>
    <body>
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-wrapper content-scroll">
                <!-- side menu logo start -->
                <div class="ttr-sidebar-logo">
                    <a href="#"><img alt="" src="../../view/trainer/assets/images/logo.png" width="122" height="27"></a>
                    <!-- <div class="ttr-sidebar-pin-button" title="Pin/Unpin Menu">
                            <i class="material-icons ttr-fixed-icon">gps_fixed</i>
                            <i class="material-icons ttr-not-fixed-icon">gps_not_fixed</i>
                    </div> -->
                    <div class="ttr-sidebar-toggle-button">
                        <i class="ti-arrow-left"></i>
                    </div>
                </div>
                <!-- side menu logo end -->
                <!-- sidebar menu start -->
                <nav class="ttr-sidebar-navi">
                    <ul>
                        <li>
                            <a href="../dashboard/view" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-home"></i></span>
                                <span class="ttr-label">Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="../user/list" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-user"></i></span>
                                <span class="ttr-label">User List</span>
                            </a>
                        </li>
                        <li>
                            <a href="../setting/list" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-settings"></i></span>
                                <span class="ttr-label">Setting List</span>
                            </a>
                        </li>
                        <li>
                            <a href="../subject/list" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-book"></i></span>
                                <span class="ttr-label">Subject List</span>
                            </a>
                        </li>
                        <li>
                            <a href="../milestone/list" class="ttr-material-button">
                                <span class="ttr-icon"><i class='far fa-flag'></i></span>
                                <span class="ttr-label">Milestone List</span>
                            </a>
                        </li>
                        <li>
                            <a href="../assignment/list" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-book"></i></span>
                                <span class="ttr-label">Assignment List</span>
                            </a>
                        </li>
                        <li>
                            <a href="../evalcriteria/list" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-pencil"></i></span>
                                <span class="ttr-label">Eval Criteria List</span>
                            </a>
                        </li>
                        <li>
                            <a href="../classsetting/list" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-marker"></i></span>
                                <span class="ttr-label">Class Setting List</span>
                            </a>
                        </li>
                        <li>
                            <a href="../system/permission" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-panel"></i></span>
                                <span class="ttr-label">System Permission List</span>
                            </a>
                        </li>
                        <li>
                            <a href="../classevalcriteria/list" class="ttr-material-button">
                                <span class="ttr-icon"><i class="ti-pencil"></i></span>
                                <span class="ttr-label">Class Eval Criteria List</span>
                            </a>
                        </li>
                    </ul>
                    <!-- sidebar menu end -->
                </nav>
                <!-- sidebar menu end -->
            </div>
        </div>
    </body>
</html>
