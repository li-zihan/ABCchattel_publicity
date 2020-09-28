<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>修改密码</title>
	<meta http-equiv="X-UA-Compatible" content="IE=8" >
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@ page language="java" contentType="text/html; charset=utf-8"
	    pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:include page="../common/common.jsp"></jsp:include> 
	
	<script type='text/javascript' src='dwr/interface/areaDwr.js'></script>
	<script type='text/javascript' src='dwr/interface/userPasswordController.js'></script>
	<script type='text/javascript' src='dwr/engine.js'></script>
	<script type='text/javascript' src='dwr/util.js'></script>
	
	<script type="text/javascript" src="script/config/js/config.js"></script>
	
	<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
	<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>
	
	<link href="script/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<link href="script/validation/template.css" rel="stylesheet" type="text/css" />
	<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
	<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
	<link href="css/account/userinfo.css" rel="stylesheet" type="text/css" />	
	
	<script type="text/javascript">

		$(function(){
			$('#updatepw').validationEngine();
		});

		$(function(){
			
			$('#updatepwd_btn').click(function(){
				if($('#updatepw').validationEngine("validate")){
					var newPassword = document.getElementById('newPassword');
					var confirmPassword = document.getElementById('confirmPassword');
					var oldPassword = document.getElementById('oldPassword');
					if(newPassword.value!=confirmPassword.value){
						alert("新登录密码与再次输入密码不一致，请重新输入！");
					}else if(newPassword.value==oldPassword.value){
						
						alert("新登录密码与原密码一致，请重新输入！");
					}else if(newPassword.value==confirmPassword.value){
						
						userPasswordController.isExsitUserPassword(oldPassword.value, function(data){
							if(data) {
								alert("原登录密码输入不正确，请重新输入！");
							} else {
								$("#updatepw").submit();
								//location.href = basePath + 'security/password_update.html';
								alert("密码修改成功！");
							}
						});
					}
				}
				
			});
		});
		
	</script>
</head>
<body>
		<div class="main_content" style="margin: 16px 0px 0px 48px;width:907px;height:305pxborder-width: 2px">
		<form class="main_right_div_form" action="security/password_update.html" method="post" id="updatepw">
 		<div class="center_4_ale" style="padding-left:45px">密 码 修 改</div>
		<table id="userpwd_table_id" style="border-width: 2px;margin-top: -5px;padding-top:20px">
			<tr>
				<td align="right" class="pr10" >原登录密码：</td>
				<td align="left">
                        <input class="userpwd_table_id_td validate[required,maxSize[16]] text-input" style="width: 200px;" type="password" name="oldPassword" id="oldPassword" size="20"/>
                        <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                    	</td>
			</tr>
			
			<tr>
				<td align="right" class="pr10">新登录密码： </td>
				<td align="left">
                        <input class="userpwd_table_id_td validate[required, custom[numberletters], maxSize[16], minSize[6]] text-input" style="width: 200px;" type="password" name="newPassword" id="newPassword" />
                        <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                    	</td>
			</tr>
			
			<tr>
				<td align="right" class="pr10">再次输入： </td>
				<td align="left">
                        <input class="userpwd_table_id_td validate[required, custom[numberletters], maxSize[16], minSize[6]] text-input" style="width: 200px;" type="password" name="confirmPassword" id="confirmPassword" />
                        <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                    	</td>
			</tr>
			
			<tr class="input_table" >
                     <td colspan="2">
                     	<div class="buttontxt" align="center">	
                     	<input type="button" value="确认" class="buttony" id="updatepwd_btn" /><!--onclick="fn_updateUserPwd();" -->
                        <input type="button" value="返回" onclick="javascript:history.back(1);" class="buttony"  />
                       </div>
                     </td>
                  </tr>
			
		</table>
	</form>
	</div>

</body>
</html>