<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>中国物流金融服务平台</title>
<META http-equiv="X-UA-Compatible" content="IE=8" >
<meta name="renderer" content="ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="common/common.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="shortcut icon" href="images/security/favicon.png" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/zzsc.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/common/css_index_general.css"/>
<link rel="stylesheet" type="text/css" href="css/common/css_lanrentuku.css"/>
<link href="css/common/top.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="script/index_navigation.js"></script>
<script type="text/javascript" src="script/config/js/config.js"></script> 
 <script language="javascript" type="text/javascript"> 
$(document).ready(function(){ 
      $("#main").load(function(){ 
      $(this).height(0); //用于每次刷新时控制IFRAME高度初始化 
      var height = $(this).contents().height() + 20;
      $(this).height( height < 500 ? mainBodyHeight : height ); 
    }); 
}); 

function f1(){
	$("#myform").submit();
	$("#mycom").removeClass("mycom1").addClass("mycom");
		$(".nav .nav_li ul li").siblings().each(function(){
			$(this).children(":first")
			.removeClass("vvv");
			
		});

}
//屏蔽backspace按键
$(document).keydown(function (e) {  
	  
    var doPrevent;  
      
    // for IE && Firefox   
    var varkey = (e.keyCode) || (e.which) || (e.charCode);  
      
    if (varkey == 8) {  

        var d = e.srcElement || e.target;   

        if (d.tagName.toUpperCase() == 'INPUT' || d.tagName.toUpperCase() == 'TEXTAREA') {  

            doPrevent = d.readOnly || d.disabled;  

            // for button,radio and checkbox   
            if (d.type.toUpperCase() == 'SUBMIT'  
                || d.type.toUpperCase() == 'RADIO'  
                || d.type.toUpperCase() == 'CHECKBOX'  
                || d.type.toUpperCase() == 'BUTTON') {  

                doPrevent = true;  
            }  
        }  
        else {  

            doPrevent = true;  
        }  
    }  
    else {  

        doPrevent = false;  
    }  

if (doPrevent)  

    e.preventDefault();  
});  

</script>

</head>
<body>
<center>
<div id="container">
    <!--头部 Begin-->
	<div id="header">
		<div class="content">
		     <div class="head">
		       <div class="logo"><img src="images/security/logo.png" /></div>
<!-- 		       <div class="tel"><img src="images/common/tel.jpg" /></div> -->
		       <div class="clr"></div>
		       <div class="xian"><img src="images/common/shutiao.jpg" /></div>
		    </div>
		 <!-- *************************************************************-->
			<div class="nav">
		        <div class="nav_li">
		            <ul>
		               <c:forEach items="${menuList }" var="row" varStatus="status">
						<li><a href="<c:out value="${row.menuUrl }"/>?parentMenuId=<c:out value="${row.menuId }"/>" target="main"><c:out value="${row.menuName }" /></a>
					   </c:forEach>
		            </ul>
		        </div>
		        <div class="nav_02">
		            <ul>
		               <li class="yonghu" style="width:200px;text-align: right;">
		               	<img src="images/common/yonghu_bg.jpg"></img>
		               	<span style="margin-top:20px;vertical-align: top;">你好！&nbsp;<c:out value="${managerName }" /></span>
		               </li>
		               <li style="width:50px;"><a href="javascript:f1()"  ><div id="mycom" class="mycom1">我的账号</div></a></li>
		               <li style="width:30px;"><a href="security/logout.html">退出</a></li>
		            </ul>
		        </div>
		    </div>
		</div>
		<form action="security/user_info.html" method="post" id="myform" target="main"></form>
    </div>
    <!--头部 End-->
    
    <!--主体页面 Begin-->
    <div id="mainBody" style=" background:url(images/chattel/main_bg.jpg) repeat;">
        <iframe allowTransparency="true" frameborder="0" width="1000" id="main" name="main" src="<c:out value="${menuList[0].menuUrl }"/>?parentMenuId=<c:out value="${menuList[0].menuId }"/>" scrolling="no"></iframe>
    </div>
    <!--主体页面 End-->
    
    <!--底部 Begin-->
    <div id="footer">
         <iframe frameborder="0" width="1000" id="footer" name="footer" src="security/foot_load.html" scrolling="no"></iframe>
    </div>

    <!--底部 End-->

</div>
</center>
</body>
</html>