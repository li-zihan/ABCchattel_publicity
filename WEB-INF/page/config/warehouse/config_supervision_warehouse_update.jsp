<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改监管仓库</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<jsp:include page="../../common/common.jsp"></jsp:include>

<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/warehouse.css" rel="stylesheet" type="text/css" />
<link href="script/validation/template.css" rel="stylesheet" type="text/css" />
<link href="script/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="script/config/js/config.js"></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>

<script src="script/config/warehouse/warehouse_update.js"></script>
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
	     <div class="main_content_orgnization"><p class="navbar"><a href="warehouse/warehouse_list.html">监管仓库</a> > 监管仓库修改</p></div>
		 <div class="main_content_line"></div>
		 <form class="main_right_div_form" action="warehouse/update_warehouse.html" method="post" id="updateWarehouse"> 
		       <table id="warehouse_table_id">
                  
                      <tr>
                        <td class="main_content_tab" colspan="2">
	         			 	<span class="tab_style" >监管仓库修改</span>
	         			</td>
                      </tr>
					<tr>
						<td width="200" align="right" class="pr10" >仓库名称:</td>
						<td align="left">
                            <input type="hidden" name="warehouseId" value="<c:out value='${resultMap.warehouseId }'/>"/>
		          	    	<input  name="warehouseName" id="warehouseName"  type="text" class="warehouse_table_id_td validate[required,maxSize[30]] text-input" value="<c:out value='${resultMap.warehouseName }'/>"/>
		           	    	<span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                        </td>
					</tr>
					<tr>
						<td align="right" class="pr10" >仓库地址:</td>
						<td align="left">
                            <input type="text" name="warehouseAddress" id="warehouseAddress" value="<c:out value='${resultMap.warehouseAddress }'/>"  class="warehouse_table_id_td validate[required,maxSize[80]] text-input"/>
                            <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                        </td>
					</tr>
					
					<tr>
						<td align="right" class="pr10">监管方式:</td>
						<td align="left">
			       			<select name="wtypeId" class="warehouse_table_id_td1">
				              	<c:forEach var="row" items="${warehouseTypeList}" varStatus="st">
								<option value="<c:out value='${row.wtypeId }'/>" <c:if test="${resultMap.wtypeId==row.wtypeId }">selected="selected"</c:if>>
								<c:out value='${row.wtypeName }'/>
								</option>
								</c:forEach>
				        	 </select>
				        	 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                        </td>
					</tr>
					<tr>
						<td align="right" align="right" class="pr10" >所属监管公司:</td>
						<td align="left">
                            <select name="supvId" class="warehouse_table_id_td1">
				               <c:forEach var="row" items="${supvList }">
								<option value="<c:out value="${row.supvId}"/>" <c:if test="${resultMap.supvId==row.supvId }">selected="selected"</c:if>>
								<c:out value="${row.supvName}"/>
								</option>
								</c:forEach>
				           </select>
				           <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;*</span>
                        </td>
					</tr>
                  
                    <tr class="input_table" >
                       <td colspan="2">
                         <div class="buttontxt">
	       					 <input type="button" value="确定" class="buttony" onclick="form_submit()"/>
		       				 <input type="button" value="返回" onclick="javascript:history.back(1);" class="buttony"/><br />   
       					 </div>
                       </td>
                    </tr> 
				</table>        
		   </form>
    </div>

</body>

</html>