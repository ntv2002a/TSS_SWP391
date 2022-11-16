<%-- 
    Document   : TraineeDetail
    Created on : Nov 1, 2022, 6:48:56 PM
    Author     : Lenovo
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Trainee Detail Page</title>
        <!-- FAVICONS ICON ============================================= -->
        <!-- FAVICONS ICON ============================================= -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="icon" href="/TrainingSystem/view/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="/TrainingSystem/view/assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/color/color-1.css">

        <!-- PAGINATION ============================================= -->
        <link href="/TrainingSystem/view/admin/assets/css/pagination.css" rel="stylesheet" type="text/css"/>
        <script src="/TrainingSystem/view/admin/assets/js/pagination.js" type="text/javascript"></script>

        <!-- SORTTABLE ============================================= -->
        <script src="/TrainingSystem/view/admin/assets/js/sorttable.js" type="text/javascript"></script>
        <link href="/TrainingSystem/view/admin/assets/css/sorttable.css" rel="stylesheet" type="text/css"/>

        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    </head>
    <body>
        <header>
            <%@include file="./Header.jsp"%>
        </header>
        <!-- Content -->
        <main class="page-content bg-white">
            <div class="page-banner ovbl-dark" style="background-image:url(/TrainingSystem/assets/images/banner/banner1.jpg);">
                <div class="container">
                    <div class="page-banner-entry">
                        <h1 class="text-white mt-5">Trainee Detail</h1>
                    </div   >
                </div>
            </div>
            <!-- comment -->
            <div class="container-fluid mt-3">
                <div>
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">Trainee Detail</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="/TrainingSystem/home"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="list?class=${trainee.getClassId().getClass_id()}">Trainee List</a></li>
                        <li>Trainee Detail</li>
                    </ul>
                </div>	
                <c:if test="${success != null}">
                    <div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 100px">
                        <div class="toast" style="position: absolute; top: 0; right: 0;" id="myToast">
                            <div class="toast-header">
                                <i style="font-size:20px; color: green" class="fa">&#xf058;</i>
                                <strong class="mr-auto ml-1">Information</strong>
                                <small>Just now</small>
                                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close" onclick="hideToast()">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="toast-body">
                                Update successfully !!!
                            </div>
                        </div>
                    </div>
                    <script>
                        $(document).ready(function () {
                            $('#myToast').toast('show');
                        });
                        
                        function hideToast() {
                            $('#myToast').toast('dispose');
                        }
                    </script>
                </c:if>
                </div>
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Trainee Detail</h4>
                            </div>
                            <div class="widget-inner">
                                <form class="edit-profile m-b30" id="trainee-detail" action="detail" method="POST">
                                    <div class="">
                                        <input type="hidden" name="classId" id="classId" value="${trainee.getClassId().getClass_id()}"/>
                                        <input type="hidden" name="traineeId" id="traineeId" value="${trainee.getUserId().getId()}"/>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Full Name</label>
                                            <div class="col-sm-3">
                                                <input id="fullname" class="form-control" type="text" readonly="true" value="${trainee.getUserId().getFullname()}" name="fullname"/>
                                            </div>
                                            <label class="col-sm-2 col-form-label ml-5 pl-5">Email</label>
                                            <div class="col-sm-3">
                                                <input id="email" class="form-control" type="text" readonly="true" value="${trainee.getUserId().getEmail()}" name="email"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Grade</label>
                                            <div class="col-sm-3">
                                            <c:if test="${trainee.getTopic_eval() == 0}">
                                                <input type="text" readonly ="true" id="grade" name="grade" value="0" class="form-control"/>
                                            </c:if>
                                            <c:if test="${trainee.getTopic_eval() != 0}">
                                                <input id="grade" class="form-control" type="text" readonly="true" 
                                                       value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${trainee.getFinal_eval()/trainee.getTopic_eval()*10}"/>" 
                                                       name="grade"/>
                                            </c:if>
                                            </div>
                                            <label class="col-sm-2 col-form-label ml-5 pl-5">Dropout Date</label>
                                            <div class="col-sm-3">
                                                <input id="dropoutdate" class="form-control" type="date" value="${trainee.getDropout_date()}" name="dropoutdate"/>
                                            </div>
                                        </div>

                                        <div class="seperator"></div>

                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Note</label>
                                            <div class="col-sm-7">
                                                <textarea class="form-control" type="text" name="note">${trainee.getNote()}</textarea>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Status</label>
                                            <div class="col-sm-7 row">
                                                <div class="form-check ml-3 row col-3">
                                                    <input class="form-check-input mt-3" type="radio" name="status" value="0"
                                                           <c:if test="${trainee.getStatus() == 0}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label class="col-form-label mt-1">Dropped Out</label>
                                                </div>
                                                <div class="form-check ml-3 row col-3">
                                                    <input class="form-check-input mt-3" type="radio" name="status" value="1"
                                                           <c:if test="${trainee.getStatus() == 1}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label class="col-form-label mt-1">Studying</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="">
                                            <div class="row">
                                                <div class="col-sm-2">
                                                </div>
                                                <div class="col-sm-7">
                                                    <button type="submit" class="btn">Save changes</button>
                                                    <button type="reset" class="btn-secondry"><a href="list?class=${trainee.getClassId().getClass_id()}" style="color: white">Cancel</a></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>

        <div class="footer-fixed" style="clear:  both">
            <%@include file="./Footer.jsp" %>
        </div>
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
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="/TrainingSystem/assets/js/validation.js"></script>
    </body>
</html>
