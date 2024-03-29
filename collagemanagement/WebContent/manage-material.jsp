<%@page import="com.collagemanagement.bean.Assignment"%>
<%@page import="com.collagemanagement.bean.Subject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/student-attendence.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>EduChamp | Manage Notes & Chapters</title>
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
<%
List<Assignment> notes =  (List)request.getSession(false).getAttribute("notes");

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
					<h3>Student Materials</h3>
					<ul>
						<li><a href="Student_dashboard.jsp">Home</a></li>
						<li>View-materials</li>
					</ul>
				</div>

				<!-- Breadcubs Area End Here -->
				<div id="uploadAssDiv" class="row">
					<!-- Student Attendence Search Area Start Here -->

					<!-- Student Attendence Search Area End Here -->
					<!-- Student Attendence Area Start Here -->
					<div class="col-12">
						<div class="card">
							<div class="card-body">

								<div class="heading-layout1">
									<div class="item-title">
										<h3 id="subname">
											Notes</h3>
									</div>
									<div class="dropdown">
										<a class="dropdown-toggle" href="#" role="button"
											data-toggle="dropdown" aria-expanded="false">...</a>

										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item" href="#"><i
												class="fas fa-times text-orange-red"></i>Close</a> <a
												class="dropdown-item" href="#"><i
												class="fas fa-cogs text-dark-pastel-green"></i>Edit</a> <a
												class="dropdown-item" href="#"><i
												class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
										</div>
									</div>
								</div>
								

							<div class="table-responsive">

								<table class="table bs-table table-striped table-bordered text-nowrap">

									<%
										//System.out.println("asslis: "+asslist);
									if (notes.isEmpty() == false || notes != null) {
									%>
									<thead>
										<tr>
											<th class="text-left">Serial number</th>
											<th>Name</th>
											<th>Description</th>
											<th>Faculty name</th>
											<th>Notes Uploaded by faculty(Date)</th>
											
											<th>PDF</th>
											<th>Delete</th>

										</tr>
									</thead>
									<tbody>




										<%
											int cnt = 1;
										Assignment a;
										for (int j = 0; j < notes.size(); j++) {
											a = notes.get(j);
											//User f = facultylist.get(j);
										%><tr>
												<td><%=cnt%></td>
												<td class="text-left"><input type="hidden" name="assId"
													value="<%=a.getAssId()%>"><%=a.getTitle()%></td>

												<td><%=a.getDiscription()%></td>
												<td><%=a.getUserFirstName() + " " + a.getUserLastName()%></td>
												<td><%=a.getUploadDate()%></td>
												
												<td><a href="DownloadNotes?id=<%=a.getAssId()%>">
														Download</a></td>
												<td><a href="DeleteNote?assid=<%=a.getAssId()%>&userid=<%=a.getUsesrId()%>">Delete this</a></td>

											</tr>
											
										

										<%
											cnt++;
										}
										} else {
										System.out.println("else");
										%>
										<div class="ui-alart-box">
											<div class="icon-color-alart">

												<div class="alert icon-alart bg-fb2" role="alert">
													<i class="fas fa-exclamation bg-fb3"></i> !! Yet there is
													no materials for this subject !!!!
												</div>

											</div>
										</div>
										<%
											}
										%>


									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer-wrap-layout1">
				<div class="copyright">
					� Copyrights <a href="#">akkhor</a> 2019. All rights reserved.
					Designed by <a href="#">PsdBosS</a>
				</div>
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


</html>