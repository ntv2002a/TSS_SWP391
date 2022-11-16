<%-- 
    Document   : ScheduleDetail
    Created on : 27-Oct-2022, 06:44:57
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
        <title>Schedule Detail</title>
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
            .button {
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
                        <h1 class="text-white mt-5">Schedule Detail</h1>
                    </div>
                </div>
            </div>
            <div class="breadcrumb-row">
                <div class="container">
                    <ul class="list-inline">
                        <li><a href="schedulelist">Schedule List</a></li>
                        <li>Schedule Detail</li>
                    </ul>
                </div>
            </div>

            <div style="width: 900px; padding: 30px; margin: auto;">
                <form action="scheduledetail" method="POST" id="inputForm">
                    <input name="id" type="hidden" value="${schedule.schedule_id}">
                    <input name="action" type="hidden" value="${action}">
                    <c:if test="${action == 'view'}">
                        <table>
                            <tr>
                                <td class="col-2">Slot:</td>
                                <td>${schedule.slot.slot_name} (${schedule.slot.time_start} - ${schedule.slot.time_end})</td>
                            </tr>
                            <tr>
                                <td>Class</td>
                                <td>${schedule.classroom.class_code}</td>
                            </tr>
                            <tr>
                                <td>Subject</td>
                                <td>${schedule.classroom.subject_id.code} - ${schedule.classroom.subject_id.name}</td>
                            </tr>
                            <tr>
                                <td>Topic</td>
                                <td>${schedule.title}</td>
                            </tr>
                            <tr>
                                <td>Training date</td>
                                <td>${schedule.training_date}</td>
                            </tr>
                            <tr>
                                <td>Room</td>
                                <td>${schedule.room.room_code}</td>
                            </tr>
                        </table>  
                    </c:if>
                    <c:if test="${action == 'edit'}">
                        <table>
                            <tr>
                                <td class="col-2">Slot:</td>
                                <td>
                                    <div class="row">
                                        <select name="slot" class="col-5">
                                            <c:forEach items="${slots}" var="sl" varStatus="loop">
                                                <option value="${sl.slot_id}"
                                                        <c:if test="${sl.slot_id eq schedule.slot.slot_id}">
                                                            selected
                                                        </c:if>
                                                        >
                                                    ${sl.slot_name} - (${sl.time_start} - ${sl.time_end})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Class</td>
                                <td>${schedule.classroom.class_code}</td>
                            </tr>
                            <tr>
                                <td>Subject</td>
                                <td>${schedule.classroom.subject_id.code} - ${schedule.classroom.subject_id.name}</td>
                            </tr>
                            <tr>
                                <td>Topic</td>
                                <td>
                                    <input type="text" name="title" style="width: 400px;" value="${schedule.title}">
                                </td>
                            </tr>
                            <tr>
                                <td>Training date</td>
                                <td>
                                    <input type="date" name="date" value="${today.toString()}"
                                           min="${today.toString()}" value="${schedule.training_date.toString()}">
                                </td>
                            </tr>
                            <tr>
                                <td>Room</td>
                                <td>
                                    <div class="row">
                                        <select name="room" class="col-3">
                                            <c:forEach items="${rooms}" var="r">
                                                <option value="${r.room_id}"
                                                        <c:if test="${r.room_id eq schedule.room.room_id}">
                                                            selected
                                                        </c:if>
                                                        >
                                                    ${r.room_code}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="button" type="submit" value="SAVE">
                                </td>
                                <td>
                                    <c:if test="${actionStatus gt 0}">
                                        <p style="color: #00CC00">Schedule updated successfully!</p>
                                    </c:if>
                                    <c:if test="${actionStatus eq 0}">
                                        <p style="color: #d93223">Schedule updated unsuccessfully!</p>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                    </c:if>
                    <c:if test="${action == 'add'}">
                        <table>
                            <tr>
                                <td class="col-2">Slot:</td>
                                <td>
                                    <div class="row">
                                        <select name="slot" class="col-5">
                                            <c:forEach items="${slots}" var="sl" varStatus="loop">
                                                <option value="${sl.slot_id}">
                                                    ${sl.slot_name} - (${sl.time_start} - ${sl.time_end})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Class</td>
                                <td>
                                    <div class="row">
                                        <select name="class" class="col-5">
                                            <c:forEach items="${classes}" var="c" varStatus="loop">
                                                <option value="${c.class_id}">
                                                    ${c.class_code} (${c.subject_id.code} - ${c.subject_id.name})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Topic</td>
                                <td>
                                    <input type="text" name="title" style="width: 400px;">
                                </td>
                            </tr>
                            <tr>
                                <td>Training date</td>
                                <td>
                                    <input type="date" name="date" min="${today.toString()}" value="${today.toString()}">
                                </td>
                            </tr>
                            <tr>
                                <td>Room</td>
                                <td>
                                    <div class="row">
                                        <select name="room" class="col-3">
                                            <c:forEach items="${rooms}" var="r">
                                                <option value="${r.room_id}">
                                                    ${r.room_code}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="button" type="submit" value="SAVE">
                                </td>
                                <td>
                                    <c:if test="${actionStatus gt 0}">
                                        <p style="color: #00CC00">Schedule added successfully!</p>
                                    </c:if>
                                    <c:if test="${actionStatus eq 0}">
                                        <p style="color: #d93223">Schedule added unsuccessfully!</p>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                    </c:if>
                </form>
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
