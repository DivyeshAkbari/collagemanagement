<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%@page import="com.collagemanagement.bean.FeesDetails"%>
<%@page import="com.collagemanagement.service1.AdminPanel"%>
<%@page import="com.collagemanagement.service.impl.AdminPanelServiceImpl"%>

<%	
	AdminPanel adminpanelService = new AdminPanelServiceImpl();

	int count = adminpanelService.fetchTotalEarning();
	
	List<FeesDetails>  chartlist =(List)request.getAttribute("chartlist");
	

%>
 
<%
Gson gsonObj = new Gson();

Map<Object,Object> map = null;

List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();

for(int i=0 ;i<chartlist.size();i++){
	
	FeesDetails fees = new FeesDetails();
 
map = new HashMap<Object,Object>(); map.put("label",fees.getPaymentdate()); map.put("y",count); list2.add(map);

map = new HashMap<Object,Object>(); map.put("label", "2022"); map.put("y",7000); list2.add(map);

}

String dataPoints = gsonObj.toJson(list2);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	title: {
		text: "Student Fees Earning Chart"
	},
	axisX: {
		title: "Year"
	},
	axisY: {
		title: "In Rs.",
		includeZero: true
	},
	data: [{
		type: "area",
		yValueFormatString: "Rs#,##0.0# Rupees",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="assets/js/canvasjs.min.js"></script>
</body>
</html>  