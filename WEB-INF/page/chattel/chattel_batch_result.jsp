<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>动产查询</title>
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    
    <META   HTTP-EQUIV="pragma"   CONTENT="no-cache">
	<META   HTTP-EQUIV="Cache-Control"   CONTENT="no-cache,   must-revalidate">
	<META   HTTP-EQUIV="expires"   CONTENT="Wed,   26   Feb   1997   08:21:57   GMT">

	<%@ page language="java" contentType="text/html; charset=utf-8"
	    pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
	<jsp:include page="../common/common.jsp"></jsp:include> 
	<link type="text/css" href="css/footable-0.1.css" rel="stylesheet" />
	<link type="text/css" href="css/chattel/chattel_publicity.css" rel="stylesheet" />
	<script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script src="script/footable-0.1.js" type="text/javascript"></script>
    <script src="script/chattel/chattel_publicity.js" type="text/javascript"></script>
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
    </script>
    <%
response.setHeader("Pragma","No-Cache");

response.setHeader("Cache-Control","No-Cache");

response.setDateHeader("Expires",   0);
%>
<style type="text/css">
.mydiv{
background-color: #ffffff;
-moz-box-shadow: 0px 2px 10px #909090;/*firefox*/
-webkit-box-shadow: 0px 2px 10px #909090;/*safari或chrome*/
box-shadow:0px 2px 10px #909090;/*opera或ie9*/
/*direction 阴影角度 0°为从下往上 顺时针方向 strength 阴影段长度*/
 -ms-filter:"progid:DXImageTransform.Microsoft.Shadow(color=#E9E9E9, direction=0, strength=6)\
 progid:DXImageTransform.Microsoft.Shadow(color=#E9E9E9, direction=90, strength=6)\
 progid:DXImageTransform.Microsoft.Shadow(color=#E9E9E9, direction=180, strength=6)\
 progid:DXImageTransform.Microsoft.Shadow(color=#E9E9E9, direction=270, strength=6)";
 filter:
 progid:DXImageTransform.Microsoft.Shadow(color=#909090, direction=90, strength=10)
 progid:DXImageTransform.Microsoft.Shadow(color=#909090, direction=180, strength=10)
 progid:DXImageTransform.Microsoft.Shadow(color=#909090, direction=270, strength=10);
 }

</style>
    
</head>

<body background="images/chattel/main_bg.jpg" >

	
	
	<div class ="mydiv" style="width:930px;padding:13px;margin: 15px 5px 0px 5px;">  
		<div class ="1" style="padding:13px;margin: 15px 5px 0px 400px;font-family: 'microsoft yahei';font-weight: 600;">  
			共导入<c:out value="${excel.successCount+excel.failureCount}"/>条数据
		</div>
		<hr/><br>
			<div class="resultsuccess" style="padding:15px 20px 0;margin: 20px 5px 0px 260px;display: inline;"></div>
			<div class ="1" style="padding:13px 13px 13px 13px;margin: 20px 80px 10px 10px;display: inline;font-family: 'microsoft yahei';font-size: 14px;font-weight: 600;">  
				成功数: <c:out value="${excel.successCount}"/>条
			</div>
			<div class="resultfail" style="padding:20px;margin: 20px 5px 0px 5px;display: inline;"></div>
			<div class ="2" style="padding:13px 13px 13px 13px;margin: 20px 5px 10px 5px;display: inline;font-family: 'microsoft yahei';font-size: 14px;font-weight: 600;">  
				失败数: <c:out value="${excel.failureCount}"/>条
			</div>
			<br>
			<br>
			<br>
				<c:if test="${excel.failureCount != 0 }">
				<table class="footable"  border="1px" cellspacing="0px" style="border-collapse:collapse">
				<thead>
					<tr >
						<th width="30">行号</th>
						<th width="135">列名</th>
						<th width="500">失败原因</th>			
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${excel.excelErrorRows}" varStatus="st">
					<tr onmouseover="light(this)" onmouseout="low(this)">
						<td style="text-align: center"><c:out value="${row.rowIndex}"/></td>
						<td >
							<div class="table_tr_td_div" >
								<div class="table_tr_td_div_div">
									<c:out value="${row.columnName }"></c:out>
								</div>
							</div>
						</td>	
						<td align="center">
							<div class="table_tr_td_div">
								<div class="table_tr_td_div_div">
    								<c:out value="${row.errorMsg }"></c:out>
    							</div>
    						</div>
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				</c:if>
				<br />
	</div>
	
</body>

</html>