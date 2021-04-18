<%@page import="com.collagemanagement.bean.Subject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/student-attendence.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>EduChamp | Subjects</title>
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
    <!-- Animate CSS -->
    <link rel="stylesheet" href="css/animate.min.css">
    <!-- Select 2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Modernize js -->
    <script src="js/modernizr-3.6.0.min.js"></script>
    <style>
    	#hoverDiv {background: #fff;}
	#hoverDiv:hover {background: aqua;}
	
/* 	@media only screen and (max-width: 320px) { */

/*    h2 {  */
/*       font-size: 2em;  */
/*    } */
/*    } */
   .chevron {
  display: inline-flex;
  align-items:center;
  justify-content:center;
  
  position: relative;
  clear: both;
  padding: 10px 0  10px 2.5em;
  margin:2px 0;
  height: 250px;
  width: 100%;
  vertical-align:middle;
  text-align:center;
  color: white;
  font-size: 12px;
	}
	

	
    </style>
    </head>
    
   <jsp:include page ="/FetchSubjectsForStudent"/>
   <% List<Subject> subjectlist= (List)request.getAttribute("subjectlist"); 
  System.out.println(subjectlist);
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
            <div  class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Student Assignment</h3>
                    <ul>
                        <li>
                            <a href="Student_dashboard.jsp">Home</a>
                        </li>
                        <li>Assignment</li>
                    </ul>
                </div>
                <div>
                <div class="row gutters-20">
                <% for(Subject s : subjectlist){ %>
<%--                 <a href = <%= "\"student-assignment-subject.jsp?Id=" + s.getSubjectId() +"&Name=" +s.getSubjectName()+ "\"" %>> --%>
              
                    <div id="sub" value="<%=s.getSubjectId()%>" class="col-xl-3 col-sm-6 col-12">
                        <div id="hoverDiv" class="dashboard-summery-one mg-b-20 ">
                            <div class="row align-items-center ">
                                
                                <div class="col-6">
                                    <div  class="item-content">
                                        <div style="font-size:2vw;" class="item-title chevron"> <h2  id="dsubvalue" value="<%= s.getSubjectId() %>"> <a href = <%= "\"UploadAssStudent?Id=" + s.getSubjectId() +"&flag=1&Name=" +s.getSubjectName()+ "\"" %>><%= s.getSubjectName() %></a> </h2>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
<!--                     </a> -->
                    <% } %>
                  
                    
                    
                </div>
               
                </div>
                <!-- Breadcubs Area End Here -->
                
                <!-- Student Attendence Area End Here -->
                <footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a href="#">PsdBosS</a></div>
                </footer>
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
    <!-- Select 2 Js -->
    <script src="js/select2.min.js"></script>
    <!-- Scroll Up Js -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- Custom Js -->
    <script src="js/main.js"></script>
    

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/student-attendence.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
</html>