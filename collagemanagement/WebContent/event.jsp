<%@page import="com.collagemanagement.bean.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

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
	<meta property="og:description" content="EduChamp : Education HTML Template" />
	<meta property="og:image" content="" />
	<meta name="format-detection" content="telephone=no">
	
	<!-- FAVICONS ICON ============================================= -->
	<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
	
	<!-- PAGE TITLE HERE ============================================= -->
	<title>EduChamp : Education HTML Template </title>
	
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
	<link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">
	
	<!-- STYLESHEETS ============================================= -->
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
	<link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">
	
</head>
<%
List<Event> eventlist=(List)request.getAttribute("eventlist");
%>
<body id="bg">
<div class="page-wraper">
<div id="loading-icon-bx"></div>
	<!-- Header Top ==== -->
    <%@include file="header.jsp" %>
    <!-- header END ==== -->
    <!-- Content -->
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner2.jpg);">
            <div class="container">
                <div class="page-banner-entry">
                    <h1 class="text-white">Events</h1>
				 </div>
            </div> 
        </div>
		<!-- Breadcrumb row -->
		<div class="breadcrumb-row">
			<div class="container">
				<ul class="list-inline">
					<li><a href="#">Home</a></li>
					<li>Events</li>
				</ul>
			</div>
		</div>
		<!-- Breadcrumb row END -->
        <!-- contact area -->
        <div class="content-block">
			<!-- Portfolio  -->
			<div class="section-area section-sp1 gallery-bx">
				<div class="container">
					<div class="feature-filters clearfix center m-b40">
						<ul >
							<li data-filter="" class="btn active">
								<input type="radio">
								<a href="FetchEventDetails"><span>All</span></a> 
							</li>
							<!-- <li data-filter="happening" class="btn">
								<input type="radio">
								<a href="#"><span>Happening</span></a> 
							</li> -->
							<li class="btn active"  >
								<a  href="Fetchupcomingevent">Upcoming</a> 
							</li>
							<li data-filter="expired" class="btn active" >
								<input type="radio">
								<a href="Fetchexpiredevent"><span>Expired</span></a> 
							</li>
						</ul>
					</div>
					<%-- <%int l=0; %> --%>
					<% if(eventlist!=null)
          { %>
		<% for(int i=0;i<eventlist.size();i++)
          { %>
          		
          		<% Event e1=eventlist.get(i); %>
					<div class="clearfix">
					
						<ul id="masonry" class="ttr-gallery-listing magnific-image row">
						
							<%-- <% if(i%2==0)
					{%> --%>
							<li class="action-card col-lg-6 col-md-6 col-sm-12 happening">
								<div class="event-bx m-b30">
									<div class="action-box">
										<img src="assets/images/event/pic1.jpg" alt="">
									</div>
									<div class="info-bx d-flex">
										<div>
											<div class="event-time">
												<div class="event-date"><%=e1.getD1() %></div>
												<div class="event-month"><%=e1.getMonth() %></div>
											</div>
										</div>
										<div class="event-info">
											<h4 class="event-title"><a href="#"><%=e1.getEventname() %> <%=e1.getYear() %> </a></h4>
											<!-- <ul class="media-post">
												<li><a href="#"><i class="fa fa-clock-o"></i> 7:00am 8:00am</a></li>
												<li><a href="#"><i class="fa fa-map-marker"></i> Berlin, Germany</a></li>
											</ul> -->
											<p><%=e1.getEventDescription() %></p>
										</div>
									</div>
								</div>
							</li>
						<%-- 	<%l=1; %>
							
					<%} %> --%>
					
					<%-- <% if(i%2!=0)
					{%> --%>
							 <%-- <li class="action-card col-lg-6 col-md-6 col-sm-12 upcoming">
								<div class="event-bx m-b30">
									<div class="action-box">
										<img src="assets/images/event/pic2.jpg" alt="">
									</div>
									<div class="info-bx d-flex">
										<div>
											<div class="event-time">
												<div class="event-date"><%=e1.getD1() %></div>
												<div class="event-month"><%=e1.getMonth() %></div>
											</div>
										</div>
										<div class="event-info">
											<h4 class="event-title"><a href="#"><%=e1.getEventname() %> <%=e1.getYear() %></a></h4>
											<!-- <ul class="media-post">
												<li><a href="#"><i class="fa fa-clock-o"></i> 7:00am 8:00am</a></li>
												<li><a href="#"><i class="fa fa-map-marker"></i> Berlin, Germany</a></li>
											</ul> -->
											<p><%=e1.getEventDescription() %></p>
										</div>
									</div>
								</div>
							</li> --%> 
						<%-- 	<%l=0; %>
							
						<%} %> --%>
							<!-- <li class="action-card col-lg-6 col-md-6 col-sm-12 happening">
								<div class="event-bx m-b30">
									<div class="action-box">
										<img src="assets/images/event/pic4.jpg" alt="">
									</div>
									<div class="info-bx d-flex">
										<div>
											<div class="event-time">
												<div class="event-date">29</div>
												<div class="event-month">October</div>
											</div>
										</div>
										<div class="event-info">
											<h4 class="event-title"><a href="#">Education Autumn Tour 2019</a></h4>
											<ul class="media-post">
												<li><a href="#"><i class="fa fa-clock-o"></i> 7:00am 8:00am</a></li>
												<li><a href="#"><i class="fa fa-map-marker"></i> Berlin, Germany</a></li>
											</ul>
											<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the..</p>
										</div>
									</div>
								</div>
							</li>
							<li class="action-card col-lg-6 col-md-6 col-sm-12 expired">
								<div class="event-bx m-b30">
									<div class="action-box">
										<img src="assets/images/event/pic2.jpg" alt="">
									</div>
									<div class="info-bx d-flex">
										<div>
											<div class="event-time">
												<div class="event-date">29</div>
												<div class="event-month">October</div>
											</div>
										</div>
										<div class="event-info">
											<h4 class="event-title"><a href="#">Education Autumn Tour 2019</a></h4>
											<ul class="media-post">
												<li><a href="#"><i class="fa fa-clock-o"></i> 7:00am 8:00am</a></li>
												<li><a href="#"><i class="fa fa-map-marker"></i> Berlin, Germany</a></li>
											</ul>
											<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the..</p>
										</div>
									</div>
								</div>
							</li>
							<li class="action-card col-lg-6 col-md-6 col-sm-12 happening">
								<div class="event-bx m-b30">
									<div class="action-box">
										<img src="assets/images/event/pic1.jpg" alt="">
									</div>
									<div class="info-bx d-flex">
										<div>
											<div class="event-time">
												<div class="event-date">29</div>
												<div class="event-month">October</div>
											</div>
										</div>
										<div class="event-info">
											<h4 class="event-title"><a href="#">Education Autumn Tour 2019</a></h4>
											<ul class="media-post">
												<li><a href="#"><i class="fa fa-clock-o"></i> 7:00am 8:00am</a></li>
												<li><a href="#"><i class="fa fa-map-marker"></i> Berlin, Germany</a></li>
											</ul>
											<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the..</p>
										</div>
									</div>
								</div>
							</li> -->
						</ul>
						
					</div>
			<% } %>
		<% } %>
				</div>
			</div>
        </div>
		<!-- contact area END -->
    </div>
    <!-- Content END-->
	<!-- Footer ==== -->
    <%@include file="footer.jsp" %>
    <!-- Footer END ==== -->
    <button class="back-to-top fa fa-chevron-up" ></button>
</div>
<!-- External JavaScripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/vendors/bootstrap/js/popper.min.js"></script>
<script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
<script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
<script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
<script src="assets/vendors/counter/waypoints-min.js"></script>
<script src="assets/vendors/counter/counterup.min.js"></script>
<script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
<script src="assets/vendors/masonry/masonry.js"></script>
<script src="assets/vendors/masonry/filter.js"></script>
<script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
<script src="assets/js/functions.js"></script>
<script src="assets/js/contact.js"></script>

</body>

</html>
