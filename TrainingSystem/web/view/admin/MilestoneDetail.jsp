<%-- 
   Document   : MilestoneDetail
   Created on : Oct 7, 2022, 4:40:58 PM
   Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Milestone Detail Page</title>
        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../../view/admin/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title> Milestone Detail </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <style>
            .error{
                color: red;
                font-size: 14px
            }
        </style>
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
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
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
                    <h4 class="breadcrumb-title">Milestone Detail</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="../../manage/dashboard/view"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="list">Milestone List</a></li>
                        <li>Milestone Detail</li>
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
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Milestone Detail</h4>
                            </div>
                            <div class="widget-inner">
                                <form class="edit-profile m-b30" id="milestone-detail" action="detail" method="POST">
                                    <input type="hidden" name="action" value="${action}" id="action">
                                    <div class="">
                                            <div class="form-group row">
                                                <div class="col-sm-7">
                                                    <input class="form-control" type="hidden" value="${milestone.getId()}" readonly="true" name="milestoneId" id="milestoneId">
                                                </div>
                                            </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Title *</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" value="${milestone.getTitle()}" name="title" id="title">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Class</label>
                                            <div class="col-sm-3">
                                                <input class="form-control" type="text" readonly="true" value="${milestone.getClass_milestone().getClass_code()}" name="title" id="title">
                                            </div>
                                            <label class="col-sm-2 col-form-label ml-5 pl-5">Assignment</label>
                                            <div class="col-sm-3">
                                                <input class="form-control" type="text" readonly="true" value="${milestone.getAss().getTitle()}" name="title" id="title">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Start Date</label>
                                            <div class="col-sm-3">
                                                <input id="startDate" class="form-control" type="date" value="${milestone.getFrom_date()}" name="startDate"/>
                                            </div>
                                            <label class="col-sm-2 col-form-label ml-5 pl-5">End Date</label>
                                            <div class="col-sm-3">
                                                <input id="endDate" class="form-control" type="date" value="${milestone.getTo_date()}" name="endDate"/>
                                            </div>
                                        </div>

                                        <div class="seperator"></div>

                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Description</label>
                                            <div class="col-sm-7">
                                                <textarea class="form-control" type="text" name="description">${milestone.getDescription()}</textarea>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Status</label>
                                            <div class="col-sm-7 row">
                                                <div class="form-check ml-3 row col-3">
                                                    <input class="form-check-input mt-3" type="radio" name="status" value="0"
                                                           <c:if test="${milestone.getStatus() == 0}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label class="col-form-label mt-1">Open</label>
                                                </div>
                                                <div class="form-check ml-3 row col-3">
                                                    <input class="form-check-input mt-3" type="radio" name="status" value="1"
                                                           <c:if test="${milestone.getStatus() == 1}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label class="col-form-label mt-1">In Progress</label>
                                                </div>
                                                <div class="form-check ml-3 row col-3">
                                                    <input class="form-check-input mt-3" type="radio" name="status" value="2"
                                                           <c:if test="${milestone.getStatus() == 2}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label class="col-form-label mt-1">Closed</label>
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
                                                    <button type="reset" class="btn-secondry"><a href="list" style="color: white">Cancel</a></button>
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
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="../../view/admin/assets/js/milestoneValidation.js"></script>
    </body>
</html>
