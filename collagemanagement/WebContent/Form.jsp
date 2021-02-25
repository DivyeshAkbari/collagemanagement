<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zxx">


<!-- suchana/login.html  22 Nov 2019 04:16:58 GMT -->
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Suchana is an online blog, news & magazine dedicated to different categories html template">

    <title>Suchana - Blog, News & Magazine HTML Template</title>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!--Default CSS-->
    <link href="css/default.css" rel="stylesheet" type="text/css">

    <!--Custom CSS-->
    <link href="css/style.css" rel="stylesheet" type="text/css">

    <!--Plugin CSS-->
    <link href="css/plugin.css" rel="stylesheet" type="text/css">

    <!--Font Icons-->
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]> <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>

<body>
    <!--PRELOADER-->
    <div id="preloader">
        <div id="status"></div>
    </div>
    <!--*Header*-->
    <header id="inner-navigation">

        <!-- navbar start -->
        <!-- <nav class="navbar navbar-default navbar-fixed-top navbar-sticky-function navbar-arrow">

            <div class="container">

                <div class="logo pull-left">
                    <h1><a href="index.html"><img src="images/logo.png"></a></h1>
                </div>
                
                <div id="navbar" class="navbar-nav-wrapper text-center">
                    <ul class="nav navbar-nav navbar-right" id="responsive-menu">
                        <li><a href="#">Home <i class="fa fa-angle-down"></i></a>
                            <ul>
                                <li><a href="index.html">Home Default</a></li>
                                <li><a href="#">Home List View</a>
                                    <ul>
                                        <li><a href="index-1.html">Home RightSidebar</a></li>
                                        <li><a href="index-2.html">Home Fullwidth</a></li>
                                        <li><a href="index-3.html">Home LeftSidebar</a></li> 
                                    </ul>
                                </li> 
                                <li><a href="#">Home Grid View</a>
                                    <ul>
                                        <li><a href="index-4.html">Home RightSidebar</a></li>
                                        <li><a href="index.html">Home Fullwidth</a></li>
                                        <li><a href="index-5.html">Home LeftSidebar</a></li> 
                                    </ul>
                                </li>         
                            </ul>
                        </li>

                        <li><a href="#">Pages <i class="fa fa-angle-down"></i></a>
                            <ul>
                                <li><a href="about-us.html">About Us</a></li>
                                <li><a href="error.html">Error Page</a></li>
                                <li><a href="#">Detail Page</a>
                                    <ul>
                                        <li><a href="blog-details.html">Detail 1</a></li>
                                        <li><a href="blog-details1.html">Detail 2</a></li>
                                    </ul>
                                </li>
                                <li><a href="author.html">Author Page</a></li>
                                <li><a href="#">Category</a>
                                    <ul>
                                        <li><a href="category.html">Category Lists</a></li>
                                        <li><a href="category-detail.html">Category Detail</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Tags</a>
                                    <ul>
                                        <li><a href="tag.html">Tag Lists</a></li>
                                        <li><a href="tag-detail.html">Tag Detail</a></li>
                                    </ul>
                                </li>
                                <li><a href="faq.html">Faq</a></li>
                                <li><a href="coming-soon.html">Coming Soon</a></li>
                            </ul>
                        </li> 

                        <li>
                            <a href="#">Dashboard  <i class="fa fa-angle-down"></i></a>
                            <ul>
                                <li><a href="dashboard.html">Dashboard</a></li>
                                <li><a href="dashboard-my-profile.html">Dashboard Profile</a></li>
                                <li><a href="dashboard-booking.html">Dashboard Bookings</a></li>
                                <li><a href="dashboard-history.html">Dashboard History</a></li>
                                <li><a href="dashboard-list.html">Dashboard Listing</a></li>
                                <li><a href="dashboard-addtour.html">Dashboard Add Tour</a></li>
                                <li><a href="dashboard-reviews.html">Dashboard Reviews</a></li>
                            </ul>
                        </li>   
                        
                        <li class="active"><a href="shop.html">Shop <i class="fa fa-angle-down"></i></a>
                            <ul>
                                <li><a href="shop.html">Shop List</a></li>
                                <li><a href="shop-detail.html">Shop Detail</a></li>
                                <li><a href="cart.html">Cart</a></li>
                                <li><a href="checkout.html">Checkout</a></li>
                                <li><a href="login.html">Login Page</a></li>
                                <li><a href="forgot-password.html">Forgot Password</a></li>
                            </ul>
                        </li>
                        <li><a href="contact-us.html">Contact Us</a></li>
                        <li><a href="#search" class="mt_search"><i class="fa fa-search"></i></a></li>
                    </ul>
                </div>
            </div>
            
            <div id="slicknav-mobile"></div>
        </nav> -->
        <!-- navbar end -->
    </header>
    <!--* End Header*-->

    <!-- Breadcrumb -->
    <!-- <section class="breadcrumb-outer text-center bg-orange">
        <div class="container">
            <div class="breadcrumb-content">
                <h2>Login/Register Page</h2>
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Login/Register Page</li>
                    </ul>
                </nav>
            </div>
        </div>
    </section> -->
    <!-- BreadCrumb Ends -->

    <section class="login">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="login-form">
                        <form>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-title">
                                        <!-- <h2>Login</h2>
                                        <p>Register if you don't have an account.</p> -->
                                    </div>
                                </div>
                                <!-- <div class="form-group col-xs-12">
                                    <label>Username</label>
                                    <input type="email" class="form-control" id="Name1" placeholder="Enter username or email id">
                                </div>
                                <div class="form-group col-xs-12">
                                    <label>Password</label>
                                    <input type="password" class="form-control" id="email1" placeholder="Enter correct password">
                                </div> -->

                                <div class="form-group col-xs-12"></div>
                                    <label>Your Answer</label>
                                    <textarea placeholder="Your Answer" class="form-control" required></textarea>
                                </div>
                                
                                <div class="col-xs-12">
                                    <div class="comment-btn mar-bottom-20">
                                        <a href="#" class="btn-blog">Submit</a>
                                    </div>
                                </div>
                                <!-- <div class="col-xs-12">
                                    <div class="checkbox-outer pull-left">
                                        <input type="checkbox" name="vehicle2" value="Car"> Remember Me?
                                    </div>
                                    <div class="login-accounts pull-right">
                                        <a href="forgot-password.html" class="forgotpw">Forgot Password?</a>
                                    </div>
                                </div> -->
                            </div>
                        </form>
                    </div>
                </div>
                <!-- <div class="col-md-6">
                    <div class="register-form">
                        <form>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-title">
                                        <h2>Register</h2>
                                        <p>Enter your details to be a member.</p>
                                    </div>
                                </div>
                                <div class="form-group col-xs-12">
                                    <label>Name:</label>
                                    <input type="text" class="form-control" id="Name" placeholder="Enter full name">
                                </div>
                                <div class="form-group col-xs-12">
                                    <label>Email:</label>
                                    <input type="email" class="form-control" id="email" placeholder="abc@xyz.com">
                                </div>
                                <div class="form-group col-xs-12">
                                    <label>Phone Number:</label>
                                    <input type="text" class="form-control" id="date1" placeholder="Select Date">
                                </div>
                                <div class="form-group col-xs-6">
                                    <label>Select Password :</label>
                                    <input type="password" class="form-control" id="date" placeholder="Enter Password">
                                </div>
                                <div class="form-group col-xs-6 col-left-padding">
                                    <label>Confirm Password :</label>
                                    <input type="password" class="form-control" id="phnumber" placeholder="Re-enter Password">
                                </div>
                                <div class="col-xs-12">
                                    <div class="checkbox-outer">
                                        <input type="checkbox" name="vehicle2" value="Car"> I agree to the <a href="#">terms and conditions.</a>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="comment-btn mar-top-30">
                                        <a href="#" class="btn-blog">Register Now</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div> -->
            </div>
        </div>
    </section>

    <!-- <div class="mt_instagram mar-bottom-20">
        <div class="container">
            <div class="row">
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_01.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_02.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_03.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_04.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_05.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_06.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_07.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_08.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_09.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_10.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_11.jpg" alt="Image"></a></div>
                <div class="col-sm-2 col-xs-6"><a href="#"><img src="images/insta/insta_12.jpg" alt="Image"></a></div>
            </div>
            <div class="sectio-title">
                <h3 class="mar-0"><a href="#">Follow @ Instagram</a></h3>
            </div>
        </div> 
    </div> -->

    <!--*Footer*-->
    <!-- <footer id="mt_footer" class="mt_footer_style1">  
        <div class="container"> 
            <div class="mt_footer_col">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="mt_footer_about">
                            <h2><a href="#">Suchana</a></h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="mt_footer_list">
                            <h3>Quick Links</h3>
                            <ul class="footer-quick-links-4">
                               <li><a href="#"><i class="fa fa-angle-right"></i> Placerat bibendum</a></li>
                               <li><a href="#"><i class="fa fa-angle-right"></i> Ullamcorper odio nec turpis</a></li>
                               <li><a href="#"><i class="fa fa-angle-right"></i> Aliquam porttitor vestibulum</a></li>
                               <li><a href="#"><i class="fa fa-angle-right"></i> Lobortis enim nec nisi</a></li>
                               <li><a href="#"><i class="fa fa-angle-right"></i> Placerat bibendum</a></li>
                               <li><a href="#"><i class="fa fa-angle-right"></i> Lobortis enim nec nisi</a></li>
                             </ul>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="mt_footer_newsletter">
                            <h3>Newsletter</h3>
                            <div class="mailpoet_form">
                                <form target="_self" method="post" action="https://cyclonethemes.com/demo/html/suchana/email" novalidate="">
                                    <label>Email Address:</label>
                                    <input type="email" class="mailpoet_text" name="mail" title="Email" placeholder="Please specify a valid email address.">

                                    <div class="blog-button">
                                        <button class="btn-blog">Subscribe</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="mt_footer_gallery">
                            <h3>Amazing Gallery</h3>
                            <div class="row">
                                <div class="col-sm-4 col-xs-6"><a href="#"><img src="images/insta/insta_01.jpg" alt="Image"></a></div>
                                <div class="col-sm-4 col-xs-6"><a href="#"><img src="images/insta/insta_02.jpg" alt="Image"></a></div>
                                <div class="col-sm-4 col-xs-6"><a href="#"><img src="images/insta/insta_03.jpg" alt="Image"></a></div>
                                <div class="col-sm-4 col-xs-6"><a href="#"><img src="images/insta/insta_04.jpg" alt="Image"></a></div>
                                <div class="col-sm-4 col-xs-6"><a href="#"><img src="images/insta/insta_05.jpg" alt="Image"></a></div>
                                <div class="col-sm-4 col-xs-6"><a href="#"><img src="images/insta/insta_06.jpg" alt="Image"></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt_footer_copy">
                <div class="copy_txt pull-left">
                    <p class="mar-0"><a href="templateshub.net">Templateshub</a></p>
                </div> 
                <div class="follow_us pull-right">
                    <ul class="social_icons">
                        <li><a href="#"> <i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
                      
            </div>
        </div>
    </footer> -->
    <!--* End Footer*-->  

    <!-- back to top start -->
    <!-- <div id="back-to-top">
        <a href="#"></a>
    </div> -->

    <!-- search popup -->
    <!-- <div id="search">
        <button type="button" class="close">×</button>
        <form>
            <input type="search" value="" placeholder="type keyword(s) here" />
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div> -->

    <!--*Scripts*-->
    <!-- Latest jquery --><script src="js/jquery-3.2.1.min.js"></script>
    <!-- Plugin Jquery --><script src="js/plugin.js"></script>
    <!-- custom nav jquery --><script src="js/custom-nav.js"></script>
    <!-- main default Jquery --><script src="js/main.js"></script>
</body>

<!-- suchana/login.html  22 Nov 2019 04:16:58 GMT -->
</html>