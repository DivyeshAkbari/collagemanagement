<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.collagemanagement.bean.QuoraSession"%>
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
    <link rel="shortcut icon" href="assets4/favicon.png">
    <!-- Normalize Css -->
    <link rel="stylesheet" href="assets4/css/normalize.css">
    <!-- Main Css -->
    <link rel="stylesheet" href="assets4/css/main.css">
    <!-- Bootstrap Css -->
    <link rel="stylesheet" href="assets4/css/bootstrap.min.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="assets4/css/animate.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets4/css/fontawesome-all.min.css">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="assets4/fonts/flaticon.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="style4.css">
    <!-- Modernizr Js -->
    <script src="js/modernizr-3.6.0.min.js"></script>
    
<script src="assets/js/jquery.min.js"></script>

<script>
	$(document).ready(function()
{
	$("#searchid").click(function(){
		
		var serachid = $("#searchid").val();
		alert(serachid);
		$.ajax({
			
					method:"POST",
					url:"searchquestion",
					data:
					{
						id:serachid
					}
			}).done(function(data)
			{
				alert(data);
				$("#searchvalueid").html(data);
				$
			});
		});
});
</script>
</head>

<jsp:include page ="/SelectQueryDetails"/>

<% List<QuoraSession>  queryList =(List)request.getAttribute("querylist"); %>

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
        <!-- Header Area Start Here -->
        
        <!-- Header Area End Here -->
        <!-- Inne Page Banner Area Start Here -->
        
        </section> -->
        <!-- Inne Page Banner Area End Here -->
        <!-- Author Area Start Here -->
        <section class="author-page-wrap padding-top-80 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <div class="author-box-layout1">
                            <div class="adv-search-wrap">
                                <div class="input-group">
                                    <input type="text"  id="searchid" class="form-control" placeholder="Question Search . . ." />
                                    <div class="btn-group">
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn-search"><i class="flaticon-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>
                                                <div class="author-personal-info">
                                                    <a href="#" class="item-figure"><img src="assets4/img/blog/author2.jpg" alt="Author"></a>
                                                    <div class="item-content">
                                                        <div class="item-designation"><a href="GetAnswerDetails?id=" id="searchvalueid" ></a></div>		
                                                    </div>
                                                </div>
                                            </th>
                                            <td>
                                                <div class="author-social-info">
                                                    <ul>
                                                        
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Reviews</h4>
                                                                <span class="item-number">29</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Favourite</h4>
                                                                <span class="item-number">35+</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <h3 class="author-section-title">Total 1,050 Authors</h3>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                     <% for(int i=0;i<queryList.size();i++)
                                     { %>
                                     		<% QuoraSession q1 = queryList.get(i); %>
                                        <tr>
                                            <th>
                                                <div class="author-personal-info">
                                                    <a href="#" class="item-figure"><img src="assets4/img/blog/author2.jpg" alt="Author"></a>
                                                    <div class="item-content">
                                                        <div class="item-title"><a href="#"><%=q1.getUsername()%></a></div>		
                                                        <div class="item-designation"><a href="GetAnswerDetails?id=<%=q1.getQueryId() %>" ><%=q1.getTopicname() %></a></div>		
                                                    </div>
                                                </div>
                                            </th>
                                            <td>
                                                <div class="author-social-info">
                                                    <ul>
                                                        
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Reviews</h4>
                                                                <span class="item-number">29</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Favourite</h4>
                                                                <span class="item-number">35+</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                      <% } %>
                                    </tbody>
                                </table>
                            </div>
                            <ul class="pagination-layout1">
                                <li class="active">
                                    <a href="#">1</a>
                                </li>
                                <li>
                                    <a href="#">2</a>
                                </li>
                                <li>
                                    <a href="#">3</a>
                                </li>
                                <li>
                                    <a href="#">4</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">ABOUT ME</h3>
                            </div>
                            <div class="widget-about">
                                <figure class="author-figure"><img src="assets4/img/figure/about.jpg" alt="about"></figure>
                                <figure class="author-signature"><img src="assets4/img/figure/signature.png" alt="about"></figure>
                                <p>Fusce mauris auctor ollicituder teary iner hendrerit risusey aeenean rauctor pibus
                                    doloer.</p>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">TAGS &amp; FOLLOW</h3>
                            </div>
                            <div class="widget-follow-us">
                                <ul>
                                    <li class="single-item"><a href="#">Python</a></li>
                                    <li class="single-item"><a href="#">java</a></li>
                                    <li class="single-item"><a href="#">.Net</a></li>
                                    <li class="single-item"><a href="#">Rubby</a></li>
                                    <li class="single-item"><a href="#">C</a></li>
                                    <li class="single-item"><a href="#">C++</a></li>
                                    <li class="single-item"><a href="#">DBMS</a></li>
                                    <li class="single-item"><a href="#">MYSQL</a></li>
                                    
                                </ul>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">LATEST RECIPES</h3>
                            </div>
                            <div class="widget-latest">
                                <ul class="block-list">
                                    <li class="single-item">
                                        <div class="item-img">
                                            <a href="#"><img src="assets4/img/product/latest1.jpg" alt="Post"></a>
                                            <div class="count-number">1</div>
                                        </div>
                                        <div class="item-content">
                                            <div class="item-ctg">DESERT</div>
                                            <h4 class="item-title"><a href="#">Salami Oven Roasted are
                                                    Mozzarella Oelette</a></h4>
                                            <div class="item-post-by"><a href="single-blog.html"><i class="fas fa-user"></i><span>by</span>
                                                    John Martin</a></div>
                                        </div>
                                    </li>
                                    <li class="single-item">
                                        <div class="item-img">
                                            <a href="#"><img src="assets4/img/product/latest2.jpg" alt="Post"></a>
                                            <div class="count-number">2</div>
                                        </div>
                                        <div class="item-content">
                                            <div class="item-ctg">DESERT</div>
                                            <h4 class="item-title"><a href="#">Salami Oven Roasted are
                                                    Mozzarella Oelette</a></h4>
                                            <div class="item-post-by"><a href="single-blog.html"><i class="fas fa-user"></i><span>by</span>
                                                    John Martin</a></div>
                                        </div>
                                    </li>
                                    <li class="single-item">
                                        <div class="item-img">
                                            <a href="#"><img src="assets4/img/product/latest3.jpg" alt="Post"></a>
                                            <div class="count-number">3</div>
                                        </div>
                                        <div class="item-content">
                                            <div class="item-ctg">DESERT</div>
                                            <h4 class="item-title"><a href="#">Salami Oven Roasted are
                                                    Mozzarella Oelette</a></h4>
                                            <div class="item-post-by"><a href="single-blog.html"><i class="fas fa-user"></i><span>by</span>
                                                    John Martin</a></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Author Area End Here -->
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
    <script src="assets4/js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets4/js/popper.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets4/js/bootstrap.min.js"></script>
    <!-- Plugins Js -->
    <script src="assets4/js/plugins.js"></script>
    <!-- Smoothscroll Js -->
    <script src="assets4/js/smoothscroll.min.js"></script>
    <!-- Custom Js -->
    <script src="assets4/js/main.js"></script>
</body>

</html>