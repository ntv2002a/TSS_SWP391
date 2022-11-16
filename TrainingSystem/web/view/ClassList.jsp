<%-- 
    Document   : ClassList
    Created on : Oct 9, 2022, 1:09:33 AM
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
        <title>Class List</title>
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
            table, th, td {
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
                background: blueviolet;
                text-align: center;
                border-radius: 5px;
                color: white;
            }
        </style>
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
                        <h1 class="text-white mt-5">Class List</h1>
                    </div   >
                </div>
            </div>



            <div style="height: 700px; padding: 30px">

                <br>
                <div>
                    <form class="col-12 row" action="list" method="POST" id="filter">
                        <div class="form-group row col-sm-2">
                            <label class="col-sm-4 col-form-label">Subject: </label>
                            <div class="col-sm-8">
                                <select class="col-12 row" name="subjectId" onchange="document.getElementById('filter').submit()">
                                    <option value="-1"
                                            <c:if test="${requestScope.subjectID eq null}">
                                                selected
                                            </c:if>
                                            >All</option>
                                    <c:forEach items="${requestScope.subjects}" var="s">
                                        <option value="${s.getId()}"
                                                <c:if test="${requestScope.subjectID eq s.getId()}">
                                                    selected
                                                </c:if>>${s.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row col-sm-2">
                            <label class="col-sm-4 col-form-label">Trainer: </label>
                            <div class="col-sm-8">
                                <select class="col-12 row" name="trainerId" onchange="document.getElementById('filter').submit()">
                                    <option value="-1"
                                            <c:if test="${requestScope.trainerID eq null}">
                                                selected
                                            </c:if>
                                            >All</option>
                                    <c:forEach items="${requestScope.trainers}" var="t">
                                        <option value="${t.getId()}" 
                                                <c:if test="${requestScope.trainerID eq t.getId()}">
                                                    selected
                                                </c:if>>${t.getFullname()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row col-sm-2">
                            <label class="col-sm-4 col-form-label">Supporter: </label>
                            <div class="col-sm-8">
                                <select class="col-12 row" name="supporterId" onchange="document.getElementById('filter').submit()">
                                    <option value="-1"
                                            <c:if test="${requestScope.supporterID eq null}">
                                                selected
                                            </c:if>
                                            >All</option>
                                    <c:forEach items="${requestScope.supporters}" var="s">
                                        <option value="${s.getId()}" 
                                                <c:if test="${requestScope.supporterID eq s.getId()}">
                                                    selected
                                                </c:if>>${s.getFullname()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row col-sm-2">
                            <label class="col-sm-3 col-form-label">Term: </label>
                            <div class="col-sm-9">
                                <select class="col-12 row" name="termId" onchange="document.getElementById('filter').submit()">
                                    <option value="-1"
                                            <c:if test="${requestScope.termId eq null}">
                                                selected
                                            </c:if>
                                            >All</option>
                                    <c:forEach items="${requestScope.terms}" var="t">
                                        <option value="${t.getSetting_id()}" 
                                                <c:if test="${requestScope.termID eq t.getSetting_id()}">
                                                    selected
                                                </c:if>>${t.getSetting_title()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row col-sm-2">
                            <label class="col-sm-3 col-form-label">Status: </label>
                            <div class="col-sm-9">
                                <select class="col-12 row" name="status" onchange="document.getElementById('filter').submit()">
                                    <option value="-1"
                                            <c:if test="${requestScope.statusFlag eq null}">
                                                selected
                                            </c:if>
                                            >All</option>
                                    <c:forEach items="${requestScope.status}" var="s">
                                        <option value="${s}" 
                                                <c:if test="${requestScope.statusFlag eq s}">
                                                    selected
                                                </c:if>>
                                            <c:if test="${s eq 2}">Closed</c:if>
                                            <c:if test="${s eq 1}">Active</c:if>
                                            <c:if test="${s eq 0}">Inactive</c:if>
                                            </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row col-sm-3">
                            <label class="col-sm-3 col-form-label">Code: </label>
                            <div class="col-sm-9">
                                <ul class="row">
                                    <li class="col-sm-10 row"><input style="padding: 5px 80px 5px 15px" type="text" placeholder="Search by Code..." name="search_by_code"></li>
                                    <li class="col-sm-2 row"><button style="padding: 5px 15px 5px 15px" id="quik-search-btn" type="submit" class="btn-link"><i class="fa fa-search"></i></button></li>
                                </ul>
                            </div>
                        </div>

                        <div class="wc-title form-group row col sm-2">
                            <div class="btn btn-success btn-outline-primary ml-auto mr-3 row col-2"><a href="/TrainingSystem/class/detail?action=add">
                                    <i class="fa fa-plus-circle" style="font-size:18px"></i>
                                    <spam class="mb-5">Add new class</spam></a>
                            </div>
                        </div>

                        <table class="table table-hover table-bordered sortable">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Code</th>
                                    <th>Subject</th>
                                    <th>Term</th>
                                    <th>Trainer</th>
                                    <th>Supporter</th>
                                    <th class="sorttable_nosort">Status</th>
                                    <th colspan="2" class="sorttable_nosort" style="text-align: center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.classes}" var="c" varStatus="loop">
                                    <tr>
                                        <td>${loop.count}</td>
                                        <td>${c.getClass_code()}</td>
                                        <td>${c.getSubject_id().getName()}</td>
                                        <td>${c.getTerm_id().getSetting_title()}</td>
                                        <td>${c.getTrainer_id().getFullname()}</td>
                                        <td>${c.getSupporter_id().getFullname()}</td>

                                        <c:if test="${c.getStatus() eq 0}">
                                            <td id="inactiveStatus">Inactive</td>
                                        </c:if>
                                        <c:if test="${c.getStatus() eq 1}">
                                            <td id="activeStatus">Active</td>
                                        </c:if>
                                        <c:if test="${c.getStatus() eq 2}">
                                            <td id="closedStatus">Closed</td>
                                        </c:if>    

                                        <td><a class="button" href="detail?id=${c.getClass_id()}"> Edit </a></td>
                                        <td id="status_change_${c.getClass_id()}">
                                            <select class="col-12 row" name="status_change_${c.getClass_id()}" onchange="changeStatus(${c.getClass_id()})">
                                                <option <c:if test="${c.getStatus() eq 1}">selected</c:if> value="1">
                                                        Activate
                                                    </option>
                                                    <option <c:if test="${c.getStatus() eq 0}">selected</c:if> value="0">
                                                        Deactivate
                                                    </option>
                                                    <option <c:if test="${c.getStatus() eq 2}">selected</c:if> value="2">
                                                        Close
                                                    </option>
                                                </select>
                                            </td>
                                        </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
                <br>

                <div id="pagination" class="d-flex justify-content-center">

                </div>
            </div>

            <div class="footer-fixed" style="clear:  both">
                <%@include file="./Footer.jsp" %>
            </div>
        </div>
        <!-- Content END-->
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
        <script>
                                                pagger_render("pagination",${requestScope.pageindex},${requestScope.totalpage}, 2, "list?");
                                                function changeStatus(id) {
                                                    var changed = document.getElementById("status_change_" + id);

                                                    const input = document.createElement("input");
                                                    input.setAttribute("name", "status_change_check");
                                                    input.setAttribute("type", "hidden");
                                                    input.setAttribute("value", id);

                                                    changed.appendChild(input);

                                                    document.getElementById("filter").submit();
                                                }
        </script>
    </body>
</html>
