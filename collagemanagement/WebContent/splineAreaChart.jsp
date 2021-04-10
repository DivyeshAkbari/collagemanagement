<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>  
<script>
window.onload = function () {
	
	var object = null;
	var date = [];
	var amount = [] ;
	
	$(document).ready(function(){
		$.ajax({ url: "getsplineAreaChartDetail",
		    	method:"POST",
				}).done(function(data)  {
					object = jQuery.parseJSON(data);
				});	
	});
		    	
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,  
	title:{
		text: "Fees Earning by Year"
	},
	axisY: {
		title: "Revenue in Rs.",
		valueFormatString: "#0,,.",
		suffix: "mn",
		prefix: "₹"
	},
	data: [{
		type: "splineArea",
		color: "rgba(54,158,173,.7)",
		markerSize: 5,
		xValueFormatString: "YYYY",
		yValueFormatString: "$#,##0.##",
		dataPoints: [
			
			{ x: new Date(2000, 0), y: 3289000 },
			{ x: new Date(2001, 0), y: 3830000 },

		/* 	 for(var i in data)
			{
				{ x: new Date(object.getPaymentdate(), 0), y: object.getAmount()},
			}  */
			
			/* $.each(object,function(key,value){
				{ x: new Date(value.getPaymentdate(), 0), y: value.getAmount()},
			}); */
		]
	}]
	});
	
chart.render();

}
</script>
</head>
<body>
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="assets/js/canvasjs.min.js"></script>
</body>
</html>