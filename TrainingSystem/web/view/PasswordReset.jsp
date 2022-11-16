<%-- 
    Document   : PasswordReset
    Created on : Sep 19, 2022, 11:51:39 PM
    Author     : tuand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">
    </head>
    <body id="bg">       
        <div class="tab-pane" id="change-password">
            <div class="profile-head">
                <h3>Reset Password</h3>
            </div>           
            <form class="edit-profile" action="/TrainingSystem/PasswordReset" method="Post">
                <div class="">                  
                    <div class="form-group row">
                        <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label"></label>
                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                            <input hidden name ="email" class="form-control" type="password" value="${email}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">New Password</label>
                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                            <input name ="npass" class="form-control" type="password" value="${npass}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Re Type New Password</label>
                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                            <input name ="cnpass" class="form-control" type="password" value="${cnpass}">
                        </div>
                    </div>
                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                            <p>${msgt}</p>
                        </div>
                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                            <p>${msg}</p>
                        </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-4 col-md-4 col-lg-3">
                    </div>
                    <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                        <button type="submit" class="btn">Save changes</button>
                        <button type="reset" class="btn-secondry">Cancel</button>
                    </div>
                </div>

            </form>
        </div>

        <!-- contact area END -->


        <!-- External JavaScripts -->
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
        <script src='assets/vendors/switcher/switcher.js'></script>
    </body>

</html>