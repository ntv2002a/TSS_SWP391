<%-- 
    Document   : TeamList
    Created on : Nov 3, 2022, 12:23:25 AM
    Author     : trung
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
        <title>Team List</title>
        <link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="../assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="../assets/css/color/color-1.css">

        <!-- PAGINATION ============================================= -->
        <link href="../assets/css/pagination.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/js/pagination.js" type="text/javascript"></script>

        <!-- SORTTABLE ============================================= -->
        <script src="../assets/js/sorttable.js" type="text/javascript"></script>
        <link href="../assets/css/sorttable.css" rel="stylesheet" type="text/css"/>
        
        

        <style>
            a {
                color: blue;
            }

            table, th{
                text-align: center;
            }

            #inactiveStatus {
                color: red;
            }

            #activeStatus {
                color: limegreen;
            }

            #closedStatus {
                color: graytext;
            }

            .button {
                display: block;
                background: ;
                text-align: center;
                border-radius: 5px;
                color: black;
            }

            #button {
                display: block;
                background: blueviolet;
                text-align: center;
                border-radius: 5px;
                color: white;
            }
        </style>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('tr.parent')
                        .css("cursor", "pointer")
                        .attr("title", "Click to expand/collapse")
                        .click(function () {
                            $(this).siblings('.child-' + this.id).toggle();
                        });
                $('tr[@class^=child-]').hide().children('td');
            });
        </script>
    </head>
    <body>
        <header>
            <%@include file="./Header.jsp"%>
        </header>

        <div class="page-content bg-white" style="">
            <!-- inner page banner -->
            <div class="page-banner ovbl-dark" style="background-image:url(../assets/images/banner/banner1.jpg);">
                <div class="container">
                    <div class="page-banner-entry">
                        <h1 class="text-white mt-5">Team List</h1>
                    </div>
                </div>
            </div>

            <div style="padding: 30px;">
                <br>
                <div>
                    <form class="col-12 row" action="list" method="POST" id="filter">
                        <div class="form-group row col-sm-6">
                            <label class="col-sm-2 col-form-label">Milestone: </label>
                            <div class="col-sm-8">
                                <select class="col-12 row" name="milestone_id" onchange="document.getElementById('filter').submit()">
                                    <c:forEach items="${requestScope.milestones}" var="m">
                                        <option value="${m.getId()}"
                                                <c:if test="${requestScope.milestone_id eq m.getId()}">
                                                    selected
                                                </c:if>>${m.getTitle()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row col-sm-6">
                            <label class="col-sm-2 col-form-label">Status: </label>
                            <div class="col-sm-8">
                                <select class="col-12 row" name="status" onchange="document.getElementById('filter').submit()">
                                    <option value="-1"
                                            <c:if test="${requestScope.status eq -1}">
                                                selected
                                            </c:if>>All</option>
                                    <option value="1"
                                            <c:if test="${requestScope.status eq 1}">
                                                selected
                                            </c:if>>Active</option>
                                    <option value="0"
                                            <c:if test="${requestScope.status eq 0}">
                                                selected
                                            </c:if>>Inactive</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row col-sm-12">
                            <c:if test="${requestScope.teams.size() eq 0}">
                                Trainees have not been grouped.</c:if>

                            <c:if test="${requestScope.teams.size() ne 0}">
                                This milestone has groups already.
                            </c:if>

                            <a style="color: blue" href="detail?milestone_id=${requestScope.milestone_id}&action=add"><u>Add a new group</u></a>
                        </div>
                        <br>


                        <div class="form-group row col-sm-12">
                            <table class="table table-hover table-bordered" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Student</th>
                                        <th>Email</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <tr class="parent" id="row0" title="Click to expand/collapse" style="cursor: pointer;">
                                        <td style="text-align: left; background-color: lightgrey;" colspan="5">Waiting List (These trainees would work personally</td>
                                    </tr>
                                    <c:forEach items="${requestScope.wTrainee}" var="wr" varStatus="loop">
                                        <tr class="child-row0" style="display: none;">
                                            <td>${loop.count}</td>
                                            <td>${wr.getFullname()}</td>
                                            <td>${wr.getEmail()}</td>
                                            <td <c:if test="${wr.getStatus() eq 1}">id="activeStatus">Active</c:if>
                                                <c:if test="${wr.getStatus() eq 0}">id="inactiveStatus">Inactive</c:if></td>
                                                <td></td>
                                            </tr>
                                    </c:forEach>

                                    <c:forEach items="${requestScope.teams}" var="t">
                                        <tr class="parent" id="row${t.getTeam_id()}" title="Click to expand/collapse" style="cursor: pointer;">
                                            <td style="text-align: left; background-color: lightgrey;" colspan="3">${t.getTeam_code()}  (${t.getTopic_name()})</td>
                                            <td style="background-color: lightgrey;"
                                                <c:if test="${t.getStatus() eq true}"> id="activeStatus">Active</c:if>
                                                <c:if test="${t.getStatus() eq false}"> id="inactiveStatus">Inactive</c:if>
                                                </td>
                                                <td style="background-color: lightgrey;"><a class="button" href="detail?team_id=${t.getTeam_id()}&action=view"> Edit </a></td>
                                        </tr>
                                        <c:forEach items="${t.getTeam_member()}" var="tm" varStatus="loop">
                                            <tr class="child-row${t.getTeam_id()}" style="display: none;">
                                                <td>${loop.count}</td>
                                                <td>${tm.getFullname()}</td>
                                                <td>${tm.getEmail()}</td>
                                                <td <c:if test="${tm.getStatus() eq 1}">id="activeStatus">Active</c:if>
                                                    <c:if test="${tm.getStatus() eq 0}">id="inactiveStatus">Inactive</c:if></td>
                                                    <td></td>
                                                </tr>
                                        </c:forEach>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>


            <div class="footer-fixed" style="clear:  both">
                <%@include file="./Footer.jsp" %>
            </div>
        </div>
        
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="../assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="../assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="../assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="../assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="../assets/vendors/counter/waypoints-min.js"></script>
        <script src="../assets/vendors/counter/counterup.min.js"></script>
        <script src="../assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="../assets/vendors/masonry/masonry.js"></script>
        <script src="../assets/vendors/masonry/filter.js"></script>
        <script src="../assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="../assets/js/functions.js"></script>
        <script src="../assets/js/contact.js"></script>
    </body>


</html>
