
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.2/js/bootstrap.min.js" integrity="sha512-5BqtYqlWfJemW5+v+TZUs22uigI8tXeVah5S/1Z6qBLVO7gakAOtkOzUtgq6dsIo5c0NJdmGPs0H9I+2OHUHVQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.2/css/bootstrap.min.css" integrity="sha512-CpIKUSyh9QX2+zSdfGP+eWLx23C8Dj9/XmHjZY2uDtfkdLGo0uY12jgcnkX9vXOgYajEKb/jiw67EYm+kBf+6g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="../view/trainer/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="../view/trainer/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="../view/trainer/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="../view/trainer/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="../view/trainer/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="../view/trainer/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="../view/trainer/assets/css/color/color-1.css">

    </head>
    <body>
        <%@include file="./AdminHeader.jsp"%>

        <%@include file="./Navbar.jsp"%>

        <main class="ttr-wrapper">
            <div class="container-fluid">

                <div class="container-fluid">
                    <div class="db-breadcrumb">
                        <h4 class="breadcrumb-title">Eval Criteria List</h4>
                        <ul class="db-breadcrumb-list">
                            <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                            <li><a href="list">Eval Criteria List</a></li>
                            <li style="text-transform: capitalize">${requestScope.action} eval criteria detail</li>
                        </ul>
                    </div>	
                    <div class="row">
                        <!-- Your Profile Views Chart -->
                        <div class="col-lg-12 m-b30">
                            <div class="widget-box">
                                <div class="wc-title">
                                    <h4>Class Eval Criteria Details</h4>
                                </div>
                                <c:if test="${success == 'ufalse'}">
                                    <h6 class="alert-danger">Update failed! Eval Weight must <100 and >0 </h6>
                                </c:if>
                                <div class="widget-inner">
                                    <form method="post" action="EditEval">

                                        <table>
                                            <tr>
                                                <td>
                                                    <div class="col-md-6">

                                                        <input type="hidden" value="${e.id}" class="form-control" name="id" readonly="">
                                                        <input type="hidden" value="${e.milestoneId}" class="form-control" name="mid" readonly="">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Assignment</td>
                                                <td>
                                                    <select name="assId" class="form-control" readonly="">
                                                        <c:forEach var="a" items="${alist}">
                                                            <option value="${a.id}" ${a.id == e.assignment.id ? "selected": ""}>${a.title}</option>
                                                        </c:forEach>

                                                    </select>
                                                </td>

                                            </tr>


                                            <!--                                            <div class="col-md-3">-->
                                            <tr>
                                                <td>Criteria name</td>
                                                <td>
                                                    <div>
                                                        <input name="name" class="form-control" type="text" value="${e.name}">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Team member</td>
                                                <td>
                                                    <select name="isTeamEval" class="form-control" >
                                                        <option value="1" ${e.isTeamEval ? "selected": ""} >Team</option>
                                                        <option value="0" ${e.isTeamEval ? "selected": ""}>Personal</option>
                                                    </select >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>

                                                    <p>Eval weight <span style="color: red">(*)</span></p>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input class="form-control" required="" type="number" name="evalWeight" value="${e.evalWeight}">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>

                                                    <p>Max LOC <span style="color: red">(*)</span></p>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input class="form-control" required="" type="number" name="maxLoc" value="${e.maxLoc}" >
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Status</td>
                                                <td>
                                                    <input name="status" type="radio" value="1"
                                                           <c:if test="${ec.status eq true}">
                                                               checked
                                                           </c:if>
                                                           > Active
                                                    &nbsp;&nbsp;
                                                    <input name="status" type="radio" value="0"
                                                           <c:if test="${ec.status ne true}">
                                                               checked
                                                           </c:if>
                                                           > Inactive
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>Description</td>
                                                <td>
                                                    <div class="form-group col-12">
                                                        <textarea name="description" class="form-control" rows="4" cols="50" >${e.description}</textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="col-md-3">
                                                        <button type="submit" class="btn btn-primary" style="margin: 10px;">Edit</button>
                                                    </div>

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
            </div>
        </main>
        <!-- External JavaScripts -->
        <script src="../view/trainer/assets/js/jquery.min.js"></script>
        <script src="../view/trainer/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="../view/trainer/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="../view/trainer/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="../view/trainer/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="../view/trainer/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="../view/trainer/assets/vendors/counter/waypoints-min.js"></script>
        <script src="../view/trainer/assets/vendors/counter/counterup.min.js"></script>
        <script src="../view/trainer/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="../view/trainer/assets/vendors/masonry/masonry.js"></script>
        <script src="../view/trainer/assets/vendors/masonry/filter.js"></script>
        <script src="../view/trainer/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="../view/trainer/assets/vendors/scroll/scrollbar.min.js"></script>
        <script src="../view/trainer/assets/js/functions.js"></script>
        <script src="../view/trainer/assets/vendors/chart/chart.min.js"></script>
        <script src="../view/trainer/assets/js/admin.js"></script>



    </body>
</html>
