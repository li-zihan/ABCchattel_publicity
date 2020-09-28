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
	<jsp:include page="../common/common.jsp"></jsp:include> 
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
	<form action="/workbench/selectQueryWarn.html" method="post">

		<table class="footable"  border="1px" cellspacing="0px" style="border-collapse:collapse">
			<caption style="height:43px;font-weight: bold;color:#e8090e;font-family: 'Microsoft Yahei';font-size:17px;background:url('images/common/biaoti.png') no-repeat;">
			<img alt="查询预警" src="images/common/check.png"  style="margin-top: 5px">
			</caption>
			<tbody>
				<c:forEach var="row" items="${warnlist}" varStatus="st">
					<tr onmouseover="light(this)" onmouseout="low(this)">
						<td>
							某${row.org_id}于${row.update_time}通过<
							<c:if test="${not empty row.cvar_id }">
							担保品:${row.cvar_id}
							</c:if>
							<c:if test="${not empty row.finan_name }">
							，借款企业:${row.finan_name}
							</c:if>
							<c:if test="${not empty row.finan_org_code}">
							，组织机构代码:${row.finan_org_code}
							</c:if>
							<c:if test="${not empty row.guarantee_contract_no }">
							，采购合同号:${row.guarantee_contract_no}
							</c:if>
							<c:if test="${not empty row.guarantee_Invoice_no }">
							，采购发票号:${row.guarantee_Invoice_no }
							</c:if>
							<c:if test="${not empty row.guarantee_pledgor }">
							，出质人:${row.guarantee_pledgor }
							</c:if>
							<c:if test="${not empty row.supv_name }">
							，监管企业:${row.supv_name }
							</c:if>
							<c:if test="${not empty row.warehouse_name }">
							，监管仓库:${row.warehouse_name }
							</c:if>
							<c:if test="${not empty row.pledgee_id }">
							，质权人:${row.pledgee_id }
							</c:if>
							>进行了动产查询
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<!--  	<jsp:include page="./page.jsp"></jsp:include>-->
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
    	iframe.style.height=height+15;
    }else{
    	iframe.height=height+15;
    } 
} 
dyniframesize(window.parent.document.all("querywarn"));

</script>
</body>
</html>