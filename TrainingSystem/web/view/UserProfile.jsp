<%-- 
    Document   : UserProfile
    Created on : Sep 20, 2022, 10:53:31 AM
    Author     : Lenovo
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
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">


    </head>
    <body>
        <header>
            <%@include file="./Header.jsp"%>
        </header>
        <!-- Content -->
        <div class="page-content bg-white" style="">
            <!-- inner page banner -->
            <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner1.jpg);">
                <div class="container">
                    <div class="page-banner-entry">
                        <h1 class="text-white mt-5">Profile</h1>
                    </div   >
                </div>
            </div>
            <!-- Breadcrumb row -->
            <div class="breadcrumb-row">
                <div class="container">
                    <ul class="list-inline">
                        <li><a href="#">Home</a></li>
                        <li>Profile</li>
                    </ul>
                </div>
            </div>
            <!-- Breadcrumb row END -->
            <!-- inner page banner END -->
            <form class="edit-profile" id ="edit-profile" action="profile" method="post" enctype="multipart/form-data">
                <div class="content-block">
                    <c:if test="${success != null}">
                        <h6 class="alert-success">Update successful!</h6>
                    </c:if>
                    <!-- About Us -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-12 m-b30">
                                    <div class="profile-bx text-center">
                                        <div class="user-profile-thumb">
                                            <c:if test="${avatar == '' ||  avatar == null}">
                                                <img style="height: 100%; width: 100%" src="/TrainingSystem/img/avatarDefault.jpg" alt=""/>
                                            </c:if>
                                            <c:if test="${avatar != '' &&  avatar != null}">
                                                <img style="height: 100%; width: 100%" src="/TrainingSystem/img/${avatar}" alt=""/>
                                            </c:if>
                                        </div>
                                        <div class="profile-info">
                                            <h4>${fullname}</h4>
                                        </div>
                                        <div class="upload-img">
                                            <input type="file" id="files" name="avatar" class="hidden" style="display:none;"/>
                                            <label for="files" class="btn">Upload avatar</label><br>
                                            <span>Your can upload file < 50mb and after save change wait 5s to refresh page</span>
                                        </div>
                                        <div class="profile-tabnav">
                                            <ul class="nav nav-tabs">
                                                <li class="nav-item">
                                                    <a class="nav-link show active"><i class="ti-pencil-alt"></i>Edit Profile</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="changepassword" class="nav-link"><i class="ti-lock"></i>Change Password</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-md-6 col-sm-12 m-b30">
                                    <div class="profile-content-bx">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="edit-profile">
                                                <div class="profile-head">
                                                    <h2 class="font-weight-bold">Edit Profile</h2>
                                                </div>

                                                <div class="ml-3">
                                                    <div class="form-group row">
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                            <h3> Personal Details</h3>
                                                        </div>
                                                        <input type="text" name="id" value="${id}" hidden="true">
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Full Name</label>
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                            <input class="form-control" id="fullname" name="fullname" type="text" value="${fullname}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Email</label>
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                            <input class="form-control" readonly name="email" type="text" value="${email}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Phone number</label>
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                            <input class="form-control" id="phone" name="phone" type="text" value="${phone}">
                                                        </div>
                                                    </div>
                                                    

                                                    <div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>
                                                </div>
                                                <div class="mb-3">
                                                    <div class="">
                                                        <div class="row">
                                                            <div class="col-12 col-sm-3 col-md-3 col-lg-2">
                                                            </div>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <button type="submit" class="btn">Save changes</button>
                                                                <button type="reset" class="btn-secondry">Cancel</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- contact area END -->
        </div>
        <div class="footer-fixed" style="clear:  both">
            <%@include file="./Footer.jsp" %>
        </div>
        <!-- Content END-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/js/validation.js"></script>
    </body>
</html>
