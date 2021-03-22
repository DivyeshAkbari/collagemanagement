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
    <title>ADMIN | Previous year paper</title>
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
	$("#stream").change(function(){
		
		var stream=$("#stream").val();
	//	alert(stream);
		$.ajax({
			
					method:"POST",
					url:"Fetchsemesterid",
					data:
					{
						id:stream,	
					}
			}).done(function(data)
			{
				$("#semester1").children().remove();
				var object=jQuery.parseJSON(data);
				$('#semester1').append($("<option></option>").attr("value",'-1').text('Please Select type'));
				$.each(object,function(key,value){
					$("#semester1").append('<option value='+value.semid+'>'+value.semvalue+'</option>');
				});
			});
	});
	var typeofpaper;
	var stream;
	var sem;
	
	$("#semester1").change(function()
	{
		sem1=$("#semester1").val();
		//alert(sem1);
		$.ajax({
			
			method:"POST",
			url:"getPaperTypeDetails",
			data:
			{
				sem1:sem1,
			}
		}).done(function(data)
		{
			$("#typeofpaper").children().remove();
			var object=jQuery.parseJSON(data);
			$('#typeofpaper').append($("<option></option>").attr("value",'-1').text('Please Select Type of paper'));

			
			$.each(object,function(key,value){
				$("#typeofpaper").append('<option value='+value.papertypeid+'>'+value.paperType+'</option>');
			});
		});	
	});  
	
	$("#typeofpaper").change(function()
	{
		typeofpaper=$("#typeofpaper").val();
		stream=$("#stream").val();
		sem=$("#semester1").val();
		//alert(typeofpaper);
	//	alert(stream);
		//alert(sem);
		
		$.ajax({
					method:"POST",
					url:"getpaperinformation",
					data:
					{
						typeofpaper:typeofpaper,stream:stream,sem:sem,
					}
			}).done(function(data)
			{
				$("#year").children().remove();
				var object=jQuery.parseJSON(data);
				
				$('#year').append($("<option></option>").attr("value",'-1').text('Please Select Year'));
				$.each(object,function(key,value){
					$("#year").append('<option value='+value.Year+'>'+value.Year+'</option>');
				});
			});
	});
	
	$("#year").change(function()
	{
		var year=$("#year").val();
		
		//alert(typeofpaper);
		//alert(stream);
		//alert(sem);
		//alert(year);
		
		$.ajax({
					method:"POST",
					url:"getPaperId",
					data:
					{
						typeofpaper1:typeofpaper,stream1:stream,sem1:sem,year:year,
					}
			}).done(function(data)
			{
				//alert("Paper id "+data);
				 $("#paperid").val(data);
			});
	});
});
</script>
<script src="assets/js/jquery.min.js"></script>
<script>
/*
	document.getElementById("myform").addEventListener("click",function(e)
	{
		alert("form submiit");
		
	});
	*/
	
	var el = document.getElementById('myform');
	if(el)
	{
	  el.addEventListener('submit', swapper, false);
	}
</script>
</head>
<jsp:include page ="/FetchHobby"/>
<% List<Stream> Streamlist= (List)request.getAttribute("Streamlist"); %>
<% String id= (String)request.getAttribute("streamid"); %>
<body>
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <div id="wrapper" class="wrapper bg-ash">
        <!-- Header Menu Area Start Here -->
        <div class="navbar navbar-expand-md header-menu-one bg-light">
            <div class="nav-bar-header-one">
                <div class="header-logo">
                    <a href="Amyformdmin.jsp">
                        <img src="img/logo.png" alt="logo">
                    </a>
                </div>
                  <div class="toggle-button sidebar-toggle">
                    <button type="button" class="item-link">
                        <span class="btn-icon-wrap">
                            <span></span>
                            <span></span>
                            <span></span>
                        </span>
                    </button>
                </div>
            </div>
            <div class="d-md-none mobile-nav-bar">
               <button class="navbar-toggler pulse-animation" type="button" data-toggle="collapse" data-target="#mobile-navbar" aria-expanded="false">
                    <i class="far fa-arrow-alt-circle-down"></i>
                </button>
                <button type="button" class="navbar-toggler sidebar-toggle-mobile">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
            <div class="header-main-menu collapse navbar-collapse" id="mobile-navbar">
                <ul class="navbar-nav">
                    <li class="navbar-item header-search-bar">
                        <div class="input-group stylish-input-group">
                            <span class="input-group-addon">
                                <button type="submit">
                                    <span class="flaticon-search" aria-hidden="true"></span>
                                </button>
                            </span>
                            <input type="text" class="form-control" placeholder="Find Something . . .">
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="navbar-item dropdown header-admin">
                        <a class="navbar-nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                            aria-expanded="false">
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
                                    <li><a href="#"><i class="flaticon-user"></i>My Profile</a></li>
                                    <li><a href="#"><i class="flaticon-list"></i>Task</a></li>
                                    <li><a href="#"><i class="flaticon-chat-comment-oval-speech-bubble-with-text-lines"></i>Message</a></li>
                                    <li><a href="#"><i class="flaticon-gear-loading"></i>Account Settings</a></li>
                                    <li><a href="Admin.jsp"><i class="flaticon-turn-off"></i>Log Out</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="navbar-item dropdown header-message">
                        <a class="navbar-nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                            aria-expanded="false">
                            <i class="far fa-envelope"></i>
                            <div class="item-title d-md-none text-16 mg-l-10">Message</div>
                            <span>5</span>
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
                                            <a href="#">
                                                <span class="item-name">Maria Zaman</span> 
                                                <span class="item-time">18:30</span> 
                                            </a>  
                                        </div>
                                        <p>What is the reason of buy this item. 
                                        Is it usefull for me.....</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="item-img bg-yellow author-online">
                                        <img src="img/figure/student12.png" alt="img">
                                    </div>
                                    <div class="media-body space-sm">
                                        <div class="item-title">
                                            <a href="#">
                                                <span class="item-name">Benny Roy</span> 
                                                <span class="item-time">10:35</span> 
                                            </a>  
                                        </div>
                                        <p>What is the reason of buy this item. 
                                        Is it usefull for me.....</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="item-img bg-pink">
                                        <img src="img/figure/student13.png" alt="img">
                                    </div>
                                    <div class="media-body space-sm">
                                        <div class="item-title">
                                            <a href="#">
                                                <span class="item-name">Steven</span> 
                                                <span class="item-time">02:35</span> 
                                            </a>  
                                        </div>
                                        <p>What is the reason of buy this item. 
                                        Is it usefull for me.....</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="item-img bg-violet-blue">
                                        <img src="img/figure/student11.png" alt="img">
                                    </div>
                                    <div class="media-body space-sm">
                                        <div class="item-title">
                                            <a href="#">
                                                <span class="item-name">Joshep Joe</span> 
                                                <span class="item-time">12:35</span> 
                                            </a>  
                                        </div>
                                        <p>What is the reason of buy this item. 
                                        Is it usefull for me.....</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="navbar-item dropdown header-notification">
                        <a class="navbar-nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                            aria-expanded="false">
                            <i class="far fa-bell"></i>
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
                        </div>
                    </li>
                     <li class="navbar-item dropdown header-language">
                        <a class="navbar-nav-link dropdown-toggle" href="#" role="button" 
                        data-toggle="dropdown" aria-expanded="false"><i class="fas fa-globe-americas"></i>EN</a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">English</a>
                            <a class="dropdown-item" href="#">Spanish</a>
                            <a class="dropdown-item" href="#">Franchis</a>
                            <a class="dropdown-item" href="#">Chiness</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Header Menu Area End Here -->
        <!-- Page Area Start Here -->
        <div class="dashboard-page-one">
            <!-- Sidebar Area Start Here -->
            
            <%@include file="sidebar-admin.jsp" %>
            
            <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Previous year papers</h3>
                    <ul>
                        <li>
                            <a href="Admin.jsp">Home</a>
                        </li>
                        <li>Papers</li>
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
                                        <h3>Upload Paper here</h3>
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
                                <form class="new-added-form"  id ="myform" action="DownloadPaper" method="post">
                                    <div class="row">
                                        <div class="col-12-xxxl col-lg-6 col-12 form-group">
                                        <input type="hidden" name="id" id="paperid">
                                            <label>Select Stream *</label>
                                            <select   class="select2" id="stream" name="stream">
                                            <option selected >Please select Stream</option>
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
                                            <!-- <input type="text" placeholder="" class="form-control"> -->
                                        </div>
                                        <div class="col-12-xxxl col-lg-6 col-12 form-group">
                                           <!--    <label>Select Year *</label>
                                            <input type="text" class="form-control" id="datepicker" />
                                            <i class="flaticon-calendar"></i> -->
                                            <label>Select Semester *</label>
                                            <select class="select2" name="semester" id="semester1">
                                             <option>please select</option>
                                            </select>
                                        </div>
                                      <!--    <input type="hidden" id="paper" name="paper1">-->
                                        <!-- <input type="text" id="datepicker" /> -->
                                        <!--  
                                        <div class="col-12-xxxl col-lg-6 col-12 form-group">
                                            <label>Select Subject *</label>
                                            <select class="select2" id="subject" name="subject">
                                               
                                                
                                            </select>
                                        </div>
                                        -->
                                        <div class="col-12-xxxl col-lg-6 col-12 form-group">
                                            <label>Select Type of Paper *</label>
                                            <select class="select2"  id="typeofpaper" name="type">
                                          
                                                
                                            </select>
                                        </div>
                                        <div class="col-12-xxxl col-lg-6 col-12 form-group">
                                       <div class="col-12-xxxl col-lg-6 col-12 form-group">
                                            <label>Select Year</label>
                                              <!--  <input type="text" class="form-control" name="year123"-->  
                                           <!--   <i class="flaticon-calendar"></i>-->
                             				 <!--  <label>Select Code</label>-->
                                            <select class="select2"  id="year" name="Year">
                                            </select> 
                                        </div>
                                        <!--  
                                            <label>Select Year *</label>
                                            <input type="text" class="form-control" name="year123" id="datepicker" />
                                            <i class="flaticon-calendar"></i>
                                            <!-- <label>Select Code</label>
                                            <select class="select2">
                                                <option value="0">Please Select</option>
                                                <option value="1">00524</option>
                                                <option value="2">00525</option>
                                                <option value="3">00526</option>
                                                <option value="3">00527</option>
                                                <option value="3">00528</option>
                                            </select> -->
                                        </div>
                                       
                                        <!-- <div class="col-12-xxxl col-lg-6 col-12 form-group"> -->
                                        <!--  
                                        <input type="file" name="paper" class="btn-fill-lmd radius-30 text-light bg-true-v">Upload Paper here
                                            <i class="fas fa-cloud-upload-alt mg-l-10"></i>-->
                                        
                                        <!-- </div> -->
                                        <div class="col-12 form-group mg-t-8">
                                          	<button type="submit"  class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark" >Download</button>
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
    
    <script>
      $("#datepicker").datepicker({
    format: "yyyy",
    viewMode: "years", 
    minViewMode: "years"
    });
    </script>

</body>
<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
</html>