<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SANMOG</title>
<style type="text/css">
#menu {
	height: 30px;
	margin: 0 auto;
	background-color: #003366;
}
#menu table tr td a {
	font-size:18px;
	color:white; 
	text-decoration:none;
	display:block; 
	width:195px;
}
</style>

<link href="css/ppgallery.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.8.6.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/ppgallery.js"></script> 
<script type="text/javascript">
$(document).ready(function() {
	$('#gallery').ppGallery();
});
function test(t)
{
	t.bgColor = "#A9A9A9";
}
function fuck(tt)
{
	tt.bgColor = "#FF7F24";
}
</script>

</head>
<body style="padding-top:0px; margin-top:0px;padding-bottom:0px; margin-bottom:0px;background-color:#BDFCC9;font-family:arial,verdana,sans-serif;">
	<br/>
	<div align="center">
	<div style="width:1000px;">
		<div id="logo" align="left" style="height: 200px;">
			<!-- <img style="float:left; repeat-x" width="60%" height="130px;" src="log1.jpg"/> -->
			<img width="100%" height="200px" src="resource/log1.jpg"/>
		</div>
		<div id = "menu" style="width:1000px; background-color:#FF7F24">
			<table width="1000px">
				<tr align="center" style="height:26px;">
					<td width="200px" bgcolor="#A9A9A9"><a href="index.jsp"><b>Home</b></a></td>
					<td width="200px" onmouseover="test(this)" onmouseout="fuck(this)">
						<a href="network.jsp"><b>Network Motif</b></a></td>
						<td width="200px" onmouseover="test(this)" onmouseout="fuck(this)">
						<a href="sequence.jsp"><b>Sequence Motif</b></a></td>
					<td width="200px" onmouseover="test(this)" onmouseout="fuck(this)">
					<a href="help.jsp"><b>Help</b></a></td>
				</tr>
			</table>
		</div>
		<div id="content" align="center" style="padding-top:20px;margin-top:0px;height:700px; background-color:#E8F3FE">
			<%
				String errorMessage = (String)session.getAttribute("errorMessage");
			%>
			<h1 style="color:red">Error</h1>
			<p style="color:red"><img src="resource/error.jpg" width="300" height="250" /></p>
			<div align="left" style="width:500px">
				<h2><%=errorMessage %></h2>
			</div>			
		</div>
		<br/>
		<div id="foot" align="center" style="height: 30px; background-color: #BDFCC9; color: #000000; padding-top: 5px;margin-top:0;font-weight:bold;">
			Developed by <a href="http://lab.malab.cn/~zq/" style="color:#000000; ">Quan Zou.</a>
			Copyright <a href="http://www3.ntu.edu.sg/home/xkxiao/index.html" style="color: #000000;">Xiaokui Xiao@NTU</a>.
		    All Rights Reserved.
		</div>
	</div>
	</div>
</body>
</html>