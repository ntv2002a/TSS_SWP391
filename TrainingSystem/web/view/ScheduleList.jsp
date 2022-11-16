<%-- 
    Document   : ScheduleList
    Created on : 27-Oct-2022, 04:26:15
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
        <title>Subject Setting List</title>
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
                border: 1px solid lightgray;
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
                        <h1 class="text-white mt-5">Schedule List</h1>
                    </div   >
                </div>
            </div>

            <div style="padding: 10px; margin-left: 20px; margin-right: 20px">
                <br>
                <div>
                    <div class="row">
                        <a href="scheduledetail?action=add">
                            <button style="
                                    height: 40px;
                                    background-color: #F7B205;
                                    color: black;
                                    margin-left: 1500px;">
                                Add schedule</button>
                        </a>
                        <a href="attendancetracking">
                            <button style="
                                    height: 40px;
                                    background-color: #F7B205;
                                    color: black;
                                    margin-left: 10px;">
                                Attendance Tracking</button>
                        </a>
                    </div>
                    <form class="col-12 row" action="schedulelist" method="POST" id="filter">
                        <div class="form-group row col-6">
                            <div class="col-sm-2">
                                <select class="row" name="year" onchange="document.getElementById('filter').submit()">
                                    <option value="2022">2022</option>
                                    <option value="2023">2023</option>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <select class="row" name="week" onchange="document.getElementById('filter').submit()">
                                    <c:forEach items="${weeks}" var="w" varStatus="loop">
                                        <option value="${loop.index}"
                                                <c:if test="${loop.index eq chosenWeekIndex}">
                                                    selected
                                                </c:if>
                                                >
                                            ${w.toString()}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </form>
                    <table>
                        <tr>
                            <th>Slot</th>
                            <th>Topic</th>
                            <th>Date</th>
                            <th>From time</th>
                            <th>To time</th>
                            <th>Room</th>
                            <th style="width: 150px">Attendance</th>
                            <th style="width: 150px">Action</th>
                        </tr>
                        <c:forEach items="${schedules}" var="s" varStatus="loop">
                            <tr>
                                <td>${s.slot.slot_name}</td>
                                <td>${s.title}</td>
                                <td>${s.training_date}</td>
                                <td>${s.slot.time_start}</td>
                                <td>${s.slot.time_end}</td>
                                <td>${s.room.room_code}</td>
                                <td>
                                    <c:if test="${today.toString().compareTo(s.training_date.toString()) eq 0}">
                                        <a href="attendancedetails?action=add&schedule=${s.schedule_id}&class=${s.classroom.class_id}">
                                            <button>Take</button>
                                        </a>
                                        <a href="attendancedetails?action=edit&schedule=${s.schedule_id}&class=${s.classroom.class_id}">
                                            <button>Edit</button>
                                        </a>
                                    </c:if>
                                </td>
                                <td>
                                    <a href="scheduledetail?id=${s.schedule_id}&action=view">
                                        <button>View</button>
                                    </a>
                                    <a href="scheduledetail?id=${s.schedule_id}&action=edit">
                                        <button>Edit</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div id="pagination"></div><br/>
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
        <script>
                                    pagger_render("pagination",${requestScope.pageIndex},${requestScope.totalPage}, 2, "subjectsettinglist?");
        </script>
    </body>
</html>
