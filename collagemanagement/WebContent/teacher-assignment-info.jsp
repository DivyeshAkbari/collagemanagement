<%@page import="com.collagemanagement.bean.Image"%>
<%@page import="com.collagemanagement.bean.User"%>
<%@page import="com.collagemanagement.bean.Assignment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-fees.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Teacher | Assignment Info</title>
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
<%
List<Assignment> facultyAsslist = (List) request.getAttribute("facultyAsslist1");
List<Integer> facultyAsslistId = (List) request.getAttribute("facultyAsslistId1");
List<Assignment> userSubmittedAssList = (List) request.getAttribute("userSubmittedAssList1");
List<Integer> assSubmittedUserId = (List) request.getAttribute("assSubmittedUserId1");
List<User> allStudentList = (List) request.getAttribute("allStudentList1");
List<Image> profilepiclist = (List) request.getAttribute("profilepiclist1");
String assId = (String)request.getAttribute("assid");
System.out.println("assId: "+assId);
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
          
          <%@include file="sidebar-teacher.jsp" %>
          
            <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Assignment</h3>
                    <ul>
                        <li>
                            <a href="Teacher_dashboard.jsp">Assignment</a>
                        </li>
                        <li>Student Assignment info.</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <!-- Fees Table Area Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                        <div class="heading-layout1">
                            <div class="item-title">
                                <h3>Students</h3>
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
                                    <input type="text" id="searchId" type="text" onkeyup="myFunction1()" placeholder="Search by ID ..." class="form-control">
                                </div>
                                <div class="col-4-xxxl col-xl-4 col-lg-3 col-12 form-group">
                                    <input type="text" id="searchName" type="text" onkeyup="myFunction()" placeholder="Search by Name ..." class="form-control">
                                </div>
                                <div class="col-4-xxxl col-xl-3 col-lg-3 col-12 form-group">
                                    <input type="text" id="searchMail" type="text" onkeyup="myFunction2()" placeholder="Search by Mail id ..." class="form-control">
                                </div>
                                <div class="col-1-xxxl col-xl-2 col-lg-3 col-12 form-group">
                                    <button disabled="disabled" type="submit" class="fw-btn-fill btn-gradient-yellow">Type to search</button>
                                </div>
                            </div>
                        </form>
                        <% if(!(allStudentList.isEmpty()) && !(userSubmittedAssList.isEmpty()) && !(facultyAsslist.isEmpty())){ %>
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
                                        <th>Name of student</th>
                                        <th>Gender</th>
                                        <th>Division</th>
                                        <th>Semester</th>
                                        <th>Email</th>
                                        <th>Title</th>
                                        <th>Due date</th>
                                        <th>Student upload date</th>
                                        <th>Status</th>
                                        <th>Assignment</th>
                                        <th></th>
                                        
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                <% Assignment a,a1;
                                int cnt=0;
                                int j= Integer.parseInt(assId);
                                int k = facultyAsslistId.indexOf(j);
									a1 = facultyAsslist.get(k);
									System.out.println("a1 id: "+a1.getAssId());
                                for(int i=0; i<allStudentList.size(); i++){
                                	User user = allStudentList.get(i); 
                                	Image i1 = profilepiclist.get(i);
                                	String title="",dueDate="";
                                	
                                  %> 
                                    <tr>
                                        <td>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input">
                                                <label class="form-check-label"><%= user.getId() %></label>
                                            </div>
                                        </td>
                                        <td><img style="border-radius: 50%;" src="data:image/png;base64,<%= i1.getUserProfilepicString()  %>" alt="student"></td>
                                        <td><%= user.getFirstname() %> <%= user.getMiddlename() %></td>
                                        <td><%= user.getXender() %></td>
                                        <td><%= user.getDivision() %></td>
                                        <td><%= user.getSemester() %></td>
                                        <td><%= user.getEmail() %></td>
										<td><%= a1.getTitle() %></td>
                                        <td><%= a1.getDate() %></td>
                                       <% if(!(assSubmittedUserId.contains(user.getId()))){%>
                                       <td>---</td>
                                       <%} %>
                                        <% if(assSubmittedUserId.contains(user.getId())){ 
                                        
                                        a = userSubmittedAssList.get(cnt);
                                        cnt++;
                                        %>
                                         <td><%= a.getUploadDate() %></td>
                                        <td class="badge badge-pill badge-success d-block mg-t-8">Submitted</td>
                                        <td><a href="DownloadStudentAss?id=<%= a.getAssId()%>">View</a></td>
                                        <% }else{ %>
                                        <td class="badge badge-pill badge-danger d-block mg-t-8">Pending</td>
                                        <td>---</td>
                                        <% } %>
                                        <td></td>
                                         
                                    </tr>
                                    <% } %>
<!--                                     <tr> -->
<!--                                         <td> -->
<!--                                             <div class="form-check"> -->
<!--                                                 <input type="checkbox" class="form-check-input"> -->
<!--                                                 <label class="form-check-label">#0021</label> -->
<!--                                             </div> -->
<!--                                         </td> -->
<!--                                         <td><img src="img/figure/student2.png" alt="student"></td> -->
<!--                                         <td>Mark Willy</td> -->
<!--                                         <td>Male</td> -->
<!--                                         <td>2</td> -->
                                       
<!--                                         <td class="badge badge-pill badge-danger d-block mg-t-8">Unsubmitted</td> -->
                                       
                                         
<!--                                     </tr> -->
                                </tbody>
                            </table>
                        </div>
                        <% }else{%>
                        <div class="ui-alart-box">
											<div class="icon-color-alart">

												<div class="alert icon-alart bg-fb2" role="alert">
													<i class="fas fa-exclamation bg-fb3"></i> Yet no one has submitted assignment !!
												</div>

											</div>
										</div>
                        <% } %>
                    </div>
                </div>
                <!-- Fees Table Area End Here -->
<!--                 <footer class="footer-wrap-layout1"> -->
<!--                     <div class="copyright">� Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a href="#">PsdBosS</a></div> -->
<!--                 </footer> -->
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
      	    td = tr[i].getElementsByTagName("td")[6];
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


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-fees.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
</html>