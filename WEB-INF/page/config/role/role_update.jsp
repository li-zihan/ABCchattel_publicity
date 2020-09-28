<jsp:include page="../../common/common.jsp"></jsp:include>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type='text/javascript' src='dwr/interface/roleController.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="script/validation/template.css" rel="stylesheet" type="text/css" />
<link href="script/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="script/config/js/config.js"></script>

<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>
<script src="script/config/role/role_add.js"></script>

<script type="text/javascript">	
jQuery(document).ready(function(){
	jQuery("#roleupdate").validationEngine();
});

function fn_updatesubmit() {
	if ($("#roleupdate").validationEngine("validate")){  //验证是否通过
		$('#confirmbutton').attr('disabled',"true");//添加disabled属性
   		   	$("#roleupdate").submit();  
	}
}
	$(document).ready(function(){
		var height = $('#config_div').height() + 20;
		$('#config_div').height( height < 500 ? mainBodyHeight : height );
		
		$('#config_main', window.parent.document).load(function(){
	      $(this).height(0); //用于每次刷新时控制IFRAME高度初始化 
	      
	      var height = $(this).contents().height() + 20; 
	      $(this).height( height < 500 ? mainBodyHeight : height ); 
	    });
		
		var mainIFrame = $('#main', window.parent.parent.document);
		$('#main', window.parent.parent.document).height(0); //用于每次刷新时控制IFRAME高度初始化 
		var height = mainIFrame.contents().height() + 200;
		mainIFrame.height( height < 500 ? mainBodyHeight : height ); 
		
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
	<form action="role/role_update.html" method="post" id="roleupdate">
	<div class="main_content" id="config_div">
        <div class="main_content_orgnization"><p class="navbar"><a href="role/role_list.html">角色管理</a>>角色管理修改</p></div>
		<div class="main_content_line"></div>
		<table id="role_table_id">
                
            <tr>
              	<td class="main_content_tab" colspan="2">
    				<span class="tab_style" >角色管理修改</span>
  				</td>
            </tr>
			<tr>
				<td width="200" align="right" class="pr10">角色名称:</td>
				<td align="left">
                          <input  type="hidden" name="roleId" value="<c:out value="${role.roleId}"/>"/>
					<input class="organization_table_id_td validate[required,maxSize[30]] text-input" style="line-height: 22px;" type="text" name="roleName" value="<c:out value="${role.roleName}"/>"/>
                       <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
                      </td>
			</tr>
			
			<tr>
				<td align="right" class="pr10">适用机构:</td>
				<td align="left">
                    <select  class="area_select validate[required]" name="otypeId" id="otypeId">
						<c:forEach items="${orgTypeList }" var="row">
							<option value="<c:out value="${row.otypeId}"/>" <c:if test="${role.otypeId == row.otypeId }">selected="selected"</c:if>>
								<c:out value="${row.otypeName}"/>
							</option>
						</c:forEach>
					</select>
					 <span style="color: red; font-size: 18px;vertical-align: middle;padding-bottom: 5px;">&nbsp;&nbsp;*</span>
                </td>
			</tr>
			<tr>
				<td colspan="2">
					<table border="1" align="center" height="400" style="width:375px;" class="user_border">
						<tr>
							<td nowrap="nowrap" class="td_left_padding">一级功能菜单</td>
							<td nowrap="nowrap" class="td_left_padding">二级功能菜单</td>
						</tr>
						<c:forEach items="${role.menus }" var="row">
						<tr>
							<td height="20" class="td_left_padding">
								<input type="checkbox" id="<c:out value="${row.menuId}"/>" name="menuId" class="checkAll validate[required]" value="<c:out value="${row.menuId}"/>"
									<c:if test="${row.checked }"> checked="checked" </c:if>/>&nbsp;
								<c:out value="${row.menuName}"/>
							</td>
							<td class="td_left_padding" >
								<c:if test="${row.childList==null}">无</c:if>
								<table>
									<c:forEach items="${row.childList }" var="childMenu">
									<tr>
										<td>
										<input type="checkbox" id="" name="menuId" class="checkItem validate[required]" value="<c:out value="${childMenu.menuId}"/>"
											<c:if test="${childMenu.checked}"> checked="checked" </c:if>/>&nbsp;
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

            <tr class="input_table" >
               <td colspan="2">
                <div class="buttontxt" style="padding-left: 170px;">
                  <input class="buttony" type="submit" value="保存" id="confirmbutton" onclick="fn_updatesubmit();" />
                  <input class="buttony" type="button" onclick="javascript:history.back(1);" value="返回" />
                </div>
               </td>
            </tr> 
		</table>
 <br></br>
      </div>

	</form>
</body>
</html>