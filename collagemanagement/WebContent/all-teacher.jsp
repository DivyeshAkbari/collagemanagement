<%@page import="com.collagemanagement.bean.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:25 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AKKHOR | All Teachers</title>
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

<jsp:include page ="/SelectFacultyDetails"/>
 
<% List<User> facultylist = (List)request.getAttribute("facultylist");
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
                    <h3>Teacher</h3>
                    <ul>
                        <li>
                            <a href="Admin.jsp">Home</a>
                        </li>
                        <li>All Teachers</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <!-- Teacher Table Area Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                        <div class="heading-layout1">
                            <div class="item-title">
                                <h3>All Teachers Data</h3>
                            </div>
                           <div class="dropdown">
                                <a class="dropdown-toggle" href="#" role="button" 
                                data-toggle="dropdown" aria-expanded="false">...</a>
        
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Generate Report</a>
<!--                                     <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> -->
<!--                                     <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a> -->
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
                            <table id="myTable" class="table display data-table text-nowrap">
<!--                              <button id="btnExport" type="submit" class="fw-btn-fill btn-gradient-yellow">Generate Report</button> -->
                                
                                <thead>
                                    <tr>
                                        <th> 
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input checkAll">
                                                <label class="form-check-label">ID</label>
                                            </div>
                                        </th>
                                        <th>Photo</th>
                                        <th>Name</th>
                                        <th>Gender</th>
                                        <th>Qualification</th>
                                        <th>Address</th>
                                        <th>Phone</th>
                                        <th>E-mail</th>
                                        <th>Subjects</th>
                                        <th>Update/Delete</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% for(int i=0; i<facultylist.size(); i++){
                                	User user = facultylist.get(i);
                                	userid1 = user.getId();
                                	%>
                                    <tr>
                                        <td>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input">
                                                <label class="form-check-label"><%= user.getId() %></label>
                                            </div>
                                        </td>
                                        <td class="text-center"><img style="border-radius: 50%;" src="data:image/png;base64,<%= user.getUserProfilepicString()  %>" alt="student"></td>
                                        <td><%= user.getFirstname() %> <%= user.getMiddlename() %></td>
                                        <td><%= user.getXender() %></td>
                                        <td><%= user.getQualification() %></td>
                                        <td><%= user.getAddress() %></td>
                                        <td><%= user.getContactno() %></td>
                                        <td><%= user.getEmail() %></td>
                                        <td><b><a href="DisplayFacultySubjects?userId=<%=user.getId()%>">View</a></b></td>
                                        <td></td>
                                         <td>
                                            <div class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                    <span class="flaticon-more-button-of-three-dots"></span>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right">
<%--                                                 	href="RemoveFacultyDetails?id=<%= user.getId()%>" --%>
                                                    <a data-toggle="modal" data-target="#exampleModalCenter" class="dropdown-item" onclick="geteventid(<%=user.getId()%>);"><i class="fas fa-times text-orange-red"></i>Delete</a>
<!--                                                    <button type="button" class="fw-btn-fill btn-gradient-yellow"  data-toggle="modal" data-target="#exampleModalCenter" -->
<%-- 													onclick="geteventid(<%=user.getId()%>);">Activate</button> --%>
                                                    <a class="dropdown-item" href="EditFacultyDetail?id=<%= user.getId() %>"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                                                    <a class="dropdown-item" href="#" onclick="reloadPage();"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                             
<!--                             modal -->
							<div class="modal fade" id="exampleModalCenter" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="exampleModalLongTitle"><i class="bi bi-exclamation-triangle"></i>Warning</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">Are you sure want to Activate  ?</div>
									<div class="modal-footer">
										<button type="button" class="fw-btn-fill btn-gradient-yellow"
											data-dismiss="modal"><i class="bi bi-x"></i>cancel</button>
										<button type="button" class="fw-btn-fill btn-gradient-yellow">
											</i><a style="color: white;" id="Acceptid"><i class="bi bi-person-x-fill" style="margin-right: 10px;"></i>Delete</a>
										</button>
									</div> 
								</div>
							</div>
						</div>
<!-- 						modal end -->
                        </div>
                    </div>
                </div>
                <!-- Teacher Table Area End Here -->
                <footer class="footer-wrap-layout1">
                    <div class="copyright">� Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a href="#">PsdBosS</a></div>
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
    <!-- Scroll Up Js -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- Data Table Js -->
    <script src="js/jquery.dataTables.min.js"></script>
    <!-- Custom Js -->
    <script src="js/main.js"></script>
<!--     https://www.jqueryscript.net/table/export-table-json-csv-txt-pdf.html -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
        crossorigin="anonymous"></script>
    <script src="js/tableHTMLExport.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.5/jspdf.plugin.autotable.min.js"></script>
    <script>
    $("#myTable").tableHTMLExport({type:'pdf',orientation: 'p' filename:'sample.pdf'});
//      $("#myTable").tableHTMLExport({ 
//      		  type:'pdf',
//      		  orientation: 'p' 

//      	  // file name
//      	  filename:'report.pdf'
    	  
//      	htmlContent:false,
    	  
//      	});
     </script>
<!-- <!--     <script> -->
<!-- //     	var doc = new jsPDF() -->
<!-- //     	var h1 = document.querySelector('#myTable') -->
<!-- //     	doc.fromHTML(h1,15,15) -->
<!-- //     	doc.save("report.pdf") -->
<!-- <!--     </script> -->
    <script>
    function reloadPage(){
        location.reload(true);
    }
    </script>
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
      	    td = tr[i].getElementsByTagName("td")[7];
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
    <script>
    function geteventid(userid)
    {	
    	var uid = userid;
    	var strLink = "RemoveFacultyDetails?id=" + uid;
    	document.getElementById("Acceptid").setAttribute("href", strLink);
    }
    </script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:25 GMT -->
</html>