<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../common/common.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="css/footable-0.1.css" rel="stylesheet" />
<link type="text/css" href="script/alert/jquery.alerts.css" rel="stylesheet"/>
<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />

<script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="script/footable-0.1.js" type="text/javascript"></script>
<title>配置管理</title>
<script type="text/javascript" src="script/config/organization/organization.js"></script>
<script type='text/javascript' src='dwr/interface/areaDwr.js'></script>
<script type='text/javascript' src='dwr/interface/organizationService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>

<script type="text/javascript">
  function organiztion_search(){
	  document.forms[0].submit();
  }
</script>
<script>
    $(function(){
		$("tbody tr:even").css('background',"#f7f7f7").attr('bgcol',"#f7f7f7");
    });
    $(function(){
		$("tbody tr:odd").css('background',"#eae9e9").attr('bgcol',"#eae9e9");
    });
        $(function() {
            $('table').footable();
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
 <!--**************************main部分  查询 创建*****************************************-->
<form action="organization/organization_list.html" method="post">	
<div class="main_content">
	<span class="super_nav">组织机构</span>
	<div class="main_content_frist_line"></div>
	<div class="main_search">
	                           <ul>
							      <li class="txt"><input type="text" name="input" value="${input}"/></li>
								   <li class="search" onclick="organiztion_search();">查询</li>
								  <li class="new"><input type="button" value="创建"  style=" border:none;" onclick="fn_load_organization_add();"></li>
							   </ul>
	 </div>

<!--***********************************************table部分 担保品 *****************************************-->
	<div style="width:815px;padding:10px;padding-top:20px">
		<table class="footable" align="center">
					<thead>
                      <tr >
                        <th style="width:7%">序号</th>
                        <th style="width:30%">公司名称</th>
                        <th style="width:15%">机构类型</th>
                        <th style="width:20%">所住地址</th>
                        <th style="width:20%">操作</th>
                       </tr>
                     </thead>
                     <tbody>
                       <c:forEach var="org" items="${organizationList }" varStatus="st">
                       <tr onmouseover="light(this)" onmouseout="low(this)">
                        <td align="center">
                        	<c:if test="${((page.thisPage-1) * page.pageSize + (st.index + 1))<=0 }">
                        		<c:out value="${(page.thisPage-1) * page.pageSize + (st.index + 1) + 10 }"></c:out>
                        	</c:if>
                        	<c:if test="${((page.thisPage-1) * page.pageSize + (st.index + 1))>0 }">
                        		<c:out value="${(page.thisPage-1) * page.pageSize + (st.index + 1)}"></c:out>
                        	</c:if>
                        </td>
                        <td ><c:out value="${org.orgName }"></c:out></td>
                        <td ><c:out value="${org.otypeName }"></c:out></td>
                        <td ><c:out value="${org.orgAddress }"></c:out></td>
                        
                        <td style="text-align: center">
                        	
							<c:if test="${org.isLock==0 }">
							<span id="span_update_href<c:out value="${org.orgId }"/>" style="float: left;padding-left:60px;display: block;"><a href="javascript:fn_load_org_update('${org.orgId }');">修改</a></span>
                        	<span id="span_update<c:out value="${org.orgId }"/>" style="color: gray; float: left;padding-left:60px;display: none;">修改</span>
							<span id="span_lock<c:out value="${org.orgId }"/>" style="display: block;float: right;padding-right:60px"><a href="javascript:fn_org_lock('${org.orgId }');">锁定</a></span>
							<span id="span_unlock<c:out value="${org.orgId }"/>" style="display:none;float: right;padding-right:60px"><a href="javascript:fn_org_unlock('${org.orgId }');" >解锁</a></span>
							</c:if>
							
							<c:if test="${org.isLock==1 }">
							<span id="span_update_href<c:out value="${org.orgId }"/>" style="float: left;padding-left:60px;display: none;"><a href="javascript:fn_load_org_update('${org.orgId }');">修改</a></span>
                        	<span id="span_update<c:out value="${org.orgId }"/>" style="color: gray; float: left;padding-left:60px;display: block;">修改</span>
							<span id="span_unlock<c:out value="${org.orgId }"/>" style="display:block;float: right;padding-right:60px"><a href="javascript:fn_org_unlock('${org.orgId }');" >解锁</a></span>
							<span id="span_lock<c:out value="${org.orgId }"/>" style="display: none;float: right;padding-right:60px"><a href="javascript:fn_org_lock('${org.orgId }');">锁定</a></span>
							</c:if>                       
                        </td>    
                        </tr>  
                        </c:forEach>
                      </tbody>              
              </table>
				
					<jsp:include page="../../common/page.jsp"></jsp:include>
            </div>
           
 </div>
 	</form>
 	<script type="text/javascript">
	window.parent.document.all("config_main").style.height = document.body.scrollHeight + 2;
	</script>
</body>
</html>