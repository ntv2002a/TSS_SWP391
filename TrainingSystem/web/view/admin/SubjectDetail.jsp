<%-- 
    Document   : SubjectDetail
    Created on : 24-Sep-2022, 23:11:37
    Author     : duyng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <title> Subject Detail </title>

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
                    <h4 class="breadcrumb-title">Subject List</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="list">Subject List</a></li>
                        <li>${requestScope.subject.code}</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>Subject List</h4>
                            </div>
                            <div class="widget-inner">
                                <form action="detail" method="POST" id="detailForm">
                                    <input type="hidden" name="id" value="${requestScope.subject.id}">
                                    <table>
                                        <tr>
                                            <td class="col-2">ID:</td>
                                            <td class="col-10">${requestScope.subject.id}</td>
                                        </tr>
                                        <tr>
                                            <td>Code:</td>
                                            <td>
                                                <c:if test="${requestScope.action == 'view'}">
                                                    ${requestScope.subject.code}
                                                </c:if>
                                                <c:if test="${requestScope.action == 'edit'}">
                                                    <input type="text" name="code" id="code" value="${requestScope.subject.code}"
                                                           <c:if test="${sessionScope.roles.isAdmin() eq false}">
                                                               disabled
                                                           </c:if>
                                                           >
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Name:</td>
                                            <td>
                                                <c:if test="${requestScope.action == 'view'}">
                                                    ${requestScope.subject.name}
                                                </c:if>
                                                <c:if test="${requestScope.action == 'edit'}">
                                                    <input type="text" name="name" id="name" value="${requestScope.subject.name}" style="width: 400px"
                                                           <c:if test="${sessionScope.roles.isAdmin() eq false}">
                                                               disabled
                                                           </c:if>
                                                           >
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Manager:</td>
                                            <td>
                                                <c:if test="${requestScope.action == 'view'}">
                                                    ${requestScope.subject.manager.fullname}
                                                </c:if>
                                                <c:if test="${requestScope.action == 'edit'}">
                                                    <select name="manager"
                                                            <c:if test="${sessionScope.roles.isAdmin() eq false}">
                                                                disabled
                                                            </c:if>
                                                            >
                                                        <c:forEach items="${requestScope.managers}" var="m" varStatus="loop">
                                                            <option value="${m.id}"
                                                                    <c:if test="${requestScope.subject.manager.id eq m.id}">
                                                                        selected
                                                                    </c:if>
                                                                    >
                                                                ${m.fullname}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Expert:</td>
                                            <td>
                                                <c:if test="${requestScope.action == 'view'}">
                                                    ${requestScope.subject.expert.fullname}
                                                </c:if>
                                                <c:if test="${requestScope.action == 'edit'}">
                                                    <select name="expert">
                                                        <c:forEach items="${requestScope.experts}" var="e" varStatus="loop">
                                                            <option value="${e.id}"
                                                                    <c:if test="${requestScope.subject.expert.id eq e.id}">
                                                                        selected
                                                                    </c:if>
                                                                    >
                                                                ${e.fullname}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Status:</td>
                                            <td>
                                                <c:if test="${requestScope.action == 'view'}">
                                                    <c:if test="${requestScope.subject.status eq true}">
                                                        <label style="color: #00CC00">Active</label>
                                                    </c:if>
                                                    <c:if test="${requestScope.subject.status eq false}">
                                                        <label style="color: #2d3239">Inactive</label>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.action == 'edit'}">
                                                    <input id="activeStatus" type="radio" name="status" value="true"
                                                           <c:if test="${requestScope.subject.status eq true}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label for="activeStatus">Active</label>
                                                    <input id="inactiveStatus" type="radio" name="status" value="false"
                                                           <c:if test="${requestScope.subject.status eq false}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label for="inactiveStatus">Inactive</label>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Body:</td>
                                            <td>
                                                <c:if test="${requestScope.action == 'view'}">
                                                    ${requestScope.subject.body}
                                                </c:if>
                                                <c:if test="${requestScope.action == 'edit'}">
                                                    <input type="text" name="body" value="${requestScope.subject.body}" style="width: 400px; height: 100px"
                                                           <c:if test="${sessionScope.roles.isAdmin() eq false}">
                                                               disabled
                                                           </c:if>
                                                           >
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <c:if test="${requestScope.action eq 'edit'}">
                                                    <input type="submit" value="Save" onclick="updateAlert()">
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
        <script>
                                                    function updateAlert() {
            <c:if test="${requestScope.updateStatus ne 0}">
                                                        alert("Updated successfully!");
            </c:if>
            <c:if test="${requestScope.updateStatus eq 0}">
                                                        alert("Updated failed!");
            </c:if>
                                                    }
        </script>
    </body>
</html>