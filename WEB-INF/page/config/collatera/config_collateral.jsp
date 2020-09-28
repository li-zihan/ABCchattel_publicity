<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>配置管理-担保品</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../common/common.jsp"></jsp:include>
<link href="resources/css/jquery-ui-themes.css" type="text/css"
	rel="stylesheet">
<link href="resources/css/axure_rp_page.css" type="text/css"
	rel="stylesheet">
<link
	href="page/demo/config_guarantee_files/axurerp_pagespecificstyles.css"
	type="text/css" rel="stylesheet">
<!--[if IE 6]>
    <link href="page/demo/config_guarantee_files/axurerp_pagespecificstyles_ie6.css" type="text/css" rel="stylesheet">
<![endif]-->
<link type="text/css" href="css/footable-0.1.css" rel="stylesheet" />
	<script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script src="script/footable-0.1.js" type="text/javascript"></script>
<script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
<script src='page/demo/config_guarantee_files/data.js'></script>
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.rowcolor0 {background-color:rgb(234, 233, 233);}/* 第一行的背景色 */
.rowcolor1 {background-color:rgb(247, 247, 247);}/* 第二行的背景色 */
</style>
<script type="text/javascript">
	function fn_submit() {
		document.forms[0].action = basePath + 'config/collateral_setting.html';
		document.forms[0].submit();
	}
	function search(){
		document.collateralLikePost.submit();
	}
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
	<form action="config/collateral.html" method="post" name="collateralLikePost">

	<!--**************************main部分  查询 创建*****************************************-->
	
<div class="main_content">
	<span class="super_nav">担保品</span>
	<div class="main_content_frist_line1"></div>
	<div class="main_search">

	       <ul>
		      <li class="txt"><input type="text" name="inputs" value="${input }"/></li>
			   <li class="search" onclick="search();">查询</li>
			  <li class="new"><input type="button" value="设置"  style=" border:none;font-family:'微软雅黑''" onclick="fn_submit()"></li>
		   </ul>
		   
	 </div>

<!--***********************************************table部分 担保品 *****************************************-->
	<div style="width:815px;padding:10px;padding-top:20px">
		<table class="footable" align="center">
		<thead>
			<tr >
				<th style="width:25%">类别</th>
				<th style="width:35%">品种</th>
				<th style="width:35%">子类</th>
		
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${collateralMap}" var="row" varStatus="st">
				<tr onmouseover="light(this)" onmouseout="lowrow(this)" style="border-right: 1px;" class="rowcolor${(st.index+1)%2}">
					<td style="text-align: center"><c:out value="${row.key}" /></td>
					<td style="text-align: center;border-top:0px;border-right:1px;" colspan="2">
						<table class="footable" align="center" height="100%" style="margin-top: -10px;margin-bottom: -10px;border: 1px;">
						<c:forEach items="${row.value}" var="varietyList" varStatus="st">
							<c:forEach items="${varietyList}" var="varietyMap" varStatus="st">
							<tr onmouseover="light(this)" onmouseout="low(this)" style="border:red">
								<td style="border-bottom:0px;border-left:0px;" width="299px" ><c:out value="${varietyMap.key}" /></td>
								<td style="border-bottom:0px;">
									<table class="footable" align="center" style="margin-top: -10px;margin-bottom: -10px;border: 1px">
										<c:forEach items="${varietyMap.value}" var="subVarietyMap" varStatus="sub">
										<c:if test="${subVarietyMap.cvar_name!=null}">
											<tr onmouseover="light(this)" onmouseout="low(this)" style="border:1px;">
												<td style="border-bottom: 0px;border-left:0px;border-right:1px;"><c:out value="${subVarietyMap.cvar_name}" /></td>
											</tr>
										</c:if>
										</c:forEach>
									</table>									
								</td>
							</tr>
							</c:forEach>
						</c:forEach>
						</table>
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