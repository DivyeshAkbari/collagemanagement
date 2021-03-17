<%@page import="com.collagemanagement.bean.QuoraSession"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> 
<html lang="en">
	
<!-- doccure/components.html  30 Nov 2019 04:12:19 GMT -->
<head>
		<meta charset="utf-8">
		<title>Educhamp</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
		<!-- Favicons -->
		<link href="assets/images/favicon.png"" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="assets/css/fontawesome.min.css">
		<link rel="stylesheet" href="assets/css/all.min.css">
		
		<!-- Main CSS -->
		<link rel="stylesheet" href="assets/css/style.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
	
	</head>
	
<jsp:include page ="/FetchTag"/>

<%List<QuoraSession> taglist = (List)request.getAttribute("taglist"); %>

	<body>

		<!-- Main Wrapper -->
		<div class="main-wrapper">
		
			<!-- Header -->
			<!-- /Header -->
			<!-- Page Content -->
			<div class="content">
				<div class="container">
					<div class="comp-sec-wrapper">
						<!-- Buttons -->
						
						<!-- Cards -->
						
						<section class="comp-section comp-cards">
							<div class="comp-header">
                                <h3 class="comp-title">Tags</h3>
                                <div class="line"></div>
                            </div>	
                            <%for(int i=0;i<taglist.size();i++) { %>
							<% QuoraSession q1=taglist.get(i); %>												
							<div class="row">					
								<div class="col-12 col-md-6 col-lg-4 d-flex">
									<div class="card flex-fill">
										<div class="card-header">
											<h5 class="card-title mb-0"></h5>
										</div>
										<div class="card-body">
											<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
											<a class="btn btn-primary" href="#"><%=q1.getTag() %></a>
										</div>
									</div>
								</div>								
							</div>						
							</div>
						</section>
					<% } %>
						<!-- /Cards -->			
					</div>	
				</div>
			</div>		
			<!-- /Page Content -->
   
			<!-- Footer -->
			<!-- /Footer -->
		   
		</div>
		<!-- /Main Wrapper -->
	  
		<!-- jQuery -->
		<script src="assets/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JS -->
		<script src="assets/js/popper.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/script.js"></script>
		
	</body>

<!-- doccure/components.html  30 Nov 2019 04:12:19 GMT -->
</html>