<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

 <%@page import="com.collagemanagement.bean.User"%>
 <%@page import="com.collagemanagement.service1.AdminPanel"%>
 <%@page import="com.collagemanagement.service.impl.AdminPanelServiceImpl"%>

<%
	AdminPanel adminpanelService = new AdminPanelServiceImpl();

	int count = adminpanelService.fetchStudent();
	
	int count1 = adminpanelService.fetchfemaleStudent();
	
	int count2 = adminpanelService.fetchfemaleTeacher();
	
	int count3 = adminpanelService.fetchmaleTeacher();
	

%>
 
<%

Gson gsonObj = new Gson();

Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

map = new HashMap<Object,Object>(); map.put("label", "MaleStudents"); map.put("y",count); list.add(map);

map = new HashMap<Object,Object>(); map.put("label", "FemaleStudents"); map.put("y",count1); list.add(map);

map = new HashMap<Object,Object>(); map.put("label", "FeMaleFaculties"); map.put("y",count2); list.add(map);

map = new HashMap<Object,Object>(); map.put("label", "MaleFaculties"); map.put("y",count3); list.add(map);

String dataPoints = gsonObj.toJson(list); 

%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "Registered Alumnies-Facuties"
	},
	subtitles: [{
		text: "in Male-Female"
	}],
	data: [{
		type: "doughnut",
		yValueFormatString: "#,##0",
		indexLabel: "{label}: {y}",
		dataPoints : <%out.print(dataPoints);%>
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