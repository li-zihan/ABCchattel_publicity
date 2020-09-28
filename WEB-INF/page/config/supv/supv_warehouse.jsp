<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../common/common.jsp"></jsp:include>

<link type="text/css" href="css/footable-0.1.css" rel="stylesheet" />
<script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="script/footable-0.1.js" type="text/javascript"></script>

<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />

<script src="script/config/warehouse/warehouse_list.js"></script>
<script type="text/javascript" src="script/config/supv/supv.js"></script>
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
	        <div class="main_content_orgnization"><p class="navbar"><a href="supv/supv_list.html">监管公司</a>>所辖仓库</p></div>
      	 	<div class="main_content_line2"></div>
		     <div class="main_search">
			   <ul>
			      <li class="txt"><input type="text" name="input" value="${input }"/></li>
				  <li class="search" onclick="search();">查询</li>
				  <li class="new"><input type="button" value="创建"  style=" border:none;" onclick="fn_load_supv_add();"></li>
			   </ul>
			  
			 </div>


<!--***********************************************table部分 监管仓库*****************************************-->
		    <div style="width:815px;padding:10px;padding-top:20px">
                 <table class="footable" align="center">
                	<thead>
                      <tr align="center"> 
                        <th >序号</th>
                        <th >仓库名称</th>
                        <th >仓库地址</th>
                        <th >监管方式</th>
                       </tr>
                     </thead>
                     <tbody>
                       <c:forEach var="row" items="${list}" varStatus="st">
                       <tr onmouseover="light(this)" onmouseout="low(this)" >
                        <td>
                        	<c:if test="${((page.thisPage-1) * page.pageSize + (st.index + 1))<=0 }">
                        		<c:out value="${(page.thisPage-1) * page.pageSize + (st.index + 1) + 10 }"></c:out>
                        	</c:if>
                        	<c:if test="${((page.thisPage-1) * page.pageSize + (st.index + 1))>0 }">
                        		<c:out value="${(page.thisPage-1) * page.pageSize + (st.index + 1)}"></c:out>
                        	</c:if>
                        </td>
                        <td><c:out value="${row.warehouseName }"></c:out></td>
                        <td><c:out value="${row.warehouseAddress }"></c:out></td>
                        <td><c:out value="${row.wtypeName}"></c:out></td> 
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
</body>
</html>