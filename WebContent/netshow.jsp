<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="./d3/d3.js" charset="utf-8"></script>
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
path.link {
  fill: none;
  stroke: #666;
  stroke-width: 1.0px;
}
circle {
  fill: #fd8d3c;
  stroke: #fff;
  stroke-width: 1.5px;
}
text {
  fill: #000;
  font: 10px sans-serif;
  pointer-events: none;
}
.node {
  stroke: #fff;
  stroke-width: 1.5px;
}

.link {
  stroke: #999;
  stroke-opacity: .6;
}

.main-container{border-left:1px solid #ccc;position:relative;padding:20px;*z-index:-1;*padding:20px 0 20px 20px;}
.main-container .prolists{list-style-type:none;margin:0;padding:0;height:900px;}
.main-container .prolists li{float:left;width:290px;height:300px;padding:0 25px 0;text-align:center;*width:240px;}
.main-container .prolists li img{width:240px;margin-bottom:30px}
.main-container .prolists li a,
.main-container .prolists li span{display:block;}      
</style>
<jsp:include page="processbar.jsp"></jsp:include>
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
					<td width="200px" onmouseover="test(this)" onmouseout="fuck(this)"><a href="index.jsp"><b>Home</b></a></td>
					<td width="200px" bgcolor="#A9A9A9">
						<a href="network.jsp"><b>Network Motif</b></a></td>
						<td width="200px" onmouseover="test(this)" onmouseout="fuck(this)">
						<a href="sequence.jsp"><b>Sequence Motif</b></a></td>
					<td width="200px" onmouseover="test(this)" onmouseout="fuck(this)">
					<a href="help.jsp"><b>Help</b></a></td>
				</tr>
			</table>
		</div>
		<div class="main-container">
		<!--  img  width="100%"  src='images/adjMatrix.jpg'-->
		<iframe sandbox="allow-scripts allow-forms allow-same-origin" src="./result.html" marginwidth="0" marginheight="0" scrolling="no" height=800 width=900 ><p>Your browser does not support iframes.</p> </iframe>
<p><aside><a style="position:relative;top:6px;" href="./result.html" target="_blank">Open in a new window.</a></aside>
		</div>
		<table align="center" border="1" style="width:100%;">
		<tbody>
		<tr onmouseover="this.style.backgroundColor=&#39;#BFEFFF&#39;;" onmouseout="this.style.backgroundColor=&#39;#FAFAFA&#39;;" style="background-color: rgb(250, 250, 250);">
		<td>ID</td><td>NUM IN REAL</td><td>MEAN IN RANDOM</td><td>VAR IN RANDOM</td><td>ZSCORE</td>
		<%
		  List<String> result = (List<String>)session.getAttribute("result");
		for(int i = 0;i < result.size(); i++){
			out.print("<tr onmouseover=\"this.style.backgroundColor=&#39;#BFEFFF&#39;;\" onmouseout=\"this.style.backgroundColor=&#39;#FAFAFA&#39;;\" style=\"background-color: rgb(250, 250, 250);\">");
			String[] linelist = result.get(i).split("\t\t");
			String id = linelist[0].trim();
			out.print("<td> <a target=\"_blank\" href=\"images/"+id+".jpg\" >" + linelist[0].trim()+"</td>");
			for(int j = 1; j < 5; j++)
		      out.print("<td>" + linelist[j].trim() + "</td>");
			out.print("<a href=\"images/"+id+".jpg\" ></tr>");
		}
		%>
		</tr>
		</tbody>
		</table>
		<br/>	
		<br>
		<div id="foot" align="center"
				style="height: 30px; background-color: #BDFCC9; color: #000000; padding-top: 5px; margin-top: 0; font-weight: bold;">
				Developed by <a href="http://lab.malab.cn/~zq/" style="color: #000000;">Quan Zou.</a> 
				Copyright <a href="http://www3.ntu.edu.sg/home/xkxiao/index.html" style="color: #000000;">Xiaokui Xiao@NTU</a>.
				All Rights Reserved.
			</div>
	</div>
	</div>
</body>
</html>