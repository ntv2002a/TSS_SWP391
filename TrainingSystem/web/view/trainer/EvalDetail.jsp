
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
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="../../view/trainer/assets/css/color/color-1.css">

    </head>
    <body>
        <%@include file="./AdminHeader.jsp"%>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <!-- Left sidebar menu start -->
        <%@include file="./Navbar.jsp"%>
        <!-- Left sidebar menu end -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="#">Eval Detail</a>
                    </li>
                </ol>
                <!-- DataTables Example -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-table"></i>
                        Eval Detail</div>                    
                        <c:if test="${success == 'ufalse'}">
                        <h6 class="alert-danger">Failed! Eval Weight must be a number > 0 and < 100!</h6>
                    </c:if>
                    <div class="card-body">
                        <a href="./EditEval?eid=${e.id}" class="btn btn-warning">Edit</a>
                        <a href="./AddEval?eid=${e.id}" class="btn btn-warning">Clone</a>

                        <div class="table-responsive">
                            <form method="post" action="EditEval">
                                <div class="row" style="width: 100%">
                                    <div class="col-md-6">
                                        <label>id</label>
                                        <input type="text" value="${e.id}" class="form-control" name="id" readonly="">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Name</label>
                                        <input type="text" value="${e.name}" class="form-control" readonly name="name" >
                                    </div>
                                    <div class="col-md-6">
                                        <label>Assignment</label>
                                        <select class="form-control"  name="assId" >
                                            <c:forEach var="a" items="${alist}">
                                                <option value="${a.id}" ${a.id == e.assignment.id ? "selected": ""}>${a.title}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Eval Weight</label>
                                        <input type="text" value="${e.evalWeight}" class="form-control" readonly name="evalWeight" >
                                    </div>
                                    <div class="col-md-6">
                                        <label>Max Loc</label>
                                        <input type="number" value="${e.maxLoc}" readonly class="form-control" name="maxLoc" >
                                    </div>
                                    <div class="col-md-6">
                                        <label>Is Team Eval</label>
                                        <select name="isTeamEval"class="form-control" >
                                            <option value="1" ${e.isTeamEval ? "selected": ""} >Active</option>
                                            <option value="0" ${e.isTeamEval ? "selected": ""}>Inactive</option>
                                        </select >
                                    </div>
                                    <div class="col-md-6">
                                        <label>status</label>
                                        <select name="status" class="form-control">
                                            <option value="1" ${e.status ? "selected": ""} >Active</option>
                                            <option value="0" ${e.status ? "selected": ""}>Inactive</option>
                                        </select >
                                    </div>
                                    <div class="col-md-6">
                                        <label>Description</label>
                                        <input type="text" readonly value="${e.description}" class="form-control" name="description" >
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>      
                </div>
            </div>

            <!-- /.container-fluid -->
        </main>
        <!-- External JavaScripts -->
        <script src="../../view/trainer/assets/js/jquery.min.js"></script>
        <script src="../../view/trainer/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="../../view/trainer/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="../../view/trainer/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="../../view/trainer/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="../../view/trainer/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="../../view/trainer/assets/vendors/counter/waypoints-min.js"></script>
        <script src="../../view/trainer/assets/vendors/counter/counterup.min.js"></script>
        <script src="../../view/trainer/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="../../view/trainer/assets/vendors/masonry/masonry.js"></script>
        <script src="../../view/trainer/assets/vendors/masonry/filter.js"></script>
        <script src="../../view/trainer/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src='../../view/trainer/assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="../../view/trainer/assets/js/functions.js"></script>
        <script src="../../view/trainer/assets/vendors/chart/chart.min.js"></script>
        <script src="../../view/trainer/assets/js/admin.js"></script>



    </body>
</html>
