<%@page import="com.collagemanagement.bean.Stream"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/add-teacher.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:26 GMT -->
<!-- Added by HTTrack --><!-- <meta http-equiv="content-type" content="text/html;charset=UTF-8" />/Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AKKHOR | Add Student</title>
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
    <style type="text/css">
    	
    	.formerror{
    	color:red;
    	
    	}
    	
    </style>
<script src="assets/js/jquery.min.js"></script>
</script>
<script>
$(document).ready(function()
{
	$("#stream").change(function(){
		
		var stream=$("#stream").val();
		if(stream=="Please select Stream")
		{
			
			alert("please select stream")	
		}
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
				$('#semester1').append($("<option></option>").attr("value",'-1').text('Please Select Semester'));
				$.each(object,function(key,value){
					$("#semester1").append('<option value='+value.semid+'>'+value.semvalue+'</option>');
				});
			});
	});
});
</script>
<script >

var returnval=true;
$(document).ready(function() {
	$("#save").click(function() {
		var str = $("#mail").val();
		alert(str);
		$.get("StudentRegistration", {
			email : str
		}).done(function(data)
		{
			alert(data);
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
		alert("alert from  first name and here return value is "+returnval);
	}
	if(name.length<3)
	{
		seterror("fname","*Your Name must Be 3 Latter.");
		
		returnval=false;
		alert("alert from first 1 name and here return value is "+returnval);
	}
	var mname=document.forms['myForm']["middlename"].value;
	
	if(mname.length==0)
	{
		seterror("mname","*Your Middle Name Can't be Empty");
		returnval=false;
		alert("alert from middle  name and here return value is "+returnval);
		
	}
	if(mname.length<3)
	{
		seterror("mname","*Your Middle Name must Be 3 Latter.");
		returnval=false;
		alert("alert from middle 1 name and here return value is "+returnval);
	}
	
	var lname=document.forms['myForm']["lastname"].value;
	
	if(lname.length==0)
	{
		seterror("lname","* Your Last Name Can't Be Empty");
		returnval=false;
		alert("alert from last  name and here return value is "+returnval);
	}
	if(lname.length<5)
	{
		seterror("lname","* Your Last Name Must be 5 Letter.");
		returnval=false;
		alert("alert from Last  1 name and here return value is "+returnval);
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
		alert("alert from email  name and here return value is "+returnval);
	}
	var address=document.forms['myForm']["address"].value;
	
	if(address.length==0)
	{
		seterror("faddress","* Please Enter Address");
		returnval=false;
		alert("alert from Adddress  name and here return value is "+returnval);
	}
	var password=document.forms['myForm']["password"].value;
	if(password.length==0)
	{
		seterror("pass","* Your Password Can't Be Empty");
		returnval=false;
		alert("alert from password  name and here return value is "+returnval);
	}
	var xender=document.forms['myForm']["gender"].value;
	if(xender==null)
	{
		seterror("xender","*Please Select Your Xender");	
		returnval=false;
		alert("alert from Xender  name and here return value is "+returnval);
	}
	if(xender=="no")
	{
		seterror("xender","*Please Select Valid Gender");	
		returnval=false;
		alert("alert from xender 1  name and here return value is "+returnval);
	}
	
	var stream=document.forms['myForm']["stream"].value;
	if(stream=="none")
	{
		seterror("streamselect","* Please Select Valid Stream");
		returnval=false;
		alert("alert from Stream   name and here return value is "+returnval);
	}
	
	var sem=document.forms['myForm']["semester"].value;
	if(sem==-1)
	{
		seterror("sem","* Please Select Valid Semester");
		returnval=false;
		alert("alert from sem  name and here return value is "+returnval);
	}
	
	var div=document.forms['myForm']["division"].value;
	if(div=="none")
	{
		seterror("division","* Please Select Valid Division");
		returnval=false;
		alert("alert from division  name and here return value is "+returnval);
	}
	alert("finally return value is "+returnval);
	return returnval;
}

/* function firstname()
{
    var nameInput = document.forms['myForm']["firstname"].value;
    var letters =/^[A-Za-z]+$/;
  if (nameInput.match(letters))
  {
    return true ;
  }
   else
  { 
	  alert("Please Enter Valid  First Name");
      return false;
  }
} */

/* function middlename() {
    var nameInput = document.forms['myForm']["middlename"].value;
    var letters =/^[A-Za-z]+$/;
    if (nameInput.match(letters))  {
    return true ;
  } else { 
	  alert("Please Enter Valid  Middle Name");
      return false;
  }
}
function lastname() {
    var nameInput = document.forms['myForm']["lastname"].value;
    var letters =/^[A-Za-z]+$/;
    if (nameInput.match(letters))  {
    return true ;
  } else { 
	  alert("Please Enter Valid  Last Name");
      return false;
  }
}*/



function fileValidation() {
    var fileInput = 
        document.getElementById('file');
      
    var filePath = fileInput.value;
 
    // Allowing file type
    var allowedExtensions = 
            /(\.jpg|\.jpeg|\.png|\.gif)$/i;
      
    if (!allowedExtensions.exec(filePath)) {
        alert('Invalid file type');
        fileInput.value = '';
        return false;
    } 
    else 
    { 
        // Image preview
        if (fileInput.files && fileInput.files[0]) {
        	alert("fileInput.files is "+fileInput.files);
        	alert("fileInput.files[0] is "+fileInput.files[0]);
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById(
                    'imageid').innerHTML = 
                    '<img src="' + e.target.result
                    + '"/>';
            };
              
            reader.readAsDataURL(fileInput.files[0]);
        }
    }
}

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
<!--         <div class="navbar navbar-expand-md header-menu-one bg-light">
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
        </div> -->
        <!-- Header Menu Area End Here -->
        <!-- Page Area Start Here -->
        <div class="dashboard-page-one">
            <!-- Sidebar Area Start Here -->
            
           <%-- <%@include file="sidebar-admin.jsp" %>
  --%>          
            <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <!-- <div class="breadcrumbs-area">
                    <h3>Student</h3>
                    <ul>
                        <li>
                            <a href="Admin.jsp">Home</a>
                        </li>
                        <li>Add New Student</li>
                        <li>
                            <a href="add-teacher.html">Add New Student</a>
                        </li>
                    </ul>
                </div>
 -->                <!-- Breadcubs Area End Here -->
                <!-- Add New Teacher Area Start Here -->
                <div class="card height-auto">
                    <div class="card-body">
                        <div class="heading-layout1">
                            <div class="item-title">
                                <h3>Sign Up </h3>
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
                        <form class="new-added-form" name="myForm" onsubmit="return validateForm()" action="StudentRegistration" method="post" enctype="multipart/form-data" >
                            <div class="row">
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="fname">
                                    <label>First Name *</label>
                                    <input type="text" placeholder="" id="fjname"  name="firstname" class="form-control"><span  class="formerror"><b></b></span>
                    				
                                </div>
                                <span id="fmessage"></span>
                                <!-- <div class="col-xl-3 col-lg-6 col-12 form-group">
                                	<label>Your role *</label> -->
                                	<input type="hidden" placeholder="" name="userrole" class="form-control" value="STUDENT" >
                                <!-- </div> -->
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="mname">
                                    <label>Middle Name *</label>
                                    <input type="text" placeholder=""  name="middlename" class="form-control"><span class="formerror"><b></b></span>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="lname">
                                    <label>Last Name *</label>
                                    <input type="text" placeholder=""   name="lastname" class="form-control"><span class="formerror"><b></b></span>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="xender">
                                    <label>Gender *</label>
                                    <select class="select2" name="gender" >
                                        <option value="no">Please Select Gender *</option> 
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Others">Others</option>
                                    </select><span class="formerror"><b></b></span>
                                </div>
                                
                                <div class="col-12-xxxl col-lg-6 col-12 form-group" id="streamselect">
                                       
                                            <label>Select Stream *</label>
                                            <select   class="select2" required="required" id="stream" name="stream">
                                            <option  value="none">Please select Stream</option>
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
                                            </select><span class="formerror"><b></b></span>
                                            <!-- <input type="text" placeholder="" class="form-control"> -->
                                        </div>
                                <!--  
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Date Of Birth *</label>
                                    <input type="text" placeholder="dd/mm/yyyy" class="form-control air-datepicker">
                                    <i class="far fa-calendar-alt"></i>
                                </div>
                                -->
                                <!--  
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>ID No</label>
                                    <input type="text" placeholder="" class="form-control">
                                </div>
                                -->
                                <!--  
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Blood Group *</label>
                                    <select class="select2">
                                        <option value="">Please Select Group *</option>
                                        <option value="1">A+</option>
                                        <option value="2">A-</option>
                                        <option value="3">B+</option>
                                        <option value="3">B-</option>
                                        <option value="3">O+</option>
                                        <option value="3">O-</option>
                                    </select>
                                </div>
                                -->
                                <!--  
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Religion *</label>
                                    <select class="select2">
                                        <option value="">Please Select Religion *</option>
                                        <option value="1">Islam</option>
                                        <option value="2">Hindu</option>
                                        <option value="3">Christian</option>
                                        <option value="3">Buddish</option>
                                        <option value="3">Others</option>
                                    </select>
                                </div>
                                -->
                                       <div class="col-12-xxxl col-lg-6 col-12 form-group" id="sem">
                                           <!--    <label>Select Year *</label>
                                            <input type="text" class="form-control" id="datepicker" />
                                            <i class="flaticon-calendar"></i> -->
                                            <label>Select Semester *</label>
                                            <select class="select2"  required="required" name="semester" id="semester1">
                                             <option>please select</option>
                                            </select><span class="formerror"><b></b></span>
                                        </div>
                                  <div class="col-xl-3 col-lg-6 col-12 form-group" id="division">
                                    <label>Select Division</label>
                                    <select class="select2" required="required" name="division">
                                        <option value="none">Please Select Division</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </select><span class="formerror"><b></b></span>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="femail">
                                    <label>E-Mail</label>
                                    <input type="email" id="mail" name="email" placeholder="" class="form-control"><span class="formerror"><b></b></span>
                                </div>
                                
                                <!--  
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Class *</label>
                                    <select class="select2">
                                        <option value="">Please Select Class *</option>
                                        <option value="1">Play</option>
                                        <option value="2">Nursery</option>
                                        <option value="3">One</option>
                                        <option value="3">Two</option>
                                        <option value="3">Three</option>
                                        <option value="3">Four</option>
                                        <option value="3">Five</option>
                                    </select>
                                </div>
                                -->
                                <!--  
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Section *</label>
                                    <select class="select2">
                                        <option value="">Please Select Section *</option>
                                        <option value="1">Pink</option>
                                        <option value="2">Blue</option>
                                        <option value="3">Bird</option>
                                        <option value="3">Rose</option>
                                        <option value="3">Red</option>
                                    </select>
                                </div>
                                -->
                                <!--  
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label>Address</label>
                                    <input type="text" placeholder="" class="form-control">
                                </div>
                                -->
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="pass">
                                    <label>Enter Password</label>
                                    <input autocomplete="off"
											class="form-control" id="password" type="password"
											name="password" 
											pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
											><i toggle="#password-field"
											class="fa fa-fw fa-eye field_icon toggle-password"></i><span class="formerror"><b></b></span>
                                </div>
                                
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="cpass">
                                    <label>Confirm Password</label>
                                    <input autocomplete="off"
											name="confirm_password" id="confirm_password" type="password"
											class="form-control">
											<span id='message'></span><span class="formerror"><b></b></span>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group" id="phone">
                                    <label>Phone</label>
                                    <input type="text" name="number" placeholder="" class="form-control"><span class="formerror"><b></b></span>
                                </div>
                                <div class="col-lg-6 col-12 form-group" id="faddress">
                                    <label>Address</label>
                                    <input type="hidden" id="commanvalue" value="null">
                                    <textarea class="textarea form-control" name="address" name="message" id="form-message" cols="10" rows="9"></textarea><span class="formerror"><b></b></span>
                                </div>
                                <div class="col-lg-6 col-12 form-group mg-t-30" id="imageid">
                                    <label class="text-dark-medium">Upload Student Photo (150px X 150px)</label>
                                    <input type="file" id="file" name="profile_photo" onchange="return fileValidation()" class="form-control-file">
                                </div>
                                <div class="col-12 form-group mg-t-8">
                                    <button type="submit" id="save" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Save</button>
                                    <button type="reset" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Reset</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Add New Teacher Area End Here -->
              <!--   <footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a href="#">PsdBosS</a></div>
                </footer> -->
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
    
    <!--  
	<script src="assets/js/jquery.min.js"></script>
	
	<script src="assets/vendors/bootstrap/js/popper.min.js"></script>
	
	<script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
	-->
	<script
		src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
	<script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
	<script src="assets/vendors/counter/waypoints-min.js"></script>
	<script src="assets/vendors/counter/counterup.min.js"></script>
	<script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
	<script src="assets/vendors/masonry/masonry.js"></script>
	<script src="assets/vendors/masonry/filter.js"></script>
	<script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
	<!--  <script src="assets/js/functions.js"></script>-->
	<script src="assets/js/contact.js"></script>
	
	
<script>
$('#password, #confirm_password').on('keyup', function () {
  if ($('#password').val() == $('#confirm_password').val()) 
  {

    $('#message').html('Matching').css('color', 'green');
    
  } else 
	  {
	  $('#message').html('Not Matching').css('color', 'red');
	  
	  }
});
</script>
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
