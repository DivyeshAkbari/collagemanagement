<%@page import="com.collagemanagement.bean.Assignment"%>
<%@page import="com.collagemanagement.bean.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
String ss = (String) request.getSession(false).getAttribute("ss");
List<User> facultylist = (List) request.getSession(false).getAttribute("faculty");
String name = (String) request.getSession(false).getAttribute("name");
List<Assignment> asslist = (List) request.getSession(false).getAttribute("assignmentlist");

//System.out.println("sub ass list is: "+asslist);
String ans = (String)request.getSession(false).getAttribute("ans");
//System.out.println("ans: "+ans);
//int result = Integer.parseInt(ans);
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
								
                                <div class="modal fade" id="success-modal" tabindex="-1" role="dialog"
                                    aria-hidden="true">
                                    <div class="modal-dialog success-modal-content" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
<!--                                                 <button type="button" class="close" data-dismiss="modal" -->
<!--                                                     aria-label="Close"> -->
<!--                                                     <span aria-hidden="true">&times;</span> -->
<!--                                                 </button> -->
                                            </div>
                                            <div class="modal-body">
                                               <div class="success-message">
                                                    <div class="item-icon">
                                                        <i class="fas fa-check"></i>
                                                    </div>
                                                    <h3 class="item-title">Your assignment has been deleted..!</h3>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button id="modalid" type="button" class="footer-btn bg-linkedin"
                                                    data-dismiss="modal" onclick="window.location='student-subject.jsp'" >Okay</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Error Modal -->
                               
                                <div class="modal fade" id="error-modal" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog success-modal-content" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
<!--                                                 <button type="button" class="close" data-dismiss="modal" -->
<!--                                                     aria-label="Close"> -->
<!--                                                     <span aria-hidden="true">&times;</span> -->
<!--                                                 </button> -->
                                            </div>
                                            <div class="modal-body">
                                                <div class="success-message">
                                                    <div class="item-icon">
                                                        <i class="fas fa-exclamation-triangle"></i>
                                                    </div>
                                                    <h3 class="item-title">Assignment can't be deleted !</h3>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button id="modalid" type="button" class="footer-btn bg-linkedin"
                                                    data-dismiss="modal" onclick="window.location='student-subject.jsp'">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                </div>

							<div class="table-responsive">

								<table
									class="table bs-table table-striped table-bordered text-nowrap">
									<%
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
											
											
											<th>Unsubmit</th>
											

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
<!-- 										<form enctype="multipart/form-data"> -->
											<tr>
												<td><%=cnt%></td>
												<td class="text-left"><input type="hidden" name="assId"
													value="<%=a.getAssId()%>"><%=a.getTitle()%></td>

												<td><%=a.getDiscription()%></td>
												<td><%=f.getFirstname() + " " + f.getMiddlename()%></td>
												<td><%=a.getUploadDate()%></td>
												<td><%=a.getDate()%></td>
												
<%-- 												<td><button> <a id="buttonid" href="RemoveSubmittedAss?id=<%=a.getAssId()%>"> --%>
<!-- 												</a>Unsubmit</button>  -->
<!-- 												 </td> -->
												<td><button class="button1" value="<%=a.getAssId()%>">
												<i class="fas fa-times text-orange-red"></i>Unsubmit</button></td>
												

											</tr>
											
<!-- 										</form> -->

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
													no submitted assignment for this subject !!!!
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
					© Copyrights <a href="#">akkhor</a> 2019. All rights reserved.
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
	<script>
	$(document).ready(function(){
		//$("#button_1").click(function(e) {
		$(".button1").click(function(){
			var value = $(".button1").val();
			$.ajax({
				method:"post",
				url: "RemoveSubmittedAss",
				data: { name : value}
			})
			.done(function(msg){
				//alert("ans is is: "+msg);
				if(msg == "true"){
					$('#success-modal').modal({backdrop: 'static', keyboard: false});
					$('#success-modal').modal('show');
				}
					
				else{
					$('#error-modal').modal({backdrop: 'static', keyboard: false});
					$('#error-modal').modal('show');
				}
				
			});
			});
		});
	</script>
	<script>
// 	function myFunction(id) {
// 		 alert("Hello World");
// 		 $("a").attr("href","RemoveSubmittedAss?id="+id);
<%-- 		 var ans = <%= ans %>; --%>
// 		 alert(ans);
// 		}
	
// 	$(document).ready(function() {
// 	    $("button a").click(function() {
// 	        alert("hello");
// 	    });
// 	});
// 	$('#buttonid').click(function() {
// 		//$("form").attr("action","500");
// 		//location.reload();
// 		//window.location.reload(true);
// 		//window.location.href=window.location.href;
// 		// and location.href=location.href;
// 	});
	
	</script>


</body>
</html>