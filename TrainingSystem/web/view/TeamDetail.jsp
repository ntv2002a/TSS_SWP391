<%-- 
    Document   : TeamDetail
    Created on : Nov 1, 2022, 4:20:11 AM
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
        <title>Team Detail</title>
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
                        <h1 class="text-white mt-5">Team Detail</h1>
                    </div>
                </div>
            </div>
            <div class="breadcrumb-row">
                <div class="container">
                    <ul class="list-inline">
                        <li><a href="/TrainingSystem/team/list">Team List</a></li>
                        <li>Team Detail</li>
                    </ul>
                </div>
            </div>

            <div style="width: 900px; padding: 30px; margin: auto;">
                <form action="../team/detail" method="POST">

                    <c:if test="${requestScope.milestone eq null}">
                        <input name="team_id" type="hidden" value="${requestScope.team_id}">
                        <input name="action" type="hidden" value="view">
                        <table>
                            <tr>
                                <td></td>
                                <td>
                                    <c:if test="${requestScope.updateState gt 0}">
                                        <p style="color: #00CC00">Team updated successfully!</p>
                                    </c:if>
                                    <c:if test="${requestScope.updateState eq 0}">
                                        <p style="color: #d93223">Team updated unsuccessfully!</p>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>Team Code</td>
                                <td><input type="text" name="team_code" placeholder="${requestScope.team.getTeam_code()}"></td>
                            </tr>
                            <tr>
                                <td>Topic Name</td>
                                <td><input type="text" name="topic_name" placeholder="${requestScope.team.getTopic_name()}"></td>
                            </tr>
                            <tr>
                                <td>Status</td>
                                <td>
                                    <input id="activeStatus" type="radio" name="status" value="1" <c:if test="${requestScope.team.getStatus() eq true}">checked="checked"</c:if>>
                                        <label for="activeStatus">Active</label>
                                        <input id="deactiveStatus" type="radio" name="status" value="0" <c:if test="${requestScope.team.getStatus() eq false}">checked="checked"</c:if>>
                                        <label for="deactiveStatus">Inactive</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Description</td>
                                    <td><textarea name="description" style="height: 100px; width: 100%" placeholder="Input Description here!"><c:if test="${requestScope.team.getDescription() ne null}">${requestScope.team.getDescription()}</c:if></textarea></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <div style="padding-left: 590px">
                                            <button class="buttonSave" type="submit">Save Changes</button>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                    </c:if>


                    <c:if test="${requestScope.milestone ne null}">
                        <input name="milestone_id" type="hidden" value="${requestScope.milestone}">
                        <input name="action" type="hidden" value="add">
                        <table>
                            <tr>
                                <td></td>
                                <td>
                                    <c:if test="${requestScope.insertState gt 0}">
                                        <p style="color: #00CC00">Added successfully!</p>
                                    </c:if>
                                    <c:if test="${requestScope.insertState eq 0}">
                                        <p style="color: #d93223">Added unsuccessfully!</p>
                                    </c:if>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>Milestone</td>
                                <td>${requestScope.milestones.getTitle()}</td>
                            </tr>
                            
                            <tr>
                                <td>Team Code</td>
                                <td><input type="text" pattern="^([A-Za-z0-9]+[,.]?[ ]?|[A-Za-z0-9]+['-]?)+$" name="team_code"></td>
                            </tr>
                            <tr>
                                <td>Topic Name</td>
                                <td><input type="text" pattern="^([A-Za-z0-9]+[,.]?[ ]?|[A-Za-z0-9]+['-]?)+$" name="topic_name"></td>
                            </tr>
                            <tr>
                                <td>Status</td>
                                <td>
                                    <input id="activeStatus" type="radio" name="status" value="1" checked="checked">
                                        <label for="activeStatus">Active</label>
                                        <input id="deactiveStatus" type="radio" name="status" value="0">
                                        <label for="deactiveStatus">Inactive</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Description</td>
                                    <td><textarea name="description" style="height: 100px; width: 100%" placeholder="Input Description here!"></textarea></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <div style="padding-left: 560px">
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
    </body>
</html>
