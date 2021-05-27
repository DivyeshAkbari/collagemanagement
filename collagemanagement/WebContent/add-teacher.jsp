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
    <title>AKKHOR | Add Teacher</title>
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
    <script src="assets/js/jquery.min.js"></script>
   <script>
//    		$(document).ready(function(){
//    			$("#stream_check").click(function(){
//    				var a = $('#stream_check').val(this.checked);
			
//    				$("#edit-previous").click(function(){
//    				  alert("The paragraph was clicked.");
//    				});
   				
//    				$.ajax({
//    					method:"post",
//    					url: "fetchsemester",
//    					data: { name : a}
//    				})
//    				.done(function(msg){
//    					$("#id_sem").children().remove();
//    					var obj = JQuery.parseJSON(msg);
//    					$.each(obj,function(key,value){
//    						$("#id_sem").append('<input type="checkbox" value="">');
//    					});
//    				});
//    			});
//    		});
   		
   </script>
   <script>

var returnval=true;

$(document).ready(function() {
	
	$("#submit").click(function() {
		var str = $("#mail").val();
		//alert(str);
		$.get("Addteacher", {
			email : str
		}).done(function(data)
		{
			//alert(data);
			if (data == "true") {
				alert("This email id is already exist");
 				returnval=false;
			}
		});	
	});
});


 
function clearErrors()
{
	errors=document.getElementsByClassName('formerror');
	
	for(let item of errors)
	{
		item.innerHTML="";	
	}
}
function seterror(id,error)
{
	element=document.getElementById(id);
	element.getElementsByClassName('formerror')[0].innerHTML=error;
}
function validateForm()
{	
	clearErrors();
	
	var name=document.forms['myForm']["firstname"].value;
	
	if(name.length==0)
	{
		seterror("fname","*Your Name can't be empty.");
		returnval=false;
		//alert("alert from  first name and here return value is "+returnval);
	}
	var mname=document.forms['myForm']["middlename"].value;
	
	if(mname.length==0)
	{
		seterror("mname","*Your Middle Name Can't be Empty");
		returnval=false;
		//alert("alert from middle  name and here return value is "+returnval);
		
	}
	
	var lname=document.forms['myForm']["lastname"].value;
	
	if(lname.length==0)
	{
		seterror("lname","* Your Last Name Can't Be Empty");
		returnval=false;
		//alert("alert from last  name and here return value is "+returnval);
	}
	var qualification=document.forms['myForm']["qualification"].value;
	
	if(qualification.length==0)
	{
		seterror("cpass","* Your Qualification Can't Be Empty");
		returnval=false;
		//alert("alert from last  name and here return value is "+returnval);
	}
	
	var phone=document.forms['myForm']["number"].value;
		
	if(phone.length!=10)
	{
		seterror("phone","* Your Phone Number Must Be of 10 Digits.");
		returnval=false;
	}
	
	var email=document.forms['myForm']["email"].value;
	
	
	if(email.length==0)
	{
		seterror("femail","* Please Enter Email");
		returnval=false;
		//alert("alert from email  name and here return value is "+returnval);
	}
	var address=document.forms['myForm']["address"].value;
	
	if(address.length==0)
	{
		seterror("faddress","* Please Enter Address");
		returnval=false;
	//	alert("alert from Adddress  name and here return value is "+returnval);
	}
// 	var password=document.forms['myForm']["password"].value;
// 	if(password.length==0)
// 	{
// 		seterror("pass","* Your Password Can't Be Empty");
// 		returnval=false;
// 		alert("alert from password  name and here return value is "+returnval);
// 	}
	var gender=document.forms['myForm']["gender"].value;
	if(gender==null)
	{
		seterror("xender","*Please Select Your Gender");	
		returnval=false;
		//alert("alert from Xender  name and here return value is "+returnval);
	}
	
	if(returnval == false){
		alert("May be you have missed some field please press back to check..");
	}
	return returnval;
}

function fileValidation() {
    var fileInput = 
        document.getElementById('file');
      
    var filePath = fileInput.value;
 
    // Allowing file type
    var allowedExtensions = 
            /(\.jpg|\.jpeg|\.png|\.gif)$/i;
      
    if (!allowedExtensions.exec(filePath)) {
      //  alert('Invalid file type');
        fileInput.value = '';
        return false;
    } 
}

</script>
	<style>
	.formerror{
    	color:red;
    	
    	}
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

<%List<Semester> Semlist= (List)request.getAttribute("SemList");%>
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
                        <li>Add New Teacher</li>
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
                     		</div>
                		</div>
                		<%} %>
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
                        <form action="Addteacher" name="myForm" onsubmit="return validateForm()" enctype="multipart/form-data" method="post" id="form1" class="new-added-form">
                        
                            <div class="row">
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="fname">
                                	<input type="hidden" name="role" value="FACULTY"></input>
                                    <label>First Name *</label>
                                    <input autocomplete="off" name="firstname" type="text" placeholder="" class="form-control"><span  class="formerror"><b></b></span>
                                </div>
                                <span id="fmessage"></span>
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="mname">
                                    <label>Middle Name *</label>
                                    <input autocomplete="off" name="middlename"  type="text" placeholder="" class="form-control"><span  class="formerror"><b></b></span>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="lname">
                                    <label>Last Name *</label>
                                    <input autocomplete="off" name="lastname" type="text" placeholder="" class="form-control"><span  class="formerror"><b></b></span>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="gender">
                                    <label>Gender *</label>
                                    <select name="gender" class="select2">
                                        <option value="">Please Select Gender *</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
<!--                                         <option value="3">Others</option> -->
                                    </select><span  class="formerror"><b></b></span>
                                </div>
								<div class="col-xl-3 col-lg-6 col-12 form-group" id="femail">
                                    <label>Email</label>
                                    <input id="mail" autocomplete="off" name="email" type="text" placeholder="" class="form-control"><span  class="formerror"><b></b></span>
                                  </div>
                                  
                                 <div class="col-xl-3 col-lg-6 col-12 form-group" id="pass">
                                    <label>Password</label>
                                    <input id="password1" autocomplete="off" class="form-control" type="password" name="password" >
                                    <i toggle="password-field" class="fa fa-fw fa-eye field_icon toggle-password"></i>
                                  </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="cpass">
                                    <label>Qualification</label>
                                    <input autocomplete="off" name="qualification" type="text" placeholder="" class="form-control"><span class="formerror"><b></b></span>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="phone">
                                    <label>Mobile Number</label>
                                    <input autocomplete="off" name="number" type="text" placeholder="" class="form-control"><span class="formerror"><b></b></span>
                                </div>
                                <div class="col-lg-6 col-12 form-group" id="faddress">
                                    <label>Address</label>
                                    <textarea name="address" class="textarea form-control"  id="form-message" cols="10" rows="9"></textarea>
                                    <span class="formerror"><b></b></span>
                                </div>
                                <div class="col-lg-6 col-12 form-group mg-t-30" id="imageid">
                                    <label class="text-dark-medium">Upload Faculty Photo (150px X 150px)</label>
                                    <input id="file" name="profile_photo" onchange="return fileValidation()" type="file" class="form-control-file">
                                </div>
								 
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
<!--    						 <div id="alert" class="ui-alart-box"> -->
<!--                             <div class="dismiss-alart"> -->
<!--      								 <div class="alert alert-warning alert-dismissible fade show" role="alert"> -->
<!--                                     This is a warning alert—check it out! -->
<!--                                     <button type="button" class="close" data-dismiss="alert" aria-label="Close"> -->
<!--                                         <span aria-hidden="true">&times;</span> -->
<!--                                     </button> -->
<!--                                 </div> -->
<!--                                 </div></div> -->
<!-- 							<form action="Addteacher" method="post" id="form2" class="new-added-form"> -->
                            <div class="row">
                           

									<div class="col-lg-12 form-group" >
                                    <label>Which stream</label>
                                    <% 
                                    for(int i=0;i<Streamlist.size();i++){
                                    
                                    	Stream s = Streamlist.get(i);
                                    	 
         								
                                         		
                                    	
                                    %>
                                    <div class="stream" >
                                    <input name="stream_checkbox" class="stream_check" type="checkbox"value="<%=s.getStreamid()%>">
                                     <%=s.getStreamname()%>
<!--                                      div for semester list -->
                                     <div id="id_stream<%=s.getStreamid() %>" class="col-lg-12 form-group">
                                     
    								</div>
    								
    								
                                     </div>
                                    <% 
										
                                    }
                                    %>
                                    
                                 
                                </div>
                                
                                <div id="id_sub" class="col-lg-12 form-group">
    								</div>
<!--                         		<div id="id_sub" class="col-lg-12 form-group">  </div> -->
    							
<!--     						<div id="id_sem" class="col-lg-12 form-group"> -->
<!--     						</div> -->

<!--                                 <div class="col-xl-3 col-lg-6 col-12 form-group"> -->
<!--                                     <label>Date Of Birth *</label> -->
<!--                                     <input type="text" placeholder="dd/mm/yyyy" class="form-control air-datepicker"> -->
<!--                                     <i class="far fa-calendar-alt"></i> -->
<!--                                 </div> -->
<!--                                 <div class="col-xl-3 col-lg-6 col-12 form-group"> -->
<!--                                     <label>ID No</label> -->
<!--                                     <input type="text" placeholder="" class="form-control"> -->
<!--                                 </div> -->
<!--                                 <div class="col-xl-3 col-lg-6 col-12 form-group"> -->
<!--                                     <label>Blood Group *</label> -->
<!--                                     <select class="select2"> -->
<!--                                         <option value="">Please Select Group *</option> -->
<!--                                         <option value="1">A+</option> -->
<!--                                         <option value="2">A-</option> -->
<!--                                         <option value="3">B+</option> -->
<!--                                         <option value="3">B-</option> -->
<!--                                         <option value="3">O+</option> -->
<!--                                         <option value="3">O-</option> -->
<!--                                     </select> -->
<!--                                 </div> -->
<!--                                 <div class="col-xl-3 col-lg-6 col-12 form-group"> -->
<!--                                     <label>Religion *</label> -->
<!--                                     <select class="select2"> -->
<!--                                         <option value="">Please Select Religion *</option> -->
<!--                                         <option value="1">Islam</option> -->
<!--                                         <option value="2">Hindu</option> -->
<!--                                         <option value="3">Christian</option> -->
<!--                                         <option value="3">Buddish</option> -->
<!--                                         <option value="3">Others</option> -->
<!--                                     </select> -->
<!--                                 </div> -->
                                 
<!--                                 <div class="col-xl-3 col-lg-6 col-12 form-group"> -->
<!--                                     <label>Class *</label> -->
<!--                                     <select class="select2"> -->
<!--                                         <option value="">Please Select Class *</option> -->
<!--                                         <option value="1">Play</option> -->
<!--                                         <option value="2">Nursery</option> -->
<!--                                         <option value="3">One</option> -->
<!--                                         <option value="3">Two</option> -->
<!--                                         <option value="3">Three</option> -->
<!--                                         <option value="3">Four</option> -->
<!--                                         <option value="3">Five</option> -->
<!--                                     </select> -->
<!--                                 </div> -->
<!--                                 <div class="col-xl-3 col-lg-6 col-12 form-group"> -->
<!--                                     <label>Section *</label> -->
<!--                                     <select class="select2"> -->
<!--                                         <option value="">Please Select Section *</option> -->
<!--                                         <option value="1">Pink</option> -->
<!--                                         <option value="2">Blue</option> -->
<!--                                         <option value="3">Bird</option> -->
<!--                                         <option value="3">Rose</option> -->
<!--                                         <option value="3">Red</option> -->
<!--                                     </select> -->
<!--                                 </div> -->

									
<!-- 								hidden input to pass array of id's of stream,semester,subject to servlet -->
								<input type="hidden" id="streamHidden" name="streamInputArray">
								<input type="hidden" id="semesterHidden" name="semesterInputArray">
								<input type="hidden" id="subjectHidden" name="subjectInputArray"> 
<!--                                 <input name="streamInputArray" type="checkbox" style="opacity:0; position:absolute; left:9999px;"> -->
                                <div class="col-12 form-group mg-t-8">
                                   <button type="button" class="btn-fill-lg bg-blue-dark btn-hover-yellow" id="edit-previous">Edit Previous Options</button>
     								<button id="submit" type="submit" onclick="myFunction()" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark" >Save</button>
     								
                         			<button type="reset" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Reset</button>
<!--                          			<button id="check11" disabled>Check</button> -->
                         			<input type="hidden" id="demo"> 
                                </div>
                               
                                
                               
                                
                                
                            </div>
                            
                        </form>
                        
						

    					 
					</div>
					
                    </div>
                    
                </div>
                <!-- Add New Teacher Area End Here -->
                <footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">educhap</a> 2021. All rights reserved. Designed by <a href="#">pldBrosS</a></div>
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
	
	var input = $("#password1");
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
		var value,id,previousValue=0;
		var streamValue;
		
		$('.stream_check').change(function() {
			value = ($(this).val()); //1 
				
			previousValue = value;
			if(previousValue == value){
				
			}
			previousValue = value;
			id = "id_stream"+value; //id_sem1
			streamValue = value; //
	        if(this.checked) {
	            
	        	$.ajax({
					method:"post",
					url: "fetchsemester",
					data: { name : value}
				})
				.done(function(msg){
					//var id = "id_sem"+value;
					document.getElementById("demo").value = 1;
					//$("#id_sem").children().remove();
					//$("#id_sem").remove();
					$("#"+id).empty();
					//alert(value);
					var obj = jQuery.parseJSON(msg);
					
					$.each(obj,function(key,value){
						var divId = streamValue+'-'+value.semId; //
						$('#'+id).append('<div style="margin-left: 30px;" id='+divId+'></div>'); 
						$("#"+divId).append('<input name="semesterCheck" class="semester_check" type="checkbox" value='+value.semId+'>semester '+value.semValue+'<br>');
						//var aa = $("#"+id);
						//alert("aa: "+aa);
					});
					
				});//ajax
	        	
	        }//if
	        else{
	        	//alert("else");
	        	document.getElementById("demo").value = 0;
	        	$('#submit').attr("disabled", true);
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
					document.getElementById("demo").value = 1;
					//var flag=document.getElementById("demo").value;
// 					if(flag == 1){
// 						$('#check11').attr("disabled", false);
// 					}else{
// 						$('#check11').attr("disabled", true);
// 					}
					$('#' + divTagId).find('.subject').remove();
					var obj = jQuery.parseJSON(msg);
					
					$.each(obj,function(key,value){
						//"#"+id2
						var subjectName = divTagId;//+"-"+value.subjectId
						var $subjectDivElement = $("<div>", {"class": "subject"});
						//var subjectDivElement = ;
						//$('#'+divTagId).append('<div class="Subject"></div>'); 
						$("#"+divTagId).append($subjectDivElement);
						$($subjectDivElement).append('<input class="subjectcheck" style="margin-left: 40px;" name = '+subjectName+' type="checkbox" value='+value.subjectId+'>'+value.subjectName+'<br>');
						
						
					});
				});//ajax
	        	
	        }//if
	        else{
				//$("#id_sub").empty();
				document.getElementById("demo").value = 0;
				$('#submit').attr("disabled", true);
				$('#' + divTagId).find('.subject').remove();
	        }        
	    });//change event
	    $(document).on("click",".subjectcheck",function() {
	    	if(this.checked) {
	    		document.getElementById("demo").value = 1;
				var flag=document.getElementById("demo").value;
					if(flag == 1){
						$('#submit').attr("disabled", false);
					}else{
						$('#submit').attr("disabled", true);
					}
	    	}else{
	    		document.getElementById("demo").value = 0;
				$('#submit').attr("disabled", true);
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
		//  alert("please unselect unusual checkbox");
		  var streamArray=[];
		  var semesterArray = [];
		  var subjectArray = [];
		  //var isStreamSelected = $('.stream_check').is(':checked');
		  var items = document.getElementsByClassName('class');
		    for (var i = 0; i < items.length; i++)
		        alert(items[i].name);
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
		
		
		}
	</script>
	<script>
	$('#checkstreamid').click(function(){
	    //If the checkbox is checked.
	    if($(this).is(':checked')){
	    	
	       		$('#check11').attr("disabled", false);
	    } else{
	       
	        $('#check11').attr("disabled", true);
	    }
	});
	</script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/add-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:26 GMT -->
</html>