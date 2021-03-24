<%@page import="java.util.ArrayList"%>
<%@page import="com.collagemanagement.bean.Subject"%>
<%@page import="com.collagemanagement.bean.User"%>
<%@page import="com.collagemanagement.bean.Semester"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.collagemanagement.bean.Stream"%>
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
    
  
	<style>
	.content {
    display: none;
	}
	button {
    margin-top: 30px;
	}
	.back {
   	 display: none;
	}
	.next {
  	  margin-left: 50px;
	}
	.end {
    display: none;
	}
	</style>
</head>

<jsp:include page ="/FetchHobby"/>
 
<% List<Stream> Streamlist= (List)request.getAttribute("Streamlist"); %>

<jsp:include page ="/Fetchsemdetails"/>

<%List<Semester> Semlist = (List)request.getAttribute("SemList");%>


<%-- <% List<Stream> Streamlist= (List)request.getAttribute("Streamlist"); %> --%>
<% User u1 = (User)request.getAttribute("faculty"); %>
<% List<Subject> subjectlist =(List)request.getAttribute("subjectList"); %>
<%-- <% User u1=faculty.get(0); %> --%>

<% List<Integer> streamIdList = new ArrayList<>();
List<Integer> semesterIdList = new ArrayList<>();
List<Integer> subjectIdList = new ArrayList<>();
	 
	if(null!=u1.getStreamList() && !u1.getStreamList().isEmpty()){ 
			
	 for(Stream s : u1.getStreamList()){ 
		 streamIdList.add(s.getStreamid()); 
	 }
	 }//if
	if(null!=u1.getSemesterList() && !u1.getSemesterList().isEmpty()){ 
			
	 for(Semester s1 : u1.getSemesterList()){ 
		 semesterIdList.add(s1.getSemid()); 
	 }
	 }//if
	 if(null!=u1.getSubjectList() && !u1.getSubjectList().isEmpty()){ 
			
	 for(Subject s2 : u1.getSubjectList()){ 
		 subjectIdList.add(s2.getSubjectId()); 
	 }
	 }//if
	 System.out.println(subjectIdList);
	 System.out.println(streamIdList);
	 System.out.println(semesterIdList);
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
                    <a href="Admin.jsp">
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
                    <h3>Teacher</h3>
                    <ul>
                        <li>
                            <a href="Admin.jsp">Home</a>
                        </li>
                        <li>Add New Teacher</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <!-- Add New Teacher Area Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                        <div class="heading-layout1">
                            <div class="item-title">
                                <h3>Add New Teacher</h3>
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
                         <div class="content" id="content-1" data-id='1' style="display: block;">
                        <form  enctype="multipart/form-data" method="post" id="form1" class="new-added-form">
                        
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
<!--                                 <div class="col-xl-3 col-lg-6 col-12 form-group"> -->
<!--                                     <label>Gender *</label> -->
<!--                                     <select  name="gender" class="select2"> -->
                                    
<!--                                         <option value="">Please Select Gender *</option> -->
<!--                                         <option value="Male">Male</option> -->
<!--                                         <option value="Female">Female</option> -->
<!--                                         <option value="3">Others</option> -->
<!--                                     </select> -->
<!--                                 </div> -->
								<div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Email</label>
                                    <input value="<%=u1.getEmail() %>" autocomplete="off" name="email" type="text" placeholder="" class="form-control">
                                  </div>
                                 <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Password</label>
                                    <input value="<%=u1.getPassword() %>" id="password" autocomplete="off" class="form-control" type="password" name="password">
                                    <i toggle="password-field" class="fa fa-fw fa-eye field_icon toggle-password"></i>
                                  </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Qualification</label>
                                    <input value="<%=u1.getQualification() %>" autocomplete="off" name="qualification" type="text" placeholder="" class="form-control">
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Mobile Number</label>
                                    <input value="<%=u1.getContactno() %>" autocomplete="off" name="number" type="text" placeholder="" class="form-control">
                                </div>
                                <div class="col-lg-6 col-12 form-group">
                                    <label>Address</label>
                                    <textarea name="address" class="textarea form-control"  id="form-message" cols="10" rows="9"><%=u1.getAddress() %></textarea>
                                </div>
<!--                                 <div class="col-lg-6 col-12 form-group mg-t-30"> -->
<!--                                     <label class="text-dark-medium">Upload Faculty Photo (150px X 150px)</label> -->
<!--                                     <input name="profile_photo" type="file" class="form-control-file"> -->
<!--                                 </div> -->
								 
<!-- 								<button type="button" class="back">Back</button> -->
				
							   
                                <div class="col-12 form-group mg-t-8">
                                   <button  type="button" id="next" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Next</button>
                                </div>
                            </div>
<!--                         </form> -->
                        </div>
                        </div>
<!--                         content holder end -->
<!-- 					below is division-2  -->
					 <div class="end" data-id='2'>
   						
<!-- 							<form method="post" id="form2" class="new-added-form"> -->
                            <div class="row">
                           

									<div class="col-lg-12 form-group">
                                    <label>Which stream</label>
                                    <% 
                                     for(int i=0;i<Streamlist.size();i++){
                                    
                                    	Stream s = Streamlist.get(i);
                                    	
                                    %>
                                    <div class="stream" >
                                    <input name="stream_checkbox" class="stream_check" type="checkbox"  class=""
                                    <% if(streamIdList.contains(s.getStreamid())){ %>
                                    checked="checked"
                                    <% } %>
                                     value="<%=s.getStreamid()%>">
                                     <%=s.getStreamname()%>
<!--                                      div for semester list  -->
                                     <div id="id_stream<%=s.getStreamid() %>" class="col-lg-12 form-group">                                     
    								</div>
    								
    								
                                     </div>
                                    <% 
										
                                   }
                                    %>
<!--                                    default value code here                                  -->
                                </div>
                                
                              

									
<!-- 								hidden input to pass array of id's of stream,semester,subject to servlet -->
								<input type="hidden" id="streamHidden" name="streamInputArray">
								<input type="hidden" id="semesterHidden" name="semesterInputArray">
								<input type="hidden" id="subjectHidden" name="subjectInputArray"> 
<!--                                 <input name="streamInputArray" type="checkbox" style="opacity:0; position:absolute; left:9999px;"> -->
                                <div class="col-12 form-group mg-t-8">
                                   <button type="button" class="btn-fill-lg bg-blue-dark btn-hover-yellow" id="edit-previous">Edit Previous Options</button>
     								<button id=submit" type="submit" onclick="myFunction()" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark" >Save</button>
     								
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
	<script>
	$('body').on('click', '#next', function() { 
	    var id = $('.content:visible').data('id');
	    var nextId = $('.content:visible').data('id')+1;
	    $('[data-id="'+id+'"]').hide();
	    $('[data-id="'+nextId+'"]').show();
	    
	    if($('.back:hidden').length == 1){
	        $('.back').show();
	    }
	    if(nextId == 2){
			$('.content-holder').hide();
			$('.end').show();
	    }
	});

	$('body').on('click', '#edit-previous', function() { 
		$('.end').hide();
	    $('.content-holder').show();
	    $('#content-1').show();
	});
	</script>
	
	<script>
	//$(':input[type="submit"]').prop('disabled', true);
	$(document).ready(function(){
		//var values = [];
		//$("#alert").hide();
		var value,id;
		var streamValue;
		
		$('.stream_check').change(function() {
			value = ($(this).val()); //1 
			id = "id_stream"+value; //id_sem1
			streamValue = value;
	        if(this.checked) {
	            
	        	$.ajax({
					method:"post",
					url: "fetchselectedsemester",
					data: { name : value}
				})
				.done(function(msg){
					//var id = "id_sem"+value;
					
					$("#"+id).empty();
					
					
					var obj = jQuery.parseJSON(msg);
					var firstobj = obj[0];
					//alert(firstobj);
// 					for (i = 0; i < firstobj.length; ++i) {
// 					    alert(firstobj[i]);
// 					}
// 					
					
					
					$.each(obj[1],function(key,value){
						var divId = streamValue+'-'+value.semId;
						$('#'+id).append('<div id='+divId+'></div>');
						if(firstobj.includes(value.semId)){
							//alert(value.semId);
							code = '<input name="semesterCheck" class="semester_check" type="checkbox" value='+value.semId+' checked>semester '+value.semValue+'<br>';
						}
						else{
							//alert(value.semId);
							code = '<input name="semesterCheck" class="semester_check" type="checkbox" value='+value.semId+' >semester '+value.semValue+'<br>';
						}
						
						$("#"+divId).append(code);
						//var aa = $("#"+id);
						//alert("aa: "+aa);
					});

					

					
				});//ajax
	        	
	        }//if
	        else{
	        	//alert("else");
				$("#"+id).empty();
	        }
	        
	       // $('#textbox1').val(this.checked);        
	    });//change event
	    
		var value1;
		
 		$(document).on("click",".semester_check",function() {
// 		$(".semester_check").on("click",function() {
// 		$(".semester_check").click(function() {
// 		 var stream_value = $(this).closest('div').attr('data-value');
// 		 alert(stream_value);
			
			//alert("id in change : "+id);
			//alert("in semester_check");
			
			var divTagId = $(this).parent().attr('id');
			//alert(divTagId);
			value1 = ($(this).val());
			var id2 = "id_sub"+value1;
			
			//alert("value in sub: "+value1);
			//alert("id2: "+id2);
	        if(this.checked) {
	            
	        	$.ajax({
					method:"post",
					url: "fetchsubjects",
					data: { name1 : value1}
				})
				.done(function(msg){
					//$("#"+id3).empty();//"#id_sub"
					$('#' + divTagId).find('.subject').remove();
					var obj = jQuery.parseJSON(msg);
					
					$.each(obj,function(key,value){
						//"#"+id2
						var subjectName = divTagId;//+"-"+value.subjectId
						var $subjectDivElement = $("<div>", {"class": "subject"});
						//var subjectDivElement = ;
						//$('#'+divTagId).append('<div class="Subject"></div>'); 
						$("#"+divTagId).append($subjectDivElement);
						$($subjectDivElement).append('<input name = '+subjectName+' type="checkbox" value='+value.subjectId+'>'+value.subjectName+'<br>');
						
						
					});
				});//ajax
	        	
	        }//if
	        else{
				//$("#id_sub").empty();
				$('#' + divTagId).find('.subject').remove();
	        }        
	    });//change event
	    
// 		$(".stream_check").change(function(){
// 			value = ($(this).val());
// 			var id = "id_sem"+value;
// 			if($(".stream_check").is(":checked")){
// 				//values.push($(this).val());
				
				
				
				
				
// 			}//if
// 			else{
				
// 			}
			
			//alert(values);
			
// 		});
	});//document.ready
	
	$(document).ready(function(){
		
	});//document.ready
			
			
// 			$('input[name="stream_checkbox"]:checked').each(function() {
// 				values.push($(this).val()); 
// 				});
// 			alert(values);
			//console.log(values);
			///var a = $('#stream_check').val(this.checked);
			
			
// 			$.ajax({
// 				method:"post",
// 				url: "fetchsemester",
// 				data: { name : a}
// 			})
// 			.done(function(msg){
// 				$("#id_sem").children().remove();
// 				var obj = JQuery.parseJSON(msg);
// 				$.each(obj,function(key,value){
// 					$("#id_sem").append('<input type="checkbox" value="">');
// 				});
// 			});
		
// 	});	
    </script>
    <script>
	function myFunction() {
		  //document.getElementById("demo").innerHTML = "Hello World";
		  alert("please unselect unusual checkbox");
		  var streamArray=[];
		  var semesterArray = [];
		  var subjectArray = [];
		$("input:checkbox[name=stream_checkbox]:checked").each(function(){
		    streamArray.push($(this).val());
		});
		$("input:checkbox[name=semesterCheck]:checked").each(function(){
			semesterArray.push($(this).val());
		});
		$('.subject input:checked').each(function() {
			subjectArray.push($(this).attr('value'));
		});
		
		document.getElementById("streamHidden").value = streamArray;
		document.getElementById("semesterHidden").value = semesterArray;
		document.getElementById("subjectHidden").value = subjectArray;
		
		//alert("streamArray: "+streamArray);
		//alert("semesterArray: "+semesterArray);
		//alert("subjectArray: "+subjectArray);
		}
	</script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/add-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:26 GMT -->
</html>