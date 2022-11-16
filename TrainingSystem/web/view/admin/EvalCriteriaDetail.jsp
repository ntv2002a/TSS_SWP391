<%-- 
    Document   : EvalCriteriaDetail
    Created on : 14-Oct-2022, 10:53:25
    Author     : duyng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <title> Eval Criteria Detail </title>

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
                    <h4 class="breadcrumb-title">Eval Criteria List</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="list">Eval Criteria List</a></li>
                        <li style="text-transform: capitalize">${requestScope.action} eval criteria detail</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Eval Criteria Detail</h4>
                            </div>
                            <div class="widget-inner">
                                <form action="detail" method="POST">
                                    <input type="hidden" name="id" value="${requestScope.ec.criteria_id}">
                                    <input type="hidden" name="action" value="${requestScope.action}">
                                    <table>
                                        <tr>
                                            <td>Assignment</td>
                                            <td>
                                                <select name="assignment">
                                                    <c:forEach items="${requestScope.assignments}" var="a" varStatus="loop">
                                                        <option value="${a.ass_id}"
                                                                <c:if test="${ec.ass_id.ass_id eq a.ass_id}">
                                                                    selected
                                                                </c:if>
                                                                >${a.title} - ${a.subject_id.code}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Milestone</td>
                                            <td>
                                                <select name="milestone">
                                                    <c:forEach items="${requestScope.milestones}" var="m" varStatus="loop">
                                                        <option value="${m.id}"
                                                                <c:if test="${m.id eq ec.milestone_id.id}">
                                                                    selected
                                                                </c:if>
                                                                >
                                                            ${m.title} (${m.from_date} to ${m.to_date})
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Criteria name</td>
                                            <td>
                                                <input name="criteria_name" type="text" value="${ec.criteria_name}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Is team eval</td>
                                            <td>
                                                <input type="checkbox" name="is_team_eval" value="true"
                                                       <c:if test="${ec.is_team_eval eq true}">
                                                           checked
                                                       </c:if>
                                                       >
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p>Eval weight <span style="color: red">(*)</span></p>
                                            </td>
                                            <td>
                                                <input type="number" name="eval_weight" value="${ec.eval_weight}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p>Max LOC <span style="color: red">(*)</span></p>
                                            </td>
                                            <td>
                                                <input type="number" name="max_loc" value="${ec.max_loc}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Status</td>
                                            <td>
                                                <input name="status" type="radio" value="true"
                                                       <c:if test="${ec.status eq true}">
                                                           checked
                                                       </c:if>
                                                       > Active
                                                &nbsp;&nbsp;
                                                <input name="status" type="radio" value="false"
                                                       <c:if test="${ec.status ne true}">
                                                           checked
                                                       </c:if>
                                                       > Inactive
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Description</td>
                                            <td>
                                                <textarea rows="4" cols="50">
                                                    ${ec.description}
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="submit" 
                                                       <c:if test="${action eq 'add'}">
                                                           value="ADD"
                                                       </c:if>
                                                       <c:if test="${action eq 'edit'}">
                                                           value="SAVE"
                                                       </c:if>
                                                       >
                                            </td>
                                            <td>
                                                <c:if test="${actionStatus ne null}">
                                                    <c:if test="${action == 'add'}">
                                                        <c:if test="${actionStatus ne 0}">
                                                            <p style="color: #00CC00">New eval criteria added successfully!</p>
                                                        </c:if>
                                                        <c:if test="${actionStatus eq 0}">
                                                            <p style="color: #d93223">New eval criteria added unsuccessfully!</p>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${action == 'edit'}">
                                                        <c:if test="${actionStatus ne 0}">
                                                            <p style="color: #00CC00">New eval criteria updated successfully!</p>
                                                        </c:if>
                                                        <c:if test="${actionStatus eq 0}">
                                                            <p style="color: #d93223">New eval criteria updated unsuccessfully!</p>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </table>
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
        <script src="../../view/admin/assets/js/subjectdetailvalidation.js" type="text/javascript"></script>
    </body>
</html>
