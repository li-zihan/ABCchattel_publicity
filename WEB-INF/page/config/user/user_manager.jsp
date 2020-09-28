<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 	
<jsp:include page="../../common/common.jsp"></jsp:include>
<link type="text/css" href="css/footable-0.1.css" rel="stylesheet" />
<script type='text/javascript' src='dwr/interface/userService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>

<script type='text/javascript' src='dwr/util.js'></script>

<script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="script/footable-0.1.js" type="text/javascript"></script>
<title>Insert title here</title>
<script src="script/common/check_only.js"></script>
<script src="script/config/user/user_list.js"></script>
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function fn_submit() {
		//document.forms[0].action = basePath + 'account/user_manager_addload.html';
		document.forms[0].submit();
	}
	function fn_useradd_submit(){
		document.forms[0].action = basePath + 'account/user_manager_addload.html';
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
<form action="account/user_manager.html" method="post">
<!--**************************main部分  查询 创建*****************************************-->

        <div class="main_content">
        <span class="super_nav">用户管理</span>
        <div class="main_content_frist_line"></div>
	     <div class="main_search">
		   <ul>
		      <li class="txt"><input id="inputs" type="text" name="inputs" value="${inputs }"/></li>
			  <li class="search" onclick="fn_submit();">查询</li>
			  <li class="new"><input type="button" value="创建"  style=" border:none;" onclick="fn_useradd_submit()"></li>
		   </ul>
		 </div>
<!--***********************************************table部分 用户管理 *****************************************-->

		<div style="width:815px;padding:10px;padding-top:20px">
	     <table class="footable" align="center">
	     	<thead>
	          <tr >
	            <th style="width:7%">序号</th>
	            <th style="width:15%">用户名</th>
	            <th style="width:25%">角色</th>
	            <th style="width:20%">所属机构</th>
	            <th style="width:20%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="var" items="${userManagerInfoList }" varStatus="st">
					<div>
						<input type="hidden" name="otypeId" value="${var.otypeId }">
						<input type="hidden" name="userId" value="${var.userId }">
					</div>
					<tr onmouseover="light(this)" onmouseout="low(this)" >
						<td style="text-align: center">
							<c:if test="${((page.thisPage-1) * page.pageSize + (st.index + 1))<=0 }">
                        		<c:out value="${(page.thisPage-1) * page.pageSize + (st.index + 1) + 10 }"></c:out>
                        	</c:if>
                        	<c:if test="${((page.thisPage-1) * page.pageSize + (st.index + 1))>0 }">
                        		<c:out value="${(page.thisPage-1) * page.pageSize + (st.index + 1)}"></c:out>
                        	</c:if>
						</td>
						<td ><c:out value="${var.managerName }"></c:out></td>
						<td ><c:out value="${var.roleName }"></c:out></td>
						<td ><c:out value="${var.orgName }"></c:out></td>
						<td style="text-align: center" class="a_margin">
							<c:if test="${var.isLock==0}">
								<a href="account/user_manager_updateLoad.html?managerId=${var.managerId }&orgId=${var.orgId }">修改</a>
								<a href="javascript:user_delete_submit('${var.managerId }','${var.userId }');" >删除</a>
								<a href="javascript:fn_user_lock('${var.managerId }');">锁定</a>
								<a href="account/user_manager_colsettingload.html?orgId=${var.orgId }&userId=${var.userId}">担保品设置</a>
							</c:if>
							
							<c:if test="${var.isLock==1}">
								<a><span style="color: grey; ">修改</span></a>
								<a><span style="color: grey; ">删除</span></a>
								<a href="javascript:fn_user_unlock('${var.managerId }');">解锁</a>
								<span style="color: grey; ">担保品设置</span>
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