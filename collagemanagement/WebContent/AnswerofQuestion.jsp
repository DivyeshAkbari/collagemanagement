<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.collagemanagement.bean.Answer"%>
    <%@page import="java.util.List"%>
    <%@page import="com.collagemanagement.bean.QuoraSession"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>Food Ordering HTML Template</title>
    <link rel="shortcut icon" href="assetsQ/images/favicon.png" type="image/x-icon">
    

    <link rel="stylesheet" href="assetsQ/css/icons.min.css">
    <link rel="stylesheet" href="assetsQ/css/bootstrap.min.css">
    <link rel="stylesheet" href="assetsQ/css/main.css">
    <link rel="stylesheet" href="assetsQ/css/red-color.css">
    <link rel="stylesheet" href="assetsQ/css/yellow-color.css">
    <link rel="stylesheet" href="assetsQ/css/responsive.css">
    
    
   
	
	<!-- FAVICONS ICON ============================================= -->
	<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
	
	<!-- PAGE TITLE HERE ============================================= -->
	<title>EduChamp : Education HTML Template </title>
	
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
</head>
<% List<QuoraSession>  answerList1 =(List)request.getAttribute("answerlist12"); %>
<% String id =(String)request.getAttribute("id"); %>
<% List<Answer>  answerList2 =(List)request.getAttribute("answerlist"); %>
<body itemscope>
     <%@include file="header.jsp" %>
     
    <main>
    
        <!-- <div class="preloader">
            <div id="cooking">
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div id="area">
                    <div id="sides">
                        <div id="pan"></div>
                        <div id="handle"></div>
                    </div>
                    <div id="pancake">
                        <div id="pastry"></div>
                    </div>
                </div>
            </div>
        </div>
         -->
         
         
        <!-- <header class="stick">
            <div class="topbar">
                <div class="container">
                    <div class="select-wrp">
                        <select data-placeholder="Feel Like Eating">
                            <option>FEEL LIKE EATING</option>
                            <option>Burger</option>
                            <option>Pizza</option>
                            <option>Fried Rice</option>
                            <option>Chicken Shots</option>
                        </select>
                    </div>
                    <div class="select-wrp">
                        <select data-placeholder="Choose Location">
                            <option>CHOOSE LOCATION</option>
                            <option>New york</option>
                            <option>Washington</option>
                            <option>Chicago</option>
                            <option>Los Angeles</option>
                        </select>
                    </div>
                    <div class="topbar-register">
                        <a class="log-popup-btn" href="#" title="Login" itemprop="url">LOGIN</a> / <a class="sign-popup-btn" href="#" title="Register" itemprop="url">REGISTER</a>
                    </div>
                    <div class="social1">
                        <a href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook-square"></i></a>
                        <a href="#" title="Twitter" itemprop="url" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>                
            </div>
            <div class="logo-menu-sec">
                <div class="container">
                    <div class="logo"><h1 itemprop="headline"><a href="index-2.html" title="Home" itemprop="url"><img src="assets/images/logo2.png" alt="logo.png" itemprop="image"></a></h1></div>
                    <nav>
                        <div class="menu-sec">
                            <ul>
                                <li class="menu-item-has-children"><a href="#" title="HOMEPAGES" itemprop="url"><span class="red-clr">FOOD ORDERING</span>HOMEPAGES</a>
                                    <ul class="sub-dropdown">
                                        <li><a href="index-2.html" title="HOMEPAGE 1" itemprop="url">HOMEPAGE 1</a></li>
                                        <li><a href="index2.html" title="HOMEPAGE 2" itemprop="url">HOMEPAGE 2</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="#" title="RESTAURANTS" itemprop="url"><span class="red-clr">REAL FOOD</span>RESTAURANTS</a>
                                    <ul class="sub-dropdown">
                                        <li><a href="restaurant-found.html" title="RESTAURANT 1" itemprop="url">RESTAURANT 1</a></li>
                                        <li><a href="restaurant-found2.html" title="RESTAURANT 2" itemprop="url">RESTAURANT 2</a></li>
                                        <li><a href="restaurant-detail.html" title="RESTAURANT DETAILS" itemprop="url">RESTAURANT DETAILS</a></li>
                                        <li><a href="food-recipes.html" title="RESTAURANT DETAILS" itemprop="url">FOOD RECIPES</a></li>
                                        <li><a href="our-articles.html" title="RESTAURANT DETAILS" itemprop="url">OUR ARTICLES</a></li>
                                        <li><a href="our-menu.html" title="RESTAURANT DETAILS" itemprop="url">OUR MENU</a></li>
                                        <li><a href="our-services.html" title="RESTAURANT DETAILS" itemprop="url">OUR SERVICES</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="#" title="PAGES" itemprop="url"><span class="red-clr">REAL FOOD</span>PAGES</a>
                                    <ul class="sub-dropdown">
                                        <li class="menu-item-has-children"><a href="#" title="BLOG" itemprop="url">BLOG</a>
                                            <ul class="sub-dropdown">
                                                <li class="menu-item-has-children"><a href="#" title="BLOG LAYOUTS" itemprop="url">BLOG LAYOUTS</a>
                                                    <ul class="sub-dropdown">
                                                        <li><a href="blog-right-sidebar.html" title="BLOG WITH RIGHT SIDEBAR" itemprop="url">BLOG (W.R.S)</a></li>
                                                        <li><a href="blog-left-sidebar.html" title="BLOG WITH LEFT SIDEBAR" itemprop="url">BLOG (W.L.S)</a></li>
                                                        <li><a href="blog.html" title="BLOG WITH NO SIDEBAR" itemprop="url">BLOG</a></li>
                                                    </ul>
                                                </li>
                                                <li class="menu-item-has-children"><a href="#" title="BLOG DETAIL" itemprop="url">BLOG DETAIL</a>
                                                    <ul class="sub-dropdown">
                                                        <li><a href="blog-detail-right-sidebar.html" title="BLOG DETAIL WITH RIGHT SIDEBAR" itemprop="url">BLOG DETAIL (W.R.S)</a></li>
                                                        <li><a href="blog-detail-left-sidebar.html" title="BLOG DETAIL WITH LEFT SIDEBAR" itemprop="url">BLOG DETAIL (W.L.S)</a></li>
                                                        <li><a href="blog-detail.html" title="BLOG DETAIL WITH NO SIDEBAR" itemprop="url">BLOG DETAIL</a></li>
                                                    </ul>
                                                </li>
                                                <li class="menu-item-has-children"><a href="#" title="BLOG FORMATES" itemprop="url">BLOG FORMATES</a>
                                                    <ul class="sub-dropdown">
                                                        <li><a href="blog-detail-video.html" title="BLOG DETAIL WITH VIDEO" itemprop="url">BLOG DETAIL (VIDEO)</a></li>
                                                        <li><a href="blog-detail-audio.html" title="BLOG DETAIL WITH AUDIO" itemprop="url">BLOG DETAIL (AUDIO)</a></li>
                                                        <li><a href="blog-detail-carousel.html" title="BLOG DETAIL WITH CAROUSEL" itemprop="url">BLOG DETAIL (CAROUSEL)</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="#" title="SPECIAL PAGES" itemprop="url">SPECIAL PAGES</a>
                                            <ul class="sub-dropdown">
                                                <li><a href="404.html" title="404 ERROR" itemprop="url">404 ERROR</a></li>
                                                <li><a href="search-found.html" title="SEARCH FOUND" itemprop="url">SEARCH FOUND</a></li>
                                                <li><a href="search-not-found.html" title="SEARCH NOT FOUND" itemprop="url">SEARCH NOT FOUND</a></li>
                                                <li><a href="coming-soon.html" title="COMING SOON" itemprop="url">COMING SOON</a></li>
                                                <li><a href="login-register.html" title="LOGIN & REGISTER" itemprop="url">LOGIN & REGISTER</a></li>
                                                <li><a href="price-table.html" title="PRICE TABLE" itemprop="url">PRICE TABLE</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="#" title="GALLERY" itemprop="url">GALLERY</a>
                                            <ul class="sub-dropdown">
                                                <li><a href="gallery.html" title="FOOD GALLERY" itemprop="url">FOOD GALLERY</a></li>
                                                <li><a href="gallery-detail.html" title="GALLERY DETAIL" itemprop="url">GALLERY DETAIL</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="register-reservation.html" title="REGISTER RESERVATION" itemprop="url">REGISTER RESERVATION</a></li>
                                        <li><a href="how-it-works.html" title="HOW IT WORKS" itemprop="url">HOW IT WORKS</a></li>
                                        <li><a href="dashboard.html" title="USER PROFILE" itemprop="url">USER PROFILE</a></li>
                                        <li><a href="about-us.html" title="ABOUT US" itemprop="url">ABOUT US</a></li>
                                        <li><a href="food-detail.html" title="FOOD DETAIL" itemprop="url">FOOD DETAIL</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html" title="CONTACT US" itemprop="url"><span class="red-clr">REAL FOOD</span>CONTACT US</a></li>
                            </ul>
                            <a class="red-bg brd-rd4" href="register-reservation.html" title="Register" itemprop="url">REGISTER RESTAURANT</a>
                        </div>
                    </nav>
                </div>
            </div>
        </header> -->

        <!-- <div class="responsive-header">
            <div class="responsive-topbar">
                <div class="select-wrp">
                    <select data-placeholder="Feel Like Eating">
                        <option>FEEL LIKE EATING</option>
                        <option>Burger</option>
                        <option>Pizza</option>
                        <option>Fried Rice</option>
                        <option>Chicken Shots</option>
                    </select>
                </div>
                <div class="select-wrp">
                    <select data-placeholder="Choose Location">
                        <option>CHOOSE LOCATION</option>
                        <option>New york</option>
                        <option>Washington</option>
                        <option>Chicago</option>
                        <option>Los Angeles</option>
                    </select>
                </div>
            </div>
            <div class="responsive-logomenu">
                <div class="logo"><h1 itemprop="headline"><a href="index-2.html" title="Home" itemprop="url"><img src="assets/images/logo.png" alt="logo.png" itemprop="image"></a></h1></div>
                <span class="menu-btn yellow-bg brd-rd4"><i class="fa fa-align-justify"></i></span>
            </div>
            <div class="responsive-menu">
                <span class="menu-close red-bg brd-rd3"><i class="fa fa-close"></i></span>
                <div class="menu-lst">
                    <ul>
                        <li class="menu-item-has-children"><a href="#" title="HOMEPAGES" itemprop="url"><span class="yellow-clr">FOOD ORDERING</span>HOMEPAGES</a>
                            <ul class="sub-dropdown">
                                <li><a href="index-2.html" title="HOMEPAGE 1" itemprop="url">HOMEPAGE 1</a></li>
                                <li><a href="index2.html" title="HOMEPAGE 2" itemprop="url">HOMEPAGE 2</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children"><a href="#" title="RESTAURANTS" itemprop="url"><span class="yellow-clr">REAL FOOD</span>RESTAURANTS</a>
                            <ul class="sub-dropdown">
                                <li><a href="restaurant-found.html" title="RESTAURANT 1" itemprop="url">RESTAURANT 1</a></li>
                                <li><a href="restaurant-found2.html" title="RESTAURANT 2" itemprop="url">RESTAURANT 2</a></li>
                                <li><a href="restaurant-detail.html" title="RESTAURANT DETAILS" itemprop="url">RESTAURANT DETAILS</a></li>
                                <li><a href="restaurant-detail.html" title="RESTAURANT DETAILS" itemprop="url">RESTAURANT DETAILS</a></li>
                                <li><a href="food-recipes.html" title="RESTAURANT DETAILS" itemprop="url">FOOD RECIPES</a></li>
                                <li><a href="our-articles.html" title="RESTAURANT DETAILS" itemprop="url">OUR ARTICLES</a></li>
                                <li><a href="our-menu.html" title="RESTAURANT DETAILS" itemprop="url">OUR MENU</a></li>
                                <li><a href="our-services.html" title="RESTAURANT DETAILS" itemprop="url">OUR SERVICES</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children"><a href="#" title="PAGES" itemprop="url"><span class="yellow-clr">REAL FOOD</span>PAGES</a>
                            <ul class="sub-dropdown">
                                <li class="menu-item-has-children"><a href="#" title="BLOG" itemprop="url">BLOG</a>
                                    <ul class="sub-dropdown">
                                        <li class="menu-item-has-children"><a href="#" title="BLOG LAYOUTS" itemprop="url">BLOG LAYOUTS</a>
                                            <ul class="sub-dropdown">
                                                <li><a href="blog-right-sidebar.html" title="BLOG WITH RIGHT SIDEBAR" itemprop="url">BLOG (W.R.S)</a></li>
                                                <li><a href="blog-left-sidebar.html" title="BLOG WITH LEFT SIDEBAR" itemprop="url">BLOG (W.L.S)</a></li>
                                                <li><a href="blog.html" title="BLOG WITH NO SIDEBAR" itemprop="url">BLOG</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="#" title="BLOG DETAIL" itemprop="url">BLOG DETAIL</a>
                                            <ul class="sub-dropdown">
                                                <li><a href="blog-detail-right-sidebar.html" title="BLOG DETAIL WITH RIGHT SIDEBAR" itemprop="url">BLOG DETAIL (W.R.S)</a></li>
                                                <li><a href="blog-detail-left-sidebar.html" title="BLOG DETAIL WITH LEFT SIDEBAR" itemprop="url">BLOG DETAIL (W.L.S)</a></li>
                                                <li><a href="blog-detail.html" title="BLOG DETAIL WITH NO SIDEBAR" itemprop="url">BLOG DETAIL</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="#" title="BLOG FORMATES" itemprop="url">BLOG FORMATES</a>
                                            <ul class="sub-dropdown">
                                                <li><a href="blog-detail-video.html" title="BLOG DETAIL WITH VIDEO" itemprop="url">BLOG DETAIL (VIDEO)</a></li>
                                                <li><a href="blog-detail-audio.html" title="BLOG DETAIL WITH AUDIO" itemprop="url">BLOG DETAIL (AUDIO)</a></li>
                                                <li><a href="blog-detail-carousel.html" title="BLOG DETAIL WITH CAROUSEL" itemprop="url">BLOG DETAIL (CAROUSEL)</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="#" title="SPECIAL PAGES" itemprop="url">SPECIAL PAGES</a>
                                    <ul class="sub-dropdown">
                                        <li><a href="404.html" title="404 ERROR" itemprop="url">404 ERROR</a></li>
                                        <li><a href="search-found.html" title="SEARCH FOUND" itemprop="url">SEARCH FOUND</a></li>
                                        <li><a href="search-not-found.html" title="SEARCH NOT FOUND" itemprop="url">SEARCH NOT FOUND</a></li>
                                        <li><a href="coming-soon.html" title="COMING SOON" itemprop="url">COMING SOON</a></li>
                                        <li><a href="login-register.html" title="LOGIN & REGISTER" itemprop="url">LOGIN & REGISTER</a></li>
                                        <li><a href="price-table.html" title="PRICE TABLE" itemprop="url">PRICE TABLE</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="#" title="GALLERY" itemprop="url">GALLERY</a>
                                    <ul class="sub-dropdown">
                                        <li><a href="gallery.html" title="FOOD GALLERY" itemprop="url">FOOD GALLERY</a></li>
                                        <li><a href="gallery-detail.html" title="GALLERY DETAIL" itemprop="url">GALLERY DETAIL</a></li>
                                    </ul>
                                </li>
                                <li><a href="register-reservation.html" title="REGISTER RESERVATION" itemprop="url">REGISTER RESERVATION</a></li>
                                <li><a href="how-it-works.html" title="HOW IT WORKS" itemprop="url">HOW IT WORKS</a></li>
                                <li><a href="dashboard.html" title="USER PROFILE" itemprop="url">USER PROFILE</a></li>
                                <li><a href="about-us.html" title="ABOUT US" itemprop="url">ABOUT US</a></li>
                                <li><a href="food-detail.html" title="FOOD DETAIL" itemprop="url">FOOD DETAIL</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html" title="CONTACT US" itemprop="url"><span class="yellow-clr">REAL FOOD</span>CONTACT US</a></li>
                    </ul>
                </div>
                <div class="topbar-register">
                    <a class="log-popup-btn" href="#" title="Login" itemprop="url">LOGIN</a> / <a class="sign-popup-btn" href="#" title="Register" itemprop="url">REGISTER</a>
                </div>
                <div class="social1">
                    <a href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook-square"></i></a>
                    <a href="#" title="Twitter" itemprop="url" target="_blank"><i class="fa fa-twitter"></i></a>
                    <a href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i></a>
                </div>
                <div class="register-btn">
                    <a class="yellow-bg brd-rd4" href="register-reservation.html" title="Register" itemprop="url">REGISTER RESTAURANT</a>
                </div>
            </div>
        </div> -->

        <!-- <section>
            <div class="block">
                <div class="fixed-bg" style="background-image: url(assets/images/topbg.jpg);"></div>
                <div class="page-title-wrapper text-center">
                    <div class="col-md-12 col-sm-12 col-lg-12">
                        <div class="page-title-inner">
                            <h1 itemprop="headline">Blog Detail With Left Sidebar</h1>
                                <span>A Greate Restaurant Website</span>
                        </div>
                    </div>
                </div>
            </div>
        </section> -->

        <!-- <div class="bread-crumbs-wrapper">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#" title="" itemprop="url">Home</a></li>
                    <li class="breadcrumb-item active">Blog Detail With Left Sidebar</li>
                </ol>
            </div>
        </div> -->

        <section>
            <div class="block less-spacing gray-bg top-padd30">
                
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                            <div class="sec-box">                                    
    							<div class="col-md-9 col-sm-12 col-lg-9">
    								<div class="blog-detail-wrapper">
    									<div class="blog-detail-thumb wow fadeIn" data-wow-delay="0.2s">
    										<!-- <img src="assets/images/resource/blog-detial-img.jpg" alt="blog-detial-img.jpg" itemprop="image"> -->
    									</div>
    									
    									
    									
    									<blockquote><p itemprop="headline">Michel ivauedaus rutrum mi utercture aliquam In habitasse platore dictumst. Integer sagittis  vulputate  similique sunt in culpa qui officia deserunt.</p></blockquote>
    									<p itemprop="description">Rennie White, an advertising manager in New York City, leaves for work 10 minutes later these days because she no longer has to wait in line for coffee at a Dunkin' Donuts outlet. Instead, she preorders coffee by sending a text message from her cellphone on the way to work. "I can get off the train and get the coffee and not break my flow," Ms. White says</p>
    									<p itemprop="description"><a class="alignnone wow fadeIn" data-wow-delay="0.2s" href="assetsQ/images/resource/blog-detial-img2.jpg" data-fancybox="gallery" title="" itemprop="url"><img src="assetsQ/images/resource/blog-detial-img2.jpg" alt="blog-detial-img2.jpg" itemprop="image"></a></p>
    									
    									
    									<p itemprop="description"></p>
    									<div class="blog-detail-info">
    										<span class="post-detail-date red-clr"><i class="fa fa-clock-o"></i> August 10, 2017</span>
    										<div class="post-meta">
    											<span><i class="fa fa-eye red-clr"></i> 95 Views</span>
    											<span><i class="fa fa-comment-o red-clr"></i> 5 Comments</span>
    										</div>
    									</div>
    									<div class="post-share">
    										<span>Share:</span>
    										<a class="brd-rd2" href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook"></i></a>
    										<a class="brd-rd2" href="#" title="Twitter" itemprop="url" target="_blank"><i class="fa fa-twitter"></i></a>
    										<a class="brd-rd2" href="#" title="Pinterest" itemprop="url" target="_blank"><i class="fa fa-pinterest"></i></a>
    										<a class="brd-rd2" href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i></a>
    										<a class="brd-rd2" href="#" title="Linkedin" itemprop="url" target="_blank"><i class="fa fa-linkedin"></i></a>
    										<a class="brd-rd2" href="#" title="Vimeo" itemprop="url" target="_blank"><i class="fa fa-vimeo"></i></a>
    									</div>
    									<div class="post-next-prev">
    										<a class="prev-post" href="#" title="Previous Post" itemprop="url"><i class="fa fa-angle-left"></i> PREV</a> -
    										<a class="next-post" href="#" title="Next Post" itemprop="url">NEXT <i class="fa fa-angle-right"></i></a>
    									</div>
    									
    									
    									
    									<p itemprop="description"><span class="big-letter"></span> <a class="alignnone wow fadeIn" data-wow-delay="0.2s" href="assetsQ/images/resource/blog-detial-img3.jpg" data-fancybox="gallery" title="" itemprop="url"></a> </p>
    									<h1 itemprop="headline"><% for(int i=0;i<answerList1.size();i++)
												{ %>
												<tr>	
														<% QuoraSession q1=answerList1.get(i); %>
														<td><%=q1.getTopicname()%></td>
														
														
													</tr>
											<% } %></h1>
    									<div class="post-tags red-clr">
    										<span>Tags:</span>
    										<a href="#" title="" itemprop="url">#fish</a>,<a href="#" title="" itemprop="url">#pasta</a>,<a href="#" title="" itemprop="url">#soups</a>
    									</div>
    									<div class="post-cate red-clr">
    										<span>Category:</span>
    										<a href="#" title="Italian cuisine" itemprop="url">Italian cuisine</a>
    									</div>
    									    								</div>
    								
    								
    								
    								<div class="author-info-wrapper">
    								
    									<h3 class="title4" itemprop="headline"><span class="sudo-bottom sudo-bg-red">About</span> The Author</h3>
    									<div class="author-box">
    										<img class="brd-rd50" src="assetsQ/images/resource/author-img.jpg" alt="author-img.jpg" itemprop="image">
    										<div class="author-info">
    											<h4 itemprop="headline"><a href="#" title="" itemprop="url"><% for(int i=0;i<answerList1.size();i++)
                                                    { %>
                                                    <tr>	
                                                            <% QuoraSession q1=answerList1.get(i); %>
                                                            <td><%=q1.getUsername()%></td>
                                                            
                                                            
                                                        </tr>
                                                <% } %>
                                        </a></h4>
                                        <%if(answerList1!=null) {%>
    											<p itemprop="description"><% for(int i=0;i<answerList1.size();i++)
                                                    { %>
                                                    	
                                                            <% QuoraSession q1=answerList1.get(i); %>
                                                            
                                                           	<%=q1.getTdescription()%>
                                                          <%=q1.getTopicname()%>
                                                            
                                                       
                                                	<% } %>
                                                <% } %></p>
    											<a class="red-clr" href="#" title="Webinane" itemprop="url" target="_blank">webinane.com</a>
    										</div>
    									</div>
    								</div>
    								<%if(answerList2!=null) {%>
    								<div class="comments-wrapper">
    									<h3 class="title4" itemprop="headline"><span class="sudo-bottom sudo-bg-red">Comm</span>ents (2)</h3>
    									<ul class="comments-thread">
    										<li>
    											<div class="comment">
    												<img class="brd-rd50" src="assetsQ/images/resource/comment1.jpg" alt="comment1.jpg">
    												<%int l=0; %>
    												<div class="comment-info">
    													<h4 itemprop="headline"><a href="#" title="" itemprop="url">
    													
    													<%if(l==0) 
    												    {%>
    															<% for(int i=0;i<answerList2.size();i++)
                                                   		 		{ %>
                                                  
                                                           			 <% Answer ans=answerList2.get(i); %>
                                                            
                                                            		<%=ans.getUsername()%>
                                                           			                
                                                				<% } %>
                                                		<% } %>
                                                		
                                                </a></h4>
    													<i>17 August 2018 at 12.00pm / <a class="comment-reply-link red-clr" href="#" title="" itemprop="url">Reply</a></i>
    													<p itemprop="description"> 
    													<% for(int i=0;i<answerList2.size();i++)
                                                    { %>
                                                  
                                                            <% Answer ans=answerList2.get(i); %>
                                                            
                                                            <%=ans.getAnswerdescription()%>
                                                                            
                                                <% } %>
    													</p>
    												</div>
    											</div>
    											
    										</li>
    									</ul>
    								</div>
    								<% }%>
    								
    								<div class="leav-comment-wrapper">
    									<h3 class="title4" itemprop="headline"><span class="sudo-bottom sudo-bg-red">Leave</span> a Reply</h3>
    									<form class="reply-form" action="InsertAnswerDescription" method="post">
    										<div class="row">
    											<!-- <div class="col-md-4 col-sm-6 col-lg-4">
    												<input class="brd-rd2" type="text" placeholder="Name">
    											</div>
    											<div class="col-md-4 col-sm-6 col-lg-4">
    												<input class="brd-rd2" type="email" placeholder="Email">
    											</div>
    											<div class="col-md-4 col-sm-12 col-lg-4">
    												<input class="brd-rd2" type="text" placeholder="Subject">
    											</div> -->
    											<div class="col-md-4 col-sm-12 col-lg-4">
    												<input class="brd-rd2" type="hidden" name="id" value=<%=id %> placeholder="id">
    											</div>
    											
    											<div class="col-md-12 col-sm-12 col-lg-12">
    												<textarea class="brd-rd2" name="answerdescription" placeholder="Message" ></textarea>
    											</div>
    											<div class="col-md-12 col-sm-12 col-lg-12">
    												<button class="brd-rd3 red-bg" type="submit">SUBMIT NOW</button>
    											</div>
    										</div>
    									</form>
    								</div>
    							</div>
    							<div class="col-md-3 col-sm-12 col-lg-3">
    								<div class="sidebar right">
    									<div class="widget style2 Search_filters wow fadeIn" data-wow-delay="0.2s">
    										<h4 class="widget-title2 sudo-bg-red" itemprop="headline">Search Filters</h4>
    										<div class="widget-data">
    											<ul>
    												<li><a href="#" title="" itemprop="url">Fast Food</a> </li>
    												<li><a href="#" title="" itemprop="url">North Indian</a> </li>
    												<li><a href="#" title="" itemprop="url">Chinese</a> </li>
    												<li><a href="#" title="" itemprop="url">Bakery</a> </li>
    												<li><a href="#" title="" itemprop="url">Mughlai</a> </li>
    												<li><a href="#" title="" itemprop="url">Pizza</a> </li>
    												<li><a href="#" title="" itemprop="url">Ice Cream</a></li>
    												<li><a href="#" title="" itemprop="url">Rolls</a> </li>
    												<li><a href="#" title="" itemprop="url">Cafe</a> </li>
    												<li><a href="#" title="" itemprop="url">Italian</a> </li>
    											</ul>
    										</div>
    									</div>
    								
    									<!-- <div class="widget style2 quick_filters wow fadeIn" data-wow-delay="0.2s">
    										<h4 class="widget-title2 sudo-bg-red" itemprop="headline">Quick Filters</h4>
    										<div class="widget-data">
    											<ul>
    												<li><span class="radio-box"><input type="radio" name="filter" id="filt1-1"><label for="filt1-1">Promotions</label></span></li>
    												<li><span class="radio-box"><input type="radio" name="filter" id="filt1-2"><label for="filt1-2">Bookmarked</label></span></li>
    												<li><span class="radio-box"><input type="radio" name="filter" id="filt1-3"><label for="filt1-3">Pure veg</label></span></li>
    												<li><span class="radio-box"><input type="radio" name="filter" id="filt1-4"><label for="filt1-4">Free Delivery</label></span></li>
    												<li><span class="radio-box"><input type="radio" name="filter" id="filt1-5"><label for="filt1-5">Online Payments</label></span></li>
    											</ul>
    										</div>
    									</div> -->
    									
    									<div class="widget style2 popular_posts wow fadeIn" data-wow-delay="0.2s">
    										<h4 class="widget-title2 sudo-bg-red" itemprop="headline">Popular Posts</h4>
    										<div class="widget-data">
    											<div class="mini-posts-list">
    												<div class="mini-post-item">
    													<a href="blog-detail-right-sidebar.html" title="" itemprop="url"><img class="brd-rd2" src="assetsQ/images/resource/popular-post-img1.jpg" alt="popular-post-img1.jpg" itemprop="image"></a>
    													<div class="mini-post-info">
    														<h5 itemprop="headline"><a href="blog-detail-right-sidebar.html" title="" itemprop="url">Food Tech</a></h5>
    														<span class="mini-post-data"><i class="fa fa-clock-o"></i> August 10, 2017</span>
    													</div>
    												</div>
    												<div class="mini-post-item">
    													<a href="blog-detail-left-sidebar.html" title="" itemprop="url"><img class="brd-rd2" src="assetsQ/images/resource/popular-post-img2.jpg" alt="popular-post-img2.jpg" itemprop="image"></a>
    													<div class="mini-post-info">
    														<h5 itemprop="headline"><a href="blog-detail-left-sidebar.html" title="" itemprop="url">Food Tech</a></h5>
    														<span class="mini-post-data"><i class="fa fa-clock-o"></i> November 12, 2017</span>
    													</div>
    												</div>
    												<div class="mini-post-item">
    													<a href="blog-detail.html" title="" itemprop="url"><img class="brd-rd2" src="assetsQ/images/resource/popular-post-img3.jpg" alt="popular-post-img3.jpg" itemprop="image"></a>
    													<div class="mini-post-info">
    														<h5 itemprop="headline"><a href="blog-detail.html" title="" itemprop="url">Food Tech</a></h5>
    														<span class="mini-post-data"><i class="fa fa-clock-o"></i> May 15, 2017</span>
    													</div>
    												</div>
    												<div class="mini-post-item">
    													<a href="blog-detail-right-sidebar.html" title="" itemprop="url"><img class="brd-rd2" src="assetsQ/images/resource/popular-post-img4.jpg" alt="popular-post-img4.jpg" itemprop="image"></a>
    													<div class="mini-post-info">
    														<h5 itemprop="headline"><a href="blog-detail-right-sidebar.html" title="" itemprop="url">Food Tech</a></h5>
    														<span class="mini-post-data"><i class="fa fa-clock-o"></i> March 20, 2017</span>
    													</div>
    												</div>
    											</div>
    										</div>
    									</div>
    									<div class="widget style2 category_posts wow fadeIn" data-wow-delay="0.2s">
    										<h4 class="widget-title2 sudo-bg-red" itemprop="headline">Categories</h4>
    										<div class="widget-data">
    											<div class="mini-posts-list">
    												<div class="mini-post-item">
    													<a href="blog-detail-right-sidebar.html" title="" itemprop="url"><img class="brd-rd2" src="assetsQ/images/resource/popular-post-img2-1.jpg" alt="popular-post-img2-1.jpg" itemprop="image"></a>
    													<div class="mini-post-info">
    														<h5 itemprop="headline"><a href="blog-detail-right-sidebar.html" title="" itemprop="url">Food Tech</a></h5>
    														<span class="mini-post-data"><i class="fa fa-clock-o"></i> August 10, 2017</span>
    													</div>
    												</div>
    												<div class="mini-post-item">
    													<a href="blog-detail-left-sidebar.html" title="" itemprop="url"><img class="brd-rd2" src="assetsQ/images/resource/popular-post-img2-2.jpg" alt="popular-post-img2-2.jpg" itemprop="image"></a>
    													<div class="mini-post-info">
    														<h5 itemprop="headline"><a href="blog-detail-left-sidebar.html" title="" itemprop="url">Food Tech</a></h5>
    														<span class="mini-post-data"><i class="fa fa-clock-o"></i> November 12, 2017</span>
    													</div>
    												</div>
    												<div class="mini-post-item">
    													<a href="blog-detail.html" title="" itemprop="url"><img class="brd-rd2" src="assetsQ/images/resource/popular-post-img2-3.jpg" alt="popular-post-img2-3.jpg" itemprop="image"></a>
    													<div class="mini-post-info">
    														<h5 itemprop="headline"><a href="blog-detail.html" title="" itemprop="url">Food Tech</a></h5>
    														<span class="mini-post-data"><i class="fa fa-clock-o"></i> May 15, 2017</span>
    													</div>
    												</div>
    												<div class="mini-post-item">
    													<a href="blog-detail-right-sidebar.html" title="" itemprop="url"><img class="brd-rd2" src="assetsQ/images/resource/popular-post-img2-4.jpg" alt="popular-post-img2-4.jpg" itemprop="image"></a>
    													<div class="mini-post-info">
    														<h5 itemprop="headline"><a href="blog-detail-right-sidebar.html" title="" itemprop="url">Food Tech</a></h5>
    														<span class="mini-post-data"><i class="fa fa-clock-o"></i> March 20, 2017</span>
    													</div>
    												</div>
    											</div>
    										</div>
    									</div>
    								</div><!--Sidebar -->
    							</div>
                            </div>
                        </div>
                        </div>
                    </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
<!-- 
        <footer>
            <div class="block top-padd80 bottom-padd80 dark-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-lg-12">
                            <div class="footer-data">
                                <div class="row">
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget about_widget wow fadeIn" data-wow-delay="0.1s">
                                            <div class="logo"><h1 itemprop="headline"><a href="#" title="Home" itemprop="url"><img src="assets/images/logo.png" alt="logo.png" itemprop="image"></a></h1></div>
                                            <p itemprop="description">Food Ordering is a Premium HTML Template. Best choice for your online store. Let purchase it to enjoy now</p>
                                            <div class="social2">
                                                <a class="brd-rd50" href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook"></i></a>
                                                <a class="brd-rd50" href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i></a>
                                                <a class="brd-rd50" href="#" title="Twitter" itemprop="url" target="_blank"><i class="fa fa-twitter"></i></a>
                                                <a class="brd-rd50" href="#" title="Pinterest" itemprop="url" target="_blank"><i class="fa fa-pinterest"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget information_links wow fadeIn" data-wow-delay="0.2s">
                                            <h4 class="widget-title" itemprop="headline">INFORMATION</h4>
                                            <ul>
                                                <li><a href="#" title="" itemprop="url">Careers</a></li>
                                                <li><a href="#" title="" itemprop="url">Investor Relations</a></li>
                                                <li><a href="#" title="" itemprop="url">Press Releases</a></li>
                                                <li><a href="#" title="" itemprop="url">Shop with Points</a></li>
                                                <li><a href="#" title="" itemprop="url">More Branches</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget customer_care wow fadeIn" data-wow-delay="0.3s">
                                            <h4 class="widget-title" itemprop="headline">CUSTOMER CARE</h4>
                                            <ul>
                                                <li><a href="#" title="" itemprop="url">Returns</a></li>
                                                <li><a href="#" title="" itemprop="url">Shipping Info</a></li>
                                                <li><a href="#" title="" itemprop="url">Gift Cards</a></li>
                                                <li><a href="#" title="" itemprop="url">Size Guide</a></li>
                                                <li><a href="#" title="" itemprop="url">Money Back</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget get_in_touch wow fadeIn" data-wow-delay="0.4s">
                                            <h4 class="widget-title" itemprop="headline">GET IN TOUCH</h4>
                                            <ul>
                                               <li><i class="fa fa-map-marker"></i> 123 New Design Str, ABC Building, melbourne, Australia.</li>
                                               <li><i class="fa fa-phone"></i> (0044) 8647 1234 587</li>
                                               <li><i class="fa fa-envelope"></i> <a href="#" title="" itemprop="url">hello@yourdomain.com</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer> -->
        <!-- <div class="bottom-bar dark-bg text-center">
            <div class="container">
                <p itemprop="description"><a target="_blank" href="https://www.templateshub.net">Templates Hub</a></p>
            </div>
        </div> -->

        <div class="log-popup text-center">
            <div class="sign-popup-wrapper brd-rd5">
                <div class="sign-popup-inner brd-rd5">
                    <a class="log-close-btn" href="#" title="" itemprop="url"><i class="fa fa-close"></i></a>
                    <div class="sign-popup-title text-center">
                        <h4 itemprop="headline">SIGN IN</h4>
                        <span>with your social network</span>
                    </div>
                    <div class="popup-social text-center">
                        <a class="facebook brd-rd3" href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook"></i> Facebook</a>
                        <a class="google brd-rd3" href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i> Google</a>
                        <a class="twitter brd-rd3" href="#" title="Twitter" itemprop="url" target="_blank"><i class="fa fa-twitter"></i> Twitter</a>
                    </div>
                    <span class="popup-seprator text-center"><i class="brd-rd50">or</i></span>
                    <form class="sign-form">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <input class="brd-rd3" type="text" placeholder="Username or Email">
                            </div>
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <input class="brd-rd3" type="password" placeholder="Password">
                            </div>
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <button class="red-bg brd-rd3" type="submit">SIGN IN</button>
                            </div>
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <a class="sign-btn" href="#" title="" itemprop="url">Not a member? Sign up</a>
                                <a class="recover-btn" href="#" title="" itemprop="url">Recover my password</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="sign-popup text-center">
            <div class="sign-popup-wrapper brd-rd5">
                <div class="sign-popup-inner brd-rd5">
                    <a class="sign-close-btn" href="#" title="" itemprop="url"><i class="fa fa-close"></i></a>
                    <div class="sign-popup-title text-center">
                        <h4 itemprop="headline">SIGN UP</h4>
                        <span>with your social network</span>
                    </div>
                    <div class="popup-social text-center">
                        <a class="facebook brd-rd3" href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook"></i> Facebook</a>
                        <a class="google brd-rd3" href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i> Google</a>
                        <a class="twitter brd-rd3" href="#" title="Twitter" itemprop="url" target="_blank"><i class="fa fa-twitter"></i> Twitter</a>
                    </div>
                    <span class="popup-seprator text-center"><i class="brd-rd50">or</i></span>
                    <form class="sign-form">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <input class="brd-rd3" type="text" placeholder="Username">
                            </div>
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <input class="brd-rd3" type="email" placeholder="Email">
                            </div>
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <input class="brd-rd3" type="password" placeholder="Password">
                            </div>
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <button class="red-bg brd-rd3" type="submit">REGISTER NOW</button>
                            </div>
                            <div class="col-md-12 col-sm-12 col-lg-12">
                                <a class="sign-btn" href="#" title="" itemprop="url">Already Registered? Sign in</a>
                                <a class="recover-btn" href="#" title="" itemprop="url">Recover my password</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main><!-- Main Wrapper -->

    <script src="assetsQ/js/jquery.min.js"></script>
    <script src="assetsQ/js/bootstrap.min.js"></script>
    <script src="assetsQ/js/plugins.js"></script>
    <script src="assetsQ/js/main.js"></script>
    
   <script src="assets/js/jquery.min.js"></script>
<script src="assets/vendors/bootstrap/js/popper.min.js"></script>
<script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
<script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
<script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
<script src="assets/vendors/counter/waypoints-min.js"></script>
<script src="assets/vendors/counter/counterup.min.js"></script>
<script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
<script src="assets/vendors/masonry/masonry.js"></script>
<script src="assets/vendors/masonry/filter.js"></script>
<script src="assets/vendors/owl-carousel/owl.carousel.js"></script>



</body>	

</html>