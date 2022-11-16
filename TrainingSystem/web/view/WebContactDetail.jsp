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
        <title>Web Contact Detail</title>
        <link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="../assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="../assets/css/color/color-1.css">

        <!-- PAGINATION ============================================= -->
        <link href="../assets/css/pagination.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/js/pagination.js" type="text/javascript"></script>

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
                        <h1 class="text-white mt-5">Web Contact Detail</h1>
                    </div>
                </div>
            </div>
            <div class="breadcrumb-row">
                <div class="container">
                    <ul class="list-inline">
                        <li><a href="/TrainingSystem/contact/list">Web Contact List</a></li>
                        <li>Web Contact Detail</li>
                    </ul>
                </div>
            </div>

            <div style="height: 700px; padding: 30px">

                <div>
                    <div>
                        Name: <input style="text-align: center" readonly value="${requestScope.wc.getFullname()}">

                        Email: <input style="text-align: center" readonly value="${requestScope.wc.getEmail()}">

                        Phone: <input style="text-align: center" readonly value="${requestScope.wc.getMobile()}">
                    </div>
                    <br>
                    <div>
                        Category Name: <input style="text-align: center" readonly value="${requestScope.cname}"> 
                    </div>
                    <br>
                    <div>
                        Message:
                        <div>
                            <textarea readonly style="height: 100px; width: 80%" placeholder="${requestScope.wc.getMessage()}"></textarea>
                        </div>
                    </div>
                    <div>
                        ________________________________________________________________________________________________________________________
                    </div>
                </div>

                <div>
                    <form method="POST" action="../contact/detail">
                        <div>
                            Reply:
                            <br>
                            <div>
                                <textarea name="response" style="height: 100px; width: 80%" placeholder="Input response here!"><c:if test="${requestScope.wc.getResponse() ne null}">${requestScope.wc.getResponse()}</c:if></textarea>
                                <input type="hidden" value="${requestScope.wc.getId()}" name="id">
                            </div>
                        </div>
                        <div>
                            <button type="submit">Save Changes</button>
                            <button type="reset">Cancel</button>
                        </div>
                    </form>
                </div>

            </div>

            <div class="footer-fixed" style="clear:  both">
                <%@include file="./Footer.jsp" %>
            </div>
        </div>
        <!-- Content END-->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="../assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="../assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="../assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="../assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="../assets/vendors/counter/waypoints-min.js"></script>
        <script src="../assets/vendors/counter/counterup.min.js"></script>
        <script src="../assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="../assets/vendors/masonry/masonry.js"></script>
        <script src="../assets/vendors/masonry/filter.js"></script>
        <script src="../assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="../assets/js/functions.js"></script>
        <script src="../assets/js/contact.js"></script>
    </body>
</html>
