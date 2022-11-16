<%-- 
    Document   : SubjectSettingList
    Created on : 12-Oct-2022, 22:20:34
    Author     : duyng
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
        <title>Attendance Detail</title>
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
                        <h1 class="text-white mt-5">Attendance Detail</h1>
                    </div   >
                </div>
            </div>
            <c:if test="${requestScope.action eq 'add'}">
                <div style="padding: 10px; margin-left: 20px; margin-right: 20px">
                    <br>
                    <form method="POST" action="attendancedetails">
                        <div>
                            <table>
                                <tr>
                                    <th>Index</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Comment</th>
                                </tr>
                                <c:forEach items="${requestScope.trainees}" var="t" varStatus="loop"> 
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                    <input type="text" value="${loop.index + 1}" name="indexes" hidden/>
                                    <td>${t.fullname}</td>
                                    <input type="text" value="${t.id}" name="traineeID${loop.index+1}" hidden/>
                                    <td>${t.email}</td>
                                    <td>
                                        <input type="radio" value="true" name="status${loop.index+1}"/>Present
                                        <input type="radio" value="false" checked name="status${loop.index+1}"/>Absent
                                    </td>
                                    <td>
                                        <input type="text" name="comment${loop.index+1}"/>
                                    </td>

                                    </tr>
                                </c:forEach>
                            </table>
                            <input type="submit" value="Take"/>
                        </div>
                    </form>
                </div>
            </c:if>
            
            <c:if test="${requestScope.action eq 'edit'}">
                <div style="padding: 10px; margin-left: 20px; margin-right: 20px">
                    <br>
                    <form method="POST" action="attendancedetails">
                        <div>
                            <table>
                                <tr>
                                    <th>Index</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Comment</th>
                                </tr>
                                <c:forEach items="${requestScope.attendances}" var="a" varStatus="loop"> 
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                    <input type="text" value="${loop.index + 1}" name="indexes" hidden/>
                                    <td>${a.trainee_id.fullname}</td>
                                    <input type="text" value="${a.trainee_id.id}" name="traineeID${loop.index+1}" hidden/>
                                    <td>${a.trainee_id.email}</td>
                                    <td>
                                        <input type="radio" value="true" name="status${loop.index+1}"
                                               <c:if test="${a.status}">
                                                   checked
                                               </c:if>
                                               />Present
                                        <input type="radio" value="false" name="status${loop.index+1}"
                                               <c:if test="${not a.status}">
                                                   checked
                                               </c:if>
                                               />Absent
                                    </td>
                                    <td>
                                        <input type="text" name="comment${loop.index+1}"
                                               value="${a.comment}"
                                               />
                                    </td>

                                    </tr>
                                </c:forEach>
                            </table>
                            
                            <input type="submit" value="Edit"/>
                        </div>
                    </form>
                </div>
            </c:if>
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
