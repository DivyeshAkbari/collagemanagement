<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page import="com.collagemanagement.bean.Stream"%>
<%@page import="java.util.List"%>
<%@page import="com.collagemanagement.bean.Semester"%>
<!DOCTYPE html>
<html lang="en">

<head>

<link rel="stylesheet" href="style1.css">
<script src="assets/js/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("input[type=email]").blur(function() {
		var str = $("#mail").val();
		$.get("Registration", {
			email : str
		}).done(function(data)  {

			if (data == "true") {
				alert("This email id is already exist");	
			}
		});	
	});
});
	
</script>


<!-- META ============================================= -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="" />
<meta name="author" content="" />
<meta name="robots" content="" />

<!-- DESCRIPTION -->
<meta name="description" content="EduChamp : Education HTML Template" />

<!-- OG -->
<meta property="og:title" content="EduChamp : Education HTML Template" />
<meta property="og:description"
	content="EduChamp : Education HTML Template" />
<meta property="og:image" content="" />
<meta name="format-detection" content="telephone=no">

<!-- FAVICONS ICON ============================================= -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.png" />

<!-- PAGE TITLE HERE ============================================= -->
<title>EduChamp : Education HTML Template</title>

<!-- MOBILE SPECIFIC ============================================= -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.min.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->

<!-- All PLUGINS CSS ============================================= -->
<link rel="stylesheet" type="text/css" href="assets/css/assets.css">

<!-- TYPOGRAPHY ============================================= -->
<link rel="stylesheet" type="text/css" href="assets/css/typography.css">

<!-- SHORTCODES ============================================= -->
<link rel="stylesheet" type="text/css"
	href="assets/css/shortcodes/shortcodes.css">

<!-- STYLESHEETS ============================================= -->
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<link class="skin" rel="stylesheet" type="text/css"
	href="assets/css/color/color-1.css">

<style>
#imageUpload {
	display: none;
}

#profileImage {
	cursor: pointer;
}
</style>

</head>

<jsp:include page ="/FetchHobby"/>
 
<% List<Stream> Streamlist= (List)request.getAttribute("Streamlist"); %>

<jsp:include page ="/Fetchsemdetails"/>
 
<% List<Semester> Semlist= (List)request.getAttribute("SemList"); %>
<body id="bg">
	<div class="page-wraper">
		<div id="loading-icon-bx"></div>
		<div class="account-form">
			<div class="account-head"
				style="background-image: url(assets/images/background/bg2.jpg);">
				<a href="index.jsp"><img src="assets/images/logo-white-2.png"
					alt=""></a>
			</div>
			<div class="account-form-inner">
				<div class="account-container">
					<div class="heading-bx left">
						<h2 class="title-head">
							Sign Up <span>Now</span>
						</h2>
						<h2 class="title-head">
							<span>As a Student</span>
						</h2>
						<p>
							Login Your Account <a href="login.jsp">Click here</a>
						</p>
					</div>
					<form class="contact-bx" action="Registrationstudent" method="post" enctype="multipart/form-data" >
						<div class="row placeani">
							<div class="col-md-6">
								<div class="form-group">
									<div class="input-group">
										<input type="hidden" name="role" value="STUDENT"></input>
										 <label>FirstName</label> <input name="firstname" type="text" autocomplete="off"
											required="" class="form-control">
									</div>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<div class="input-group">
										<label>Middle Name</label> <input name="middlename"
											type="text" autocomplete="off" required=""
											class="form-control">
									</div>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<div class="input-group">
										<label>Last Name</label> <input name="lastname" type="text"
											autocomplete="off" required="" class="form-control">
									</div>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<select class="form-control" name="stream">
										<option class="hidden" value="" disabled selected hidden>Choose
											your Stream</option>
										<%
											for(int i=0;i<Streamlist.size();i++)
											{
										%>
										<%
											Stream s=Streamlist.get(i);
										%>
											<option value="<%=s.getStreamid()%>"> <%=s.getStreamname()%> </option>
										<%
											}
										%>
									</select>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<div class="form-group">
									<select class="form-control" name="semester">
										<option class="hidden" value="" disabled selected hidden>Choose
											your Semester</option>
											
										<%
											for(int i=0;i<Semlist.size();i++)
											{
										%>
										<%
											Semester s=Semlist.get(i);
										%>
											<option value="<%=s.getSemid()%>"> <%=s.getSemid()%> </option>
										<%
											}
										%>
										
									</select>
								</div>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<select class="form-control" name="division">
										<option class="hidden" selected="" disabled="">Choose
											your Division</option>
										<option>A</option>
										<option>B</option>
										<option>C</option>
										<option>D</option>
									</select>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<div class="maxl">
										<label class="radio inline"> <input type="radio"
											name="gender" value="male" checked=""> <span> Male </span>
										</label> <label class="radio inline"> <input type="radio"
											name="gender" value="female" checked=""> <span>Female </span>
										</label>
									</div>
									<!-- </div> -->
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<div class="input-group">
										<label>Your Email Address</label> <input name="email"
											id="mail" type="email" autocomplete="off" required=""
											class="form-control">
									</div>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<div class="input-group">
										<label>Your Password</label> <input autocomplete="off"
											class="form-control" id="password" type="password"
											name="password" onkeyup='check();'
											pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
											required> <i toggle="#password-field"
											class="fa fa-fw fa-eye field_icon toggle-password"></i>
									</div>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<div class="input-group">
										<label>Confirm Password</label> <input autocomplete="off"
											name="confirm_password" id="confirm_password" type="password"
											class="form-control" required="">
										<!-- <span toggle="#password-field" class="fa fa-fw fa-eye field_icon toggle-password"></span> -->
										<span id='message'></span>
									</div>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<div class="form-group">
										<div class="input-group">
											<label>Your Number</label> <input autocomplete="off"
												minlength="10" maxlength="10" name="number" type="text"
												required="" class="form-control">
										</div>
									</div>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<div class="input-group">
										<label>Your Address</label>
										<textarea autocomplete="off" name="address" type="Address"
											required="" class="form-control" cols="30" rows="4"
											maxlength="100" placeholder="Enter Your Address *"> </textarea>
									</div>
								</div>
								<!-- </div> -->
								<!-- <div class="col-lg-12"> -->
								<div class="form-group">
									<div class="input-group">
										<image id="profileImage" src="assets/images/profile.png" />
										<input id="imageUpload" type="file" name="profile_photo"
											placeholder="Photo" capture> <br> <span>
											Upload your photo</span>
									</div>
								</div>
							</div>
							<!-- </div> -->
							<div class="col-lg-12 m-b30">

								<button name="submit" type="submit" value="Submit"
									class="btn button-md">Sign Up</button>

							</div>
							<!-- <div class="col-lg-12">
							<h6>Sign Up with Social media</h6>
							<div class="d-flex">
								<a class="btn flex-fill m-r5 facebook" href="#"><i class="fa fa-facebook"></i>Facebook</a>
								<a class="btn flex-fill m-l5 google-plus" href="#"><i class="fa fa-google-plus"></i>Google Plus</a>
							</div>
						</div> -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- External JavaScripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/vendors/bootstrap/js/popper.min.js"></script>
	<script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
	<script
		src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
	<script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
	<script src="assets/vendors/counter/waypoints-min.js"></script>
	<script src="assets/vendors/counter/counterup.min.js"></script>
	<script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
	<script src="assets/vendors/masonry/masonry.js"></script>
	<script src="assets/vendors/masonry/filter.js"></script>
	<script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
	<script src="assets/js/functions.js"></script>
	<script src="assets/js/contact.js"></script>
	
	
	<script>
$('#password, #confirm_password').on('keyup', function () {
  if ($('#password').val() == $('#confirm_password').val()) {
    $('#message').html('Matching').css('color', 'green');
  } else 
    $('#message').html('Not Matching').css('color', 'red');
});
</script>
	<script>
$(document).on('click', '.toggle-password', function() {

$(this).toggleClass("fa-eye fa-eye-slash");

var input = $("#password");
input.attr('type') === 'password' ? input.attr('type','text') : input.attr('type','password')
});

</script>
	<script>
	$(document).ready(function(){
$("#profileImage").click(function(e) {
    $("#imageUpload").click();
});
});
</script>
</body>

</html>
