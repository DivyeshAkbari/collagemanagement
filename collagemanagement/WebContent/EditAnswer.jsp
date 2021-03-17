<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.collagemanagement.bean.Answer"%>
		<%@page import="java.util.List"%>

<!doctype html>
<html class="no-js" lang="">


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
</head>

<% Answer answer = (Answer)request.getAttribute("answer");
String id =(String)request.getAttribute("id"); %>

<body>
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
        <section class="single-blog-page-wrap padding-top-80 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <div class="single-blog-box">
                            <div class="leave-review">
                                <div class="section-heading3 heading-dark">
                                    <h2 class="item-heading">Post Your Question</h2>
                                </div>
                                <form class="leave-form-box" action="UpdateAnswerDescription" method="post" >
                                    <div class="row">                              
                                        <div class="col-12 form-group">
                                            <label>Description :</label>
                                            <textarea placeholder="" class="textarea form-control" name="tdescription" rows="7"
                                                cols="20" data-error="Message field is required"   required> <%=answer.getAnswerdescription() %></textarea>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <input type="hidden"  placeholder="" class="form-control"  name="id" value=<%=id %>
                                                  data-error="id field is required" required >
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
                                        <a href="#">BreakFast
                                            <span>25</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Lunch
                                            <span>15</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Pasta
                                            <span>22</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Dinner
                                            <span>18</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Dessert
                                            <span>36</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Drinks
                                            <span>12</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Fruits
                                            <span>05</span>
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
                                <ul>
                                    <li>
                                        <a href="#">DESERT</a>
                                    </li>
                                    <li>
                                        <a href="#">CAKE</a>
                                    </li>
                                    <li>
                                        <a href="#">BREAKFAST</a>
                                    </li>
                                    <li>
                                        <a href="#">BURGER</a>
                                    </li>
                                    <li>
                                        <a href="#">DINNER</a>
                                    </li>
                                    <li>
                                        <a href="#">PIZZA</a>
                                    </li>
                                    <li>
                                        <a href="#">SEA FOOD</a>
                                    </li>
                                    <li>
                                        <a href="#">SALAD</a>
                                    </li>
                                    <li>
                                        <a href="#">JUICE</a>
                                    </li>
                                </ul>
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