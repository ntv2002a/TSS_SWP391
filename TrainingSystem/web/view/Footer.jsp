<%-- 
    Document   : Footer
    Created on : Sep 20, 2022, 8:06:09 AM
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer Page</title>
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

        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/vendors/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/vendors/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/assets/vendors/revolution/css/navigation.css">
    </head>
    <body>
        <!-- Footer ==== -->
        <footer>
            <div class="footer-top">
                <div class="pt-exebar">
                    <div class="container">
                        <div class="d-flex align-items-stretch">
                            <div class="pt-logo mr-auto">
                                <a href="index.html"><img src="/TrainingSystem/assets/images/logo-white.png" alt=""/></a>
                            </div>
                            <div class="pt-social-link">
                                <ul class="list-inline m-a0">
                                    <li><a href="#" class="btn-link"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#" class="btn-link"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#" class="btn-link"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#" class="btn-link"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                            <div class="pt-btn-join">
                                <a href="#" class="btn ">Join Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-lg-6 col-md-6 col-sm-12">
                            <h5 class="footer-title">Our Address</h5>
                            <div class="col-12 col-12 col-lg-12 col-md-12 col-sm-12 h-75">
                                <iframe style="border:0; width: 100%; height: inherit" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.485534574083!2d105.52487561501258!3d21.013249986006823!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2sFPT%20University!5e0!3m2!1sen!2s!4v1663638074680!5m2!1sen!2s" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>

                        <div class="col-12 col-lg-6 col-md-6 col-sm-12">
                            <div>
                                <h5 class="footer-title">Contact for support or information</h5>
                                <form method="POST" action="/TrainingSystem/sentcontact" class="row g-2 col-12">
                                    <input type="hidden" id="myurl" name="url"/>
                                    <div class="col-md-6">
                                        <input type="text" pattern="^([A-Za-z]+[,.]?[ ]?|[A-Za-z]+['-]?)+$" name="fullname" class="form-control" <c:if test="${sessionScope.user ne null}">value="${sessionScope.user.getFullname()}"</c:if> placeholder="Full name (*)">
                                        </div>
                                        <div class="col-md-6">
                                            <select name="category">
                                            <c:forEach items="${sessionScope.categoryList}" var="c"><option value="${c.getKey()}">${c.getValue()}</option></c:forEach>
                                            </select>
                                        </div>
                                        <br>
                                        <div class="col-md-6 mt-3">
                                            <input type="email" name="email" class="form-control" <c:if test="${sessionScope.user ne null}">value="${sessionScope.user.getEmail()}"</c:if> placeholder="Email (*)">
                                        </div>
                                        <div class="col-md-6 mt-3">
                                            <input type="text" pattern="^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$" name="mobile" class="form-control" <c:if test="${sessionScope.user ne null}">value="${sessionScope.user.getMobile()}"</c:if>  placeholder="Phone number (*)">
                                    </div>
                                    <div class="col-12 mt-3">
                                        <textarea class="form-control" name="message" placeholder="Input content here" style="height: 100px; width: 100%"></textarea>
                                    </div>
                                    <div class="col-12 mt-3">
                                        <button type="submit" class="btn btn-primary mb-3">Send Information</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 text-center"> <a target="_blank" href="https://www.templateshub.net">Templates Hub</a></div>
                    </div>
                </div>
            </div>
        </footer>
        <script type="text/javascript">
            document.getElementById('myurl').value = window.location.href;
        </script>
    </body>
</html>
