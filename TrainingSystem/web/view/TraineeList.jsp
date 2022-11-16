<%-- 
    Document   : TraineeList
    Created on : Nov 1, 2022, 6:48:42 PM
    Author     : Lenovo
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Trainee List Page</title>
        <!-- FAVICONS ICON ============================================= -->
        <!-- FAVICONS ICON ============================================= -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="icon" href="/TrainingSystem/view/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="/TrainingSystem/view/assets/images/favicon.png" />

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="/TrainingSystem/view/admin/assets/css/color/color-1.css">

        <!-- PAGINATION ============================================= -->
        <link href="/TrainingSystem/view/admin/assets/css/pagination.css" rel="stylesheet" type="text/css"/>
        <script src="/TrainingSystem/view/admin/assets/js/pagination.js" type="text/javascript"></script>

        <!-- SORTTABLE ============================================= -->
        <script src="/TrainingSystem/view/admin/assets/js/sorttable.js" type="text/javascript"></script>
        <link href="/TrainingSystem/view/admin/assets/css/sorttable.css" rel="stylesheet" type="text/css"/>
        
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    </head>
    <body>
        <header>
            <%@include file="./Header.jsp"%>
        </header>
        <!-- Content -->
        <main class="page-content bg-white">
            <div class="page-banner ovbl-dark" style="background-image:url(/TrainingSystem/assets/images/banner/banner1.jpg);">
                <div class="container">
                    <div class="page-banner-entry">
                        <h1 class="text-white mt-5">Trainee List</h1>
                    </div   >
                </div>
            </div>
            <!-- comment -->
            <div class="container-fluid mt-3">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">Trainee List</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="/TrainingSystem/home"><i class="fa fa-home"></i>Home</a></li>
                        <li>Trainee List</li>
                    </ul>
                </div>	
                <c:if test="${success eq 'true'}">
                    <div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 100px">
                        <div class="toast" style="position: absolute; top: 0; right: 0;" id="myToast">
                            <div class="toast-header">
                                <i style="font-size:20px; color: green" class="fa">&#xf058;</i>
                                <strong class="mr-auto ml-1">Information</strong>
                                <small>Just now</small>
                                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close" onclick="hideToast()">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="toast-body">
                                Add successfully !!!
                            </div>
                        </div>
                    </div>
                    <script>
                        $(document).ready(function () {
                            $('#myToast').toast('show');
                        });
                        
                        function hideToast() {
                            $('#myToast').toast('dispose');
                        }
                    </script>
                </c:if>
                <c:if test="${success eq 'false'}">
                    <div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 100px">
                        <div class="toast" style="position: absolute; top: 0; right: 0;" id="myToast">
                            <div class="toast-header">
                                <i style="font-size:20px; color: green" class="fa">&#xf058;</i>
                                <strong class="mr-auto ml-1">Information</strong>
                                <small>Just now</small>
                                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close" onclick="hideToast()">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="toast-body">
                                This student already in class !!!
                            </div>
                        </div>
                    </div>
                    <script>
                        $(document).ready(function () {
                            $('#myToast').toast('show');
                        });
                        
                        function hideToast() {
                            $('#myToast').toast('dispose');
                        }
                    </script>
                </c:if>
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title row">
                                <h4 class="center pt-2 float-left">Trainee List</h4>
                            </div>
                            <div class="container-fluid ml-5 mt-5 mb-5">
                                <div class="row d-flex justify-content-center">
                                    <form class="col-5" action="list" method="GET" id="classFilter">
                                        <div class="form-group row col-12 ml-0 p-0 m-0">
                                            <label class="col-sm-2 col-2 col-form-label small p-0 m-0 pt-2">Class</label>
                                            <div class="col-sm-6 p-0 m-0 col-8">
                                                <select class="p-0 m-0 form-control" name="class" onchange="document.getElementById('classFilter').submit();">
                                                    <option value="-1">---Select class---</option>
                                                    <option value="-1" 
                                                            <c:if test="${classId == -1}"> selected </c:if>
                                                                >All</option>
                                                    <c:forEach var="class_mile" items="${classes}"> 
                                                        <option 
                                                            <c:if test="${classId == class_mile.getClass_id()}"> selected </c:if>
                                                            value="${class_mile.getClass_id()}"
                                                            >${class_mile.getClass_code()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <c:if test = "${classId != -1}">
                                <div class="container-fluid row ml-5 mt-5">
                                    <div class="col-lg-12 col-12 col-md-12 col-sm-12 row">
                                        <form class="col-6 row" action="list" method="GET" id="filter">
                                            <div class="form-group row col-12 ml-0 p-0 m-0">
                                                <label class="col-sm-3 col-3 col-form-label small pt-2">Status</label>
                                                <div class="col-sm-6 col-8 m-0">
                                                    <select name="status" class="form-control" onchange="document.getElementById('filter').submit();">
                                                        <option value="-1">---Select status---</option>
                                                        <option value="-1" <c:if test="${status == -1}"> selected </c:if>>All</option>
                                                        <option value="0" <c:if test="${status == 0}"> selected </c:if>>Study</option>
                                                        <option value="1" <c:if test="${status == 1}"> selected </c:if>>Dropped Out</option>
                                                        </select>
                                                    </div>                                       
                                                </div>
                                                <input type="hidden" name="class" id="class" value="${classId}">
                                        </form>
                                        <div class="btn btn-success btn-outline-primary ml-auto mr-3 row col-2">
                                            <a href="modelAdd" data-toggle="modal" data-target="#modelAdd" data-toggle="tooltip">
                                                <i class="fa fa-plus-circle" style="font-size:18px"></i>
                                                <spam clas="mb-5">Add new trainee</spam></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-inner">
                                    <div id="setting_list">
                                        <table class="table table-striped table-hover table-bordered sortable">
                                            <thead>
                                                <tr>
                                                    <th>Student Id</th>
                                                    <th class="text-center sorttable_nosort">Avatar</th>
                                                    <th>Full Name</th>
                                                    <th>Grade</th>
                                                    <th>Status</th>
                                                    <th class="text-center sorttable_nosort">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="trainee" items="${trainees}">
                                                    <tr>
                                                        <td id="id">${trainee.getUserId().getId()}</td>
                                                        <c:if test="${trainee.getUserId().getAvatarurl() == '' ||  trainee.getUserId().getAvatarurl() == null}">
                                                            <td class="text-center"><img style="height: 150px; width: 150px" src="/TrainingSystem/img/avatarDefault.jpg" alt=""/></td>
                                                            </c:if>
                                                            <c:if test="${trainee.getUserId().getAvatarurl() != '' &&  trainee.getUserId().getAvatarurl() != null}">
                                                            <td class="text-center"><img style="height: 150px; width: 150px" src="/TrainingSystem/img/${trainee.getUserId().getAvatarurl()}" alt=""/></td>
                                                            </c:if>
                                                        <td id="name">${trainee.getUserId().getFullname()}</td>
                                                        
                                                        <c:if test="${trainee.getTopic_eval() == 0}">
                                                            <td>0</td>
                                                        </c:if>
                                                        <c:if test="${trainee.getTopic_eval() != 0}">
                                                            <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${trainee.getFinal_eval()/trainee.getTopic_eval()*10}"/></td>
                                                        </c:if>
                                                        
                                                        <c:if test="${trainee.getStatus() == 0}">
                                                            <td id="status">Dropped Out</td>
                                                        </c:if>
                                                        <c:if test="${trainee.getStatus() == 1}">
                                                            <td id="status">Studying</td>
                                                        </c:if>
                                                        <td class="text-center">
                                                            <c:if test="${trainee.getStatus() == 1}">
                                                                <a href="modelStatus" data-toggle="modal" data-target="#modelStatus" 
                                                                   class="p-2 inactiveStatus" title="Edit" data-toggle="tooltip">
                                                                    <i class="material-icons fa fa-toggle-on" style="color: green"></i>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${trainee.getStatus() != 1}">
                                                                <a href="modelStatus" data-toggle="modal" data-target="#modelStatus" 
                                                                   class="p-2 activeStatus" title="Edit" data-toggle="tooltip">
                                                                    <i class="material-icons fa fa-toggle-off"></i>
                                                                </a>
                                                            </c:if>
                                                            <a href="detail?traineeId=${trainee.getUserId().getId()}&classId=${classId}" class="p-2" title="Edit" data-toggle="tooltip"><i class='material-icons fa'>&#xf044;</i></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- Modal Status-->
                                <div id="modelStatus" class="modal fade" role="dialog" style="margin-top: 5%">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <form action="list" method="GET">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title left">Warning</h4>
                                                    <button type="button" class="close right" data-dismiss="modal">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <p></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div>
                                            <input type="hidden" name="traineeId" id="traineeId">
                                            <input type="hidden" name="updateStatus" id="updateStatus">
                                            <input type="hidden" name="class" id="class" value="${classId}">
                                            <input type="hidden" name="status" id="status" value="${status}">
                                            <input type="hidden" name="page" id="page" value="${pageindex}">
                                        </form>
                                    </div>
                                </div>

                                <!-- Modal Add-->
                                <div id="modelAdd" class="modal fade" role="dialog" style="margin-top: 5%">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <form action="import123" method="POST" class="form-group" id="addTrainee">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title left">Add new trainee</h4>
                                                    <button type="button" class="close right" data-dismiss="modal">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Full Name</label>
                                                        <div class="col-sm-7">
                                                            <input class="form-control" type="text" name="fullname" id="fullname"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Email</label>
                                                        <div class="col-sm-7">
                                                            <input class="form-control" type="text" name="email" id="email"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div>
                                            <input type="hidden" name="class" id="class" value="${classId}">
                                            <input type="hidden" name="status" id="status" value="${status}">
                                            <input type="hidden" name="page" id="page" value="${pageindex}">
                                        </form>
                                    </div>
                                         <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
                                        <script src="/TrainingSystem/assets/js/validation.js"></script>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
                <div id="pagination"></div>
            </div>
        </main>
        <div class="ttr-overlay"></div>

        <div class="footer-fixed" style="clear:  both">
            <%@include file="./Footer.jsp" %>
        </div>
        <!-- Content END-->
        <script src="/TrainingSystem/assets/js/jquery.min.js"></script>
        <script src="/TrainingSystem/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="/TrainingSystem/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="/TrainingSystem/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="/TrainingSystem/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="/TrainingSystem/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="/TrainingSystem/assets/vendors/counter/waypoints-min.js"></script>
        <script src="/TrainingSystem/assets/vendors/counter/counterup.min.js"></script>
        <script src="/TrainingSystem/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="/TrainingSystem/assets/vendors/masonry/masonry.js"></script>
        <script src="/TrainingSystem/assets/vendors/masonry/filter.js"></script>
        <script src="/TrainingSystem/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="/TrainingSystem/assets/js/functions.js"></script>
        <script src="/TrainingSystem/assets/js/contact.js"></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <script>
                                                        pagger_render("pagination",${pageindex},${totalpage}, 2, 'list?class=${classId}&status=${status}');
        </script>
        <script>
            $(document).ready(function () {
                $('table .activeStatus').on('click', function () {
                    var id = $(this).parent().parent().find('#id').text();
                    var name = $(this).parent().parent().find('#name').text();
                    $('#modelStatus .modal-body').children().text('Do you want to this student ' + name + ' study');
                    $('#modelStatus #traineeId').val(id);
                    $('#modelStatus #updateStatus').val('0');
                });
                $('table .inactiveStatus').on('click', function () {
                    var id = $(this).parent().parent().find('#id').text();
                    var name = $(this).parent().parent().find('#name').text();
                    $('#modelStatus .modal-body').children().text('Do you want to dropout this student ' + name);
                    $('#modelStatus #traineeId').val(id);
                    $('#modelStatus #updateStatus').val('1');
                });
            });
        </script>
    </body>
</html>
