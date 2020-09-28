<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="common.jsp"></jsp:include> 
<link type="text/css" href="css/footable-0.1.css" rel="stylesheet" />
	<script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script src="script/footable-0.1.js" type="text/javascript"></script>
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
	<div style="background-color: white;border:1px solid #bfbfbf;margin-top: 15px">
		<iframe  frameborder="0"  width="978px" id="queryrelieve" name="queryrelieve" src="workbench/load_Relieve.html" scrolling="no"></iframe>
	</div>
	<br>
	<div style="background-color: white;border:1px solid #bfbfbf;">
		<iframe  frameborder="0"  width="978px" id="querywarn" name="querywarn" src="workbench/selectQueryWarn.html" scrolling="no"></iframe>
	</div>
	<br>
	<div style="padding: 10px;background-color: white;border:1px solid #bfbfbf;">
	<table class="footable"  border="1px" cellspacing="0px" style="border-collapse:collapse">
		<caption style="height:43px;font-weight: bold;color:#e8090e;font-family: 'Microsoft Yahei';font-size:17px;background:url('images/common/biaoti.png') no-repeat;">
			<img alt="数据统计" src="images/common/stat.png"  style="margin-top: 10px">

		</caption>
		<tbody>
		<tr>
			<td width="330px"> 登记&nbsp;${allNum}&nbsp;笔</td>
			<td width="330px"> 解除
				<c:choose>
					<c:when test="${unlockNum==0 }">0</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${unlockNum!=0 }">${unlockNum}</c:when>
				</c:choose>
			笔</td>
			<td width="330px"> 正在进行
			<c:choose>
				<c:when test="${normalNum==0 }">0</c:when>
				<c:when test="${normalNum!=0 }">${normalNum}</c:when>
			</c:choose>
			笔</td>
		</tr>
		</tbody>
	</table>
	</div>
</body>
</html>