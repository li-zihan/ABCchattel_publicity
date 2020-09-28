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
<script type="text/javascript" src="script/config/js/config.js"></script>
<script type='text/javascript' src='dwr/interface/areaDwr.js'></script>
<script type='text/javascript' src='dwr/interface/userController.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>

<link href="script/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<link href="script/validation/template.css" rel="stylesheet" type="text/css" />

<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/user.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery("#addForm").validationEngine();
	});

	function fn_getRole() {
	
		var comboOrg = document.getElementById('orgId');
		DWREngine.setAsync(false);
		userController.loadRolesByOrgId(comboOrg.value, function(data){
			
				var comboRole = document.getElementById('roleId');
				
				comboRole.options.length = 0;
				
				for(var i=0;i<data.length;i++) {
					comboRole.options.add(new Option(data[i].roleName, data[i].roleId));
				}
			});
		
	}

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
	
	$(document).ready(function(){
		var height = $('#test').height() + 20;
		$('#test').height( height < 500 ? 500 : height );
		
		//var config_main = $('#config_main', window.parent.document);
		
		$('#config_main', window.parent.document).load(function(){
	      $(this).height(0); //用于每次刷新时控制IFRAME高度初始化 
	      
	      var height = $(this).contents().height() + 100; 
	      $(this).height( height < 500 ? 500 : height ); 
	    });
		
		var mainIFrame = $('#main', window.parent.parent.document);
		var height = mainIFrame.contents().height() + 400;
		mainIFrame.height( height < 500 ? 500 : height ); 
		
	});
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
  <div class="main_content_orgnization"><p class="navbar"><a href="account/user_manager.html">用户管理</a>>用户管理修改</p></div>
   	   <div class="main_content_line"></div>
   <form class="main_right_div_form" action="account/user_manager_update.html" method="post" id="addForm"> 
   	   <input type="hidden" name="userId" value="<c:out value="${userManagerInfoMap.userId}"></c:out>" />
   	   <input type="hidden" name="managerId" value="<c:out value="${userManagerInfoMap.managerId}"></c:out>" />
       <table id="user_table_id">
			<tr>
				<td class="main_content_tab" colspan="2">
	         		<span class="tab_style" >用户管理修改</span>
	         	</td>
			</tr>
			<tr>
				<td width="200" align="right" class="pr10">用户姓名:</td>
				<td align="left"><input class="user_table_id_td validate[required,maxSize[8], custom[exsitspace]] text-input" style="width: 160px;" type="text" name="managerName" id="managerName" value="<c:out value="${userManagerInfoMap.managerName}"></c:out>"/>
				 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
				</td>
			</tr>
			<tr style="display: none;">
				<td align="right" class="pr10"></td>
			</tr>

			<tr>
				<td align="right" class="pr10">用户登录名：</td>
				<td align="left"><input class="user_table_id_td validate[required,maxSize[30], custom[exsitspace]] text-input" style="width: 160px;" type="text" name="userName" id="roleName" value="<c:out value="${userManagerInfoMap.userName}"></c:out>"/>
				 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
				</td>
			</tr>
			
			<tr>
				<td align="right" class="pr10">身份证号:</td>
				<td align="left">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${userManagerInfoMap.idcard}"></c:out>
				</td>
			</tr>
			<tr style="display: none;">
				<td align="right" class="pr10"></td>
			</tr>

			<tr>
				<td align="right" class="pr10">所在地区:</td>
				<td align="left">
                   <select class="area_select validate[required]" name="proId" id="combo_province" onchange="fn_getCity();">
				        <option value="">-- 请选择 --</option>
				        <c:forEach var="row" items="${provinceList }">
							<option value="<c:out value="${row.proId}"/>" <c:if test="${row.proId==userManagerInfoMap.proId }">selected="selected"</c:if>> 
							<c:out value="${row.proName}"/>
							</option>
						</c:forEach>
			       </select>  
			       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			       <select class="area_select validate[required]" name="cityId" id="combo_city">
				        <option value="">-- 请选择 --</option>
				        <c:forEach var="row" items="${cityList }">
							<option value="<c:out value="${row.cityId}"/>" <c:if test="${userManagerInfoMap.cityId==row.cityId }">selected="selected"</c:if>> 
							<c:out value="${row.cityName}"/>
							</option>
						</c:forEach>
			       </select>
			        <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;&nbsp;*</span>
                 </td>
			</tr>

			<tr>
				<td align="right" class="pr10">所属机构:</td>
				<td align="left">
				<select class="user_table_id_td1 validate[required]" name="orgId" id="orgId" onchange="fn_getRole();">
					<c:forEach var="row" items="${userOrgInfoList}">
						<option value="<c:out value="${row.orgId}"/>" <c:if test="${userManagerInfoMap.orgId==row.orgId }">selected="selected"</c:if> >
							<c:out value="${row.orgName}"/>
						</option>
					</c:forEach>
			   </select>
			    <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
				</td>
			</tr>
			<tr style="display: none;">
				<td align="right" class="pr10"></td>
			</tr>
			
			<tr>
				<td align="right" class="pr10">角色:</td>
				<td align="left">
				<select class="user_table_id_td1 validate[required]" name="roleId" id="roleId">
					<c:forEach var="row" items="${userRoleInfoList}">
						<option value="<c:out value='${row.roleId }'/>" <c:if test="${userManagerInfoMap.roleId==row.roleId }">selected="selected"</c:if> >
							<c:out value='${row.roleName }'/>
						</option>
					</c:forEach>
				</select>
				 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
				</td>
			</tr>
			<tr style="display: none;">
				<td align="right" class="pr10"></td>
			</tr>
			<tr>
				<td align="right" class="pr10">EMAIL:</td>
				<td align="left"><input type="text" class="user_table_id_td validate[required, maxSize[30], custom[email]] text-input" name="managerEmail" id="managerEmail" value="<c:out value="${userManagerInfoMap.managerEmail}"/>"/>
				<span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span></td>
			</tr>			
			<tr>
				<td align="right" class="pr10">办公电话:</td>
				<td align="left"><input type="text" class="user_table_id_td validate[maxSize[30], custom[phone]] text-input" name="managerTelphone" id="managerTelphone" value="<c:out value="${userManagerInfoMap.managerTelphone}"></c:out>"/></td>
			</tr>
			
			<tr>
				<td align="right" class="pr10">联系手机:</td>
				<td align="left"><input type="text" class="user_table_id_td validate[maxSize[30], custom[mobilephone]] text-input" name="managerMobilephone" id="managerMobilephone" value="<c:out value='${userManagerInfoMap.managerMobilephone}' />" /></td>
			</tr>

			<tr class="input_table">
				<td colspan="2">
					<div class="buttontxt">
						<input type="submit" value="确定" class="buttony" /> 
						<input type="button" value="返回" onclick="javascript:history.back(1);" class="buttony" />
					</div>
				</td>
			</tr>
		</table>
		<br/><br/>
   </form>
          
   </div>

</body>

</html>