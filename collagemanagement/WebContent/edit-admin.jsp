<%@page import="java.util.Optional"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.collagemanagement.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/add-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:26 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Update Teacher</title>
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
    <!-- Date Picker CSS -->
    <link rel="stylesheet" href="css/datepicker.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Modernize js -->
    <script src="js/modernizr-3.6.0.min.js"></script>
    
  
	
</head>


<% User u1 = (User)request.getSession(false).getAttribute("user");
%>
<% String message = (String)request.getSession(false).getAttribute("ans");

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
                        <li>Update Admin</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <!-- Add New Teacher Area Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                    <%if(message != null){ %>
                    	<div class="ui-alart-box">
                			<div class="alert alert-success" role="alert">
                        	<%=message%>
                        	<%if(message.equals("record updated successfully")){
                        		session.setAttribute("user", null); 
                        		
                        		}%>
                     		</div>
                		</div>
                		<%}session.setAttribute("ans", null);
                		%>
                        <div class="heading-layout1">
                            <div class="item-title">
                                <h3>Update</h3>
                            </div>
                           <div class="dropdown">
                                <a class="dropdown-toggle" href="#" role="button" 
                                data-toggle="dropdown" aria-expanded="false">...</a>
        
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#"><i class="fas fa-times text-orange-red"></i>Close</a>
                                    <a class="dropdown-item" href="#"><i class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                                    <a class="dropdown-item" href="#"><i class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                                </div>
                            </div>
                        </div>
<!--                         division for next previous button  -->
					
                        <div class="content-holder">
                        <form action="UpdateAdmin" enctype="multipart/form-data" method="post" id="form1" class="new-added-form">
                        
                            <div class="row">
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                	<input type="hidden" name="role" value="FACULTY"></input>
                                    <label>First Name *</label>
                                    <input value="<%=u1.getFirstname() %>" autocomplete="off" name="firstname" type="text" placeholder="" class="form-control">
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Middle Name *</label>
                                    <input value="<%=u1.getMiddlename() %>" autocomplete="off" name="middlename"  type="text" placeholder="" class="form-control">
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Last Name *</label>
                                    <input value="<%=u1.getLastname() %>" autocomplete="off" name="lastname" type="text" placeholder="" class="form-control">
                                </div>
<!--                                 </div> -->
<!-- 								<div class="col-xl-3 col-lg-6 col-12 form-group"> -->
<!--                                     <label>Email</label> -->
<%--                                     <input readonly="readonly" value="<%=u1.getEmail() %>" autocomplete="off" name="email" type="text" placeholder="" class="form-control"> --%>
<!--                                   </div> -->
                                 <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Password</label>
                                    <input value="<%=u1.getPassword() %>" id="password" autocomplete="off" class="form-control" type="password" name="password">
                                    <i toggle="password-field" class="fa fa-fw fa-eye field_icon toggle-password"></i>
                                  </div>
<!--                                 <div class="col-xl-3 col-lg-6 col-12 form-group"> -->
<!--                                     <label>Qualification</label> -->
<%--                                     <input value="<%=u1.getQualification() %>" autocomplete="off" name="qualification" type="text" placeholder="" class="form-control"> --%>
<!--                                 </div> -->
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Mobile Number</label>
                                    <input value="<%=u1.getContactno() %>" autocomplete="off" name="number" type="text" placeholder="" class="form-control">
                                </div>
                                <div class="col-lg-6 col-12 form-group">
                                    <label>Address</label>
                                    <textarea name="address" class="textarea form-control"  id="form-message" cols="10" rows="9"><%=u1.getAddress() %></textarea>
                                </div>
                                <div class="col-lg-6 col-12 form-group mg-t-30">
                                    <label class="text-dark-medium">Update Photo (150px X 150px)</label>
                                    <img style="height: 150px; width: 150px;" src="data:image/png;base64,<%= u1.getUserProfilepicString()  %>" alt="student">
                                    <input   name="profile_photo" type="file" class="form-control-file">
                                </div>
								 
<!-- 								<button type="button" class="back">Back</button> -->

								<input type="hidden" name="userID" value="<%=u1.getId() %>">
								
							    <div class="col-12 form-group mg-t-8">
     								<button id="submit" type="submit" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark" >Save</button>
                         			<button type="reset" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Reset</button>
                                </div>
                              
                            </div>
                        </form>
                       
                        </div>

					
                    </div>
                    
                </div>
                <!-- Add New Teacher Area End Here -->
                <footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a href="#">PsdBosS</a></div>
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
    <!-- Date Picker Js -->
    <script src="js/datepicker.min.js"></script>
    <!-- Smoothscroll Js -->
    <script src="js/jquery.smoothscroll.min.html"></script>
    <!-- Scroll Up Js -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- Custom Js -->
    <script src="js/main.js"></script>
    
    <script>
	$(document).on('click', '.toggle-password', function() {
	
	$(this).toggleClass("fa-eye fa-eye-slash");
	
	var input = $("#password");
	input.attr('type') === 'password' ? input.attr('type','text') : input.attr('type','password')
	});
	
	</script>


</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/add-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:26 GMT -->
</html>