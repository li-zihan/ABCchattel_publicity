<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="common.jsp"></jsp:include>
<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<script>
function guanyu(){
  window.open(basePath+"security/guanyu.html");
}

function gongyue(){
	  window.open(basePath+"security/gongyue.html");
	}
	
function huiyuan(){
	  window.open(basePath+"security/huiyuan.html");
	}
function meitigongyue(){
	window.open(basePath+"security/meitigongyue.html");
}

</script>

</head>


<body>
 <div class="content"><img src="images/common/shutiao.jpg"  /></div>
   <div class="footer">
     <div class="footer_div">
       <p class="footer_li">
        <a class="fontcolor" style="font-weight: bold;" href="javascript:guanyu()">关于我们</a>
        <img src="images/common/shuxian.jpg" />
        <a class="fontcolor" style="font-weight: bold;" href="javascript:gongyue()">银行业公约</a>
        <img src="images/common/shuxian.jpg" />
        <!--<a class="fontcolor" style="font-weight: bold;" href="javascript:meitigongyue()">媒体公约</a>
        <img src="images/common/shuxian.jpg" />
		--><a class="fontcolor" style="font-weight: bold;" href="javascript:huiyuan()">会员体验及服务申请</a>
		<img src="images/common/shuxian.jpg" />
		<a class="fontcolor" style="font-weight: bold;" href="javascript:huiyuan()">市场业务合作联系</a>
       </p> 
       <p class="fontcolor">版权所有&copy;中物动产信息服务股份有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 未经许可不得复制、转载或建立镜像，违者必究!</p>
       <p class="fontcolor">China Logistics Chattel Information Service Co.,LTD. ALL Rights Reserved  京ICP备11031910号-2</p>
       </div>
   </div>

</body>
</html>
