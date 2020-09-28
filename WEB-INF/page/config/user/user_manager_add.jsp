<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>创建用户</title>
		<meta http-equiv="X-UA-Compatible" content="IE=8" >
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ page language="java" contentType="text/html; charset=utf-8"
		    pageEncoding="utf-8"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
		<jsp:include page="../../common/common.jsp"></jsp:include>
		
		<script type='text/javascript' src='dwr/interface/areaDwr.js'></script>
		<script type='text/javascript' src='dwr/interface/userController.js'></script>
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
		<link href="css/config/configManager/supv.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript">	
	
		$(function(){
			$('#addUser').validationEngine();
		});
		
		$(function(){
			$('#add_btn').click(function(){
				var userName = document.getElementById('userName');
				userController.isExistUserName(userName.value, function(data){
					if(data) {
						$('#userName').validationEngine('showPrompt', '用户登录名已存在！', null, null, true);
					} else {
						if ($("#addUser").validationEngine("validate")){  //验证是否通过
							$('#add_btn').attr('disabled',"true");//添加disabled属性
			     		   	$("#addUser").submit();  
						}
					}
				});
				
			});
		});
		
		function fn_getCity() {
			var comboProvince = document.getElementById('combo_province');
			areaDwr.loadCitysByProvince(comboProvince.value, function(data){
				var comboCity = document.getElementById('combo_city');		
				comboCity.options.length = 0;		
				for(var i=0;i<data.length;i++) {
					comboCity.options.add(new Option(data[i].cityName, data[i].cityId));
				}
			});
		}
	
		function fn_getRole() {
			var comboOrg = document.getElementById('orgId');
			if(comboOrg.value!=""){
				DWREngine.setAsync(false);
				userController.loadRolesByOrgId(comboOrg.value, function(data){
					if(data.length != 0){
						var comboRole = document.getElementById('roleId');
						
						comboRole.options.length = 0;
						for(var i=0;i<data.length;i++) {
							comboRole.options.add(new Option(data[i].roleName, data[i].roleId));
						}
					}else{
						var comboRole = document.getElementById('roleId');
						comboRole.options.length = 0;
					}
				});
			}
			
		}
	
		/* function user_add_submit(){
			var userName = document.getElementById('userName');
			userController.isExistUserName(userName.value, function(data){
				if(data) {
					alert('用户登陆名已存在！');
				} else {
					//location.href = basePath + 'account/user_manager_add.html';
					$("#addUser").validationEngine();
					//document.forms[0].submit();
				}
			});
			
		} */
	
		
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

<div class="main_content">
   <div class="main_content_orgnization"><p class="navbar"><a href="account/user_manager.html">用户管理</a>>用户管理创建</p></div>
   <div class="main_content_line"></div>
   <form class="main_right_div_form" action="account/user_manager_add.html" method="post" id="addUser">
		<table id="user_table_id">
			<tr>
				<td class="main_content_tab" colspan="2">
	         		<span class="tab_style" >用户管理创建</span>
	         	</td>
			</tr>
			<tr>
				<td width="200" align="right" class="pr10" >用户姓名:</td>
				<td align="left"><input type="text" class="user_table_id_td validate[required,maxSize[8], custom[exsitspace]] text-input" style="width: 160px;"  name="managerName" id="managerName"/>
				 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
				</td>
			</tr>
			<tr style="display: none;">
				<td align="right" ></td>
				<!--<span id="managerERR" style="color: red"></span>
				</td>
			--></tr>

			<tr>
				<td  width="200" align="right" class="pr10" >用户登录名:</td>
				<td align="left"><input type="text" class="user_table_id_td validate[required,maxSize[30], custom[exsitspace]] text-input" style="width: 160px;" name="userName" id="userName"/>
				 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
				</td>
			</tr>
			<tr>
				<td align="right" class="pr10">身份证号:</td>
				<td align="left">
					<input type="text" class="user_table_id_td validate[required, maxSize[30], custom[idcard]] text-input" name="idcard" id="idcard"/>
					<span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
				</td>
			</tr>
			<tr style="display: none;">
				<td align="right"></td>
				<!--<span id="userERR" style="color: red"></span>
				</td>
			--></tr>
			<tr>
				<td align="right" class="pr10">所在地区:</td>
				<td align="left">
					<select class="area_select validate[required]" name="proId" id="combo_province" onchange="fn_getCity();">
						<option value="">-- 请选择 --</option>
						<c:forEach var="row" items="${provinceList }">
							<option value="<c:out value="${row.proId}"/>"><c:out value="${row.proName}"/></option>
						</c:forEach>
	       			</select>
	       			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
	       			<select class="area_select validate[required]" name="cityId" id="combo_city">
						<option value="">-- 请选择 --</option>
	       			</select>
	       			 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;&nbsp;*</span>
				</td>
			</tr>

			<tr>
				<td align="right" class="pr10">所属机构:</td>

				<td align="left">
				<select class="user_table_id_td1 validate[required]" name="orgId" id="orgId" onchange="fn_getRole();">
				<option value="">-- 请选择 --</option>
					<c:forEach var="row" items="${userOrgInfoList}">
						<option value="<c:out value="${row.orgId}"/>"><c:out value="${row.orgName}"/></option>
					</c:forEach>
				</select>
				 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
				</td>
			</tr>
			<tr style="display: none;">
				<td align="right" ></td>
				<!--<span id="orgNameERR" style="color: red"></span>
				</td>
			--></tr>
			
			<tr>
				<td align="right" class="pr10" >角色:</td>
				<td align="left">
				<select class="user_table_id_td1 validate[required]" name="roleId" id="roleId">
					<option value="">-- 请选择 --</option>
					<c:forEach var="row" items="${userRoleInfoList}">
						<option value="<c:out value="${row.roleId}"/>"><c:out value="${row.roleName}"/></option>
					</c:forEach>
				</select>
				 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
				</td>
			</tr>
			<tr style="display: none;">
				<td align="right" class="pr10"></td>
				<!--<span id="roleNameERR" style="color: red"></span>
				</td>
			--></tr>
			<tr>
				<td align="right" class="pr10">EMAIL:</td>
				<td align="left"><input type="text" class="user_table_id_td validate[required, maxSize[30], custom[email]] text-input" name="managerEmail" id="managerEmail"/>
				<span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span></td>
			</tr>
			<tr>
				<td align="right" class="pr10">办公电话:</td>
				<td align="left"><input type="text" class="user_table_id_td validate[maxSize[30], custom[phone]] text-input" name="managerTelphone" id="managerTelphone"/>
				</td>
			</tr>
			
			<tr>
				<td align="right" class="pr10">联系手机:</td>
				<td align="left"><input type="text" class="user_table_id_td validate[maxSize[30], custom[mobilephone]] text-input" name="managerMobilephone" id="managerMobilephone"/></td>
			</tr>
			
			<tr class="input_table">
				<td colspan="2" >		
				 <div class="buttontxt">		
						<input class="buttony" type="button" value="确定" id="add_btn"/>
						<input class="buttony" type="button" value="返回" id="goback_b" onclick="javascript:history.back(1);" />
				</div>
				</td>
			</tr>
		</table>
		<br></br>
	</form>
</div>
</body>

</html>