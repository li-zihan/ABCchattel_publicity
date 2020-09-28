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

<script type='text/javascript' src='dwr/interface/areaDwr.js'></script>
	<script type='text/javascript' src='dwr/interface/userPasswordController.js'></script>
	<script type='text/javascript' src='dwr/engine.js'></script>
	<script type='text/javascript' src='dwr/util.js'></script>
	
		<script type="text/javascript" src="script/config/js/config.js"></script>
	
	<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
	<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>

<link rel="shortcut icon" href="images/security/favicon.png" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/zzsc.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/common/css_index_general.css"/>
<link rel="stylesheet" type="text/css" href="css/common/css_lanrentuku.css"/>
<link href="css/common/top.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="script/index_navigation.js"></script>
<script type="text/javascript" src="script/config/js/config.js"></script>

	<link href="script/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<link href="script/validation/template.css" rel="stylesheet" type="text/css" />
	<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
	<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
	<link href="css/config/configManager/supv.css" rel="stylesheet" type="text/css" />
	<link type="text/css" href="css/account/userinfo.css" rel="stylesheet" />	

 
 <script language="javascript" type="text/javascript"> 
$(document).ready(function(){ 
      $("#main").load(function(){ 
      $(this).height(0); //用于每次刷新时控制IFRAME高度初始化 
      var height = $(this).contents().height() + 20;
      $(this).height( height < 500 ? mainBodyHeight : height ); 
    }); 
}); 
</script>

<script type="text/javascript">	
	
		$(function(){
			$('#updatepwindex').validationEngine();
		});
		
		function fn_updateUserPwd(){
			if($('#updatepwindex').validationEngine("validate")){
				var newPassword = document.getElementById('newPassword');
				var confirmPassword = document.getElementById('confirmPassword');
				if(newPassword.value!=confirmPassword.value){
					alert("新登录密码与再次输入密码不一致，请重新输入！");
				}else{
					$("#updatepwindex").submit();
				}
			}
		};
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
		        <div class="nav_03">
		            <ul>
		               <li class="yonghu" style="width:200px;text-align: right;">
		               		<img src="images/common/yonghu_bg.jpg"></img>
		               		<span style="margin-top:20px;vertical-align: top;">你好！&nbsp;<c:out value="${managerName }" /></span>
		               </li>
		               <li style="width:50px;"><div id="mycom" class="mycom">我的账号</div></li>
		               <li style="width:30px;"><a href="security/logout.html">退出</a></li>
		            </ul>
		        </div>
		    </div>
		</div>
    </div>
    <!--头部 End-->
    
    <!--主体页面 Begin-->
    <div id="mainBody" style=" background:url(images/chattel/main_bg.jpg) repeat;">
        	<form method="post" action="security/first_update_password.html" id="updatepwindex">
	 		<div class="main_content" style="margin: 16px 0px 10px 48px;width:907px;height:305pxborder-width: 2px;">
		 		<div class="center_4_ale" style="padding-left:45px">首 次 登 陆 修 改 密 码</div>
				<table id="userpwd_table_id" style="border-width: 2px; margin-top: -5px;padding-top:20px;">
					
					<tr>
						<td align="right" style="vertical-align: middle;" class="pr10">新登录密码： </td>
						<td align="left" style="vertical-align: middle;">
                          <input class="userpwd_table_id_td validate[required, custom[numberletters], maxSize[16], minSize[6]] text-input" style="width: 200px;" type="password" name="newPassword" id="newPassword" />
                          <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                      	</td>
					</tr>
					
					<tr>
						<td align="right" style="vertical-align: middle;" class="pr10">再次输入： </td>
						<td align="left" style="vertical-align: middle;">
                          <input class="userpwd_table_id_td validate[required, custom[numberletters], maxSize[16], minSize[6]] text-input" style="width: 200px;" type="password" name="confirmPassword" id="confirmPassword" />
                          <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                      	</td>
					</tr>
					
					<tr >
                       <td align="center" colspan="2" >
	                         <input style="margin-top: 20px;margin-left: 100px;margin-right:0px;" type="button" value="确认" class="buttony" onclick="fn_updateUserPwd();"/>
	                         <input style="margin-top: 20px;margin-left: 50px;" type="button" value="返回" onclick="javascript:history.back(1);" class="buttony"  />
                       </td>
                    </tr>
					
				</table>
			
			</div>

</form>
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