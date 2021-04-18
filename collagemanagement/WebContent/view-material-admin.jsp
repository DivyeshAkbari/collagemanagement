
<%@page import="com.collagemanagement.bean.Stream"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">

<!-- hello -->
<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>ADMIN | Manage Materials</title>
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
    <!-- Data Table CSS -->
    <link rel="stylesheet" href="css/jquery.dataTables.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Modernize js -->
    <script src="js/modernizr-3.6.0.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script>
$(document).ready(function()
{
	var stream="";
	var sem="";
	var typepaper="";
	var year="";
	$("#stream").change(function(){
		
		stream=$("#stream").val();
		//alert(stream);
		$.ajax({
			
					method:"POST",
					url:"Fetchsemesterid",
					data:
					{
						id:stream	
					}
			}).done(function(data)
			{
				$("#semester1").children().remove();
				var object=jQuery.parseJSON(data);
				
				$('#semester1').append($("<option></option>").attr("value",'-1').text('Please Select Semester'));
				$.each(object,function(key,value){
					$("#semester1").append('<option value='+value.semid+'>'+value.semvalue+'</option>');
				});
			});
	});


	$("#semester1").change(function()
	{
		 sem=$("#semester1").val();
		//alert(sem);
		$.ajax({
			
					method:"POST",
					url:"fetchsubjects",
					data:
					{
						name1:sem
					}
			}).done(function(data)
			{
				$("#subject").children().remove();
				var object=jQuery.parseJSON(data);
				
				$.each(object,function(key,value){
					$("#subject").append('<option value='+value.subjectId+'>'+value.subjectName+'</option>');
				});
				
			});
	});
	
	
});
</script>
</head>
<jsp:include page ="/FetchHobby"/>
<% List<Stream> Streamlist= (List)request.getAttribute("Streamlist"); %>
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
                    <h3>Manage Notes & Chapters</h3>
                    <ul>
                        <li>
                            <a href="Admin.jsp">Home</a>
                        </li>
                        <li>Manage Materials</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <!-- All Subjects Area Start Here -->
                <div class="row">
                    <div class="col-4-xxxl col-12">
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Select subject</h3>
                                    </div>
                                    <div class="dropdown">
                                        <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                                            aria-expanded="false">...</a>

                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-times text-orange-red"></i>Close</a>
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                                        </div>
                                    </div>
                                </div>
                                <form class="new-added-form" action="GetNotes" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-12-xxxl col-lg-6 col-12 form-group">
                                            <label>Select Stream *</label>
                                            <select class="select2" id="stream" name="stream">
                                            <option>please select stream*</option>
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
                                        <div class="col-12-xxxl col-lg-6 col-12 form-group">
                                            <label>Select Semester *</label>
                                            <select class="select2" name="semester" id="semester1">
                                                
                                            </select>
                                        </div>
                                         
                                        <div class="col-12-xxxl col-lg-6 col-12 form-group">
                                            <label>Select Subject *</label>
                                            <select class="select2" id="subject" name="subject">
                                               
                                                
                                            </select>
                                        </div>
                                       
                                        
                                      
                                        <!-- </div> -->
                                        <div class="col-12 form-group mg-t-8">
                                            <button type="submit" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Save</button>
                                            <!--  <button type="reset" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Reset</button> -->
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- All Subjects Area End Here -->
                <footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a
                            href="#">PsdBosS</a></div>
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
    <!-- Data Table Js -->
    <script src="js/jquery.dataTables.min.js"></script>
    <!-- Custom Js -->
    <script src="js/main.js"></script>
    <!-- bootstrap datepicker js -->
    <script src="js/bootstrap-datepicker.js"></script>
    <!-- bootstrap datepicker css -->
    <link href="css/bootstrap-datepicker.css" rel="stylesheet">

</body>
<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
</html>