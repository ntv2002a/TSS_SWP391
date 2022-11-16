
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
        <!-- SORTTABLE ============================================= -->
        <script src="../../view/trainer/assets/js/sorttable.js" type="text/javascript"></script>
        <link href="../../view/trainer/assets/css/sorttable.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="./AdminHeader.jsp"%>

        <%@include file="./Navbar.jsp"%>

        <main class="ttr-wrapper">
            <div class="container-fluid">


                <div class="card mb-3">
                    <div class="card-header"></div>
                    <div class="db-breadcrumb">
                        <h4 class="breadcrumb-title"> Class Eval Criteria List</h4>
                        <ul class="db-breadcrumb-list">
                            <li><a href="../../manage/dashboard/view"><i class="fa fa-home"></i>Home</a></li>
                            <li>Class Eval Criteria List</li>
                        </ul>
                       
                        </div>
                        <div class="card-body">
                            <div class="col-lg-12 col-12 col-md-12 col-sm-12 row">

                                <form class="col-12 row" method="get" id="filter" action="/TrainingSystem/manage/classevalcriteria/list">

                                    <div class="col-md-10 form-group row col-4 ">

                                        <input type="hidden" value="${param.name}" name="mid" class="form-control" style="display: inline; width: 150px;">
                                        <div class="search-box col-lg-3 col-3 col-md-3 col-sm-3 d-inline">
                                            <i class="fa fa-search ml-3"></i>
                                            <input value="${param.name}"  type="text" class="form-control" placeholder="Search&hellip;" name="name"
                                                   <c:if test="${search != null}">
                                                       value ="${search}"
                                                   </c:if>
                                                   >
                                        </div>
                                        <div class="search-box col-lg-1 col-1 col-md-1 col-sm-1">
                                            <input class="btn pl-3 pr-3" type="submit" value="Search">
                                        </div>
                                        <div class="btn btn-success btn-outline-primary ml-auto mr-4 row col-3"><a href="http://localhost:8080/TrainingSystem/manage/evalcriteria/detail?action=add">
                                                <i class="fa fa-plus-circle" style="font-size:18px"></i>
                                                <spam clas="mb-10">Add class eval criteria</spam></a>
                                        </div>
                                                    <c:if test="${success == 'utrue'}">
                            <h6 class="alert-success">Update successful!</h6>
                        </c:if>
                        <c:if test="${success == 'ufalse'}">
                            <h6 class="alert-danger">Update failed!</h6>
                        </c:if>
                                    </div>

                                    <div class="form-group row col-4 ">
                                        <select  onchange="document.getElementById('filter').submit();" name="cid"  class="form-control" style="display: inline; width: 150px;">
                                            <option value="">All Class</option>
                                            <c:forEach var="e" items="${clist}">
                                                <option value="${e.class_id}" ${param.cid==e.class_id?"selected":""}>${e.class_code}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group row col-4 ml-0">
                                        <select name="status"   onchange="document.getElementById('filter').submit();" class="form-control" style="display: inline; width: 150px;">

                                            <option value="1" ${param.status==1?"selected":""}>Active</option>
                                            <option value="0" ${param.status==0?"selected":""}>Inactive</option>
                                            <option value="" ${param.status==""?"selected":""}>All Status</option>


                                        </select >
                                    </div>
                                    <div class="form-group row col-4 ml-0">
                                        <select  onchange="document.getElementById('filter').submit();" name="assId"  class="form-control" style="display: inline; width: 150px;">
                                            <option value="">All Assignment</option>
                                            <c:forEach var="e" items="${alist}">
                                                <option value="${e.id}" ${param.assId==e.id?"selected":""}>${e.title}</option>
                                            </c:forEach>

                                        </select>
                                    </div>


                            </div>
                            <div class="col-md-2">
                            </div>


                            </form>
                            <div class="row">
                                <div class="col-md-12">
                                    <table width="100%" id="slidetable" class="table table-hover table-bordered sortable">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Name</th>
                                                <th>Member</th>
                                                <th>Weight</th>
                                                <th>Max loc</th>
                                                <th>Status</th>
                                                <th class="sorttable_nosort">Action </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="a" items="${elist}">
                                                <tr>
                                                    <td><a href="./EvalDetail?eid=${a.id}">${a.id}</a></td>
                                                    <td><a href="./EvalDetail?eid=${a.id}">${a.name}</a></td>
                                                    <td>${a.isTeamEval?"team":"personal"}</td>
                                                    <td>${a.evalWeight}</td>
                                                    <td>${a.maxLoc}</td>
                                                    <td>${a.status?"Active":"Inactive"}</td>

                                                    <c:if test="${a.status}">
                                                       <!-- <td><a href="/TrainingSystem/Trainer/UpdateEvalStatus?eid=${a.id}&status=0&mid=${param.mid}" class="btn btn-danger">Inactive</a></td>
                                                        --></c:if>
                                                    <c:if test="${!a.status}">
                                                        <!--<td><a href="/TrainingSystem/Trainer/UpdateEvalStatus?eid=${a.id}&status=1&mid=${param.mid}" class="btn btn-success">Active</a></td>
                                                        --> </c:if>

                                                        <td><c:if test="${a.status}">
                                                            <a href="/TrainingSystem/Trainer/UpdateEvalStatus?eid=${a.id}&status=0&mid=${param.mid}""
                                                               class="p-2 inactiveStatus" title="Edit" data-toggle="tooltip" style="cursor: pointer">
                                                                <i class="material-icons fa fa-toggle-on" style="color: green"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${not a.status}">
                                                            <a href="/TrainingSystem/Trainer/UpdateEvalStatus?eid=${a.id}&status=1&mid=${param.mid}""
                                                               class="p-2 activeStatus" title="Edit" data-toggle="tooltip" style="cursor: pointer">
                                                                <i class="material-icons fa fa-toggle-off"></i>
                                                            </a>
                                                        </c:if>

                                                        <a href="/TrainingSystem/Trainer/EditEval?eid=${a.id}" class="p-2" title="Edit" data-toggle="tooltip"><i class="material-icons fa">&#xf044;</i></a>

                                                    </td>   
    <!--                                                <td><a href="/TrainingSystem/Trainer/EditEval?eid=${a.id}" class="btn btn-warning">Edit</a></td>-->

                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>


                <!-- Your Profile Views Chart END-->
                <div id="modelDelete" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title left">Warning</h4>
                                <button type="button" class="close right" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>Do you want to delete this Assignment ?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </main>
        
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
