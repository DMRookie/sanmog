<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
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
        div.help {
          display:inline-block;
          margin:0px;
          padding:0px;
          width:12px;
          height:13px;
          background-image: url("help.gif");
          background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAANAQMAAACn5x0BAAAAAXNSR0IArs4c6QAAAAZQTFRFAAAAnp6eqp814gAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH2gMJBQgGYqhNZQAAACZJREFUCNdj+P+BoUGAoV+AYeYEEGoWYGgTYGgRAAm2gRGQ8f8DAOnhC2lYnqs6AAAAAElFTkSuQmCC");
        } 
div.pad { padding-left: 30px; padding-top: 5px; padding-bottom: 10px;}
.strand_name {text-align:left;}
        .strand_side {padding:0px 10px;}
        .strand_start {padding:0px 10px;}
        .strand_pvalue {text-align:center; padding:0px 10px;}
        .strand_lflank {text-align:right; padding-right:5px; font-weight:bold; font-size:large; font-family: 'Courier New', Courier, monospace; color:gray;}
        .strand_seq {text-align:center; font-weight:bold; font-size:large; font-family: 'Courier New', Courier, monospace;}
        .strand_rflank {text-align:left; padding-left:5px; font-weight:bold; font-size:large; font-family: 'Courier New', Courier, monospace; color:gray;}

        .block_td {height:25px;}
        .block_container {position:relative; width:99%; height:25px; padding:0px; margin:0px;}
        .block_motif {position:absolute; z-index:3; height:12px; top:0px; text-align:center; vertical-align:middle; background-color:cyan;}
        .block_rule {position:absolute; z-index:2; width:100%; height:1px; top:12px; left:0px; background-color:grey;}
        .block_plus_sym {position:absolute; z-index:4; width:12px; height:12px; top:0px; left:0px; color:grey;}
        .block_minus_sym {position:absolute; z-index:4; width:12px; height:12px; top:13px; left:0px; color:grey;}
        .tic_major {position:absolute; border-left:2px solid blue; height:0.5em; top:0em;}
        .tic_minor {position:absolute; border-left:1px solid blue; height:0.2em; top:0em;}
        .tic_label {position:absolute; top:0.5em;  height: 1em; text-align:center; vertical-align:middle}
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
					<td width="200px" onmouseover="test(this)" onmouseout="fuck(this)"><a href="index.jsp"><b>Home</b></a></td>
					<td width="200px" onmouseover="test(this)" onmouseout="fuck(this)">
						<a href="network.jsp"><b>Network Motif</b></a></td>
						<td width="200px" bgcolor="#A9A9A9"">
						<a href="sequence.jsp"><b>Sequence Motif</b></a></td>
					<td width="200px" onmouseover="test(this)" onmouseout="fuck(this)">
					<a href="help.jsp"><b>Help</b></a></td>
				</tr>
			</table>
		</div>
		<div class="pad">
<%
    List<String> result = (List<String>)session.getAttribute("showContent");
	for(String line : result){
		out.print(line);
	}
%>	
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