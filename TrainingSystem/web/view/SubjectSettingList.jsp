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
                        <h1 class="text-white mt-5">Subject Setting List</h1>
                    </div   >
                </div>
            </div>

            <div style="padding: 10px; margin-left: 20px; margin-right: 20px">
                <br>
                <div>
                    <form class="col-12 row" action="subjectsettinglist" method="POST" id="filter">
                        <i class="fa fa-filter"></i><br/>
                        <div class="form-group row col-9">
                            <div class="col-sm-3">
                                <select class="row" name="type" onchange="document.getElementById('filter').submit()">
                                    <option value="-1"
                                            <c:if test="${requestScope.typeID eq null}">
                                                selected
                                            </c:if>
                                            >All type title</option>
                                    <c:forEach items="${requestScope.types}" var="t" varStatus="loop">
                                        <option value="${t.setting_id}"
                                                <c:if test="${requestScope.typeID eq t.setting_id}">
                                                    selected
                                                </c:if>
                                                >${t.setting_title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row col-3">
                            <div class="row">
                                <input type="text" name="namepart" value="${requestScope.namepart}">
                                <input style="background-color: blueviolet; color: white; border-radius: 5px; border: none" type="submit" value="Search">
                            </div>
                        </div>
                    </form>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Setting type title</th>
                            <th>Setting type</th>
                            <th>Subject</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach items="${requestScope.subjectSettings}" var="ss" varStatus="loop"> 
                            <tr>
                                <td>${ss.setting_id}</td>
                                <td>${ss.type_id.type_id.setting_title}</td>
                                <td>${ss.setting_title}</td>
                                <td>${ss.subject.name}</td>
                                <td>
                                    <a href="subjectsettingdetail?id=${ss.setting_id}&action=view">
                                        <button>View</button>
                                    </a>
                                    <a href="subjectsettingdetail?id=${ss.setting_id}&action=edit">
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
                                    pagger_render("pagination",${requestScope.pageIndex},${requestScope.totalpage}, 2, "subjectsettinglist?");
        </script>
    </body>
</html>
