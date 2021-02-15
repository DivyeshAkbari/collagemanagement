<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.collagemanagement.bean.Answer"%>
    <%@page import="java.util.List"%>
    <%@page import="com.collagemanagement.bean.QuoraSession"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zxx">


<!-- suchana/blog-details1.html  22 Nov 2019 04:16:25 GMT -->
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Suchana is an online blog, news & magazine dedicated to different categories html template">

    <title>Educhamp</title>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png">

    <!-- Bootstrap core CSS -->
    <link href="css1/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!--Default CSS-->
    <link href="css1/default.css" rel="stylesheet" type="text/css">

    <!--Custom CSS-->
    <link href="css1/style.css" rel="stylesheet" type="text/css">

    <!--Plugin CSS-->
    <link href="css1/plugin.css" rel="stylesheet" type="text/css">

    <!--Font Icons-->
    <link href="css1/font-awesome.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]> <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>


<% List<QuoraSession>  answerList1 =(List)request.getAttribute("answerlist12"); %>

<body class="page">

    <!--PRELOADER-->
    <div id="preloader">
        <div id="status"></div>
    </div>

    <!--*Header*-->
    <header id="inner-navigation">

        
    </header>
    <!--* End Header*-->
    

    <!--* Blog Main Sec*-->
    <section id="blog_main_sec" class="section-inner">
        <div class="container">
            <div class="row">
                <div class="col-md-9 width70">
                    <!--*Blog Content Sec*-->
                    <div class="blog-detail-main cats-detail">
                        <div class="post_body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                            </p>
                        <blockquote>
                            <p>Sed felis est, placerat a ornare vel, tempor id est. Phasellus ac urna vitae massa porttitor lacinia. Integer mollis, nulla pretium porttitor sagittis, urna nibh lobortis eros, ut lacinia elit velit nec diam.</p>
                            <span>Arthur & Molly Weasley</span>
                        </blockquote>
                        <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                            </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Ut
                            enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <img src="images/blog-listing/blog_06.jpg" alt=""></p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Ut
                            enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat incidunt dicta eius corporis iste, nihil nam atque.
                            Deserunt vel, velit cum aut error nam. Unde in ipsa quos earum. Atque.</p> -->
                        </div>
                        <div class="follow_us">
                            <ul class="social_icons">
                                <li><a href="#"> <i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                        <div class="tag mar-top-30">
                            <div class="widget-tags-main">
                                <h5 class="bg-orange">Tags:</h5>
                                <a href="#" class="" >Python</a>
                                <a href="#" class="" >Java</a>
                                <a href="#" class="" >C</a>
                                <a href="#" class="" >C++</a>
                                <a href="#" class="" >.Net</a>
                                <a href="#" class="" >FrameWork</a>
                                <a href="#" class="" >Tips</a>
                                <a href="#" class="" >Photography</a>
                            </div>
                        </div>

                        <div class="author_box">
                            <div class="author_img">
                                <img src="images/blog/author.png" alt="Author">
                            </div>
                            <div class="author_bio">
                                <h5>
                                         <% for(int i=0;i<answerList1.size();i++)
												{ %>
												<tr>	
														<% QuoraSession q1=answerList1.get(i); %>
														<td><%=q1.getUsername()%></td>
														
														
													</tr>
											<% } %>
                                    

                                            
                                                           
                                            </h5>
                                <p>
                               	<% for(int i=0;i<answerList1.size();i++)
												{ %>
												<tr>	
														<% QuoraSession q1=answerList1.get(i); %>
														
														<td><%=q1.getTdescription()%></td>
														<td><%=q1.getTopicname()%></td>
														
													</tr>
											<% } %>
                                    

                               	
                                            
                                         </p>
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!--=========================* Comment Sec*===========================-->
                        <div id="comments">
                            <div class="comments-wrap">
                                <h3 class="single-post_heading blog_heading_border">Comments (4)</h3>
                                <ol class="comments-lists">
                                    <li class="comment">
                                        <div class="activity_rounded">
                                            <img src="images/blog/cmnt-1.jpg" alt="image" /> </div>
                                        <div class="comment-body">
                                            <h4 class="text-left"> NIKLOS DELSON &nbsp;&nbsp;
                                                <small class="date-posted pull-right">18th Mar, 2018</small>
                                            </h4>
                                            <p> Duis a enim vel mauris ultrices. Nullam aliquet velit ac velit tempus in semper neque auctor. Etiam pellentesque, magna eget lobortis placerat, leo leo consequat ante, non iaculis turpis augue ac ligula. Duis a
                                                enim vel mauris ultrices, leo. </p>
                                            <a href="#" class="pull-left btn-blog">Reply</a>
                                            <div class="clearfix"></div>
                                        </div>
                                        <ol class="children">
                                            <li class="comment">
                                                <div class="activity_rounded">
                                                    <img src="images/blog/cmnt-2.jpg" alt="image" /> </div>
                                                <div class="comment-body">
                                                    <h4 class="text-left"> NIKLOS DELSON &nbsp;&nbsp;
                                                        <small class="date-posted pull-right">18th Mar, 2018</small>
                                                    </h4>
                                                    <p> Duis a enim vel mauris ultrices. Nullam aliquet velit ac velit tempus in semper neque auctor. Etiam pellentesque, magna eget lobortis placerat, leo leo consequat ante, non iaculis turpis augue ac ligula.
                                                        Duis a enim vel mauris ultrices, leo. </p>
                                                    <a href="#" class="pull-left btn-blog">Reply</a>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </li>
                                        </ol>
                                    </li>
                                    <li class="comment">
                                        <div class="activity_rounded">
                                            <img src="images/blog/cmnt-3.jpg" alt="image" /> </div>
                                        <div class="comment-body">
                                            <h4 class="text-left"> NIKLOS DELSON &nbsp;&nbsp;
                                                <small class="date-posted pull-right">18th Mar, 2018</small>
                                            </h4>
                                            <p> Duis a enim vel mauris ultrices. Nullam aliquet velit ac velit tempus in semper neque auctor. Etiam pellentesque, magna eget lobortis placerat, leo leo consequat ante, non iaculis turpis augue ac ligula. Duis a
                                                enim vel mauris ultrices, leo. </p>
                                            <a href="#" class="pull-left btn-blog">Reply</a>
                                            <div class="clearfix"></div>
                                        </div>
                                    </li>
                                </ol>
                                <div class="leave_comment">
                                    <h3 class="blog_heading_border"> Leave a Comment </h3>
                                    <form action="InsertAnswerDescription" method="post" enctype="multipart/formdata">
                                        <div class="row">
                                            <div class="col-sm-12">
                                           
                                               <textarea  name="answerdescription" 
											 cols="30" rows="4"
											 placeholder=" Your ans"> </textarea>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button type="submit" class="btn-blog">Submit</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--=========================*End Comment Sec*===========================-->
                        <!--* End Blog Content Sec*-->
                    </div> 
                </div>
                <div class="col-md-3 width30">
                    <div class="sidebar">

                        <!-- widget author -->
                        <div class="widget widget-author text-center">
                            <div class="widget-image">
                                <img src="images/blog/author.png" alt="...">
                            </div>
                            <div class="widget-author-content">
                                <div class="widget-author mar-bottom-15">
                                    <h3 class="mar-bottom-5">Blork Lewson</h3>
                                    <span class="author-profession">Author Blogger</span>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
                                <div class="follow_us mar-bottom-15">
                                    <ul class="social_icons">
                                        <li><a href="#"> <i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                                <div class="widget-author-signature">
                                    <img src="images/blog/signature.png" alt="...">
                                </div>
                            </div>
                        </div>

                        <!-- widget category -->
                        <div class="widget widget-category">
                            <div class="widget-content">
                                <div class="widget-title">
                                    <h3 class="white">Category</h3>
                                </div>
                                <div class="widget-category-main">
                                    <ul class="widget-category-list">
                                        <li><a href="#">Lifestyle</a></li>
                                        <li><a href="#">Health</a></li>
                                        <li><a href="#">Article</a></li>
                                        <li><a href="#">Travel</a></li>
                                        <li><a href="#">Uncategorised</a></li>
                                        <li><a href="#">Popular</a></li>
                                        <li><a href="#">World</a></li>
                                        <li><a href="#">Stylish</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- widget popular post -->
                        <div class="widget widget-popular-post">
                            <div class="widget-content">
                                <div class="widget-title">
                                    <h3 class="white">Popular Posts</h3>
                                </div>
                                <div class="widget-popular-post-main">
                                    <div class="widget-posts">
                                        <div class="post-thumb">
                                            <img src="images/blog/r-post-1.jpg" alt=".....">
                                        </div>
                                        <div class="post-title">
                                            <div class="widget-cats">
                                                <a href="#">Technology</a>
                                                <a href="#">Travel</a>
                                            </div>
                                            <h4><a href="#">That Evening At Bali Beach Was Wounderful</a></h4>
                                        </div>
                                    </div>

                                    <div class="widget-posts">
                                        <div class="post-thumb">
                                            <img src="images/blog/r-post-2.jpg" alt=".....">
                                        </div>
                                        <div class="post-title">
                                            <div class="widget-cats">
                                                <a href="#">Technology</a>
                                                <a href="#">Travel</a>
                                            </div>
                                            <h4><a href="#">5 Reasons Why Ladies Prefer To Have Brown Hair</a></h4>
                                        </div>
                                    </div>

                                    <div class="widget-posts">
                                        <div class="post-thumb">
                                            <img src="images/blog/r-post-3.jpg" alt=".....">
                                        </div>
                                        <div class="post-title">
                                            <div class="widget-cats">
                                                <a href="#">Technology</a>
                                                <a href="#">Travel</a>
                                            </div>
                                            <h4><a href="#">This post has just gone viral with many views</a></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- widget tags -->
                        <div class="widget widget-tags">
                            <div class="widget-content">
                                <div class="widget-title">
                                    <h3 class="white">Trending Tags</h3>
                                </div>    
                                <div class="widget-tags-main">
                                    <a href="#" class="" >Python</a>
                                    <a href="#" class="" >Java</a>
                                    <a href="#" class="" >C</a>
                                    <a href="#" class="" >C++</a>
                                    <a href="#" class="" >.Net</a>
                                    <a href="#" class="" >FrameWork</a>
                                    <a href="#" class="" >BigData Analysis</a>
                                    <a href="#" class="" >Photography</a>
                                    <a href="#" class="" >Tips</a>
                                </div>
                            </div>
                        </div>

                        <!-- widget popular post -->
                        <div class="widget widget-popular-post">
                            
                        </div>

                       
                    </div>
                </div>
            </div>       
    	</div>
    </section>
    <!--*End Blog Main Sec*-->

     


    <!-- back to top -->
    <a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="" data-placement="left">
        <span class="fa fa-arrow-up"></span>
    </a>

    <!-- search popup -->
    <div id="search">
        <button type="button" class="close">×</button>
        <form>
            <input type="search" value="" placeholder="type keyword(s) here" />
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>

    <!--*Scripts*-->
    <!-- Latest jquery --><script src="js1/jquery-3.2.1.min.js"></script>
    <!-- Plugin Jquery --><script src="js1/plugin.js"></script>
    <!-- custom nav jquery --><script src="js1/custom-nav.js"></script>
    <!-- main default Jquery --><script src="js1/main.js"></script>
</body>


<!-- suchana/blog-details1.html  22 Nov 2019 04:16:25 GMT -->
</html>