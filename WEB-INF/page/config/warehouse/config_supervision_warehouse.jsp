<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../common/common.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/footable-0.1.css" rel="stylesheet" />

<script type='text/javascript' src='dwr/interface/warehouseService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>

<script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="script/footable-0.1.js" type="text/javascript"></script>
<script src="script/config/warehouse/warehouse_list.js"></script>
<script type="text/javascript">
	function search(){
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
<form action="warehouse/warehouse_list.html" method="post">
 <!--**************************main部分  查询 创建*****************************************-->

        <div class="main_content">
        <span class="super_nav">监管仓库</span>
        <div class="main_content_frist_line"></div>
		     <div class="main_search">
			   <ul>
			      <li class="txt"><input type="text" name="input" value="${input }"/></li>
				  <li class="search" onclick="search();">查询</li>
				  <li class="new"><input type="button" value="创建"  style=" border:none;" onclick="fn_open_warehouse_add();"></li>
			   </ul>
			  
			 </div>


<!--***********************************************table部分 监管仓库*****************************************-->
		    <div style="width:815px;padding:10px;padding-top:20px">
                 <table class="footable" align="center">
                 	<thead>
                      <tr >
                        <th style="width:7%">序号</th>
                        <th style="width:30%">仓库名称</th>
                        <th style="width:20%">仓库地址</th>
                        <th style="width:15%">监管方式</th>
                        <th style="width:20%">操作</th>
                       </tr>
                     </thead>
                     <tbody>
                       <c:forEach var="row" items="${list}" varStatus="st">
                       <tr onmouseover="light(this)" onmouseout="low(this)">
                        <td style="text-align: center">
                        	<c:if test="${((page.thisPage-1) * page.pageSize + (st.index + 1))<=0 }">
                        		<c:out value="${(page.thisPage-1) * page.pageSize + (st.index + 1) + 10 }"></c:out>
                        	</c:if>
                        	<c:if test="${((page.thisPage-1) * page.pageSize + (st.index + 1))>0 }">
                        		<c:out value="${(page.thisPage-1) * page.pageSize + (st.index + 1)}"></c:out>
                        	</c:if>
                        </td>
                        <td ><c:out value="${row.warehouseName }"></c:out></td>
                        <td ><c:out value="${row.warehouseAddress }"></c:out></td>
                        <td ><c:out value="${row.wtypeName}"></c:out></td>
                        <td style="text-align: center" class="a_margin">
                        	<c:if test="${row.isLock== 0 }">
                                <a href="javascript:void();" onclick="fn_update_submit('${row.warehouseId}')">修改</a>
                                <a href="javascript:void();" onclick="fn_delete_submit('${row.warehouseId}')">删除</a>
								<a href="javascript:void();" onclick="fn_lock_submit('${row.warehouseId}')">锁定</a>
							</c:if>
							<c:if test="${row.isLock== 1 }">
								<a><span style="color: grey">修改</span></a>
								<a><span style="color: grey">删除</span></a>
								<a href="javascript:void();" onclick="fn_unlock_submit('${row.warehouseId}')">解锁</a>
							</c:if>                          
                        </td> 
                        </tr> 
                        </c:forEach>           
                     </tbody>       
              </table>
              <div>
					<jsp:include page="../../common/page.jsp"></jsp:include>
           </div>
         </div>
         </div>
</form>	
	<script type="text/javascript">
	window.parent.document.all("config_main").style.height = document.body.scrollHeight + 2;
	</script>
</body>
</html>