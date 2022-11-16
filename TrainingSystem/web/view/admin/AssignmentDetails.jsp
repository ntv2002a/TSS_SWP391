<%-- 
    Document   : AssignmentDetails
    Created on : Oct 9, 2022, 3:34:56 PM
    Author     : tuand
--%>

<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

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
        <title> Assignment Details </title>

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

        <!-- PAGINATION ============================================= -->
        <link href="../../view/admin/assets/css/pagination.css" rel="stylesheet" type="text/css"/>
        <script src="../../view/admin/assets/js/pagination.js" type="text/javascript"></script>

        <!-- SORTTABLE ============================================= -->
        <script src="../../view/admin/assets/js/sorttable.js" type="text/javascript"></script>
        <link href="../../view/admin/assets/css/sorttable.css" rel="stylesheet" type="text/css"/>
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
                    <h4 class="breadcrumb-title">Assignment Details</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="list">Assignment List</a></li>
                        <li>Assignment Details</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Assignment Details</h4>
                                <c:if test="${success == 'afalse'}">
                                    <h6 class="alert-danger">Failed! Eval Weight must be a number > 0 and < 100!</h6>
                                </c:if>
                                <c:if test="${success == 'ufalse'}">
                                    <h6 class="alert-danger">Failed! Eval Weight must be a number > 0 and < 100!</h6>
                                </c:if>
                            </div>
                            <c:if test="${success == 'utrue'}">
                                <h6 class="alert-success">Update successful!</h6>
                            </c:if> 
                            <c:if test="${success == 'atrue'}">
                                <h6 class="alert-success">Add successful!</h6>
                            </c:if> 
                            <div class="widget-inner">
                                <form action="detail" id="detail" method="POST">
                                    <input type="hidden" name="action" value="${action}" id="action">
                                    <input type="text" name="ass_id" value="${requestScope.ass.ass_id}" hidden="true">
                                    <div class="form-group col-12" >
                                        <label class="col-form-label">Subject </label>                                      
                                        <c:if test="${requestScope.action == 'update'}">
                                            <div class="form-group col-12">
                                                <input name="subject" readonly="true" class="form-control" type="text" value="${requestScope.ass.subject_name}">
                                            </div>                                                </c:if>
                                        <c:if test="${requestScope.action == 'add'}">
                                            <select name="subject" class="form-control col-6">
                                                <c:forEach items="${requestScope.sub}" var="su" >                                            
                                                    <option 
                                                        <c:if test=""> selected </c:if>
                                                        value="${su.id}"
                                                        >${su.code}</option>
                                                </c:forEach>
                                            </select>
                                        </c:if>
                                    </div>
                                    <div class="form-group col-12">
                                        <label class="col-form-label">Assignment </label>
                                        <div>
                                            <input name="title" class="form-control" type="text" required="" value="${requestScope.ass.title}" >
                                        </div>
                                    </div>
                                        <div>
                                        <div class="form-group col-12">
                                        <label class="col-form-label">Is On Going</label>
                                        <div>
                                            <input name="is_ongoing" type="radio" value="1"
                                                   <c:if test="${requestScope.ass.is_ongoing == true}">
                                                       checked
                                                   </c:if>
                                                   checked
                                                   > 
                                            Going
                                            &nbsp;
                                            <input name="is_ongoing" type="radio" value="0"
                                                   <c:if test="${requestScope.ass.is_ongoing == false}">
                                                       checked
                                                   </c:if>
                                                   >
                                            Done
                                        </div>
                                    </div>
                                            </div>
                                        <div class="form-group col-12">
                                        <label class="col-form-label">Is Team Work</label>
                                        <div>
                                            <input name="is_team_work" type="radio" value="1"
                                                   <c:if test="${requestScope.ass.is_team_work == true}">
                                                       checked
                                                   </c:if>
                                                   checked
                                                   > 
                                            Team
                                            &nbsp;
                                            <input name="is_team_work" type="radio" value="0"
                                                   <c:if test="${requestScope.ass.is_team_work == false}">
                                                       checked
                                                   </c:if>
                                                   >
                                            Person
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <label class="col-form-label">Status</label>
                                        <div>
                                            <input name="status" type="radio" value="1"
                                                   <c:if test="${requestScope.ass.status == true}">
                                                       checked
                                                   </c:if>
                                                   checked
                                                   > 
                                            Active
                                            &nbsp;
                                            <input name="status" type="radio" value="0"
                                                   <c:if test="${requestScope.ass.status == false}">
                                                       checked
                                                   </c:if>
                                                   >
                                            Inactive
                                        </div>
                                    </div>
                                    
                                    <div class="form-group col-12">
                                        <label class="col-form-label">Eval Weight: </label>
                                        <div>
                                            <input name="eval_weight" class="form-control" type="number" required="" value="${requestScope.ass.eval_weight}">
                                        </div>
                                    </div>


                                    <div class="form-group col-12">
                                        <label class="col-form-label">Description</label>
                                        <div>
                                            <textarea name="ass_body" class="form-control">${requestScope.ass.ass_body}</textarea>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <a href="list"><button type="button" class="btn-secondry"><i class="fa fa-undo" aria-hidden="true"></i> Go back</button></a>
                                        <!--                                        <button type="submit" form="detail" class="btn">Save changes</button>-->
                                        <c:if test="${action == 'update'}">
                                            <button type="submit" form="detail" class="btn">Save changes</button>
                                        </c:if>
                                        <c:if test="${action == 'add'}">
                                            <button type="submit" form="detail" class="btn">Add new</button>
                                        </c:if>
                                        ${requestScope.confirm}
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
        <script src="../../view/admin/assets/vendors/chart/chart.min.js"></script>
        <script src="../../view/admin/assets/js/admin.js"></script>

    </body>

</html>
