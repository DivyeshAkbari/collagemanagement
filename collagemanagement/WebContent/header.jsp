<%@page import="com.collagemanagement.bean.User"%>
<% HttpSession httpSession = request.getSession(false);%>
<% User u1 = (User) httpSession.getAttribute("uname");%>
<header class="header rs-nav">
		<div class="top-bar">
			<div class="container">
				<div class="row d-flex justify-content-between">
					<div class="topbar-left">
						<ul>
							<li><a href="faq-1.jsp"><i class="fa fa-question-circle"></i>Ask a Question</a></li>
							<li><a href="javascript:;"><i class="fa fa-envelope-o"></i>Support@website.com</a></li>
						</ul>
					</div>
					<div class="topbar-right">
						<ul>
<!-- 							<li> -->
<!-- 								<select class="header-lang-bx"> -->
<!-- 									<option data-icon="flag flag-uk">English UK</option> -->
<!-- 									<option data-icon="flag flag-us">English US</option> -->
<!-- 								</select> -->
<!-- 							</li> -->
								<%if(null!=httpSession && null==u1){%>
                               <li><a href="login.jsp">Login </a> </li>                                    
                             <%}else{ %>
                                <li><a href="Logout">Logout </a></li>
                                <li><a href="#">Welcome <%=u1.getMiddlename() %></a></li>
                                
                                <%if(u1.getRole().equals("STUDENT"))
                                {%>
                                
                                <li><a href="EditStudentDetails">Edit</a></li>
                                <%}else if(u1.getRole().equals("ADMIN")){%>
                                <li><a href="EditAdminDetails">Edit</a></li>
                                	<%}else{ %>
                                <li><a href="EditFacultyDetail?id=<%= u1.getId() %>">Edit</a></li>
                                <%} %>
                             <%} %>
                               <%if(null!=u1 && "STUDENT".equalsIgnoreCase(u1.getRole()))
                             {%>
                             		<li><a href="Student_dashboard.jsp">Dashboard</a></li>
                             <%} %>
                             <%if(null!=u1 && "FACULTY".equalsIgnoreCase(u1.getRole()))
                             {%>
                             		<li><a href="Teacher_dashboard.jsp">Dashboard</a></li>
                             <%} %>
                             
                             <%if(null!=u1 && "ADMIN".equalsIgnoreCase(u1.getRole()))
                             {%>
                                	<li><a href="StudentData">StudentDetails</a></li>
                                	<li><a href="FacultyData">FacultyDetails</a></li>
                                	<li><a href="Admin.jsp">Dashboard</a></li>
                                	<li><a href="register1.jsp"> As a Faculty</a></li>
                              <%}else{ %>  
							<li><a href="add-student.jsp">As a Student</a></li>
			 				 
			 				 <%} %>
<!-- 							<li><a href="login.jsp">Login</a></li> -->
<!-- 							<li><a href="register.jsp">As a Student</a></li> -->
<!-- 							 <li><a href="register1.jsp">As a Faculty</a></li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="sticky-header navbar-expand-lg">
            <div class="menu-bar clearfix">
                <div class="container clearfix">
					<!-- Header Logo ==== -->
					<div class="menu-logo">
						<a href="index.jsp"><img src="assets/images/Educhamp_logo.png" alt=""></a>
						<a href="index.jsp"><img    src="assets/images/Black.png" alt=""></a>
					</div>
					<!-- Mobile Nav Button ==== -->
                    <button class="navbar-toggler collapsed menuicon justify-content-end" type="button" data-toggle="collapse" data-target="#menuDropdown" aria-controls="menuDropdown" aria-expanded="false" aria-label="Toggle navigation">
						<span></span>
						<span></span>
						<span></span>
					</button>
					<!-- Author Nav ==== -->
                    
					<!-- Search Box ==== -->
                    <div class="nav-search-bar">
                        <form action="#">
                            <input name="search" value="" type="text" class="form-control" placeholder="Type to search">
                            <span><i class="ti-search"></i></span>
                        </form>
						<span id="search-remove"><i class="ti-close"></i></span>
                    </div>
					<!-- Navigation Menu ==== -->
                    <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
						<div class="menu-logo">
							<a href="index.jsp"><img src="assets/images/logo.png" alt=""></a>
						</div>
                        <ul class="nav navbar-nav">	
							<li class="active"><a href="index.jsp">Home </a>
								<!-- <ul class="sub-menu">
									<li><a href="index.jsp">Home 1</a></li>
								</ul> -->
							</li>
							<li><a href="trainers.jsp">Our Faculty </a> </li>
							<li><a href="javascript:;">Pages <i class="fa fa-chevron-down"></i></a>
								<ul class="sub-menu">
									<li><a href="about-1.jsp">About</a></li>
									<!-- <li><a href="javascript:;">About<i class="fa fa-angle-right"></i></a>
										<ul class="sub-menu">
											<li><a href="about-1.jsp">About 1</a></li>
											 <li><a href="about-2.jsp">About 2</a></li> -->
										<!-- </ul> -->
									<!-- </li> --> 
									<li><a href="event.jsp">Event</a></li>
									<li><a href="faq-1.jsp">FAQ's</a></li>
									<li><a href="contact-2.jsp">Contact Us</a></li>
									
									<li><a href="portfolio.jsp">Gallery</a></li>
									
<!-- 									<li><a href="membership.jsp">Membership</a></li> -->
<!-- 									<li><a href="error-404.jsp">404 Page</a></li> -->
									<li><a href="Unanswered.jsp">Unanswered</a></li>
<!-- 									<li><a href="Result.jsp">Result</a></li> -->
									<li><a target="_blank" href="QuestionDetails.jsp" >Question Display</a></li>					
										<% if(null!=u1 && "STUDENT".equalsIgnoreCase(u1.getRole()))
										{%>
									
											<li><a href="AddQuestion.jsp">Add Question</a></li>
										<%} %>
				
									
										<% if(null!=u1 && "ADMIN".equalsIgnoreCase(u1.getRole()))
					{%>
						 <li><a href="ResultFileUpload.jsp">Upload Result File </a></li>
					<%} %>
								</ul>
							</li>
							
<!-- 							<li><a href="javascript:;">Blog <i class="fa fa-chevron-down"></i></a> -->
<!-- 								<ul class="sub-menu"> -->
<!-- 									<li><a href="blog-classic-grid.jsp">Blog Classic</a></li> -->
									
<!-- 									<li><a href="blog-details.jsp">Blog Details</a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 							<li class="nav-dashboard"><a href="javascript:;">Dashboard <i class="fa fa-chevron-down"></i></a> -->
<!-- 								<ul class="sub-menu"> -->
<!-- 									<li><a href="akkhor/index.jsp">Admin</a></li> -->
<!-- 									<li><a href="akkhor/index3.jsp">student</a></li> -->
<!-- 									<li><a href="akkhor/index4.jsp">Parent</a></li> -->
<!-- 									<li><a href="akkhor/index5.jsp">Teacher</a></li> -->
									
<!-- 								</ul> -->
<!-- 							</li> -->
						</ul>
						
                    </div>
					<!-- Navigation Menu END ==== -->
                </div>
            </div>
        </div>
    </header>