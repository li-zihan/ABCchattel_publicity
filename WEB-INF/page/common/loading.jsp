<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="common/common.jsp"></jsp:include>      
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> 正在查询，请稍等... </title>
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
}
.query_hint img{position:relative;top:10px;left:-8px;}
</style>

<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
//页面加载完成之后去掉Loading
$(document).ready(function(){
	//show_div('excel正在处理中, 请稍后...', 2000);
	//window.setTimeout("show_div('正在上传到服务器...', 2000)", 2000);
	//window.setTimeout("window.setTimeout(\"show_div('eeeeeeeeee...', 2000)\", 2000)", 2000);
});

function show_div(content, timeout) {
	var span = document.getElementById('span');
	span.innerText = content;
	show_query_hint();
	window.setTimeout("queryHintCallback()", timeout);
}

/**
 * @description  * 显示查询等待层
 * @param query_hint
 */
function show_query_hint(){
    var query_hint = document.getElementById('query_hint');
    query_hint.style.display="block";
}

/**
 * @description 查询结果回调函数
 * @param query_hint 要隐藏的提示层id
 */
function queryHintCallback(){
    var query_hint = document.getElementById('query_hint');
    query_hint.style.display="none";
}
</script>
 </head>
 <body>
  <div id="query_hint" class="query_hint">
   <img src="images/common/loading.gif" /><span id="span"></span>
  </div>
 </body>
</html>