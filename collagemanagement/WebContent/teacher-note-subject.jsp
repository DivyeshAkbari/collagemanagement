<%@page import="com.collagemanagement.bean.Stream"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/notice-board.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Teacher subjects</title>
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
    <!-- Date Picker CSS -->
    <link rel="stylesheet" href="css/datepicker.min.css">
    <!-- Select 2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Modernize js -->
    <script src="js/modernizr-3.6.0.min.js"></script>
    
</head>

<jsp:include page ="/fetchsemesterforfaculty"/>
 
<% List<Stream> Streamlist= (List)request.getAttribute("Streamlist"); %>

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
           
           <%@include file="sidebar-teacher.jsp" %>
           
            <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Subject</h3>
                    <ul>
                        <li>
                            <a href="Teacher_dashboard.jsp">Home</a>
                        </li>
                        <li>Subject</li>
                    </ul>
                </div>
                
                
                <!-- Breadcubs Area End Here -->
                           
					 <div class="row">
					 <div class="col-4-xxxl col-12">
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Select subject</h3>
                                    </div>
                                   
                                </div>
                                <form method="post" action="uploadAssignment" enctype="multipart/form-data" class="new-added-form">
                                    <div class="row">
<!--                                     Col-lg-12 -->
<!-- 										col-12-xxxl col-lg-6 col-12 form-group -->
                                         <div class="col-lg-12">
                                         <label>Select Stream *</label>
                                         <select name="streamId" id="stream" class="select2">
                                      <option value="0">Please Select</option>
                                       <% 
                                    	for(int i=0;i<Streamlist.size();i++){
                                    	Stream s = Streamlist.get(i);
                                    	 %>
                                        <option  value="<%=s.getStreamid()%>"> <%=s.getStreamname()%> 
                                        </option>
                                        <%}%>   
                                            </select>
                                         </div>                    
                                    </div>
                                    
<!--                                 </form> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-4-xxxl col-12">
                        <div id="uploadAssDiv" class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Select subject</h3>
                                    </div>
                                </div>
<!--                                 <form class="new-added-form"> -->
                                    <div class="row">
                                      <div id="subjects" class="col-12-xxxl form-group">
                                             
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Add Notice Area End Here -->
                    
                </div>
<!--                 <footer class="footer-wrap-layout1"> -->
<!--                     <div class="copyright">© Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by -->
<!--                         <a href="#">PsdBosS</a></div> -->
<!--                 </footer> -->
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
    <!-- Scroll Up Js -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- Date Picker Js -->
    <script src="js/datepicker.min.js"></script>
    <!-- Custom Js -->
    <script src="js/main.js"></script>
    <script>
	
    $(document).ready(function()
    		{
    	//$("#uploadAssDiv").hide();
    	var streamValue;
    			$("#stream").change(function(){
    				//$("#uploadAssDiv").show();
    				var stream=$("#stream").val();
    				streamValue = stream;
    				//alert(stream);
    				$.ajax({
    					
    							method:"POST",
    							url:"fetchsubjectforfaculty",
    							data:
    							{
    								id:stream	
    							}
    					})
    					.done(function(data)
    					{
    						
    						$("#subjects").empty();
    						//$("#semester1").children().remove();
    						var object=jQuery.parseJSON(data);
    						
    						$.each(object,function(key,value){
    						
    						var divId = streamValue+'-'+value.subjectId;
        					$('#subjects').append('<div id='+divId+'></div>');
        					
    						var code = '<div value='+value.subjectId+' class="card dashboard-card-seven">'
//     						social-media bg-gplus hover-gplus
                            +'<div id="subjectDiv" class="social-media bg-gplus hover-gplus">'
                            +'<div class="media media-none--lg">'
//                             +'<div class="media-body space-sm">'
//                             +'<h2 value = '+value.subjectName+' class="item-title">'
//                             +'<a href="FetchSubmittedAssInfo?id='+value.subjectId+'">'+value.subjectName+'</a></h2>'
//                             +'</div>'
                            +'</div>'
                            +'<div class="social-like"><a href="GetNotes?subject='+value.subjectId+'">'+value.subjectName+'</a></div>'
                            +'</div>'
                            +'</div>';	
                            
    								
    								
    						$("#"+divId).append(code);	
    								
//     							$("#subjects").append('<h4 value='+value.subjectId+'>'+value.subjectName+'</h4>');
    						});
    					});
    			});//change 
    			$(document).on("click","#subjectDiv",function() {
    				
    				//var a = $(this).parent().find('.officeName').html();
    				//alert("hello");
    				//$('#hiddenId').find('#subjectValue').remove();
    				var idOfSubject = $(this).parent().attr('value');
    				//alert(idOfSubject);
    				//$("#hiddenId").append('<input  name="subjectId" id="subjectValue" value='+idOfSubject+' type="hidden" >');
    				document.getElementById("subjectValue").value = idOfSubject;
    				$("#uploadAssDiv").show();
    				
    		    });//change event
    		});
	

    </script>
   

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/notice-board.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
</html>