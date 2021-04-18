<%@page import="com.collagemanagement.bean.Stream"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/notice-board.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>EduChamp | Upload Notes</title>
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

<jsp:include page="/fetchsemesterforfaculty" />

<%
	List<Stream> Streamlist = (List) request.getSession(false).getAttribute("Streamlist");
String ans = (String)request.getSession(false).getAttribute("message");
System.out.println(ans);

%>

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

			<%@include file="sidebar-teacher.jsp"%>

			<!-- Sidebar Area End Here -->
			<div class="dashboard-content-one">
				<!-- Breadcubs Area Start Here -->
				<div class="breadcrumbs-area">
					<h3>Notes</h3>
					<ul>
						<li><a href="Teacher_dashboard.jsp">Home</a></li>
						<li>Notes</li>
					</ul>
				</div>
				<!-- Success Modal -->
								<div class="modal-box">
								<% 
								if(null != ans && ans.equalsIgnoreCase("true")){ 
								%>
                                <div data-backdrop="static" data-keyboard="false" class="modal hide fade" id="success-modal" tabindex="-1" role="dialog"
                                    aria-hidden="true">
                                    <div class="modal-dialog success-modal-content" role="document">
                                        <div class="modal-content">
                                            
                                            <div class="modal-body">
                                               <div class="success-message">
                                                    <div class="item-icon">
                                                        <i class="fas fa-check"></i>
                                                    </div>
                                                    <h3 class="item-title">Material uploaded successfully..!</h3>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button id="modalid" type="button" class="footer-btn bg-linkedin"
                                                    data-dismiss="modal" >Okay</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%} %>
                                <!-- Error Modal -->
                                 <%if(null != ans && ans.equalsIgnoreCase("false")){ 
                                %>
                                <div data-backdrop="static" data-keyboard="false" class="modal hide fade" id="error-modal" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog success-modal-content" role="document">
                                        <div class="modal-content">
                                           
                                            <div class="modal-body">
                                                <div class="success-message">
                                                    <div class="item-icon">
                                                        <i class="fas fa-exclamation-triangle"></i>
                                                    </div>
                                                    <h3 class="item-title">Material can't be uploaded !</h3>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button id="modalid" type="button" class="footer-btn bg-linkedin"
                                                    data-dismiss="modal" >Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%} session.setAttribute("message", null);%>
                                </div>

				<!-- Breadcubs Area End Here -->

				<div class="row">
					<div class="col-4-xxxl col-12">
						<div class="card height-auto">
							<div class="card-body">
								<div class="heading-layout1">
									<div class="item-title">
										<h3>Upload Notes</h3>
									</div>

								</div>
								<form method="post" action="UploadNotes"
									enctype="multipart/form-data" class="new-added-form">
									<div class="row">
										<!--                                     Col-lg-12 -->
										<!-- 										col-12-xxxl col-lg-6 col-12 form-group -->
										<div class="col-lg-12">
											<label>Select Stream *</label> <select name="streamId"
												id="stream" class="select2">
												<option value="0">Please Select</option>
												<%
													for (int i = 0; i < Streamlist.size(); i++) {
													Stream s = Streamlist.get(i);
												%>
												<option value="<%=s.getStreamid()%>">
													<%=s.getStreamname()%>
												</option>
												<%
													}
												%>
											</select>
										</div>

										<!--                                        col-lg-6 col-12  -->
<!-- 										<div id="subjects" class="col-12-xxxl form-group"></div> -->

<!-- 									</div> -->
									<!--                                 </form> -->
							</div>
						</div>
					</div>
					
					<div class="col-4-xxxl col-12">
						<div class="card height-auto">
							<div class="card-body">
								<div class="heading-layout1">
									<div class="item-title">
										<h3>Select subject</h3>
									</div>

								</div>
									<div class="row">
									
										<div id="subjects" class="col-12-xxxl form-group"></div>

									</div>
									
							</div>
						</div>
					</div>
					
					<div class="col-4-xxxl col-12">
						<div id="uploadAssDiv" class="card height-auto">
							<div class="card-body">
								<div class="heading-layout1">
									<div class="item-title">
										<h3 id="liTag"></h3>
									</div><br>
								</div>
<!-- 								<div class="breadcrumbs-area"> -->
<!-- 										<ul> -->
<!-- 											<li><a href="Teacher_dashboard.jsp">Notest</a></li> -->
<!-- 											<li id="liTag"></li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
								<!--                                 <form class="new-added-form"> -->
								<div class="row">
									<div class="col-12-xxxl col-lg-6 col-12 form-group">
										<label>Title</label> <input name="titleOfAss" type="text"
											placeholder="" class="form-control">
									</div>
									
									<div class="col-lg-6 col-12 form-group">
										<label>Description(Optional)</label>
										<textarea name="description" class="textarea form-control"
											name="message" id="form-message" cols="10" rows="9"></textarea>
									</div>
									<div class="col-lg-4">
										<label>Upload Notes</label> <input name="assignment"
											type="file"
											class="btn-fill-lmd radius-30 text-light bg-true-v">

										
									</div>
									<input name="subjectId" id="subjectValue" type="hidden">

									<div class="col-12 form-group mg-t-8">
										<button type="submit" onclick="myFunction()"
											class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Save</button>
										<button type="reset"
											class="btn-fill-lg bg-blue-dark btn-hover-yellow">Reset</button>
									</div>

								</div>
								</form>
							</div>
						</div>
					</div>
					<!-- Add Notice Area End Here -->

				</div>
				
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
	<script type="text/javascript">
	$(document).ready(function(){
        $('#success-modal').modal('show');
        $('#error-modal').modal('show');
        <% %>
    });
</script>
	<script>
		$(document)
				.ready(
						function() {
							$("#uploadAssDiv").hide();
							var streamValue;
							$("#stream")
									.change(
											function() {
												//$("#uploadAssDiv").show();
												var stream = $("#stream").val();
												streamValue = stream;
												//alert(stream);
												$
														.ajax(
																{

																	method : "POST",
																	url : "fetchsubjectforfaculty",
																	data : {
																		id : stream
																	}
																})
														.done(
																function(data) {

																	$(
																			"#subjects")
																			.empty();
																	//$("#semester1").children().remove();
																	var object = jQuery
																			.parseJSON(data);

																	$
																			.each(
																					object,
																					function(
																							key,
																							value) {

																						var divId = streamValue
																								+ '-'
																								+ value.subjectId;
																						$(
																								'#subjects')
																								.append(
																										'<div id='+divId+'></div>');

																						var code = '<div value='+value.subjectId+' class="card dashboard-card-seven">'
																								+ '<div id="subjectDiv" class="social-media bg-twitter hover-twitter">'
																								//                             +'<div class="media media-none--lg">'
																								//                             +'<div class="media-body space-sm">'
																								//                             +'<h6 value = '+value.subjectName+' class="item-title">'+value.subjectName+'</h6>'
																								//                             +'</div>'
																								//                             +'</div>'
																								+ '<div class="social-like">'
																								+ value.subjectName
																								+ '</div>'
																								+ '</div>'
																								+ '</div>';

																						$(
																								"#"
																										+ divId)
																								.append(
																										code);

																						//     							$("#subjects").append('<h4 value='+value.subjectId+'>'+value.subjectName+'</h4>');
																					});
																});
											});//change 
							$(document)
									.on(
											"click",
											"#subjectDiv",
											function() {
												if ($(event.target).attr(
														'class') == 'social-like') {
													//alert($(event.target).text());
													var subjectName = $(
															event.target)
															.text();
												}
												$("#liTag").text(subjectName);
												
												var idOfSubject = $(this)
														.parent().attr('value');
												document
														.getElementById("subjectValue").value = idOfSubject;
												$("#uploadAssDiv").show();

											});//change event
						});
	</script>


</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/notice-board.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 20 Dec 2020 18:32:27 GMT -->
</html>