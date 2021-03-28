<%@page import="com.collagemanagement.bean.User"%>
<%@page import="com.collagemanagement.bean.FeesDetails"%>
<%@page import="com.collagemanagement.service.impl.FeesPaymentServiceImpl"%>
<%@page import="com.collagemanagement.service1.FeesPaymentService"%>
 
<%@page import="utils.PaytmConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>

 
<%
Enumeration<String> paramNames = request.getParameterNames();
Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01")){
			outputHTML = parameters.toString();
		}else{
			outputHTML="<b>Payment Failed.</b>";
		}
	}else{
		outputHTML="<b>Checksum mismatched.</b>";
	}
}catch(Exception e){
	outputHTML=e.toString();
}
%>

<%
	FeesDetails fees = new FeesDetails();

	String str = String.valueOf(parameters); 

	FeesPaymentService feespayment = new FeesPaymentServiceImpl();
	
	String s[] = str.split(",");
	String s1[] = s[5].split("=");
	String s2[]=s[10].split("=");
	String s4[] = s[11].split("=");
	String s8[]=s[10].split("=");
	
	fees.setOrderid(s1[1]);
	fees.setPaymentdate(s4[1]);
	
	String responseofpayment=feespayment.UpdatePaymentDetails(fees);
		
	FeesDetails feesDetails = new FeesDetails();
	/* String id =(String)request.getAttribute("studentfeespaymentid"); */
	
%>

<!DOCTYPE html>
<html lang="en">

<head>

	<!-- META ============================================= -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	<meta name="robots" content="" />
	
	<!-- DESCRIPTION -->
	<meta name="description" content="EduChamp : Education HTML Template" />
	
	<!-- OG -->
	<meta property="og:title" content="EduChamp : Education HTML Template" />
	<meta property="og:description" content="EduChamp : Education HTML Template" />
	<meta property="og:image" content="" />
	<meta name="format-detection" content="telephone=no">
	
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
	
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
	
	<style type="text/css">

    body
    {
        background:#f2f2f2;
    }

    .payment
	{
		border:1px solid #f2f2f2;
		height:480px;
		width:680px;
        border-radius:50px;
        background:#fff;
	}
   .payment_header
   {
	   background:rgb(216, 149, 26);
	   padding:20px;
       border-radius:20px 20px 0px 0px;
	   
   }
   
   .check
   {
	   margin:0px auto;
	   width:50px;
	   height:50px;
	   border-radius:100%;
	   background:#fff;
	   text-align:center;
   }
   
   .check i
   {
	   vertical-align:middle;
	   line-height:50px;
	   font-size:30px;
   }

    .content 
    {
        text-align:center;
    }

    .content  h1
    {
        font-size:25px;
        padding-top:25px;
    }

    .content a
    {
        width:200px;
        height:35px;
        color:#fff;
        border-radius:30px;
        padding:5px 10px;
        background:rgb(216, 149, 26);
        transition:all ease-in-out 0.3s;
    }

    .content a:hover
    {
        text-decoration:none;
        background:#000;
    }
</style>

</head>

<body id="bg">
<div class="page-wraper">
<div id="loading-icon-bx"></div>
	<!-- Header Top ==== -->
    <%@include file="header.jsp" %>
    <!-- header END ==== -->
    <!-- Content -->
<form action="SelectPaymentInvoiceDetails" method="post">
	<section>
		<div class="container">
   			<div class="row">
      			<div class="col-md-6 mx-auto mt-5">
         			<div class="payment">
            			<div class="payment_header">
               				<div class="check"><i class="fa fa-check" aria-hidden="true"></i></div>
            			</div>
            			<div class="content">
               				<h1>Payment Success !</h1>           					
                             <%--    <input type="hidden"  class="form-control"  name="id"  required value=<%=id %> >  --%>                                           
               					<p>Your Fees Payment was Processed Successfully,To Check Invoice Press Below Button.</p>
              					<p>Your Order ID :<%=fees.getOrderid() %></p>
              					<p>Amount :<%=fees.getAmount() %></p>
                				<button name="submit" type="submit" class="btn button-md">View Invoice</button>	
               					<%-- <a href="SelectPaymentInvoiceDetails?id=<%=id %>">view Invoice</a>  --%>	
            			</div>  
         			</div>
      			</div>
   			</div>
		</div>
	</section>
</form>
    <!-- Content END-->
	<!-- Footer ==== -->
    <%@include file="footer.jsp" %>
    <!-- Footer END ==== -->
    <button class="back-to-top fa fa-chevron-up" ></button>
</div>
<!-- External JavaScripts -->
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
<script src="assets/js/functions.js"></script>
<script src="assets/js/contact.js"></script>

</body>
</html>
