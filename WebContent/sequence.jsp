<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	font-size: 18px;
	color: white;
	text-decoration: none;
	display: block;
	width: 195px;
}
</style>

<link href="css/ppgallery.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.8.6.custom.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/ppgallery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#gallery').ppGallery();
	});
	function test(t) {
		t.bgColor = "#A9A9A9";
	}
	function fuck(tt) {
		tt.bgColor = "#FF7F24";
	}
	$("")
var t;
var c=0;
var startTime=false;
function timedCount()
{	
	var label='-';
	var temp=c%4;
	switch(temp){
	case 0:
		label='-';
		break;
	case 1:
		label='\\';
		break;
	case 2:
		label='|';
		break;
	case 3:
		label='/';
	}
	document.getElementById('time').value=label;
	c=c+1;
	t=setTimeout("timedCount()",100);
	document.getElementById('txt').style.visibility="visible";
	return true;
}
function check()
{
	c=0;
	timedCount();
	return true;
}
</script>

</head>
<body
	style="padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px; background-color: #BDFCC9; font-family: arial, verdana, sans-serif;">
	<br/>
	<div align="center">
		<div style="width: 1000px;">
			<div id="logo" align="left" style="height: 200px;">
				<!-- <img style="float:left; repeat-x" width="60%" height="130px;" src="resources/logor.jpg"/> -->
				<img width="100%" height="200px" src="resource/log1.jpg" />
			</div>
			<div id="menu" style="width: 1000px; background-color: #FF7F24">
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
			<div id="content" align="center"
				style="padding-top: 0; margin-top: 0; height: 100%; background-color: #E8F3FE">
				<br />
				<form method="post" action="seqmotif" enctype="multipart/form-data"  onsubmit="return check()">
					<table align="center" width="900px;"
						style="border: 1px black solid;">
						<tr>
							<td align="left" colspan="3" valign="top"
								style="font-size: 18px; font-family: Times New Roman; padding-left: 5px; padding-top: 10px; padding-right: 5px; padding-bottom: 10px; line-height: 1.5;">
								<h3 style="font-size: 18px;">Please Input Data Set: <a href="resource/data/sequencemotif.txt" target="_blank">(Example Data)</a>
								</h3> 
							<input type="file" value="123" id="train" name="file" />
							</td>
						</tr>
						<tr>
							<td align="left" colspan="3" valign="top"
								style="font-size: 18px; font-family: Times New Roman; padding-left: 5px; padding-top: 10px; padding-right: 5px; padding-bottom: 10px; line-height: 1.5;">
								<h3 style="font-size: 18px;">Sequence Type:</h3>
								<input type="radio" name="alphabet" value="dna" checked>DNA
								<input type="radio" name="alphabet" value="protein">PROTEIN
							</td>
						</tr>
						<tr>
							<td align="left" colspan="3" valign="top"
								style="font-size: 18px; font-family: Times New Roman; padding-left: 5px; padding-top: 10px; padding-right: 5px; padding-bottom: 10px; line-height: 1.5;">
								<h3 style="font-size: 18px;">Mod Type:</h3>
								<input type="radio" name="mod" value="oops" checked>OOPS
								<input type="radio" name="mod" value="zoops">ZOOPS	
							</td>
						</tr>
						<tr>					
							<td align="left" colspan="3" valign="top"
								style="font-size: 18px; font-family: Times New Roman; padding-left: 5px; padding-top: 10px; padding-right: 5px; padding-bottom: 10px; line-height: 1.5;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" value="Predict" name="submit" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="reset" value="Reset" name="reset" />
								<br />
							</td>
						</tr>
						<tr>						
							<td>
							<div id="txt" style="visibility:hidden">
							waiting...<input type="text" id="time" style="border:0">
						   </div>
							</td>
						</tr>
					</table>
				</form>
				<br /> 
				<br />
			</div>
			<br />
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