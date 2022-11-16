<%-- 
    Document   : HomePage
    Created on : Sep 23, 2022, 10:03:33 PM
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
        <title>Web Contact List</title>
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
            <div class="page-banner ovbl-dark" style="background-image:url(../assets/images/banner/banner1.jpg);">
                <div class="container">
                    <div class="page-banner-entry">
                        <h1 class="text-white mt-5">Web Contact List</h1>
                    </div   >
                </div>
            </div>

            <div style="height: 700px; padding: 30px">
                <br>
                <div>
                    <form class="col-12 row" action="../contact/list" method="POST" id="filter">
                        <div class="form-group row col-4">
                            <label class="col-sm-3 col-form-label">Category ID:</label>
                            <div class="col-sm-9">
                                <select class="col-12 row" name="categoryid" onchange="document.getElementById('filter').submit()">
                                    <option value="-1"
                                            <c:if test="${requestScope.categoryId eq null}">
                                                selected
                                            </c:if>
                                            >All</option>
                                    <c:forEach items="${requestScope.categories}" var="c">
                                        <option value="${c}" 
                                                <c:if test="${requestScope.categoryId eq c}">
                                                    selected
                                                </c:if>>${c}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <br>

                <div style="margin-top: 10px">
                    <table class="table table-hover table-bordered sortable">
                        <tr>
                            <th>Id</th>
                            <th>Category ID</th>
                            <th>Name</th>
                            <th>Supporter</th>
                            <th>Email</th>
                            <th class="sorttable_nosort">Status</th>
                            <th class="sorttable_nosort">Action</th>
                        </tr>
                        <c:if test="${requestScope.webcontacts.size() gt 0}">
                            <c:forEach items = "${requestScope.webcontacts}" var="wc" varStatus="loop">
                                <tr>
                                    <td>${loop.count}</td>
                                    <td>${wc.categoryid}</td>
                                    <td>${wc.fullname}</td>
                                    <td>${wc.getSupportid().getFullname()}</td>
                                    <td>${wc.email}</td>
                                    <td>
                                        <input type="checkbox" disabled="disabled"
                                               <c:if test="${wc.response.length() gt 0}">
                                                   checked="checked"
                                               </c:if>
                                               />
                                    </td>
                                    <td><a href="../contact/detail?id=${wc.id}"><button>Edit</button></a></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
                </div>

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
        </script>
    </body>
</html>