<%-- 
    Document   : SubjectSettingList
    Created on : 12-Oct-2022, 22:20:34
    Author     : duyng
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />
        <title>Attendance Tracking</title>
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">

        <!-- PAGINATION ============================================= -->
        <link href="assets/css/pagination.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/pagination.js" type="text/javascript"></script>

        <!-- SORTTABLE ============================================= -->
        <script src="assets/js/sorttable.js" type="text/javascript"></script>
        <link href="assets/css/sorttable.css" rel="stylesheet" type="text/css"/>
        <style>
            table, th, td {
                border: 1px solid black;
                text-align: center;
            }
            
            button {
                background-color: blueviolet;
                color: white;
                border: none;
                border-radius: 5px;
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
                        <h1 class="text-white mt-5">Attendance Tracking</h1>
                    </div>
                </div>
            </div>

            <div >
                <div style="padding: 10px; margin-left: 20px; margin-right: 20px">
                    <table class="text-center">
                        <thead>
                            <tr class="bg-light-gray">
                                <th class="text-uppercase">Class</th>
                                <th class="text-uppercase">Subject</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${requestScope.classes}" var="c">
                            <form method="POST" action="attendancetracking">
                                <tr>
                                    <td>
                                        <a style="color: blueviolet" href="scheduleattendance?id=${c.class_id}">
                                                ${c.class_code}
                                        </a>
                                    </td>
                                    <td>
                                        ${c.subject_id.name}
                                    </td>
                                    <td>
                                        <input type="hidden" name="class" value="${c.class_id}"/>
                                        <input type="submit" value="View Report"
                                               style="background-color: blueviolet;
                                               color: white;
                                               border: none;
                                               border-radius: 5px;"
                                               />
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div style="padding: 10px; margin-left: 20px; margin-right: 20px">
                <br>

                <div>
                    <table>
                        <thead >
                            <tr class="bg-light-gray">
                                <th class="text-uppercase">Name</th>
                                <th class="text-uppercase">Absent(%)</th>
                                    <c:forEach items="${requestScope.schedules}" var="s">
                                    <th class="text-uppercase">

                                        <fmt:formatDate value="${s.training_date}" pattern="dd/MM"/></br>
                                    </th>
                                </c:forEach>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.trainees}" var="t">
                                <tr>
                                    <td>
                                        ${t.fullname}
                                    </td>
                                    <td>
                                        <c:set var = "count" value = "0"/>
                                        <c:forEach items="${requestScope.attendances}" var="a">
                                            <c:if test="${a.trainee_id.id eq t.id and a.status eq false}">
                                                <c:set var = "count" value = "${count + 1}"/>
                                            </c:if>
                                        </c:forEach>
                                        <fmt:formatNumber type = "percent" minFractionDigits = "0" value = "${(count/schedules.size())}" />
                                    </td>
                                    <c:forEach items="${requestScope.schedules}" var="s">
                                        <c:set var = "flag" value = "false"/>
                                        <c:forEach items="${requestScope.attendances}" var="a">
                                            <c:if test="${a.trainee_id.id eq t.id and a.schedule_id.schedule_id eq s.schedule_id}">

                                                <c:set var = "flag" value = "true"/>
                                                <c:choose>
                                                    <c:when test="${a.status eq true}">
                                                        <td style="color: green">P</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td style="color: red">A</td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>

                                        </c:forEach>
                                        <c:if test="${not flag}">
                                            <td>-</td>
                                        </c:if>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>

            <div class="footer-fixed" style="clear:  both">
                <%@include file="./Footer.jsp" %>
            </div>
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

    </body>
</html>
