<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=8" >
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<title>查询预警信息</title>
	<jsp:include page="./common.jsp"></jsp:include> 
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
	<form action="workbench/load_Relieve.html" method="post">

		<table class="footable"  border="1px" cellspacing="0px" style="border-collapse:collapse">
			<caption style="height:43px;font-weight: bold;color:#e8090e;font-family: 'Microsoft Yahei';font-size:17px;background:url('images/common/biaoti.png') no-repeat;">
			<img alt="解除提醒" src="images/common/relieve.png"  style="margin-top: 5px">
			</caption>
			<thead>
				<tr >
					<th width="5%">序号</th>
					<th width="15%">登记日期</th>
					<th width="25%">借款企业</th>
					<th width="15%">组织结构代码</th>
					<th width="10%">解除日期</th>
					<th width="20%">质权人</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}" varStatus="st">
					<tr onmouseover="light(this)" onmouseout="low(this)">
						<td>${st.index + 1}</td>
						<td>${row.updateTime }</td>
						<td>${row.finanName }</td>
						<td>${row.orgCode}</td>
						<td>${row.finanEndTime}</td>
						<td>${row.pledgor}</td>
						<td>
						<a href="workbench/view_pledgeinfo.html?pledageid=${row.pledge_id }" target="_self">查看</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="./page.jsp"></jsp:include>
	</form>
<script type="text/javascript">

var Sys = {};
var ua = navigator.userAgent.toLowerCase();
var s;
(s=ua.match(/msie ([\d.]+)/))?Sys.ie=s[1]:(s=ua.match(/firefox\/([\d.]+)/))?Sys.firefox=s[1]:(s=ua.match(/chrome\/([\d.]+)/))?Sys.chrome=s[1]:(s=ua.match(/opera.([\d.]+)/))?Sys.opera=s[1]:(s=ua.match(/version\/([\d.]+).*safari/))?Sys.safari=s[1]:0; 
function dyniframesize(iframe) { 
    var height; 
    if(Sys.ie||Sys.firefox||Sys.opera){ 
        height = iframe.contentWindow.document.body.scrollHeight; 
    }else if(Sys.chrome||Sys.safari){
    	height=iframe.contentWindow.document.documentElement.scrollHeight;
    } 
    if(Sys.ie){
    	iframe.style.height=height+5;
    }else{
    	iframe.height=height+5;
    } 
} 
dyniframesize(window.parent.document.all("queryrelieve"));

</script>
</body>
</html>