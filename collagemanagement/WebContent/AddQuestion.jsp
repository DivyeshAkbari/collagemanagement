<%@page import="com.collagemanagement.other.Encryption"%>
<%@page import="com.collagemanagement.bean.QuoraSession"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

<!doctype html>
<html class="no-js" lang="en">


<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Educhamp</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.png">
    <!-- Normalize Css -->
    <link rel="stylesheet" href="assets/assets4/css/normalize.css">
    <!-- Main Css -->
    <link rel="stylesheet" href="assets/assets4/css/main.css">
    <!-- Bootstrap Css -->
    <link rel="stylesheet" href="assets/assets4/css/bootstrap.min.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="assets/assets4/css/animate.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/assets4/css/fontawesome-all.min.css">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="assets/assets4/fonts/flaticon.css">
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="assets/assets4/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/assets4/css/owl.theme.default.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="style4.css">
    <!-- Modernizr Js -->
    <script src="js/modernizr-3.6.0.min.js"></script>
    
    	<!-- META ============================================= -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	<meta name="robots" content="" />
	
	
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
	
	<!-- REVOLUTION SLIDER CSS ============================================= -->
	<link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/layers.css">
	<link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/settings.css">
	<link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/navigation.css">
	<!-- REVOLUTION SLIDER END -->	
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#myModal").modal('show');
	});
</script>
    
    
    
    <style type="text/css">
    	
    	.formerror{
    	color:red;
    	}
    </style>
<script type="text/javascript">
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
	var returnval=true;
	clearErrors();
	var topicname=document.forms['myForm']['topicname'].value;
	
	
	if(topicname.length==0)
	{
		seterror("topicid","* Please Enter Topic Name");	
		returnval=false;
	}
	if(topicname.length<10)
	{
		seterror("topicid","* Topic Name atleast 10 Letters ");	
		returnval=false;
	}
	var ctype=document.forms['myForm']['ctype'].value;
	
	if(ctype=="none")
	{
		seterror("categoryid","* Please Select Category Type");
		returnval=false;
	}
	
	var tdescription=document.forms['myForm']['tdescription'].value;
	if(tdescription.length==0)
	{
		seterror("descriptionid","* Please Enter Discription");
		returnval=false;
	}
	
	if(tdescription.length<20)
	{
		seterror("descriptionid","* Discription atleast 20 Letters");
		returnval=false;
	}
	var tagname=document.forms['myForm']['tagname'].value;
	
	if(tagname.length==0)
	{
		seterror("tagid","* Please Enter TageName");
		returnval=false;
	}
	return returnval;
}
</script>
</head>

<jsp:include page ="/FetchTag"/>
<% List<QuoraSession>  taglist =(List)request.getAttribute("taglist"); %>
<body>

	 <%@include file="header.jsp" %>

<div id="myModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Asking a good Question</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
				<p>You are ready to ask your first programming-related question and the community is here to help! To get you the best answers, we have provided some guidance:
                  </p>
              <p><h1>1</h1>Summarize the problem
                </p>
                  <p><h1>2</h1>Describe what you have tried
                </p>
   
            </div>
        </div>
    </div>
</div>


    <!--[if lte IE 9]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
    <![endif]-->

    <!-- Add your site or application content here -->
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <!-- ScrollUp Start Here -->
    <a href="#wrapper" data-type="section-switch" class="scrollup">
        <i class="fas fa-angle-double-up"></i>
    </a>
    <!-- ScrollUp End Here -->
    <div id="wrapper" class="wrapper">
        <!-- Header Area Start Here -->
        
        <!-- Header Area End Here -->
        <!-- Inne Page Banner Area Start Here -->
        
        <!-- Inne Page Banner Area End Here -->
        <!-- Submit Recipe Area Start Here -->
        <section class="single-blog-page-wrap padding-top-80 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <div class="single-blog-box">               
                            <div class="leave-review">
                                <div class="section-heading3 heading-dark">
                                    <h2 class="item-heading">Post Your Question</h2>
                                </div>
                                <form class="leave-form-box" name="myForm" onsubmit="return validateForm()" action="PostQuery" method="post">
                                    <div class="row">
                                        <div class="col-md-4 form-group" id="topicid">
                                            <label>Topic Name :</label>
                                            <input type="text" placeholder="Topic" class="form-control" name="topicname"
                                              style="width:627px"  ><span  class="formerror"><b></b></span>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-12 form-group" id="descriptionid">
                                            <label>Description :</label>
                                            <textarea placeholder="" class="textarea form-control" name="tdescription" rows="7"
                                                cols="20" ></textarea><span  class="formerror"><b></b></span>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-md-4 form-group" id="tagid">
                                            <label>Tag :</label>
                                            <input type="text" placeholder="e.g Python" class="form-control" name="tagname"
                                                ><span  class="formerror"><b></b></span>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-md-4 form-group" id="categoryid">
                                            <label>Category :</label>
                                            <select class="filter-box" name="ctype" data-error="Category field is required" required>
                                                <option class="hidden" value="none" selected="" >Catogary Type</option>
                                                <option>M.Sc (CA&IT)</option>
                                                <option>MBA</option>
                                            </select><span  class="formerror"><b></b></span>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-12 form-group mb-0">
                                            <button type="submit" class="item-btn">POST REVIEW</button>
                                        </div>
                                    </div>
                                    <div class="form-response"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        
                        
                        
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">CATEGORIES</h3>
                            </div>
                            <div class="widget-categories">
                                <ul>
                                    <li>
                                        <a href="#">M.Sc
                                            
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">MBA
                                          
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">B.Tech
                                            
                                        </a>
                                    </li>
                                   <li>
                                        <a href="#">M.Tech
                                            
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">BCA
                                            
                                        </a>
                                    </li>
                                    
                                </ul>
                            </div>
                        </div>                 
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">POPULAR TAGS</h3>
                            </div>
                            <div class="widget-tag">
                               <% for(int i=0;i<taglist.size();i++)
                             { %>
                                     <% QuoraSession q1 = taglist.get(i); %>
                                       <%String incrypted=Encryption.encode(Integer.toString(q1.getTagid())); %>
                                <ul>
                                    <li class="single-item"><a href="getQuestions?id=<%=incrypted %>"><%=q1.getTagname() %></a></li>
                                </ul>
                              <% } %>  
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Submit Recipe Area End Here -->
        <!-- Footer Area Start Here -->
       
        <!-- Footer Area End Here -->
    </div>
    <!-- Search Box Start Here -->
    <div id="search" class="search-wrap">
        <button type="button" class="close">×</button>
        <form class="search-form">
            <input type="search" value="" placeholder="Type here........" />
            <button type="submit" class="search-btn"><i class="flaticon-search"></i></button>
        </form>
    </div>
    <!-- Search Box End Here -->
    <!-- Modal Start-->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="title-default-bold mb-none">Login</div>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form class="login-form">
                        <input class="main-input-box" type="text" placeholder="User Name" />
                        <input class="main-input-box" type="password" placeholder="Password" />
                        <div class="inline-box mb-5 mt-4">
                            <div class="checkbox checkbox-primary">
                                <input id="modal-checkbox" type="checkbox">
                                <label for="modal-checkbox">Remember Me</label>
                            </div>
                            <label class="lost-password"><a href="#">Lost your password?</a></label>
                        </div>
                        <div class="inline-box mb-5 mt-4">
                            <button class="btn-fill" type="submit" value="Login">Login</button>
                            <a href="#" class="btn-register"><i class="fas fa-user"></i>Register Here!</a>
                        </div>
                    </form>
                    <label>Login connect with your Social Network</label>
                    <div class="login-box-social">
                        <ul>
                            <li><a href="#" class="facebook"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#" class="twitter"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#" class="linkedin"><i class="fab fa-linkedin-in"></i></a></li>
                            <li><a href="#" class="google"><i class="fab fa-google-plus-g"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal End-->
    <!-- Jquery Js -->
	
<%-- 	<%@include file="footer.jsp" %> --%>

    <script src="assets/assets4/js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets/assets4/js/popper.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets/assets4/js/bootstrap.min.js"></script>
    <!-- Plugins Js -->
    <script src="assets/assets4/js/plugins.js"></script>
    <!-- Owl Carousel Js -->
    <script src="assets/assets4/js/owl.carousel.min.js"></script>
    <!-- Smoothscroll Js -->
    <script src="assets/assets4/js/smoothscroll.min.js"></script>
    <!-- Custom Js -->
    <script src="assets/assets4/js/main.js"></script>
</body>


</html>