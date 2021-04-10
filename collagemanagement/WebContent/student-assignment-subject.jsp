<%@page import="com.collagemanagement.bean.Assignment"%>
<%@page import="com.collagemanagement.bean.User"%>
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
<title>EduChamp | Notes & Chapters</title>
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
	// String ss = (String)request.getAttribute("ss");
//  String name = (String)request.getAttribute("name");
// List<User> facultylist =  (List)request.getAttribute("faculty");
// List<Assignment> asslist =  (List)request.getAttribute("assignmentlist");

String ss = (String) request.getSession(false).getAttribute("ss");
List<User> facultylist = (List) request.getSession(false).getAttribute("faculty");
String name = (String) request.getSession(false).getAttribute("name");
List<Assignment> asslist = (List) request.getSession(false).getAttribute("assignmentlist");

String ans = (String) request.getSession(false).getAttribute("message");
%>

<body>
	<!-- Preloader Start Here -->
	<div id="preloader"></div>
	<!-- Preloader End Here -->
	<div id="wrapper" class="wrapper bg-ash">
		<!-- Header Menu Area Start Here -->
		<div class="navbar navbar-expand-md header-menu-one bg-light">
			<div class="nav-bar-header-one">
				<div class="header-logo">
					<a href="Student_dashboard.jsp"> <img src="img/logo.png"
						alt="logo">
					</a>
				</div>
				<div class="toggle-button sidebar-toggle">
					<button type="button" class="item-link">
						<span class="btn-icon-wrap"> <span></span> <span></span> <span></span>
						</span>
					</button>
				</div>
			</div>
			<div class="d-md-none mobile-nav-bar">
				<button class="navbar-toggler pulse-animation" type="button"
					data-toggle="collapse" data-target="#mobile-navbar"
					aria-expanded="false">
					<i class="far fa-arrow-alt-circle-down"></i>
				</button>
				<button type="button" class="navbar-toggler sidebar-toggle-mobile">
					<i class="fas fa-bars"></i>
				</button>
			</div>
			<div class="header-main-menu collapse navbar-collapse"
				id="mobile-navbar">
				<ul class="navbar-nav">
					<li class="navbar-item header-search-bar">
						<div class="input-group stylish-input-group">
							<span class="input-group-addon">
								<button type="submit">
									<span class="flaticon-search" aria-hidden="true"></span>
								</button>
							</span> <input type="text" class="form-control"
								placeholder="Find Something . . .">
						</div>
					</li>
				</ul>
				<ul class="navbar-nav">
					<li class="navbar-item dropdown header-admin"><a
						class="navbar-nav-link dropdown-toggle" href="#" role="button"
						data-toggle="dropdown" aria-expanded="false">
							<div class="admin-title">
								<h5 class="item-title">Stevne Zone</h5>
								<span>Admin</span>
							</div>
							<div class="admin-img">
								<img src="img/figure/admin.jpg" alt="Admin">
							</div>
					</a>
						<div class="dropdown-menu dropdown-menu-right">
							<div class="item-header">
								<h6 class="item-title">Steven Zone</h6>
							</div>
							<div class="item-content">
								<ul class="settings-list">
									<li><a href="#"><i class="flaticon-user"></i>My
											Profile</a></li>
									<li><a href="#"><i class="flaticon-list"></i>Task</a></li>
									<li><a href="#"><i
											class="flaticon-chat-comment-oval-speech-bubble-with-text-lines"></i>Message</a></li>
									<li><a href="#"><i class="flaticon-gear-loading"></i>Account
											Settings</a></li>
									<li><a href="Student_dashboard.jsp"><i
											class="flaticon-turn-off"></i>Log Out</a></li>
								</ul>
							</div>
						</div></li>
					<li class="navbar-item dropdown header-message"><a
						class="navbar-nav-link dropdown-toggle" href="#" role="button"
						data-toggle="dropdown" aria-expanded="false"> <i
							class="far fa-envelope"></i>
							<div class="item-title d-md-none text-16 mg-l-10">Message</div> <span>5</span>
					</a>

						<div class="dropdown-menu dropdown-menu-right">
							<div class="item-header">
								<h6 class="item-title">05 Message</h6>
							</div>
							<div class="item-content">
								<div class="media">
									<div class="item-img bg-skyblue author-online">
										<img src="img/figure/student11.png" alt="img">
									</div>
									<div class="media-body space-sm">
										<div class="item-title">
											<a href="#"> <span class="item-name">Maria Zaman</span> <span
												class="item-time">18:30</span>
											</a>
										</div>
										<p>What is the reason of buy this item. Is it usefull for
											me.....</p>
									</div>
								</div>
								<div class="media">
									<div class="item-img bg-yellow author-online">
										<img src="img/figure/student12.png" alt="img">
									</div>
									<div class="media-body space-sm">
										<div class="item-title">
											<a href="#"> <span class="item-name">Benny Roy</span> <span
												class="item-time">10:35</span>
											</a>
										</div>
										<p>What is the reason of buy this item. Is it usefull for
											me.....</p>
									</div>
								</div>
								<div class="media">
									<div class="item-img bg-pink">
										<img src="img/figure/student13.png" alt="img">
									</div>
									<div class="media-body space-sm">
										<div class="item-title">
											<a href="#"> <span class="item-name">Steven</span> <span
												class="item-time">02:35</span>
											</a>
										</div>
										<p>What is the reason of buy this item. Is it usefull for
											me.....</p>
									</div>
								</div>
								<div class="media">
									<div class="item-img bg-violet-blue">
										<img src="img/figure/student11.png" alt="img">
									</div>
									<div class="media-body space-sm">
										<div class="item-title">
											<a href="#"> <span class="item-name">Joshep Joe</span> <span
												class="item-time">12:35</span>
											</a>
										</div>
										<p>What is the reason of buy this item. Is it usefull for
											me.....</p>
									</div>
								</div>
							</div>
						</div></li>
					<li class="navbar-item dropdown header-notification"><a
						class="navbar-nav-link dropdown-toggle" href="#" role="button"
						data-toggle="dropdown" aria-expanded="false"> <i
							class="far fa-bell"></i>
							<div class="item-title d-md-none text-16 mg-l-10">Notification</div>
							<span>8</span>
					</a>

						<div class="dropdown-menu dropdown-menu-right">
							<div class="item-header">
								<h6 class="item-title">03 Notifiacations</h6>
							</div>
							<div class="item-content">
								<div class="media">
									<div class="item-icon bg-skyblue">
										<i class="fas fa-check"></i>
									</div>
									<div class="media-body space-sm">
										<div class="post-title">Complete Today Task</div>
										<span>1 Mins ago</span>
									</div>
								</div>
								<div class="media">
									<div class="item-icon bg-orange">
										<i class="fas fa-calendar-alt"></i>
									</div>
									<div class="media-body space-sm">
										<div class="post-title">Director Metting</div>
										<span>20 Mins ago</span>
									</div>
								</div>
								<div class="media">
									<div class="item-icon bg-violet-blue">
										<i class="fas fa-cogs"></i>
									</div>
									<div class="media-body space-sm">
										<div class="post-title">Update Password</div>
										<span>45 Mins ago</span>
									</div>
								</div>
							</div>
						</div></li>
					<li class="navbar-item dropdown header-language"><a
						class="navbar-nav-link dropdown-toggle" href="#" role="button"
						data-toggle="dropdown" aria-expanded="false"><i
							class="fas fa-globe-americas"></i>EN</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="#">English</a> <a
								class="dropdown-item" href="#">Spanish</a> <a
								class="dropdown-item" href="#">Franchis</a> <a
								class="dropdown-item" href="#">Chiness</a>
						</div></li>
				</ul>
			</div>
		</div>
		<!-- Header Menu Area End Here -->
		<!-- Page Area Start Here -->
		<div class="dashboard-page-one">
			<!-- Sidebar Area Start Here -->

			<%@include file="sidebar-student.jsp"%>

			<!-- Sidebar Area End Here -->
			<div class="dashboard-content-one">
				<!-- Breadcubs Area Start Here -->
				<div class="breadcrumbs-area">
					<h3>Student Assignment</h3>
					<ul>
						<li><a href="Student_dashboard.jsp">Home</a></li>
						<li>Assignment</li>
						<li><%=name%></li>
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
											Subject :
											<%=name%></h3>
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
								<!-- Success Modal -->
								<div class="modal-box">
								<% 
								if(null != ans && ans.equalsIgnoreCase("true")){ 
								%>
                                <div data-backdrop="static" data-keyboard="false" class="modal hide fade" id="success-modal" tabindex="-1" role="dialog"
                                    aria-hidden="true">
                                    <div class="modal-dialog success-modal-content" role="document">
                                        <div class="modal-content">
                                            
                                            <div class="modal-body">
                                               <div class="success-message">
                                                    <div class="item-icon">
                                                        <i class="fas fa-check"></i>
                                                    </div>
                                                    <h3 class="item-title">Assignment uploaded successfully..!</h3>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button id="modalid" type="button" class="footer-btn bg-linkedin"
                                                    data-dismiss="modal" onclick="window.location='student-assignment.jsp'">Okay</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%} %>
                                <!-- Error Modal -->
                                 <%if(null != ans && ans.equalsIgnoreCase("false")){ 
                                %>
                                <div data-backdrop="static" data-keyboard="false" class="modal hide fade" id="error-modal" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog success-modal-content" role="document">
                                        <div class="modal-content">
                                           
                                            <div class="modal-body">
                                                <div class="success-message">
                                                    <div class="item-icon">
                                                        <i class="fas fa-exclamation-triangle"></i>
                                                    </div>
                                                    <h3 class="item-title">Assignment can't be uploaded !</h3>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button id="modalid" type="button" class="footer-btn bg-linkedin"
                                                    data-dismiss="modal" onclick="window.location='student-assignment.jsp'">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%} session.setAttribute("message", null);%>
                                </div>

							<div class="table-responsive">

								<table
									class="table bs-table table-striped table-bordered text-nowrap">



									<%
										//System.out.println("asslis: "+asslist);
									if (asslist.isEmpty() == false) {
									%>
									<thead>
										<tr>
											<th class="text-left">Serial number</th>
											<th>Name</th>
											<th>Description</th>
											<th>Faculty name</th>
											<th>Assignment Uploaded by faculty(Date)</th>
											<th>Due Date</th>
											<th>PDF</th>
											<th>Upload</th>
											<th>Submit</th>
											<th>Status</th>

										</tr>
									</thead>
									<tbody>




										<%
											int cnt = 1;
										Assignment a;
										for (int j = 0; j < asslist.size(); j++) {
											a = asslist.get(j);
											//Assignment a : asslist
											//	System.out.println("ass: "+a);
											//int i=0;
											User f = facultylist.get(j);
											System.out.println("ass id is is: " + a.getAssId());
											System.out.println("faculty: " + f.getFirstname());
											//i++;
										%>
<!-- 										action="UploadAssByStudent"  -->
										<form id="formid" action="UploadAssByStudent" method="post" enctype="multipart/form-data">
											<tr>
												<td><%=cnt%></td>
												<td class="text-left"><input type="hidden" name="assId"
													value="<%=a.getAssId()%>"><%=a.getTitle()%></td>

												<td><%=a.getDiscription()%></td>
												<td><%=f.getFirstname() + " " + f.getMiddlename()%></td>
												<td><%=a.getUploadDate()%></td>
												<td><%=a.getDate()%></td>
												<td><a href="DownloadAss?assid=<%=a.getAssId()%>">
														Download Assignment</a></td>
												<td><input type="file" name="assignment"></td>
												<%--<a href="UploadAssByStudent?userId=<%= f.getId() %> & assId=<%= a.getAssId() %>"></a> --%>
												<td><button class="button1" value="hr">Submit</button> 
												</td>
												<td><i class="fas fa-check text-success"></i></td>

											</tr>
											
										</form>

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
													no assignment for this subject !!!!
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
			<!-- Student Attendence Area End Here -->
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
	<script type="text/javascript">
	$(document).ready(function(){
        $('#success-modal').modal('show');
        $('#error-modal').modal('show');
    });
</script>
<script>


// $('input[type=file]').change(function(){
//     if($('input[type=file]').val()==''){
//         $('button').attr('disabled',true)
//     } 
//     else{
//       $('button').attr('disabled',false);
//     }
// })
</script>
<script>

// $('input[type=file]').change(function(){
// 	var x = $("input[name=button1]").val();
// 	alert("value: "+x);
// 	var id = "buttonid"+x;
// 	alert("id: "+id);
// 	document.getElementById("id").disabled = false;

//     if($('input[type=file]').val()==''){
//     	$('button1').attr('disabled',true)
//     } 
//     else{
//       $('button1').attr('disabled',false);
//     }
// })

</script>


</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/student-attendence.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
</html>