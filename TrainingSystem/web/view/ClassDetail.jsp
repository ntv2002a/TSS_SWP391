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
        <title>Class Detail</title>
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

        <style>
            .buttonSave {
                background: blueviolet;
                text-align: center;
                border-radius: 5px;
                color: white;
            }

            .buttonCancel {
                background: graytext;
                text-align: center;
                border-radius: 5px;
                color: white;
            }

            #status {
                padding-left: 30px;
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
                        <h1 class="text-white mt-5">Class Detail</h1>
                    </div>
                </div>
            </div>
            <div class="breadcrumb-row">
                <div class="container">
                    <ul class="list-inline">
                        <li><a href="/TrainingSystem/class/list">Class List</a></li>
                        <li>Class Detail</li>
                    </ul>
                </div>
            </div>

            <div style="width: 900px; padding: 30px; margin: auto;">
                <form action="../class/detail" method="POST">
                    <c:if test="${requestScope.action eq null}">
                        <input name="id" type="hidden" value="${requestScope.cldetail.getClass_id()}">
                        <table>
                            <tr>
                                <td>Class Code</td>
                                <td style="padding-left: 30px;">${requestScope.cldetail.getClass_code()}</td>
                            </tr>
                            <tr>
                                <td>Class Subject</td>
                                <td>
                                    <select name="subjectId">
                                        <c:forEach items="${requestScope.subjects}" var="s">
                                            <option value="${s.getId()}"
                                                    <c:if test="${requestScope.cldetail.getSubject_id().getId() eq s.getId()}">
                                                        selected
                                                    </c:if>>${s.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Class Term</td>
                                <td>
                                    <select name="termId">
                                        <c:forEach items="${requestScope.terms}" var="t">
                                            <option value="${t.getSetting_id()}" 
                                                    <c:if test="${requestScope.cldetail.getTerm_id().getSetting_id() eq t.getSetting_id()}">
                                                        selected
                                                    </c:if>>${t.getSetting_title()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Class Trainer</td>
                                <td>
                                    <select name="trainerId">
                                        <c:forEach items="${requestScope.trainers}" var="t">
                                            <option value="${t.getId()}" 
                                                    <c:if test="${requestScope.cldetail.getTrainer_id().getId() eq t.getId()}">
                                                        selected
                                                    </c:if>>${t.getFullname()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Class Supporter</td>
                                <td>
                                    <select name="supporterId">
                                        <c:forEach items="${requestScope.supporters}" var="s">
                                            <option value="${s.getId()}" 
                                                    <c:if test="${requestScope.cldetail.getSupporter_id().getId() eq s.getId()}">
                                                        selected
                                                    </c:if>>${s.getFullname()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Status</td>
                                <c:if test="${requestScope.cldetail.getStatus() eq 2}"><td id="status" style="color: black">Closed</td></c:if>
                                <c:if test="${requestScope.cldetail.getStatus() eq 1}"><td id="status" style="color: limegreen">Active</td></c:if>
                                <c:if test="${requestScope.cldetail.getStatus() eq 0}"><td id="status" style="color: red">Inactive</td></c:if>
                                </tr>
                                <tr>
                                    <td>Description</td>
                                    <td>
                                        <textarea name="description" style="height: 100px; width: 100%" placeholder="    Input API Config here!"><c:if test="${requestScope.cldetail.getDescription() ne null}">${requestScope.cldetail.getDescription()}</c:if></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <div style="padding-left: 480px">
                                            <button class="buttonSave" type="submit">Save Changes</button>
                                            <button class="buttonCancel" type="reset">Cancel</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                    <c:if test="${requestScope.updateState gt 0}">
                                        <p style="color: #00CC00">Setting updated successfully!</p>
                                    </c:if>
                                    <c:if test="${requestScope.updateState eq 0}">
                                        <p style="color: #d93223">Setting updated unsuccessfully!</p>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                    </c:if>
                    <c:if test="${requestScope.action eq 'add'}">
                        <table>
                            <tr>
                                <td>Class Code</td>
                                <td>
                                    <input type="text" pattern="^([A-Za-z0-9]+[,.]?[ ]?|[A-Za-z0-9]+['-]?)+$" name="class_name" placeholder="   Enter Class Code(*)">
                                </td>
                            </tr>
                            <tr>
                                <td>Class Subject</td>
                                <td>
                                    <select name="class_subject">
                                        <c:forEach items="${requestScope.subjects}" var="s">
                                            <option value="${s.getId()}">${s.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Class Term</td>
                                <td>
                                    <select name="class_term">
                                        <c:forEach items="${requestScope.terms}" var="t">
                                            <option value="${t.getSetting_id()}">${t.getSetting_title()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Class Trainer</td>
                                <td>
                                    <select name="trainerId">
                                        <c:forEach items="${requestScope.trainers}" var="t">
                                            <option value="${t.getId()}">${t.getFullname()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Class Supporter</td>
                                <td>
                                    <select name="supporterId">
                                        <c:forEach items="${requestScope.supporters}" var="s">
                                            <option value="${s.getId()}">${s.getFullname()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Status</td>
                                <td>
                                    <input id="activeStatus" type="radio" name="class_status" value="1" checked="checked">
                                    <label for="activeStatus">Active</label>
                                    <input id="deactiveStatus" type="radio" name="class_status" value="0">
                                    <label for="deactiveStatus">Inactive</label>
                                </td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td>
                                    <textarea name="description" style="height: 100px; width: 100%" placeholder="    Input API Config here!"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="hidden" name="action" value="add"></td>
                                <td>
                                    <div style="padding-left: 480px">
                                        <button class="buttonSave" type="submit">Add New</button>
                                        <button class="buttonCancel" type="reset">Cancel</button>
                                    </div>
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
