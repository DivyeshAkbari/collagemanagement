<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.collagemanagement.bean.Answer"%>
     <%@page import="com.collagemanagement.bean.User"%>
    <%@page import="java.util.List"%>
    <%@page import="com.collagemanagement.bean.QuoraSession"%>
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
    
    <script src="assets/js/jquery.min.js"></script>

<script>
	/* $(document).ready(function()
{
	$("#postansid").click(function(){
		
		var serachid = $("#postansid").val();
		alert(postansid);
		$.ajax({
			
					method:"POST",
					url:"InsertAnswerDescription",
					data:
					{
						postansid:postansid,
					}
			})
		});
});
 */</script>
</head>

<% List<QuoraSession>  questionlist =(List)request.getSession(false).getAttribute("questionlist");

   String id =(String)request.getAttribute("id"); 
   
   List<Answer>  answerList =(List)request.getSession(false).getAttribute("answerlist");
   
   HttpSession httpSession = request.getSession(false);
   User user = (User) httpSession.getAttribute("uname");
   
   QuoraSession query = questionlist.get(0); %>

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
       
        <!-- Inne Page Banner Area End Here -->
        <!-- Submit Recipe Area Start Here -->
        <section class="single-blog-page-wrap padding-top-80 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <div class="single-blog-box">
                            <!-- <div class="main-figure">
                                <a href="single-blog.html"><img src="assets/assets4/img/blog/blog9.jpg" alt="Blog"></a>
                            </div> -->
                            <div class="blog-content">
                               <!--  <ul class="entry-meta">
                                    <li><a href="#"><i class="fas fa-clock"></i>15 December, 2018</a></li>
                                    <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                    <li><a href="#"><i class="fas fa-comments"></i>Comments <span>(03)</span></a></li>
                                    <li><a href="#"><i class="fas fa-heart"></i><span>59</span></a></li>
                                </ul> -->
                                <h3 class="item-title"><a href="single-blog.html">
                                    <% for(int i=0;i<questionlist.size();i++)
                                    { %>
                                         <% QuoraSession q1=questionlist.get(i); %>
                                         <%=q1.getTopicname()%>  
                                    <% } %>    
                                </a></h3>
                                <!-- <blockquote>Gimply dummy text of the printing and typesetting industry. Lorem Ipsum has
                                    been the industry's standard dummy text ever since the 1500s.<span></span></blockquote> -->
                            </div>
                           <!--  <div class="tag-share">
                                <ul>
                                    <li>
                                        <ul class="inner-tag">
                                            <li>
                                                <a href="#">Burger</a>
                                            </li>
                                            <li>
                                                <a href="#">Dinner</a>
                                            </li>
                                            <li>
                                                <a href="#">Pizza</a>
                                            </li>
                                            <li>
                                                <a href="#">Salad</a>
                                            </li>
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </div> -->
                            <div class="recipe-author">
                                <div class="media media-none--xs">
                                <% for(int i=0;i<questionlist.size();i++)
                                 { %>
                                 <% QuoraSession q1=questionlist.get(i); %>
                                    <img src="data:image/png;base64,<%=q1.getUserProfilepic() %>" style="width: 100px; height: 100px" alt="Blog Author" class="rounded-circle media-img-auto">
                                    <div class="media-body">
                                        <h4 class="author-title">
                                            
                                                    
                                                    <%=q1.getUsername()%> 
                                            <% } %>    
                                        </h4>
                                        <%if(questionlist!=null) {%>
                                            <h5 class="author-sub-title">Written by</h5>
                                            <p><% for(int i=0;i<questionlist.size();i++)
                                                { %>
                                                        <% QuoraSession q1=questionlist.get(i); %>
                                                        <%=q1.getTdescription()%>
                                                <% } %>
                                            </p>
                                        <% } %>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="next-prev-post">
                                <div class="prev-post">
                                    <a href="#" class="item-figure"><img src="assets/images/gallery/pic1.jpg"  alt="Post"></a>
                                    <div class="item-content">
                                        <p>PREVIOUS POST</p>
                                        <h3 class="post-title"><a href="#">Old school pancake next area so goody</a></h3>
                                    </div>
                                </div>
                                <div class="next-post">
                                    <div class="item-content">
                                        <p>NEXT POST</p>
                                        <h3 class="post-title"><a href="#">Old school pancake next area so goody</a></h3>
                                    </div>
                                    <a href="#" class="item-figure"><img src="assets/images/gallery/pic2.jpg" alt="Post"></a>
                                </div>
                            </div>
                    <%if(answerList!=null) {%>
                            <div class="recipe-reviews">
                                <div class="section-heading3 heading-dark">
                                    <h2 class="item-heading">Answers</h2>
                                </div>
                                  <% for(int i=0;i<answerList.size();i++)
                                  { %>
                                  		<% Answer ans=answerList.get(i); %>
                                  <ul>
                                    <li class="reviews-single-item">
                                        <div class="media media-none--xs">
                                            <img style="width :100px;height : 100px"  src="data:image/png;base64,<%=ans.getUserProfilepic() %>" style="width: 100px; height: 100px" alt="Comment" class="media-img-auto">
                                            <div class="media-body">
                                                <h4 class="comment-title">
                                                        <%=ans.getUsername()%>                                                    
                                                </h4>
                                                <span class="post-date">September 27, 2018</span>
                                                <%-- <p>
                                                		<%String s="EditAnswerDescription?id="; %>                                               
	                                                    <%=ans.getAnswerdescription()%>    
	                                                    <a href=<%=s+ans.getAnswerid() %> class="item-btn">Edit<i class="fas fa-long-arrow-alt-right"></i></a>
                                                </p>  --%>
                                                 <p>
                                                <%=ans.getAnswerdescription()%> 
                                                <a href="EditAnswerDescription?id=<%=ans.getAnswerid() %>" class="item-btn">Edit<i class="fas fa-long-arrow-alt-right"></i></a>  
                                          <br>
                                          <br>
			 				 				<%if(user.getId()==ans.getUserid()){%>
			 				 				<br>
			 				 				
			 				 				<a href="RemoveAnswerDescription?id=<%=ans.getAnswerid() %> &userid=<%=user.getId() %>">Delete<i class="fas fa-long-arrow-alt-right"></i></a>
			 				 				<%} %>
                                 
			 				 			<%-- 	<a href="RemoveAnswerDescription?id=,?userid=<%=ans.getAnswerid() %><%=user.getId() %>" class="item-btn">Delete<i class="fas fa-long-arrow-alt-right"></i></a> --%>
                                           
                                                </p>
                                           </div>
                                        </div>
                                    </li>
                                  <% }%>
                                  </ul>
                                 <% } %>
                            </div>
                            <div class="leave-review">
                                <div class="section-heading3 heading-dark">
                                    <h2 class="item-heading">Your Answer</h2>
                                </div>
                                <form class="leave-form-box" action="InsertAnswerDescription" method="post">
                                    <div class="row">
                                        <div class="col-12 form-group">
                                            <label>Post Answer :</label>
                                            <textarea placeholder="" class="textarea form-control"  value="<%=query.getTdescription() %>" name="answerdescription" rows="7"
                                                cols="20" data-error="Message field is required" required></textarea>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <input type="hidden"  placeholder="" class="form-control"  name="id" 
                                                  data-error="id field is required" required value=<%=id %> >
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-12 form-group mb-0">
                                            <button type="submit" id="postansid"class="item-btn">POST Your Answer</button>
                                        </div>
                                    </div>
                                    <div class="form-response"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        
                       <!--  <div class="widget">
                            <div class="widget-ad">
                                <a href="#"><img src="assets/assets4/img/figure/figure6.jpg" alt="Ad" class="img-fluid"></a>
                            </div>
                        </div> -->
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">CATEGORIES</h3>
                            </div>
                            <div class="widget-categories">
                                <ul>
                                    <li>
                                        <a href="#">M.Sc(CA&IT)
                                           
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">MBA
                                            
                                        </a>
                                    </li>
                                   
                                </ul>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">FEATURED ARTICLE</h3>
                            </div>
                            <div class="widget-featured-feed">
                                <div class="rc-carousel nav-control-layout1" data-loop="true" data-items="3"
                                    data-margin="5" data-autoplay="true" data-autoplay-timeout="5000" data-smart-speed="700"
                                    data-dots="false" data-nav="true" data-nav-speed="false" data-r-x-small="1"
                                    data-r-x-small-nav="true" data-r-x-small-dots="false" data-r-x-medium="1"
                                    data-r-x-medium-nav="true" data-r-x-medium-dots="false" data-r-small="1"
                                    data-r-small-nav="true" data-r-small-dots="false" data-r-medium="1"
                                    data-r-medium-nav="true" data-r-medium-dots="false" data-r-large="1"
                                    data-r-large-nav="true" data-r-large-dots="false" data-r-extra-large="1"
                                    data-r-extra-large-nav="true" data-r-extra-large-dots="false">
                                    <div class="featured-box-layout1">
                                        <div class="item-img">
                                            <img src="assets/images/gallery/pic8.jpg" alt="Brand" class="img-fluid">
                                        </div>
                                        <div class="item-content">
                                            <span class="ctg-name">Questions</span>
                                            <h4 class="item-title"><a href="single-recipe1.html"></a></h4>
                                            <p>Definitiones noel ei verear intelle
                                                gatpri civibus consequat area
                                                refund efficiantue.</p>
                                        </div>
                                    </div>
                                    <div class="featured-box-layout1">
                                        <div class="item-img">
                                            <img src="assets/images/gallery/pic7.jpg" alt="Brand" class="img-fluid">
                                        </div>
                                        <div class="item-content">
                                            <span class="ctg-name">Question</span>
                                            <h4 class="item-title"><a href="single-recipe1.html"></a></h4>
                                            <p>Definitiones noel ei verear intelle
                                                gatpri civibus consequat area
                                                refund efficiantue.</p>
                                        </div>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                       <!--  <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">INSTAGRAM</h3>
                            </div>
                            <div class="widget-instagram">
                                <ul>
                                    <li>
                                        <div class="item-box">
                                            <img src="assets/assets4/img/social-figure/social-figure9.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="assets/assets4/img/social-figure/social-figure10.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="assets/assets4/img/social-figure/social-figure11.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="assets/assets4/img/social-figure/social-figure12.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="assets/assets4/img/social-figure/social-figure13.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="assets/assets4/img/social-figure/social-figure14.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div> -->
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">POPULAR TAGS</h3>
                            </div>
                            <div class="widget-tag">
                                <ul>
                                    <li>
                                        <a href="#">Tomcate7</a>
                                    </li>
                                    <li>
                                        <a href="#">Java</a>
                                    </li>
                                    <li>
                                        <a href="#">JQuery</a>
                                    </li>
                                    <li>
                                        <a href="#">C</a>
                                    </li>
                                    <li>
                                        <a href="#">C++</a>
                                    </li>
                                    <li>
                                        <a href="#">Python</a>
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