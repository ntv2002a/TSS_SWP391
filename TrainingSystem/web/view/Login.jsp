<%-- 
    Document   : Login
    Created on : Sep 19, 2022, 9:42:26 PM
    Author     : tuand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">


    <head>


        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />


        <meta name="description" content="EduChamp : Education HTML Template" />


        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">


        <link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon.png" />


        <title>TSS :</title>


        <meta name="viewport" content="width=device-width, initial-scale=1">


        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>

        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">


        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">


        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">


        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">
        <style>h3.color-skins</style>
    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <div class="account-form">
                <div class="account-head" style="background-image:url(assets/images/background/bg2.jpg);">
                    <a href="index.html"><img src="assets/images/logo-white-2.png" alt=""></a>
                </div>
                <div class="account-form-inner">
                    <div class="account-container">
                        <div class="heading-bx left">
                            <h2 class="title-head">Login to your <span>Account</span></h2>
                            <p>Don't have an account? <a href="http://localhost:8080/TrainingSystem/Register">Create one here</a></p>
                        </div>

                        <div><h1>${name}</h1></div>
                        <div><h1>${email}</h1></div>
                        <form action="Login" class="contact-bx" method="Post">
                            <div class="row placeani">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label>Your Email</label>
                                            <input name="useremail" type="email" required="" class="form-control" value="${useremail}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group"> 
                                            <label>Your Password</label>
                                            <input name="userpassword" type="password" class="form-control" required=""value="${userpassword}">
                                        </div>
                                    </div>
                                </div>



                                <div class="col-lg-12">
                                    <div class="form-group form-forget">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
                                            <label class="custom-control-label" for="customControlAutosizing">Remember me</label>
                                        </div>
                                        <a href="view/SendEmailReset.jsp" class="ml-auto">Forgot Password?</a>
                                    </div>
                                </div>

                                <div class="alert error" style="color: red">

                                    <label class="close" title="close" for="alert1">
                                        <i class="icon-remove"></i>
                                    </label>
                                    <p class="inner">
                                        <strong>${msg}</strong>
                                    </p>
                                </div>
                                    <div class="alert error" style="color: green">

                                    <label class="close" title="close" for="alert1">
                                        <i class="icon-remove"></i>
                                    </label>
                                    <p class="inner">
                                        <strong>${msgt}</strong>
                                    </p>
                                </div>
                                <div class="col-lg-12 m-b30">
                                    <button type="submit" value="Login" class="btn button-md">Login</button>
                                </div>
                                <div class="col-lg-12">
                                    <h6>Login with Google</h6>
                                    <div class="d-flex">
                                        <a class="btn flex-fill m-l5 google-plus" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/TrainingSystem/login-google&response_type=code
                                           &client_id=405707406370-ieavnge36tg4cts09jt6na2iocfs1qsg.apps.googleusercontent.com&approval_prompt=force"><i class="fa fa-google-plus"></i>Google Plus</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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
    </body>

</html>
