<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>更新监管公司</title>
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
		<link href="css/config/configManager/supv.css" rel="stylesheet" type="text/css" />
		
		<script type='text/javascript' src='dwr/interface/validateDwr.js'></script>
		<script type='text/javascript' src='dwr/interface/areaDwr.js'></script>
		<script type='text/javascript' src='dwr/engine.js'></script>
		<script type='text/javascript' src='dwr/util.js'></script>
		
		<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
		<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>
		<script type="text/javascript" src="script/config/supv/supv_update.js"></script>
		
		<script type="text/javascript">	
	
			$(function(){
				$('#updateForm').validationEngine();
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
       	<div class="main_content_orgnization"><p class="navbar"><a href="supv/supv_list.html">监管公司</a>>监管公司修改</p></div>
		  <div class="main_content_line"></div>
		   <form class="main_right_div_form" action="supv/supv_update.html" method="post" id="updateForm"> 
		         <input type="hidden" name="supvId" id="supvId" value="${ supv.supvId}" />
		       <table id="organization_table_id">
                  
                      <tr>
                         <td class="main_content_tab" colspan="2">
	         			 	<span class="tab_style" >监管公司修改</span>
	         			 </td>
                      </tr>
					<tr>
						<td width="200" align="right" class="pr10" >监管公司名称:</td>
						<td align="left">
                            <input type="text" class="organization_table_id_td validate[required,maxSize[30]] text-input" name="supvName" id="supvName" value="${ supv.supvName}" />
                            <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                        </td>
					</tr>
					
					<tr>
						<td align="right" class="pr10">所在地区:</td>
						<td align="left">
                            <select class="area_select validate[required]" name="" id="combo_province" onchange="fn_getCity();">
					        <c:forEach var="row" items="${provinceList }">
							<option value="<c:out value="${row.proId}"/>" <c:if test="${supv.proId==row.proId }">selected="selected"</c:if>> 
							<c:out value="${row.proName}"/>
							</option>
							</c:forEach>
					       </select>  
					       <select class="area_select validate[required]" name="cityId" id="combo_city">
					        <c:forEach var="row" items="${cityList }">
							<option value="<c:out value="${row.cityId}"/>" <c:if test="${supv.cityId==row.cityId }">selected="selected"</c:if>> 
							<c:out value="${row.cityName}"/>
							</option>
							</c:forEach>
					       </select>
					       <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                        </td>
					</tr>
					
                    <tr>
					<td align="right" class="pr10">联系电话:</td>
					<td align="left">		
						<input type="text" class="organization_table_id_td validate[required] text-input validate[custom[phone]]" name="supvTelphone" id="supvTelphone" value="${supv.supvTelphone }" />
						<span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
					</td>
					</tr>
                    <tr style="display:none;">
						<td align="right" class="pr10" ></td>
						<td >
                            <span id="telphoneERR" style="color:red"></span>
                        </td>
					</tr>
                    
                    <tr class="input_table" >
                       <td colspan="2">
                         <div class="buttontxt">
	                         <input type="button" value="保存修改" class="buttony" onclick="fn_selectSupervisionEnterpriseByNameUpdate();" />
	       					 <input type="button"  value="返回" onclick="javascript:history.back(1);" class="buttony"/>
       					 </div>
                       </td>
                    </tr> 
				</table>      
		   </form>
          
   </div>
	</body>	
</html>