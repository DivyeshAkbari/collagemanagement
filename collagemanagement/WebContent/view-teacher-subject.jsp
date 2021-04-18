<%@page import="java.util.ArrayList"%>
<%@page import="com.collagemanagement.bean.Semester"%>
<%@page import="java.util.List"%>
<%@page import="com.collagemanagement.bean.Subject"%>
<%@page import="com.collagemanagement.bean.Semester1"%>
<%@page import="com.collagemanagement.bean.Stream"%>
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


<% User user = (User)request.getAttribute("user");
System.out.println("user semester: "+user.getSemesterList());
System.out.println("user subjects: "+user.getSubjectList());
%>


<% List<Integer> streamIdList = new ArrayList<>();
List<Integer> semesterIdList = new ArrayList<>();
List<Integer> subjectIdList = new ArrayList<>();
	 
	if(null!=user.getStreamList() && !user.getStreamList().isEmpty()){ 
			
	 for(Stream s : user.getStreamList()){ 
		 streamIdList.add(s.getStreamid()); 
	 }
	 }//if
	if(null!=user.getSemesterList() && !user.getSemesterList().isEmpty()){ 
			
	 for(Semester s1 : user.getSemesterList()){ 
		 semesterIdList.add(s1.getSemid()); 
	 }
	 }//if
	 if(null!=user.getSubjectList() && !user.getSubjectList().isEmpty()){ 
			
	 for(Subject s2 : user.getSubjectList()){ 
		 subjectIdList.add(s2.getSubjectId()); 
	 }
	 }//if
	 System.out.println("subject list id: "+subjectIdList);
	 System.out.println("stream list id: "+streamIdList);
	 System.out.println("semster list id: "+semesterIdList);
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
            
            <%@include file="sidebar-admin.jsp" %>
            
            <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Teacher Subjects</h3>
                    <ul>
                        <li>
                            <a href="Student_dashboard.jsp">Home</a>
                        </li>
                        <li>All Teacher</li>
                        <li><%=user.getFirstname()+" "+ user.getMiddlename() %></li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <div class="row">
                    <!-- Student Info Area Start Here -->
                    <div class="col-4-xxxl col-12">
                        <div class="card dashboard-card-ten">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>About Faculty</h3>
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
                                            <img src="data:image/png;base64,<%= user.getUserProfilepicString()  %>" class="media-img-auto" alt="student">
                                        </div>
                                        <div class="media-body">
                                            <h3  class="item-title"><%= user.getFirstname()+" "+user.getMiddlename() %></h3>
                                            <p><%= user.getQualification() %></p>
                                        </div>
                                    </div>
                                    <div class="table-responsive info-table">
                                        <table class="table text-nowrap">
                                            <tbody>
                                            <div class="row">
                           
									<% int subcnt=1; %>
									<div class="col-lg-12 form-group">
                                   
                                    <%  
                                    if(null != user.getStreamList()){
                                     for(int i=0;i<user.getStreamList().size();i++){
                                    
                                    	Stream s = user.getStreamList().get(i);
                                    	
                                    %>
                                    <div class="stream" >
<!--                                     <input  name="stream_checkbox" class="stream_check" type="checkbox"  class="" -->
                                    <% System.out.println(s.getStreamid()+" "+s.getSemesters() );
                                    if(streamIdList.contains(s.getStreamid()) && !s.getSemesters().isEmpty() && s.isStreamCheck()){
                                    	
                                    	%>
<!--                                     checked="checked" -->
										<h3><%=s.getStreamname()%> :-</h3> 
                                    <% } %>
<%--                                      value="<%=s.getStreamid()%>"> --%>
                                     
<!--                                      div for semester list  -->
									<div id="id_stream<%=s.getStreamid() %>" class="col-lg-12 form-group">
										<%
										 System.out.println("sem list in jsp: "+s.getSemesters());
                                     	if(null != s.getSemesters() && s.isStreamCheck()){
                                    
                                     	for(Semester1 s1 : s.getSemesters()){
                                     %>  
                                     <div style="margin-left: 30px;" id="<%=s.getStreamid()%>-<%= s1.getSemId() %>">
<!--                                           <input name="semesterCheck" class="semester_check" type="checkbox" -->
                                          <% if(s1.isSelected()){ %>
<!--                                           checked="checked" -->
												<h4> Semester <%=s1.getSemValue()  %> : </h4>
                                          <% } %>
<%--                                            value = "<%= s1.getSemId() %>" --%>
<%--                                               >  <br>    --%>
<!--                                               division for subject  -->
                                                 <div style="margin-left: 40px;" class="subject">
                                              
                                              	<% //System.out.println("subject list in jsp: "+s1.getSubjects());
                                              	if(null != s1.getSubjects()){ 
                                              
                                              	 for(Subject s2 : s1.getSubjects()){ %>
                                              	
<!--                                               	<input type="checkbox" -->
                                              	<% if(s2.isSelected()){ %>
<!--                                               		checked="checked" -->
												<h5>Subject <%=subcnt++ %> : <%= s2.getSubjectName() %></h5>
                                              	<% } %>
                                              	
<%--                                               	value = "<%= s2.getSubjectId() %>"> Subject <%=subcnt++ %> : <%= s2.getSubjectName() %> <br> --%>
                                              	
                                              	 
                                              	<% }//subject for
                                              	 subcnt=1;
                                              	}//if not equal to null%>
                                                              
                                                 </div>
                                                 
                                                 
                                         </div>        
                                     <% }//semester for loop
                                     	}//if%>
                                     	
                                     
                                     
                                     	</div>
                                     	  </div>
                                    <% 
										
                                   }//for
                                    }//if stream not equal to null %>
<!--                                    default value code here                                  -->
                              
                               
                               </div>
							      
                            </div>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Student Info Area End Here -->
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