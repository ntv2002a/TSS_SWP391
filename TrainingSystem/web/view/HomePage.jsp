<%-- 
    Document   : HomePage
    Created on : Sep 23, 2022, 10:03:33 PM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />
        <title>Home Page</title>
        <link rel="icon" href="/TrainingSystem/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="/TrainingSystem/assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="/TrainingSystem/assets/css/color/color-1.css">

        <style>
            * {
                box-sizing: border-box;
            }
            body {
                font-family: Verdana, sans-serif;
            }
            .mySlides {
                display: none;
            }
            img {
                vertical-align: middle;
            }

            /* Slideshow container */
            .slideshow-container {
                max-width: 1000px;
                position: relative;
                margin: auto;
            }

            /* Caption text */
            .textcation {
                color: #f2f2f2;
                font-size: 15px;
                padding: 8px 12px;
                position: absolute;
                bottom: 8px;
                width: 100%;
                text-align: center;
            }

            /* Number text (1/3 etc) */
            .numbertext {
                color: #f2f2f2;
                font-size: 12px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }

            /* The dots/bullets/indicators */
            .dot {
                height: 15px;
                width: 15px;
                margin: 0 2px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 0.6s ease;
            }

            .active {
                background-color: #717171;
            }

            /* Fading animation */
            .fade {
                animation-name: fade;
                animation-duration: 1.5s;
            }

            @keyframes fade {
                from {
                    opacity: .4
                }
                to {
                    opacity: 1
                }
            }

            /* On smaller screens, decrease text size */
            @media only screen and (max-width: 300px) {
                .text {
                    font-size: 11px
                }
            }
        </style>
    </head>

    <body>
        <header>
            <%@include file="./Header.jsp"%>
        </header>

        <div class="page-content bg-white" style="">
            <!-- inner page banner -->
            <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner1.jpg);">
                <div class="container">
                    <div class="page-banner-entry">
                        <h1 class="text-white mt-5">Home Page</h1>
                    </div   >
                </div>
            </div>

            <div style="height: 800px; text-align: center">
                <br>
                <h2> About our project </h2>
                <div class="slideshow-container">

                    <div class="mySlides fade">
                        <div class="numbertext">1 / 3</div>
                        <img src="/TrainingSystem/assets/images/about/pic1.jpg" style="width:100%">
                        <div class="textcation">Training System</div>
                    </div>

                    <div class="mySlides fade">
                        <div class="numbertext">2 / 3</div>
                        <img src="/TrainingSystem/assets/images/courses/pic6.jpg" style="width:100%">
                        <div class="textcation">Training System</div>
                    </div>

                    <div class="mySlides fade">
                        <div class="numbertext">3 / 3</div>
                        <img src="/TrainingSystem/assets/images/slider/slide1.jpg" style="width:100%">
                        <div class="textcation">Training System</div>
                    </div>

                </div>
                <br>

                <div style="text-align:center">
                    <span class="dot"></span> 
                    <span class="dot"></span> 
                    <span class="dot"></span> 
                </div>
            </div>

            <div class="footer-fixed" style="clear:  both">
                <%@include file="./Footer.jsp" %>
            </div>
        </div>

        <script>
            let slideIndex = 0;
            showSlides();

            function showSlides() {
                let i;
                let slides = document.getElementsByClassName("mySlides");
                let dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                setTimeout(showSlides, 2000); // Change image every 2 seconds
            }
        </script>
        <!-- Content END-->
        <script src="/TrainingSystem/assets/js/jquery.min.js"></script>
        <script src="/TrainingSystem/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="/TrainingSystem/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="/TrainingSystem/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="/TrainingSystem/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="/TrainingSystem/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="/TrainingSystem/assets/vendors/counter/waypoints-min.js"></script>
        <script src="/TrainingSystem/assets/vendors/counter/counterup.min.js"></script>
        <script src="/TrainingSystem/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="/TrainingSystem/assets/vendors/masonry/masonry.js"></script>
        <script src="/TrainingSystem/assets/vendors/masonry/filter.js"></script>
        <script src="/TrainingSystem/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="/TrainingSystem/assets/js/functions.js"></script>
        <script src="/TrainingSystem/assets/js/contact.js"></script>
    </body>
</html>

