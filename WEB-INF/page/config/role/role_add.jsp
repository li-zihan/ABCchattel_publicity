<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../common/common.jsp"></jsp:include>
<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/role.css" rel="stylesheet" type="text/css" />
<link href="script/validation/template.css" rel="stylesheet" type="text/css" />
<link href="script/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

<script type='text/javascript' src='dwr/interface/roleController.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

<script type="text/javascript" src="script/config/js/config.js"></script>
<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>

<script src="script/config/role/role_add.js"></script>

<script type="text/javascript">	
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
	<form action="role/role_add.html" method="post" id="roleAdd">
	<div class="main_content" id="config_div">
	    <div class="main_content_orgnization"><p class="navbar"><a href="role/role_list.html">角色管理</a>>角色管理创建</p></div>
	    <div class="main_content_line"></div>
		<table id="organization_table_id">
	               
	        <tr>
	           <td class="main_content_tab" colspan="2">
		          <span class="tab_style" >角色管理创建</span>
		       </td>
	        </tr>
			<tr>
				<td width="200" align="right" class="pr10">角色名称:</td>
				<td align="left">
	            	<input class="organization_table_id_td validate[required,maxSize[30]] text-input" type="text" id="roleName" name="roleName"/>
	            	 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
	            </td>
			</tr>
			
			<tr>
				<td align="right" class="pr10">适用机构:</td>
				<td align="left">
				   <select class="area_select validate[required]" name="otypeId" id="otypeId">
						<option value="">--请选择--</option>
						<c:forEach items="${orgTypeList }" var="row">
							<option value="<c:out value="${row.otypeId}"/>"><c:out value="${row.otypeName}"/></option>
						</c:forEach>
				   </select>
				    <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
	            </td>
			</tr>
			
			<tr>
				<td colspan="2">
					<table border="1" align="center" height="350" style="width:375px;line-height: 0px;" class="user_border">
						<tr>
							<td nowrap="nowrap" align="center" height="20">一级功能菜单</td>
							<td nowrap="nowrap" align="center">二级功能菜单</td>
						</tr>
						<c:forEach items="${menuList }" var="row">
						<tr>
						<td height="20" class="td_left_padding">
							<input type="checkbox" id="<c:out value="${row.menuId}"/>" name="menuId" class="checkAll validate[required]" value="<c:out value="${row.menuId}"/>"/>&nbsp;
							<c:out value="${row.menuName}"/>
						</td>
						<td class="td_left_padding">
							<c:if test="${row.childList==null}">无</c:if>
							<table>
								<c:forEach items="${row.childList }" var="childMenu">
								<tr>
									<td>
									<input type="checkbox" id="" name="menuId" class="checkItem validate[required]" value="<c:out value="${childMenu.menuId}"/>"/>&nbsp;
									<input type="hidden" value="<c:out value="${row.menuId}"/>" />
									<c:out value="${childMenu.menuName}"/>
									</td>
								</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					</c:forEach>
					</table>
				</td>
			</tr>
	       <tr class="input_table" style="height:70px; width:20px;">
	          <td colspan="2">
	          	<div class="buttontxt" style="padding-left: 170px;">
		            <input class="buttony" type="button"  value="确认" id="confirmbutton" onclick="fn_submit();" />
		            <input class="buttony" type="button" value="返回" onclick="javascript:history.back(1);" />
	            </div>
	          </td>
	       </tr> 
		</table>
	
     </div>

<!--<table>
	<tr>
		<td>角色名称</td>
		<td><input type="text" id="roleName" name="roleName"/><span id="roleNameERR" style="color:red"></span></td>
	</tr>
	<tr>
		<td>适用机构</td>
		<td>
			<select name="otypeId" id="otypeId">
				<option value="0">-- 请选择 --</option>
				<c:forEach items="${orgTypeList }" var="row">
					<option value="<c:out value="${row.otypeId}"/>"><c:out value="${row.otypeName}"/></option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
-->
</form>
</body>
</html>