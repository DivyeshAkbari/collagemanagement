<%@page import="java.util.Optional"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.collagemanagement.bean.Semester1"%>
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
/* 	stream_check  #streamid1*/
	
	
	</style>
</head>

<jsp:include page ="/FetchHobby"/>
 
<% List<Stream> Streamlist= (List)request.getAttribute("Streamlist");
	//System.out.println("Stream list in jsp: "+Streamlist);
%>

<jsp:include page ="/Fetchsemdetails"/>

<%List<Semester> Semlist = (List)request.getAttribute("SemList");%>


<%-- <% List<Stream> Streamlist= (List)request.getAttribute("Streamlist"); %> --%>

<% User u1 = (User)request.getSession(false).getAttribute("faculty");
//System.out.println("User stream liist: "+u1.getStreamList());
	Streamlist = u1.getStreamList();
%>
<% List<Subject> subjectlist =(List)request.getSession(false).getAttribute("subjectList");
	subjectlist = u1.getSubjectList();
%>
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
<% String message = (String)request.getAttribute("ans"); %>

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
                        <li>Update Teacher</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <!-- Add New Teacher Area Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                    <%if(message != null){ %>
                    	<div class="ui-alart-box">
                			<div class="alert alert-success" role="alert">
                        	<%=message %>
                        	<%if(message.equals("record updated successfully")){
                        		session.setAttribute("faculty", null); 
                        		session.setAttribute("subjectList", null);
                        		}%>
                     		</div>
                		</div>
                		<%} %>
                        <div class="heading-layout1">
                            <div class="item-title">
                                <h3>Update Teacher</h3>
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
                         <form action="UpdateTeacher" enctype="multipart/form-data" method="post" id="form1" class="new-added-form">
                        
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
                                    <input readonly="readonly" value="<%=u1.getEmail() %>" autocomplete="off" name="email" type="text" placeholder="" class="form-control">
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
                                <div class="col-lg-6 col-12 form-group mg-t-30">
                                    <label class="text-dark-medium">Update Photo (150px X 150px)</label>
                                    <img style="height: 150px; width: 150px;" src="data:image/png;base64,<%= u1.getUserProfilepicString()  %>" alt="student">
                                    <input name="profile_photo" type="file" value="<%=u1.getUserProfilepicString() %>" class="form-control-file">
                                </div>
								 
<!-- 								<button type="button" class="back">Back</button> -->
								<input type="hidden" name="userID" value="<%=u1.getId() %>">
							   
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
                           
									<% int subcnt=1; %>
									<div class="col-lg-12 form-group">
                                    <label>Which stream</label>
                                    <%  System.out.println("Streamlist.size(): "+Streamlist.size());
                                    if(null != Streamlist){
                                     for(int i=0;i<Streamlist.size();i++){
                                    
                                    	Stream s = Streamlist.get(i);
                                    	
                                    %>
                                    <div class="stream" >
                                    <input  name="stream_checkbox" class="stream_check" type="checkbox"  class=""
                                    <% System.out.println(s.getStreamid()+" "+s.getSemesters() );
                                  //  List<Semester1> semlist = s.getSemesters();
                                   
                                    //List<Boolean> blist = semlist.stream().map(Semester1::isSelected).collect(Collectors.toList());
                                    //System.out.println(blist);
                                   // boolean check = isSelected.contains(true);
                                    if(streamIdList.contains(s.getStreamid()) && !s.getSemesters().isEmpty() && s.isStreamCheck()){
                                    	
                                    	%>
                                    checked="checked"
                                    <% } %>
                                     value="<%=s.getStreamid()%>">
                                     <%=s.getStreamname()%> 
<!--                                      div for semester list  -->
									<div id="id_stream<%=s.getStreamid() %>" class="col-lg-12 form-group">
										<%
										 System.out.println("sem list in jsp: "+s.getSemesters());
                                     	if(null != s.getSemesters() && s.isStreamCheck()){
                                    
                                     	for(Semester1 s1 : s.getSemesters()){
                                     %>  
                                     <div style="margin-left: 30px;" id="<%=s.getStreamid()%>-<%= s1.getSemId() %>">
                                          <input name="semesterCheck" class="semester_check" type="checkbox"
                                          <% if(s1.isSelected()){ %>
                                          checked="checked"
                                          <% } %>
                                           value = "<%= s1.getSemId() %>"
                                              > <b>  Semester <%=s1.getSemValue() %> </b> <br>   
<!--                                               division for subject  -->
                                                 <div style="margin-left: 40px;" class="subject">
                                              
                                              	<% //System.out.println("subject list in jsp: "+s1.getSubjects());
                                              	if(null != s1.getSubjects()){ 
                                              
                                              	 for(Subject s2 : s1.getSubjects()){ %>
                                              	
                                              	<input type="checkbox"
                                              	<% if(s2.isSelected()){ %>
                                              		checked="checked"
                                              	<% } %>
                                              	
                                              	value = "<%= s2.getSubjectId() %>"> Subject <%=subcnt++ %> : <%= s2.getSubjectName() %> <br>
                                              	
                                              	 
                                              	<% }//subject for
                                              	 subcnt=1;
                                              	}//if not equal to null%>
                                                              
                                                 </div>
                                                 
                                                 
                                         </div>        
                                     <% }//semester for loop
                                     	}//if%>
                                     	
                                     
                                     
                                     	</div>
                                     	  </div>
                                    <% 
										
                                   }//for
                                    }//if stream not equal to null %>
<!--                                    default value code here                                  -->
                              
                               
                               </div>
								                               
                              

									
<!-- 								hidden input to pass array of id's of stream,semester,subject to servlet -->
								<input type="hidden" id="streamHidden" name="streamInputArray">
								<input type="hidden" id="semesterHidden" name="semesterInputArray">
								<input type="hidden" id="subjectHidden" name="subjectInputArray"> 
								 <div class="col-12 form-group mg-t-8">
                                   <button type="button" class="btn-fill-lg bg-blue-dark btn-hover-yellow" id="edit-previous">Edit Previous Options</button>
     								<button id="submit" type="submit" onclick="myFunction()" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark" >Save</button>
     								
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

	$(document).ready(function(){
		
		var value,id;
		var streamValue;
		
		$('.stream_check').change(function() {
			value = ($(this).val()); //1 
			id = "id_stream"+value; //id_sem1
			streamValue = value;
	        if(this.checked) {
	            
	        	$.ajax({
					method:"post",
					url: "fetchsemester",
					data: { name : value}
				})
				.done(function(msg){
					//var id = "id_sem"+value;
					
					
					$("#"+id).empty();
					//alert(value);
					var obj = jQuery.parseJSON(msg);
					
					$.each(obj,function(key,value){
						var divId = streamValue+'-'+value.semId;
						$('#'+id).append('<div style="margin-left: 30px;" id='+divId+'></div>'); 
						$("#"+divId).append('<input name="semesterCheck" class="semester_check" type="checkbox" value='+value.semId+'> <b> semester '+value.semValue+'</b> <br>');
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
					var subcnt=1;
					$.each(obj,function(key,value){
						//"#"+id2
						var subjectName = divTagId;//+"-"+value.subjectId
						var $subjectDivElement = $("<div>", {"class": "subject"});
						//var subjectDivElement = ;
						//$('#'+divTagId).append('<div class="Subject"></div>'); 
						$("#"+divTagId).append($subjectDivElement);
						$($subjectDivElement).append('<input  style="margin-left: 40px;" name = '+subjectName+' type="checkbox" value='+value.subjectId+'>Subject '+(subcnt++)+' : '+value.subjectName+'<br>');
						
						
					});
					subcnt=1;
				});//ajax
	        	
	        }//if
	        else{
				//$("#id_sub").empty();
				
				$('#' + divTagId).find('.subject').remove();
	        }        
	    });//change event
	    

	});//document.ready
	
	
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
		
//  		alert("streamArray: "+streamArray);
//  		alert("semesterArray: "+semesterArray);
//  		alert("subjectArray: "+subjectArray);
		}
	</script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/add-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:26 GMT -->
</html>