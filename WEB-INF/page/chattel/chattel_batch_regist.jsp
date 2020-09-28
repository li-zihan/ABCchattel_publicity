<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/common.jsp"></jsp:include>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- <link href="css/security/login.css" rel="stylesheet" type="text/css" /> -->
<style type="text/css">
.query_hint{
 border:5px solid #939393;
 width:350px;
 height:60px;
 line-height:55px;
 padding:0 20px;
 position:absolute;
 left:50%;
 margin-left:-140px;
 top:50%;
 margin-top:-40px;
 font-size:15px;
 color:#333;
 font-weight:bold;
 text-align:center;
 background-color:#f9f9f9;
 z-index:10;
}
.query_hint img{position:relative;top:10px;left:-8px;}

 #topFill{
 display:none;
 text-align:center;
 position:absolute;
 z-index:1;
 filter:alpha(opacity=50);
 background-color:#eee;
 opacity: 0.5;
 -moz-opacity: 0.5;
 width:100%;
 height: 600px;
 } 
 .back{

 background-repeat: repeat;
width: 1000px;
height: 520px;
/* background-color: red; */
margin-left: -9px;
margin-top:-14px;
 }
 .back_table{
 margin-left: 240px;
 margin-top:50px;
 font-family: "微软雅黑";
 font-size: 18px;
 float:left;
 }
 .back_table_input{
 width:400px;
 height:30px;
 line-height:30px;
 padding-top:3px;
 font-family: "微软雅黑";
 }
 .back_table_button{
 width:70px;
 height:30px;
 font-family: "微软雅黑";
 }
 .bo{
 height:30px;
  background-image: url(..../../images/chattel/back.png);
 }
</style>
<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		document.getElementById("topFill").style.display = "none";
		document.getElementById("handle").style.display = "none";
		$("#btn").click(function() {
			var flag = true;
			var filepath = $("input[name='file']").val();
			if(filepath == '') {
				alert("请选择要导入的excel文件!");
				$("input[name='file']").focus();
	         	flag = false;
			} else {
				var extStart = filepath.lastIndexOf(".");
		        var ext = filepath.substring(extStart,filepath.length).toUpperCase();
		       
		        if(ext.toUpperCase() != ".XLS" && ext.toUpperCase() != ".XLSX"){
		         	alert("文件限于xls,xlsx格式,请重新选择!");
		         	$("input[name='file']").focus();
		         	flag = false;
		        }
			}      
	        if(flag) {
				document.getElementById("handle").style.display = "block";
				
				document.body.style.overflow = 'hidden';
				document.body.style.height = document.body.clientHeight + 'px'; 
				document.getElementById('topFill').style.display = 'block';
				document.getElementById('topFill').style.height = document.body.clientHeight + 'px';
	        	$('#batch_regist_form').submit();
	        }
		});
	});
	/* function show_query_hint() {
		document.getElementById("handle").style.display = "block";
	} */
	
</script>
</head>
<body class="bo">
	<div class="back">
	<div id="topFill"></div>
	<div id="handle" class="query_hint"> 
	 <img src="images/common/loading.gif" />正在导入excel中的数据, 请稍候... 
	</div>
	<form action="chattel/batch_regist.html" method="post" enctype="multipart/form-data" target="hidden_frame" id="batch_regist_form">
		<table class="back_table">
			<tr>
				<td colspan="2"align="center";>请选择要导入的excel文件</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td>文件:    </td>
				<td ><input class="back_table_input" type="file" name="file" id="file"/></td>
				<td colspan="2" align="right" ><input class="back_table_button" type="button" value="导  入" id="btn"/></td>
			</tr>
		</table>
		<br/>
		<iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	</form>
	</div> 
</body>
</html>

<script type="text/javascript">

function handleCallback()
{
	location.href = basePath + "chattel/batch_regist_result.html";
}


</script>