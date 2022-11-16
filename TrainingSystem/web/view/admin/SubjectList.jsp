<%-- 
    Document   : SubjectList
    Created on : 22-Sep-2022, 10:09:26
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
        <title> Subject List </title>

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
                        <li><a href="../../manage/dashboard/view"><i class="fa fa-home"></i>Home</a></li>
                        <li>Subject List</li>
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
                                <div id="subject_list">
                                    <form class="col-9 row" action="list" method="POST" id="filter">
                                        <i class="fa fa-filter"></i><br/>
                                        <div class="form-group row col-3">
                                            <label class="col-sm-3 col-form-label">Manager:</label>
                                            <div class="col-sm-9">
                                                <select class="row" name="manager" onchange="document.getElementById('filter').submit()">
                                                    <option value="-1"
                                                            <c:if test="${requestScope.expert_id eq null}">
                                                                selected
                                                            </c:if>
                                                            >ALL</option>
                                                    <c:forEach items="${requestScope.managers}" var="m" varStatus="loop">
                                                        <option value="${m.id}"
                                                                <c:if test="${requestScope.manager_id eq m.id}">
                                                                    selected
                                                                </c:if>
                                                                >${m.fullname}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row col-3">
                                            <label class="col-sm-3 col-form-label">Expert:</label>
                                            <div class="col-sm-9">
                                                <select class="row" name="expert" onchange="document.getElementById('filter').submit()">
                                                    <option value="-1"
                                                            <c:if test="${requestScope.expert_id eq null}">
                                                                selected
                                                            </c:if>
                                                            >ALL</option>
                                                    <c:forEach items="${requestScope.experts}" var="e" varStatus="loop">
                                                        <option value="${e.id}"
                                                                <c:if test="${requestScope.expert_id eq e.id}">
                                                                    selected
                                                                </c:if>
                                                                >${e.fullname}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row col-3">
                                            <label class="col-sm-3 col-form-label">Status:</label>
                                            <div class="col-sm-9">
                                                <select class="row" name="status" onchange="document.getElementById('filter').submit()">
                                                    <option value="null" 
                                                            <c:if test="${requestScope.status eq null}">
                                                                selected
                                                            </c:if>
                                                            >ALL</option>
                                                    <option value="true" 
                                                            <c:if test="${requestScope.status eq true}">
                                                                selected
                                                            </c:if>
                                                            >Active</option>
                                                    <option value="false"
                                                            <c:if test="${requestScope.status eq false}">
                                                                selected
                                                            </c:if>
                                                            >Inactive</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row col-3">
                                            <div class="col-sm-9 row">
                                                <input type="text" name="namepart" value="${requestScope.namepart}">
                                                <input type="submit" value="Search">
                                            </div>
                                        </div>

                                    </form>
                                    <table class="sortable" border="1">
                                        <tr>
                                            <th>ID</th>
                                            <th>Code</th>
                                            <th>Name</th>
                                            <th>Manager</th>
                                            <th>Expert</th>
                                            <th class="sorttable_nosort">Status</th>
                                            <th class="sorttable_nosort">Action</th>
                                        </tr>
                                        <c:forEach items="${requestScope.subjects}" var="s" varStatus="loop">
                                            <tr>
                                                <td>${s.id}</td>
                                                <td>${s.code}</td>
                                                <td>${s.name}</td>
                                                <td>${s.manager.fullname}</td>
                                                <td>${s.expert.fullname}</td>
                                                <td>
                                                    <c:if test="${s.status eq true}">
                                                        <label style="color: #00CC00">Active</label>
                                                    </c:if>
                                                    <c:if test="${s.status eq false}">
                                                        <label style="color: #2d3239">Inactive</label>
                                                    </c:if>    
                                                </td>
                                                <td>
                                                    <a href="detail?id=${s.id}&action=view">
                                                        <button>View</button>
                                                    </a>
                                                    <a href="detail?id=${s.id}&action=edit"">
                                                        <button>Edit</button>
                                                    </a>
                                                    <c:if test="${s.status eq true}">
                                                        <div id="change_status_${s.id}">
                                                            <button onclick="changeStatus(${s.id})" style="color: white; background-color: red; width: 97px;">Deactivate</button>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${s.status eq false}">
                                                        <div id="change_status_${s.id}">
                                                            <button onclick="changeStatus(${s.id})" style="color: white; background-color: #00CC00; width: 97px;">Activate</button>
                                                        </div>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                    <div id="pagination"></div>
                                </div>
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
        <script>
                                                                pagger_render("pagination",${requestScope.pageindex},${requestScope.totalpage}, 2, 'list?');

                                                                function changeStatus(id) {
                                                                    var change = document.getElementById("filter");

                                                                    const input = document.createElement("input");
                                                                    input.setAttribute("name", "changeStatus");
                                                                    input.setAttribute("type", "hidden");
                                                                    input.setAttribute("value", id);

                                                                    change.appendChild(input);

                                                                    document.getElementById("filter").submit();
                                                                }
        </script>
    </body>
</html>
