<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../common/common.jsp"></jsp:include>
<link type="text/css" href="css/footable-0.1.css" rel="stylesheet" />
<title>无标题文档</title>
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />

<script type='text/javascript' src='dwr/interface/supervisionEnterpriseService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>

<script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="script/footable-0.1.js" type="text/javascript"></script>
<script type="text/javascript" src="script/config/supv/supv.js"></script>

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
<form action="supv/supv_search.html" method="post">
        <div class="main_content">
        <span class="super_nav">监管公司</span>
        <div class="main_content_frist_line"></div>
		     <div class="main_search">
			       <ul>
				      <li class="txt"><input type="text" name="input" value="<c:out value="${input }"/>" id="search_input"/></li>
					  <li class="search" onclick="fn_supv_search();">查询</li>
					  <li class="new"><input type="button" value="创建"  style=" border:none;" onclick="fn_load_supv_add()"></li>
				   </ul>
			 </div>
<!--***********************************************table部分 监管公司111*****************************************-->
              <div style="width:815px;padding:10px;padding-top:20px">
                 <table class="footable" align="center">
                 	<thead>
                      <tr >
                        <th style="width:7%">序号</th>
                        <th style="width:20%">公司名称</th>
                        <th style="width:15%">所在地区</th>
                        <th style="width:15%">联系电话</th>
                        <th style="width:30%">操作</th>
                       </tr>
                     </thead>
                     <tbody>
                       <c:forEach var="supv" items="${supvList }" varStatus="i">
                       <tr onmouseover="light(this)" onmouseout="low(this)">
                        <td style="text-align: center">${i.count }</td>
                        <td ><c:out value="${supv.supvName }"></c:out></td>
                        <td ><c:out value="${supv.proName }"></c:out>&nbsp;&nbsp;<c:out value="${supv.cityName }"></c:out></td>
                        <td ><c:out value="${supv.supvTelphone }"></c:out></td>
                        <td style="text-align: center" class="a_margin">
                        	<c:if test="${supv.isLock==0 }">
                                <a href="javascript:fn_load_supv_update('${supv.supvId }');">修改</a>
                                <a href="javascript:fn_supv_delete('${supv.supvId }');">删除</a>
								<a href="javascript:fn_supv_lock('${supv.supvId }');">锁定</a>
								<a href="javascript:fn_supv_warehouse('${supv.supvId }');">所辖仓库</a> 
							</c:if>
							
							<c:if test="${supv.isLock==1 }">
								<span style="color: grey"><a>修改</a></span>
								<span style="color: grey"><a>删除</a></span>
								<a href="javascript:fn_supv_unlock('${supv.supvId }');">解锁</a>
								<span style="color: grey"><a>所辖仓库</a></span>
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
