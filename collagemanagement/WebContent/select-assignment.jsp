<%@page import="com.collagemanagement.bean.Assignment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/notice-board.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>EduChamp | Select Assignment</title>
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
<!-- Date Picker CSS -->
<link rel="stylesheet" href="css/datepicker.min.css">
<!-- Select 2 CSS -->
<link rel="stylesheet" href="css/select2.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="style.css">
<!-- Modernize js -->
<script src="js/modernizr-3.6.0.min.js"></script>

</head>


<%
List<Integer> facultyAsslistId = (List) request.getAttribute("facultyAsslistId1");
List<Assignment> facultyAsslist = (List) request.getAttribute("facultyAsslist1");
String subId = (String)request.getAttribute("subid");
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

			<%@include file="sidebar-teacher.jsp"%>

			<!-- Sidebar Area End Here -->
			<div class="dashboard-content-one">
				<!-- Breadcubs Area Start Here -->
				<div class="breadcrumbs-area">
					<h3>Select Assignment</h3>
					<ul>
						<li><a href="Teacher_dashboard.jsp">Subject</a></li>
						<li>Select Assignment</li>
					</ul>
				</div>
				
				<!-- Breadcubs Area End Here -->

				<div class="row">
					<div class="col-4-xxxl col-12">
						<div class="card height-auto">
							<div class="card-body">
								<div class="heading-layout1">
									<div class="item-title">
										<h3>Select Assignment</h3>
									</div>

								</div>
								 <% if(!(facultyAsslist.isEmpty())){ %>
								<form action="FetchSubmittedAssInfo1" method="post">
									<div class="row">
										<div class="col-lg-12">
											<label>Select Assignment *</label> 
											<select name="assId" id="ass" class="select2" required="required">
												<option value="none">Please Select</option>
												<%
													for (int i = 0; i < facultyAsslistId.size(); i++) {
													Integer id = facultyAsslistId.get(i);
													Assignment a = facultyAsslist.get(i);
												%>
												<option value="<%=id%>">
													 <%=a.getTitle()%>
												</option>
												<%
													}
												%>
											</select>
											<input type="hidden" value="<%=subId%>" name="subid"> 
										</div>
										<div class="col-12 form-group mg-t-8">
										<button type="submit" 
										class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Next</button>
										
										</div>
									</div>
								</form>
								<% }else{%>
                        <div class="ui-alart-box">
											<div class="icon-color-alart">

												<div class="alert icon-alart bg-fb2" role="alert">
													<i class="fas fa-exclamation bg-fb3"></i> Yet no assignment !!
												</div>

											</div>
										</div>
                        <% } %>
							</div>
						</div>
					</div>
					
					<!-- Add Notice Area End Here -->

				</div>
				
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
	<!-- Date Picker Js -->
	<script src="js/datepicker.min.js"></script>
	<!-- Custom Js -->
	<script src="js/main.js"></script>
</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/notice-board.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
</html>