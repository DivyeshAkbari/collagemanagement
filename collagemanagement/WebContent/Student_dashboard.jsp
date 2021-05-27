<%@page import="com.collagemanagement.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/index3.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:14 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Educhamp | Student</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Normalize CSS -->
    <link rel="stylesheet" href="css/normalize.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/main.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/all.min.css">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="fonts/flaticon.css">
    <!-- Full Calender CSS -->
    <link rel="stylesheet" href="css/fullcalendar.min.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="css/animate.min.css">
    <!-- Data Table CSS -->
    <link rel="stylesheet" href="css/jquery.dataTables.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Modernize js -->
    <script src="js/modernizr-3.6.0.min.js"></script>
</head>

<% HttpSession httpSession = request.getSession(false);%>
<% User u1=(User) httpSession.getAttribute("uname");
String message = (String)httpSession.getAttribute("notification");
%>

<body>
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <div id="wrapper" class="wrapper bg-ash">
        <!-- Header Menu Area Start Here -->
        <%@include file="dashboard-header.jsp" %>
        <!-- Header Menu Area End Here -->
        <!-- Page Area Start Here -->
        <div class="dashboard-page-one">
            <!-- Sidebar Area Start Here -->
            
            <%@include file="sidebar-student.jsp" %>
            
            <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Student Dashboard</h3>
                    <ul>
                        <li>
                            <a href="Student_dashboard.jsp">Home</a>
                        </li>
                        <li>Student</li>
                    </ul>
                </div>
                <%if(message!=null){ %>
                 <div class="ui-alart-box">
						<div class="default-alart">
 							<div class="alert alert-primary" role="alert">
                             
                             <%=message %>
                             
                             </div>
						</div>
				</div>
				<%} %>
                <!-- Breadcubs Area End Here -->
                <div class="row">
                    <!-- Student Info Area Start Here -->
                    <div class="col-4-xxxl col-12">
                        <div class="card dashboard-card-ten">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>About Me</h3>
                                    </div>
                                    <div class="dropdown">
                                        <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                                            aria-expanded="false">...</a>

                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-times text-orange-red"></i>Close</a>
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="student-info">
                                    <div class="media media-none--xs">
                                        <div class="item-img">
                                            <img src="data:image/png;base64,<%= u1.getUserProfilepicString()  %>" alt="student">
                                        </div>
                                        <div class="media-body">
                                            <h3  class="item-title"><%= u1.getFirstname()+" "+u1.getMiddlename() %></h3>
<!--                                             <p>Aliquam erat volutpat. Curabiene natis massa -->
<!--                                                 sedde lacustiquen sodale word moun taiery.</p> -->
                                        </div>
                                    </div>
                                    <div class="table-responsive info-table">
                                        <table class="table text-nowrap">
                                            <tbody>
                                                <tr>
                                                    <td>Name:</td>
                                                    <td class="font-medium text-dark-medium"><%= u1.getFirstname()+" "+u1.getMiddlename() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Gender:</td>
                                                    <td class="font-medium text-dark-medium"><%= u1.getXender() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Father Name:</td>
                                                    <td class="font-medium text-dark-medium"><%= u1.getLastname() %></td>
                                                </tr>
                                                
<!--                                                 <tr> -->
<!--                                                     <td>Date Of Birth:</td> -->
<!--                                                     <td class="font-medium text-dark-medium">07.08.2006</td> -->
<!--                                                 </tr> -->
<!--                                                 <tr> -->
<!--                                                     <td>Religion:</td> -->
<!--                                                     <td class="font-medium text-dark-medium">Islam</td> -->
<!--                                                 </tr> -->
<!--                                                 <tr> -->
<!--                                                     <td>Father Occupation:</td> -->
<!--                                                     <td class="font-medium text-dark-medium">Graphic Designer</td> -->
<!--                                                 </tr> -->
                                                <tr>
                                                    <td>E-Mail:</td>
                                                    <td class="font-medium text-dark-medium"><%= u1.getEmail() %></td>
                                                </tr>
<!--                                                 <tr> -->
<!--                                                     <td>Admission Date:</td> -->
<!--                                                     <td class="font-medium text-dark-medium">05.01.2019</td> -->
<!--                                                 </tr> -->
                                                
                                                <tr>
                                                    <td>Stream:</td>
                                                    <td class="font-medium text-dark-medium"><%= u1.getStream() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Semester:</td>
                                                    <td class="font-medium text-dark-medium"><%= u1.getSemValue() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Division:</td>
                                                    <td class="font-medium text-dark-medium"><%= u1.getDivision() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Adress:</td>
                                                    <td class="font-medium text-dark-medium"><%= u1.getAddress() %></td>
                                                </tr>
                                                <tr>
                                                    <td>Contact:</td>
                                                    <td class="font-medium text-dark-medium"><%= u1.getContactno() %></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Student Info Area End Here -->
                    <div class="col-8-xxxl col-12">
                        <div class="row">
                            <!-- Summery Area Start Here -->
<!--                             <div class="col-lg-4"> -->
<!--                                 <div class="dashboard-summery-one"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="col-6"> -->
<!--                                             <div class="item-icon bg-light-magenta"> -->
<!--                                                 <i class="flaticon-shopping-list text-magenta"></i> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-6"> -->
<!--                                             <div class="item-content"> -->
<!--                                                 <div class="item-title">Notification</div> -->
<!--                                                 <div class="item-number"><span class="counter" data-num="12">12</span></div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            
                            
                            <!-- Summery Area End Here -->
                            <!-- Exam Result Area Start Here -->
<!--                             <div class="col-lg-12"> -->
<!--                                 <div class="card dashboard-card-eleven"> -->
<!--                                     <div class="card-body"> -->
<!--                                         <div class="heading-layout1"> -->
<!--                                             <div class="item-title"> -->
<!--                                                 <h3>All Exam Results</h3> -->
<!--                                             </div> -->
<!--                                             <div class="dropdown"> -->
<!--                                                 <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown" -->
<!--                                                     aria-expanded="false">...</a> -->

<!--                                                 <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                     <a class="dropdown-item" href="#"><i -->
<!--                                                             class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                                     <a class="dropdown-item" href="#"><i -->
<!--                                                             class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                                     <a class="dropdown-item" href="#"><i -->
<!--                                                             class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="table-box-wrap"> -->
<!--                                             <form class="search-form-box"> -->
<!--                                                 <div class="row gutters-8"> -->
<!--                                                     <div class="col-lg-4 col-12 form-group"> -->
<!--                                                         <input type="text" placeholder="Search by Exam ..." -->
<!--                                                             class="form-control"> -->
<!--                                                     </div> -->
<!--                                                     <div class="col-lg-3 col-12 form-group"> -->
<!--                                                         <input type="text" placeholder="Search by Subject ..." -->
<!--                                                             class="form-control"> -->
<!--                                                     </div> -->
<!--                                                     <div class="col-lg-3 col-12 form-group"> -->
<!--                                                         <input type="text" placeholder="dd/mm/yyyy" -->
<!--                                                             class="form-control"> -->
<!--                                                     </div> -->
<!--                                                     <div class="col-lg-2 col-12 form-group"> -->
<!--                                                         <button type="submit" -->
<!--                                                             class="fw-btn-fill btn-gradient-yellow">SEARCH</button> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </form> -->
<!--                                             <div class="table-responsive result-table-box"> -->
<!--                                                 <table class="table display data-table text-nowrap"> -->
<!--                                                     <thead> -->
<!--                                                         <tr> -->
<!--                                                             <th> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" -->
<!--                                                                         class="form-check-input checkAll"> -->
<!--                                                                     <label class="form-check-label">ID</label> -->
<!--                                                                 </div> -->
<!--                                                             </th> -->
<!--                                                             <th>Exam Name</th> -->
<!--                                                             <th>Subject</th> -->
<!--                                                             <th>Grade</th> -->
<!--                                                             <th>Percent</th> -->
<!--                                                             <th>Date</th> -->
<!--                                                             <th></th> -->
<!--                                                         </tr> -->
<!--                                                     </thead> -->
<!--                                                     <tbody> -->
<!--                                                         <tr> -->
<!--                                                             <td> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" class="form-check-input"> -->
<!--                                                                     <label class="form-check-label">#0021</label> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                             <td>Class Test</td> -->
<!--                                                             <td>English</td> -->
<!--                                                             <td>A</td> -->
<!--                                                             <td>99.00 > 100</td> -->
<!--                                                             <td>22/02/2019</td> -->
<!--                                                             <td> -->
<!--                                                                 <div class="dropdown"> -->
<!--                                                                     <a href="#" class="dropdown-toggle" -->
<!--                                                                         data-toggle="dropdown" aria-expanded="false"> -->
<!--                                                                         <span -->
<!--                                                                             class="flaticon-more-button-of-three-dots"></span> -->
<!--                                                                     </a> -->
<!--                                                                     <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                         </tr> -->
<!--                                                         <tr> -->
<!--                                                             <td> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" class="form-check-input"> -->
<!--                                                                     <label class="form-check-label">#0022</label> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                             <td>Class Test</td> -->
<!--                                                             <td>English</td> -->
<!--                                                             <td>A</td> -->
<!--                                                             <td>99.00 > 100</td> -->
<!--                                                             <td>22/02/2019</td> -->
<!--                                                             <td> -->
<!--                                                                 <div class="dropdown"> -->
<!--                                                                     <a href="#" class="dropdown-toggle" -->
<!--                                                                         data-toggle="dropdown" aria-expanded="false"> -->
<!--                                                                         <span -->
<!--                                                                             class="flaticon-more-button-of-three-dots"></span> -->
<!--                                                                     </a> -->
<!--                                                                     <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                         </tr> -->
<!--                                                         <tr> -->
<!--                                                             <td> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" class="form-check-input"> -->
<!--                                                                     <label class="form-check-label">#0023</label> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                             <td>Class Test</td> -->
<!--                                                             <td>Chemistry</td> -->
<!--                                                             <td>A</td> -->
<!--                                                             <td>99.00 > 100</td> -->
<!--                                                             <td>22/02/2019</td> -->
<!--                                                             <td> -->
<!--                                                                 <div class="dropdown"> -->
<!--                                                                     <a href="#" class="dropdown-toggle" -->
<!--                                                                         data-toggle="dropdown" aria-expanded="false"> -->
<!--                                                                         <span -->
<!--                                                                             class="flaticon-more-button-of-three-dots"></span> -->
<!--                                                                     </a> -->
<!--                                                                     <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                         </tr> -->
<!--                                                         <tr> -->
<!--                                                             <td> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" class="form-check-input"> -->
<!--                                                                     <label class="form-check-label">#0024</label> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                             <td>Class Test</td> -->
<!--                                                             <td>English</td> -->
<!--                                                             <td>A</td> -->
<!--                                                             <td>99.00 > 100</td> -->
<!--                                                             <td>22/02/2019</td> -->
<!--                                                             <td> -->
<!--                                                                 <div class="dropdown"> -->
<!--                                                                     <a href="#" class="dropdown-toggle" -->
<!--                                                                         data-toggle="dropdown" aria-expanded="false"> -->
<!--                                                                         <span -->
<!--                                                                             class="flaticon-more-button-of-three-dots"></span> -->
<!--                                                                     </a> -->
<!--                                                                     <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                         </tr> -->
<!--                                                         <tr> -->
<!--                                                             <td> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" class="form-check-input"> -->
<!--                                                                     <label class="form-check-label">#0025</label> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                             <td>Class Test</td> -->
<!--                                                             <td>Chemistry</td> -->
<!--                                                             <td>A</td> -->
<!--                                                             <td>99.00 > 100</td> -->
<!--                                                             <td>22/02/2019</td> -->
<!--                                                             <td> -->
<!--                                                                 <div class="dropdown"> -->
<!--                                                                     <a href="#" class="dropdown-toggle" -->
<!--                                                                         data-toggle="dropdown" aria-expanded="false"> -->
<!--                                                                         <span -->
<!--                                                                             class="flaticon-more-button-of-three-dots"></span> -->
<!--                                                                     </a> -->
<!--                                                                     <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                         </tr> -->
<!--                                                         <tr> -->
<!--                                                             <td> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" class="form-check-input"> -->
<!--                                                                     <label class="form-check-label">#0025</label> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                             <td>Class Test</td> -->
<!--                                                             <td>Chemistry</td> -->
<!--                                                             <td>D</td> -->
<!--                                                             <td>70.00 > 100</td> -->
<!--                                                             <td>22/02/2019</td> -->
<!--                                                             <td> -->
<!--                                                                 <div class="dropdown"> -->
<!--                                                                     <a href="#" class="dropdown-toggle" -->
<!--                                                                         data-toggle="dropdown" aria-expanded="false"> -->
<!--                                                                         <span -->
<!--                                                                             class="flaticon-more-button-of-three-dots"></span> -->
<!--                                                                     </a> -->
<!--                                                                     <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                         </tr> -->
<!--                                                         <tr> -->
<!--                                                             <td> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" class="form-check-input"> -->
<!--                                                                     <label class="form-check-label">#0025</label> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                             <td>Class Test</td> -->
<!--                                                             <td>English</td> -->
<!--                                                             <td>C</td> -->
<!--                                                             <td>80.00 > 100</td> -->
<!--                                                             <td>22/02/2019</td> -->
<!--                                                             <td> -->
<!--                                                                 <div class="dropdown"> -->
<!--                                                                     <a href="#" class="dropdown-toggle" -->
<!--                                                                         data-toggle="dropdown" aria-expanded="false"> -->
<!--                                                                         <span -->
<!--                                                                             class="flaticon-more-button-of-three-dots"></span> -->
<!--                                                                     </a> -->
<!--                                                                     <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                         </tr> -->
<!--                                                         <tr> -->
<!--                                                             <td> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" class="form-check-input"> -->
<!--                                                                     <label class="form-check-label">#0025</label> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                             <td>Class Test</td> -->
<!--                                                             <td>English</td> -->
<!--                                                             <td>B</td> -->
<!--                                                             <td>99.00 > 100</td> -->
<!--                                                             <td>22/02/2019</td> -->
<!--                                                             <td> -->
<!--                                                                 <div class="dropdown"> -->
<!--                                                                     <a href="#" class="dropdown-toggle" -->
<!--                                                                         data-toggle="dropdown" aria-expanded="false"> -->
<!--                                                                         <span -->
<!--                                                                             class="flaticon-more-button-of-three-dots"></span> -->
<!--                                                                     </a> -->
<!--                                                                     <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                         </tr> -->
<!--                                                         <tr> -->
<!--                                                             <td> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" class="form-check-input"> -->
<!--                                                                     <label class="form-check-label">#0025</label> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                             <td>First Semister</td> -->
<!--                                                             <td>English</td> -->
<!--                                                             <td>A</td> -->
<!--                                                             <td>99.00 > 100</td> -->
<!--                                                             <td>22/02/2019</td> -->
<!--                                                             <td> -->
<!--                                                                 <div class="dropdown"> -->
<!--                                                                     <a href="#" class="dropdown-toggle" -->
<!--                                                                         data-toggle="dropdown" aria-expanded="false"> -->
<!--                                                                         <span -->
<!--                                                                             class="flaticon-more-button-of-three-dots"></span> -->
<!--                                                                     </a> -->
<!--                                                                     <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                                                         <a class="dropdown-item" href="#"><i -->
<!--                                                                                 class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </td> -->
<!--                                                         </tr> -->
<!--                                                     </tbody> -->
<!--                                                 </table> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <!-- Exam Result Area End Here -->
                        </div>
                    </div>
                </div>
                <div class="row">
<!--                     <div class="col-4-xxxl col-xl-6 col-12"> -->
<!--                         <div class="card dashboard-card-three"> -->
<!--                             <div class="card-body"> -->
<!--                                 <div class="heading-layout1"> -->
<!--                                     <div class="item-title"> -->
<!--                                         <h3>Attendence</h3> -->
<!--                                     </div> -->
<!--                                     <div class="dropdown"> -->
<!--                                         <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown" -->
<!--                                             aria-expanded="false">...</a> -->

<!--                                         <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                             <a class="dropdown-item" href="#"><i -->
<!--                                                     class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                             <a class="dropdown-item" href="#"><i -->
<!--                                                     class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                             <a class="dropdown-item" href="#"><i -->
<!--                                                     class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="doughnut-chart-wrap"> -->
<!--                                     <canvas id="student-doughnut-chart" width="100" height="270"></canvas> -->
<!--                                 </div> -->
<!--                                 <div class="student-report"> -->
<!--                                     <div class="student-count pseudo-bg-blue"> -->
<!--                                         <h4 class="item-title">Absent</h4> -->
<!--                                         <div class="item-number">28.2%</div> -->
<!--                                     </div> -->
<!--                                     <div class="student-count pseudo-bg-yellow"> -->
<!--                                         <h4 class="item-title">Present</h4> -->
<!--                                         <div class="item-number">65.8%</div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-4-xxxl col-xl-6 col-12"> -->
<!--                         <div class="card dashboard-card-thirteen"> -->
<!--                             <div class="card-body"> -->
<!--                                 <div class="heading-layout1"> -->
<!--                                     <div class="item-title"> -->
<!--                                         <h3>Event Calender</h3> -->
<!--                                     </div> -->
<!--                                     <div class="dropdown"> -->
<!--                                         <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown" -->
<!--                                             aria-expanded="false">...</a> -->

<!--                                         <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                             <a class="dropdown-item" href="#"><i -->
<!--                                                     class="fas fa-times text-orange-red"></i>Close</a> -->
<!--                                             <a class="dropdown-item" href="#"><i -->
<!--                                                     class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                             <a class="dropdown-item" href="#"><i -->
<!--                                                     class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="calender-wrap"> -->
<!--                                     <div id="fc-calender" class="fc-calender"></div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                    <div class="col-4-xxxl col-12">
                        <div class="card dashboard-card-six">
                            <div class="card-body">
                                <div class="heading-layout1 mg-b-17">
                                    <div class="item-title">
                                        <h3>Notifications</h3>
                                    </div>
                                    <div class="dropdown">
                                        <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                                            aria-expanded="false">...</a>

                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-times text-orange-red"></i>Close</a>
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="notice-box-wrap">
                                    <div class="notice-list">
                                        <div class="post-date bg-skyblue">16 June, 2019</div>
                                        <h6 class="notice-title"><a href="#">Great School manag mene esom tus eleifend
                                                lectus
                                                sed maximus mi faucibusnting.</a></h6>
                                        <div class="entry-meta"> Jennyfar Lopez / <span>5 min ago</span></div>
                                    </div>
                                    <div class="notice-list">
                                        <div class="post-date bg-yellow">16 June, 2019</div>
                                        <h6 class="notice-title"><a href="#">Great School manag printing.</a></h6>
                                        <div class="entry-meta"> Jennyfar Lopez / <span>5 min ago</span></div>
                                    </div>
                                    <div class="notice-list">
                                        <div class="post-date bg-pink">16 June, 2019</div>
                                        <h6 class="notice-title"><a href="#">Great School manag Nulla rhoncus eleifensed
                                                mim
                                                us mi faucibus id. Mauris vestibulum non purus lobortismenearea</a></h6>
                                        <div class="entry-meta"> Jennyfar Lopez / <span>5 min ago</span></div>
                                    </div>
                                    <div class="notice-list">
                                        <div class="post-date bg-skyblue">16 June, 2019</div>
                                        <h6 class="notice-title"><a href="#">Great School manag mene esom text of the
                                                printing.</a></h6>
                                        <div class="entry-meta"> Jennyfar Lopez / <span>5 min ago</span></div>
                                    </div>
                                    <div class="notice-list">
                                        <div class="post-date bg-yellow">16 June, 2019</div>
                                        <h6 class="notice-title"><a href="#">Great School manag printing.</a></h6>
                                        <div class="entry-meta"> Jennyfar Lopez / <span>5 min ago</span></div>
                                    </div>
                                    <div class="notice-list">
                                        <div class="post-date bg-pink">16 June, 2019</div>
                                        <h6 class="notice-title"><a href="#">Great School manag meneesom.</a></h6>
                                        <div class="entry-meta"> Jennyfar Lopez / <span>5 min ago</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer Area Start Here -->
                <footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a
                            href="#">PsdBosS</a></div>
                </footer>
                <!-- Footer Area End Here -->
            </div>
        </div>
        <!-- Page Area End Here -->
    </div>
    <!-- jquery-->
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Counterup Js -->
    <script src="js/jquery.counterup.min.js"></script>
    <!-- Moment Js -->
    <script src="js/moment.min.js"></script>
    <!-- Waypoints Js -->
    <script src="js/jquery.waypoints.min.js"></script>
    <!-- Scroll Up Js -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- Full Calender Js -->
    <script src="js/fullcalendar.min.js"></script>
    <!-- Chart Js -->
    <script src="js/Chart.min.js"></script>
    <!-- Data Table Js -->
    <script src="js/jquery.dataTables.min.js"></script>
    <!-- Custom Js -->
    <script src="js/main.js"></script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/index3.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:15 GMT -->
</html>