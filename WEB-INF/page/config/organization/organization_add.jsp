<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	
		<title>创建组织机构</title>
		<meta http-equiv="X-UA-Compatible" content="IE=8" >
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ page language="java" contentType="text/html; charset=utf-8"
		    pageEncoding="utf-8"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<jsp:include page="../../common/common.jsp"></jsp:include> 
		<link href="script/validation/template.css" rel="stylesheet" type="text/css" />
		<link href="script/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
		<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
		<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
		
		<script type='text/javascript' src='dwr/interface/validateDwr.js'></script>
		<script type='text/javascript' src='dwr/engine.js'></script>
		<script type='text/javascript' src='dwr/util.js'></script>
		
		<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
		<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>
		<script type="text/javascript" src="script/config/organization/organization_add.js"></script>
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
		<div class="main_content">
	        <div class="main_content_orgnization"><p class="navbar"><a href="organization/organization_list.html">组织机构</a>>组织机构创建</p></div>
             <div class="main_content_line"></div>
             <form action="organization/organization_add.html" method="post" id="org_add_form">
				<table id="organization_table_id">
                  
                      <tr>
                        <td class="main_content_tab" colspan="2">
	         			 	<span class="tab_style" >组织机构创建</span>
	         			 </td>
                      </tr>
					<tr>
						<td width="200" align="right" class="pr10" >组织机构名称:</td>
						<td align="left">
                            <input class="organization_table_id_td validate[required] text-input" type="text" name="orgName" id="orgName" maxlength="36" size="36"/>
                            <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                        </td>
					</tr>
					
					<tr>
						<td align="right" class="pr10">组织机构地址:</td>
						<td align="left">
                            <input class="organization_table_id_td validate[required] text-input" type="text" name="orgAddress" id="orgAddress" maxlength="30" size="30"/>
                            <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                        </td>
					</tr>
					
					<tr>
					<td align="right" class="pr10">机构分类:</td>
					<td align="left">					
						<select class="organization_table_id_td1 validate[required]" name="bankType" id="bankType">
							<option value="">请选择</option>
							<c:forEach items="${bankTypes }" var="bankType" varStatus="i">
								<option value="<c:out value="${bankType.typeId}"/>"><c:out value="${bankType.typeName}"/></option>
							</c:forEach>
						</select>
						<span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
					</td>
					</tr>
                                    
                    <tr class="input_table" >
                       <td colspan="2">
                       	<div class="buttontxt" align="center">
	                         <input type="button" value="确认" class="buttony" id="org_add_btn" />
	                         <input type="button" value="返回" onclick="javascript:history.back(1);" class="buttony"  />
                         </div>
                       </td>
                    </tr> 
 			</table>
      	</form>
       </div>
	</body>
</html>