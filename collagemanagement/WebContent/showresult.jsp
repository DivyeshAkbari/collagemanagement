<%@page import="com.collagemanagement.bean.Marks"%>
<%@page import="com.collagemanagement.bean.Subject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>EduChamp | Student Result</title>
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
</head>
<% List<Subject> subjectlist= (List)request.getAttribute("Subjectlist"); %>
<% List<Marks> Markslist= (List)request.getAttribute("Markslist"); %>
<% String Status= (String)request.getAttribute("Status"); %>

<body>
			<div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Semester ___ result :</h3>
                                    </div>
                                   <div class="dropdown">
                                        <a class="dropdown-toggle" href="#" role="button" 
                                        data-toggle="dropdown" aria-expanded="false">...</a>
                
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                                            <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                                            <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                                        </div>
                                    </div>
                                </div>
						<div class="table-responsive">
              <table class="table bs-table table-striped table-bordered text-nowrap">
                 <thead>
                 <tr>
                 
               
                 </tr>
                 </thead>
                 <tbody>
                 <tr>
                
                 <% if(subjectlist!=null)
				{%>
						<%int l=0; %>
                            <% for(int i=0;i<subjectlist.size();i++)
							{ %>
	
								<% Subject s1=subjectlist.get(i); %>
		 						<td> <%=s1.getSubjectName()%></td>
		 						<%l=1; %>
							<% } %>
							<% if(l==1)
							{%>
								<td>Status</td>
								<td>GP</td>
							<%} %>
                <%} %>
                 </tr>
                 <tr>
                 		<%int p=0; %>
              			   	<% for(int j=0;j<Markslist.size();j++)
						{ %>
		
							<% Marks m1=Markslist.get(j); %>
							<td> <%=m1.getMarksvalue() %></td>
							<%p=1; %>
						<% } %> 
						
						<% if(p==1)
							{%>
								<td><%=Status %></td>
								<td>1.35</td>
						<%} %>
                 </tr>  
          </tbody>
     </table>
     			<footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a href="#">PsdBosS</a></div>
                </footer>
 </div>
 </div>
 </div> 
 </div>
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
</html>