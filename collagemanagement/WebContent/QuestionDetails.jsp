<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.collagemanagement.bean.QuoraSession"%>
<%@page import="java.util.List"%>
    
<!DOCTYPE html>
<html lang="en">

<!-- modules-datatables.html  Tue, 07 Jan 2020 03:38:57 GMT -->
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title>Modules &rsaquo; DataTables &mdash; CodiePie</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/all.min.css">

<!-- CSS Libraries -->
<link rel="stylesheet" href="assets/css/datatables.min.css">
<link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="assets/css/select.bootstrap4.min.css">

<!-- Template CSS -->
<link rel="stylesheet" href="assets/css/style.min.css">
<link rel="stylesheet" href="assets/css/components.min.css">

</head>
<jsp:include page ="/SelectQueryDetails"/>
<% List<QuoraSession>  queryList =(List)request.getAttribute("querylist"); %>

<body class="layout-4">
<!-- Page Loader -->


<div class="page-loader-wrapper">
    <span class="loader"><span class="loader-inner"></span></span>
</div>

<div id="app">
    <div class="main-wrapper main-wrapper-1">
        <div class="navbar-bg"></div>
                        <div class="section-body">
                     <h2 class="section-title">Quora</h2>
                    <!-- <p class="section-lead">We use 'DataTables' made by @SpryMedia. You can check the full documentation <a href="https://datatables.net/">here</a>.</p> -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                               <h4> Question Details</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped " id="table-1" style="width:30%">
                                            <thead>
                                                <tr>
                                                <th class="text-center">
                                                
                                                
                                                   Sr.No
                                                </th>
                                                <th>Topic Name</th>
                                                <th>Category Type</th>
                                               <th>Topic Description</th>
                                     
                                                </tr>
                                            </thead>
                                            <tbody>
                                           
                                            <% for(int i=0;i<queryList.size();i++)
												{ %>
												<tr>	
														<% QuoraSession q1 = queryList.get(i); %>
														<td><%=q1.getQueryId() %></td>
															<td><a href="GetAnswerDetails?id=<%=q1.getQueryId() %>" ><%=q1.getTopicname() %></a></td>		
														<td><%=q1.getCtype() %></td>
														<td><%=q1.getTdescription() %></td>		
										
													</tr>
											<% } %>               
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
       	    </div>
     </div>
</div>

<!-- General JS Scripts -->
<script src="assets/js/lib.vendor.bundle.js"></script>
<script src="assets/js/CodiePie.js"></script>

<!-- JS Libraies -->
<script src="assets/js/datatables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>
<script src="assets/js/dataTables.select.min.js"></script>
<script src="assets/js/jquery-ui.min.js"></script>

<!-- Page Specific JS File -->
<script src="assets/js/modules-datatables.js"></script>

<!-- Template JS File -->
<script src="assets/js/scripts.js"></script>
<script src="assets/js/custom.js"></script>
</body>
<!-- modules-datatables.html  Tue, 07 Jan 2020 03:39:02 GMT -->
</html>