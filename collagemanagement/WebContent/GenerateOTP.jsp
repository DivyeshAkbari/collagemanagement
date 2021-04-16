<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from demo.harnishdesign.net/html/oxyy/otp.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 12 Jan 2021 11:46:17 GMT -->
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<link href="http://demo.harnishdesign.net/html/oxyy/images/favicon.png" rel="icon" />
<title>Educhamp</title>
<meta name="description" content="Login and Register Form Html Template">
<meta name="author" content="harnishdesign.net">

<!-- Web Fonts
========================= -->
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900' type='text/css'>

<!-- Stylesheet
========================= -->
<link rel="stylesheet" type="text/css" href="http://demo.harnishdesign.net/html/oxyy/vendor/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="http://demo.harnishdesign.net/html/oxyy/vendor/font-awesome/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="http://demo.harnishdesign.net/html/oxyy/css/stylesheet.css" />
<!-- Colors Css -->
<link id="color-switcher" type="text/css" rel="stylesheet" href="#" />
</head>
<body>

<% String message=(String)request.getAttribute("message"); %>
<% String message1=(String)request.getAttribute("message1"); %>
<% String message2=(String)request.getAttribute("NewMessage"); %>
<% String email=(String)request.getAttribute("emailid"); %>
<% String otp=(String)request.getAttribute("OTPvalue"); %>

<!-- Preloader -->
<div class="preloader">
  <div class="lds-ellipsis">
    <div></div>
    <div></div>
    <div></div>
    <div></div>
  </div>
</div>
<!-- Preloader End -->

<div id="main-wrapper" class="oxyy-login-register">
  <div class="container-fluid px-0">
    <div class="row no-gutters min-vh-100"> 
      <!-- Welcome Text
      ========================= -->
      <div class="col-md-4">
        <div class="hero-wrap d-flex align-items-center h-100">
          <div class="hero-mask opacity-8 bg-primary"></div>
          <div class="hero-bg hero-bg-scroll" style="background-image:url('assets/images/background/bg2.jpg');"></div>
          <div class="hero-content mx-auto w-100 h-100 d-flex flex-column">
            <div class="row no-gutters">
              <div class="col-10 col-lg-9 mx-auto">
                <div class="logo mt-5 mb-5 mb-md-0"> <a class="d-flex" href="http://demo.harnishdesign.net/html/oxyy/index.html" title="Educhamp"><img class="ex1" height="100px" width="100px" src="assets/images/Educhamp_logo.png" alt=""></a>
			
			<img height="100px" width="150px"  src="assets/images/logo-whiteeeee.png" alt=""></a> </div>
              </div>
            </div>
            <div class="row no-gutters my-auto">
              <div class="col-10 col-lg-9 mx-auto">
                <h1 class="text-11 text-white mb-4">Welcome back!</h1>
                <p class="text-4 text-white line-height-4 mb-5"></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Welcome Text End --> 
      
      <!-- OTP Form
      ========================= -->
      <div class="col-md-6 d-flex align-items-center">
        <div class="container my-auto py-5">
          <div class="row">
            <div class="col-11 col-lg-9 col-xl-8 mx-auto">
              <h3 class="font-weight-600 mb-4">Validate OTP</h3>
              <p class="text-muted mb-4">Please enter the OTP (one time password) to verify your account. A Code has been sent to Your Email Address.</p>
              <form id="otp-screen" action="GetOTP" method="post">
                <div class="form-row">
                  <div class="col form-group">
                  	<input type="hidden" name="email" value="<%=email%>">
            		<input type="hidden" name="GeneratedOTP" value="<%=otp%>">
                    <input type="text" name="otp" class="form-control text-center text-6 py-2" maxlength="1" required autocomplete="off">
                  </div>
                  <div class="col form-group">
                    <input type="text" name="otp1"class="form-control text-center text-6 py-2" maxlength="1" required autocomplete="off">
                  </div>
                  <div class="col form-group">
                    <input type="text" name="otp2"class="form-control text-center text-6 py-2" maxlength="1" required autocomplete="off">
                  </div>
                  <div class="col form-group">
                    <input type="text" name="otp3" class="form-control text-center text-6 py-2" maxlength="1" required autocomplete="off">
                  </div>
                </div>
                <button class="btn btn-primary btn-block my-4" type="submit">Verify</button>
              </form>
              
              <form id="otp-screen" action="ResendOTP" method="post"> 
              </form>
              <p class="text-center text-muted mb-0"><a class="btn-link" href="ResendOTP?email=<%=email%>"></a></p>
			  
								<% if(message!=null)
								{%>
						            <span><%=message %></span>
				        		<%}else{ %>
				        			<span><%=message1 %></span>
				        		<%} %>
				        		<% if(message2!=null)
				        		{%>	
				        			<%=message2 %>
				        		<%}%>
            </div>
          </div>
        </div>
      </div>
      <!-- OTP Form End --> 
    </div>
  </div>
</div>

<!-- Styles Switcher -->
<div id="styles-switcher" class="left">
  <h5>Color Switcher</h5>
  <hr>
  <ul class="mb-0">
    <!-- <li class="blue" data-toggle="tooltip" title="Blue" data-path="#"></li>
    <li class="indigo" data-toggle="tooltip" title="Indigo" data-path="http://demo.harnishdesign.net/html/oxyy/css/color-indigo.css"></li> -->
    <li class="Red" data-toggle="tooltip" title="Red" data-path="http://demo.harnishdesign.net/html/oxyy/css/color-purple.css"></li>
    <!-- <li class="pink" data-toggle="tooltip" title="Pink" data-path="http://demo.harnishdesign.net/html/oxyy/css/color-pink.css"></li>
    <li class="red" data-toggle="tooltip" title="Red" data-path="http://demo.harnishdesign.net/html/oxyy/css/color-red.css"></li>
    <li class="orange" data-toggle="tooltip" title="Orange" data-path="http://demo.harnishdesign.net/html/oxyy/css/color-orange.css"></li>
    <li class="yellow" data-toggle="tooltip" title="Yellow" data-path="http://demo.harnishdesign.net/html/oxyy/css/color-yellow.css"></li>
    <li class="teal" data-toggle="tooltip" title="Teal" data-path="http://demo.harnishdesign.net/html/oxyy/css/color-teal.css"></li>
    <li class="green" data-toggle="tooltip" title="Green" data-path="http://demo.harnishdesign.net/html/oxyy/css/color-green.css"></li>
    <li class="cyan" data-toggle="tooltip" title="Cyan" data-path="http://demo.harnishdesign.net/html/oxyy/css/color-cyan.css"></li>
    <li class="brown" data-toggle="tooltip" title="Brown" data-path="http://demo.harnishdesign.net/html/oxyy/css/color-brown.css"></li> -->
  </ul>
  <!-- <button class="btn switcher-toggle"><i class="fas fa-cog"></i></button> -->
</div>
<!-- Styles Switcher End --> 

<!-- Script --> 
<script src="http://demo.harnishdesign.net/html/oxyy/vendor/jquery/jquery.min.js"></script> 
<script src="http://demo.harnishdesign.net/html/oxyy/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<!-- Style Switcher --> 
<script src="http://demo.harnishdesign.net/html/oxyy/js/switcher.min.js"></script> 
<script src="http://demo.harnishdesign.net/html/oxyy/js/theme.js"></script>
</body>

<!-- Mirrored from demo.harnishdesign.net/html/oxyy/otp.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 12 Jan 2021 11:46:18 GMT -->
</html>