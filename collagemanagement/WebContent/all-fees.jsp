<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.collagemanagement.bean.User"%>
<%@page import="java.util.List"%>  

<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-fees.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AKKHOR | Fees Collection</title>
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
    <!-- Data Table CSS -->
    <link rel="stylesheet" href="css/jquery.dataTables.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Modernize js -->
    <script src="js/modernizr-3.6.0.min.js"></script>
</head>

<jsp:include page ="/FeesPayStudentDataDisplay"/>

<% List<User> userList =(List)request.getAttribute("user");
int userid1=0;
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
                    <h3>Accounts</h3>
                    <ul>
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>Fees Collection</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <!-- Fees Table Area Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                        <div class="heading-layout1">
                            <div class="item-title">
                                <h3>All Fees Collection</h3>
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
                        <form class="mg-b-20">
                            <div class="row gutters-8">
                                <div class="col-3-xxxl col-xl-3 col-lg-3 col-12 form-group">
                                    <input id="searchId" type="text" onkeyup="myFunction1()" placeholder="Search by ID ..." class="form-control">
                                </div>
                                <div class="col-4-xxxl col-xl-4 col-lg-3 col-12 form-group">
                                    <input id="searchName" type="text" onkeyup="myFunction()" placeholder="Search by Name ..." class="form-control">
                                </div>
                                <div class="col-4-xxxl col-xl-3 col-lg-3 col-12 form-group">
                                    <input id="searchMail" type="text" onkeyup="myFunction2()" placeholder="Search by Mail id ..." class="form-control">
                                </div>
<!--                                 <div class="col-1-xxxl col-xl-2 col-lg-3 col-12 form-group"> -->
<!--                                     <button id="btnExport" type="submit" class="fw-btn-fill btn-gradient-yellow">Generate Report</button> -->
<!--                                 </div> -->
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="myTable" class="table data-table text-nowrap">
                                <thead>
                                    <tr>
                                        <th> 
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input checkAll">
                                                <label class="form-check-label">ID</label>
                                            </div>
                                        </th>
                                        	<th>Photo</th>
                                        	<th>First Name</th>                                          
                                            <th>Last Name</th>
                                            <th>Email</th>
                                           	<th>Gender</th>                                              
                                            <th>Stream</th>
                                            <th>Semester</th>
                                            <th>Division</th>
                                            <th>Status</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% int counter=1;%>
                                <% int paymentstatus=0; %>
                                            <% for(int i=0;i<userList.size();i++)
												{ %>
												<% User u1=userList.get(i);
												userid1 = u1.getId();
												%>
												
                                    <tr>
                                       <td>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input">
                                                <label class="form-check-label"><%=u1.getId() %></label>
                                            </div>
                                        </td>
                                        <!-- <td><img src="img/figure/student2.png" alt="student"></td> -->
                                        <td class="text-center"><img style="border-radius: 50%;" src="data:image/png;base64,<%= u1.getUserProfilepicString()  %>" alt="student"></td>
                                       <td><%= u1.getFirstname() %> <%=u1.getMiddlename() %></td>										
										<td><%=u1.getLastname() %></td>
										<td><%=u1.getEmail()%></td>
										<td><%=u1.getXender() %></td>
                                        <td><%=u1.getStream()%></td>
										<td><%=u1.getSemester() %>
										<td><%=u1.getDivision()%></td>
										<%-- <td class="badge badge-pill badge-danger d-block mg-t-8"><%=u1.getPaymentstatus() %></td> --%>
										<%if(u1.getPaymentstatus() != "0") { %>
											<%System.out.println("if Executed"); %>  
											
											<td class="badge badge-pill badge-success d-block mg-t-8"><%=u1.getPaymentstatus() %></td>
                                        <%}
										else{ %>     
											<%System.out.println("else Executed"); %>                                 
                                        	
                                        	<td class="badge badge-pill badge-danger d-block mg-t-8"><%=u1.getPaymentstatus() %></td>
                                        <%} %>
                                         <td>
                                            <div hidden="hidden" class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                    <span class="flaticon-more-button-of-three-dots"></span>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                                                    <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                                                    <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                  	<% } %>    
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Fees Table Area End Here -->
                
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
    <!-- Data Table Js -->
    <script src="js/jquery.dataTables.min.js"></script>
    <!-- Scroll Up Js -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- Custom Js -->
    <script src="js/main.js"></script>
    
<script>
    function myFunction() {
    	  var input, filter, table, tr, td, i, txtValue;
    	  input = document.getElementById("searchName");
    	  filter = input.value.toUpperCase();
    	  table = document.getElementById("myTable");
    	  tr = table.getElementsByTagName("tr");
    	  for (i = 0; i < tr.length; i++) {
    	    td = tr[i].getElementsByTagName("td")[2];
    	    if (td) {
    	      txtValue = td.textContent || td.innerText;
    	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
    	        tr[i].style.display = "";
    	      } else {
    	        tr[i].style.display = "none";
    	      }
    	    }       
    	  }
    	}//first fun
    	function myFunction1() {
      	  var input, filter, table, tr, td, i, txtValue;
      	  input = document.getElementById("searchId");
      	  filter = input.value.toUpperCase();
      	  table = document.getElementById("myTable");
      	  tr = table.getElementsByTagName("tr");
      	  for (i = 0; i < tr.length; i++) {
      	    td = tr[i].getElementsByTagName("td")[0];
      	    if (td) {
      	      txtValue = td.textContent || td.innerText;
      	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
      	        tr[i].style.display = "";
      	      } else {
      	        tr[i].style.display = "none";
      	      }
      	    }       
      	  }
      	}//second 
      	function myFunction2() {
      	  var input, filter, table, tr, td, i, txtValue;
      	  input = document.getElementById("searchMail");
      	  filter = input.value.toUpperCase();
      	  table = document.getElementById("myTable");
      	  tr = table.getElementsByTagName("tr");
      	  for (i = 0; i < tr.length; i++) {
      	    td = tr[i].getElementsByTagName("td")[4];
      	    if (td) {
      	      txtValue = td.textContent || td.innerText;
      	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
      	        tr[i].style.display = "";
      	      } else {
      	        tr[i].style.display = "none";
      	      }
      	    }       
      	  }
      	}
    </script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-fees.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
</html>