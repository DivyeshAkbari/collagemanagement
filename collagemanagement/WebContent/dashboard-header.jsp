<%@page import="com.collagemanagement.bean.User"%>
<%
HttpSession httpsession = request.getSession(false);
User user11 = (User) httpsession.getAttribute("uname");
String userName = user11.getFirstname()+" "+user11.getMiddlename();
String userRole = user11.getRole();
%>   
<div class="navbar navbar-expand-md header-menu-one bg-light">
            <div class="nav-bar-header-one">
                <div class="header-logo">
                    <a href="#">
<!--                         <img src="img/logo.png" alt="logo"> -->
							<img height="63px" width="63px" src="assets/images/Educhamp_logo12.png" alt="logo">
	                        <img height="127px" width="127px" src="assets/images/Black.png" alt="logo">
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
<!--                                 <button type="submit"> -->
<!--                                     <span class="flaticon-search" aria-hidden="true"></span> -->
<!--                                 </button> -->
                            </span>
<!--                             <input type="text" class="form-control" placeholder="Find Something . . ."> -->
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="navbar-item dropdown header-admin">
                        <a class="navbar-nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                            aria-expanded="false">
                            <div class="admin-title">
                                <h5 class="item-title"><%= userName %></h5>
                                <span><%=userRole %></span>
                            </div>
                            <div class="admin-img">
                                <img style="width :50px;height : 50px"  src="data:image/png;base64,<%=user11.getUserProfilepicString() %>" alt="Admin">
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <div class="item-header">
                                <h6 class="item-title"><%=userName %></h6>
                            </div>
                            <div class="item-content">
                                <ul class="settings-list">
<!--                                     <li><a href="#"><i class="flaticon-user"></i>My Profile</a></li> -->
<!--                                     <li><a href="#"><i class="flaticon-list"></i>Task</a></li> -->
<!--                                     <li><a href="#"><i class="flaticon-chat-comment-oval-speech-bubble-with-text-lines"></i>Message</a></li> -->
<!--                                     <li><a href="#"><i class="flaticon-gear-loading"></i>Account Settings</a></li> -->
                                    <li><a href="Logout"><i class="flaticon-turn-off"></i>Log Out</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
<!--                     <li class="navbar-item dropdown header-message"> -->
<!--                         <a class="navbar-nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" -->
<!--                             aria-expanded="false"> -->
<!--                             <i class="far fa-envelope"></i> -->
<!--                             <div class="item-title d-md-none text-16 mg-l-10">Message</div> -->
<!--                             <span>5</span> -->
<!--                         </a> -->

<!--                         <div class="dropdown-menu dropdown-menu-right"> -->
<!--                             <div class="item-header"> -->
<!--                                 <h6 class="item-title">05 Message</h6> -->
<!--                             </div> -->
<!--                             <div class="item-content"> -->
<!--                                 <div class="media"> -->
<!--                                     <div class="item-img bg-skyblue author-online"> -->
<!--                                         <img src="img/figure/student11.png" alt="img"> -->
<!--                                     </div> -->
<!--                                     <div class="media-body space-sm"> -->
<!--                                         <div class="item-title"> -->
<!--                                             <a href="#"> -->
<!--                                                 <span class="item-name">Maria Zaman</span>  -->
<!--                                                 <span class="item-time">18:30</span>  -->
<!--                                             </a>   -->
<!--                                         </div> -->
<!--                                         <p>What is the reason of buy this item.  -->
<!--                                         Is it usefull for me.....</p> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="media"> -->
<!--                                     <div class="item-img bg-yellow author-online"> -->
<!--                                         <img src="img/figure/student12.png" alt="img"> -->
<!--                                     </div> -->
<!--                                     <div class="media-body space-sm"> -->
<!--                                         <div class="item-title"> -->
<!--                                             <a href="#"> -->
<!--                                                 <span class="item-name">Benny Roy</span>  -->
<!--                                                 <span class="item-time">10:35</span>  -->
<!--                                             </a>   -->
<!--                                         </div> -->
<!--                                         <p>What is the reason of buy this item.  -->
<!--                                         Is it usefull for me.....</p> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="media"> -->
<!--                                     <div class="item-img bg-pink"> -->
<!--                                         <img src="img/figure/student13.png" alt="img"> -->
<!--                                     </div> -->
<!--                                     <div class="media-body space-sm"> -->
<!--                                         <div class="item-title"> -->
<!--                                             <a href="#"> -->
<!--                                                 <span class="item-name">Steven</span>  -->
<!--                                                 <span class="item-time">02:35</span>  -->
<!--                                             </a>   -->
<!--                                         </div> -->
<!--                                         <p>What is the reason of buy this item.  -->
<!--                                         Is it usefull for me.....</p> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="media"> -->
<!--                                     <div class="item-img bg-violet-blue"> -->
<!--                                         <img src="img/figure/student11.png" alt="img"> -->
<!--                                     </div> -->
<!--                                     <div class="media-body space-sm"> -->
<!--                                         <div class="item-title"> -->
<!--                                             <a href="#"> -->
<!--                                                 <span class="item-name">Joshep Joe</span>  -->
<!--                                                 <span class="item-time">12:35</span>  -->
<!--                                             </a>   -->
<!--                                         </div> -->
<!--                                         <p>What is the reason of buy this item.  -->
<!--                                         Is it usefull for me.....</p> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </li> -->
<!--                     <li class="navbar-item dropdown header-notification"> -->
<!--                         <a class="navbar-nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" -->
<!--                             aria-expanded="false"> -->
<!--                             <i class="far fa-bell"></i> -->
<!--                             <div class="item-title d-md-none text-16 mg-l-10">Notification</div> -->
<!--                             <span>8</span> -->
<!--                         </a> -->

<!--                         <div class="dropdown-menu dropdown-menu-right"> -->
<!--                             <div class="item-header"> -->
<!--                                 <h6 class="item-title">03 Notifiacations</h6> -->
<!--                             </div> -->
<!--                             <div class="item-content"> -->
<!--                                 <div class="media"> -->
<!--                                     <div class="item-icon bg-skyblue"> -->
<!--                                         <i class="fas fa-check"></i> -->
<!--                                     </div> -->
<!--                                     <div class="media-body space-sm"> -->
<!--                                         <div class="post-title">Complete Today Task</div> -->
<!--                                         <span>1 Mins ago</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="media"> -->
<!--                                     <div class="item-icon bg-orange"> -->
<!--                                         <i class="fas fa-calendar-alt"></i> -->
<!--                                     </div> -->
<!--                                     <div class="media-body space-sm"> -->
<!--                                         <div class="post-title">Director Metting</div> -->
<!--                                         <span>20 Mins ago</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="media"> -->
<!--                                     <div class="item-icon bg-violet-blue"> -->
<!--                                         <i class="fas fa-cogs"></i> -->
<!--                                     </div> -->
<!--                                     <div class="media-body space-sm"> -->
<!--                                         <div class="post-title">Update Password</div> -->
<!--                                         <span>45 Mins ago</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </li> -->
                </ul>
            </div>
            
            
            
        </div>




           