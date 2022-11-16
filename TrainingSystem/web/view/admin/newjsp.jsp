<%-- 
    Document   : Dashboard
    Created on : 25-Sep-2022, 11:33:49
    Author     : duyng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <title> Dashboard </title>

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
        <style>        <%@include file="../../view/admin/assets/css/dashboard.css"%>
        </style>
    </head>
    <body  class="ttr-opened-sidebar ttr-pinned-sidebar">

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
                    <h4 class="breadcrumb-title">Dashboard</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="list">Dashboard new</a></li>
                        <li>${requestScope.subject.code}</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>View new</h4>
                            </div>
                            <div class="widget-inner">
                                <div class="row">
                                    <canvas id="dashboardChart1" style="width:100%; max-width: 500px"></canvas>
                                </div>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script>
            var xValues = [50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150];
            var yValues = [7, 8, 8, 9, 9, 9, 10, 11, 14, 14, 15];

            new Chart("dashboardChart1", {
                type: "line",
                data: {
                    labels: xValues,
                    datasets: [{
                            fill: false,
                            lineTension: 0,
                            backgroundColor: "rgba(0,0,255,1.0)",
                            borderColor: "rgba(0,0,255,0.1)",
                            data: yValues
                        }]
                },
                options: {
                    legend: {display: false},
                    scales: {
                        yAxes: [{ticks: {min: 6, max: 16}}],
                    }
                }
            });
        </script>
    </body>
</html>
