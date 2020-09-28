<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>配置管理-担保品</title>
<meta http-equiv=“X-UA-Compatible” content=“IE=8″ />
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
<script type="text/javascript" src="script/config/js/config.js"></script>
<script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>

<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/collateraCreate.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.rowcolor0 {background-color:rgb(234, 233, 233);}/* 第一行的背景色 */
.rowcolor1 {background-color:rgb(247, 247, 247);}/* 第二行的背景色 */
</style>

<script type="text/javascript">
jQuery(function() {
	jQuery("input:checkbox.checkAll").change(
			function() {
				if (jQuery(this).attr("checked")) {
					jQuery(this).parents("tr").find(
							"td input:checkbox.checkItem1").attr("checked",
							true);
					jQuery(this).parents("tr").find(
					"td input:checkbox.checkItem2").attr("checked",
					true);
					jQuery(this).parents("tr").find(
					"td input:checkbox.checkItem3").attr("checked",
					true);
				} else {
					jQuery(this).parents("tr").find(
							"td input:checkbox.checkItem1").attr("checked",
							false);
					jQuery(this).parents("tr").find(
							"td input:checkbox.checkItem2").attr("checked",
					false);
					jQuery(this).parents("tr").find(
					"td input:checkbox.checkItem3").attr("checked",
			false);
				}
			});
		jQuery("input:checkbox.checkItem1").change(
				function() {
//					if (jQuery(this).attr("checked")) {
//						jQuery(this).parents("tr").find(
//								"td input:checkbox.checkItem3").attr("checked",
//								true);
//						} else {
//									jQuery(this).parents("tr").find(
//									"td input:checkbox.checkItem3").attr("checked",
//									false);
//									}
					if (jQuery(this).attr("checked"))  
				    {  
				        $("input[type=checkbox][id^='" + jQuery(this).attr("id") + "']").attr("checked", true);//当前ID开头的checkbox全选  
				    }  
				    else  
				    {  
				        $("input[type=checkbox][id^='" + jQuery(this).attr("id") + "']").attr("checked", false); //当前ID开头的checkbox全不选  
				    } 
					if (jQuery(this).parents("td").find(
							"input:checkbox.checkItem1:checked").length >0
						|| jQuery(this).parents("td").find(
						"input:checkbox.checkItem2:checked").length >0	
						
					) {
						jQuery(this).parents("tr").find(
								"td input:checkbox.checkAll").attr("checked",
								true);
					} else {
						jQuery(this).parents("tr").find(
								"td input:checkbox.checkAll").attr("checked",
								false);
					}
				});
		jQuery("input:checkbox.checkItem2").change(
				function() {
					if (jQuery(this).parents("td").find(
							"input:checkbox.checkItem1:checked").length > 0 ||
							jQuery(this).parents("td").find(
							"input:checkbox.checkItem2:checked").length > 0  
								
					) {
						jQuery(this).parents("tr").find(
								"td input:checkbox.checkAll").attr("checked",
								true);
					} else {
						jQuery(this).parents("tr").find(
								"td input:checkbox.checkAll").attr("checked",
								false);
					}
				});
		jQuery("input:checkbox.checkItem3").change(
				function() {
					if($("input[class=checkItem3][id='" + jQuery(this).attr("id") + "']").is(":checked")){
						jQuery(this).parents("tr").find(
						"td input:checkbox.checkAll").attr("checked",
						true);
						$("input[class=checkItem1][id='" + jQuery(this).attr("id") + "']").attr("checked", true);
					}else if(!$("input[class=checkItem3][id='" + jQuery(this).attr("id") + "']").is(":checked")&&jQuery(this).parents("td").find(
								"input:checkbox.checkItem3:checked").length == 0&&jQuery(this).parents("td").find("input:checkbox.checkItem2:checked").length == 0){
						jQuery(this).parents("tr").find(
						"td input:checkbox.checkAll").attr("checked",
						false);
						$("input[class=checkItem1][id='" + jQuery(this).attr("id") + "']").attr("checked", false);
					}else if(!($("input[class=checkItem3][id='" + jQuery(this).attr("id") + "']").is(":checked"))){
						$("input[class=checkItem1][id='" + jQuery(this).attr("id") + "']").attr("checked", false);
					}
				});


});


        $(function() {
            $('table').footable();
          });
</script>
<script>
$(document).ready(function(){
	var height = $('#config_div').height() + 20;
	$('#config_div').height( height < 500 ? mainBodyHeight : height );
	
	//var config_main = $('#config_main', window.parent.document);
	
	$('#config_main', window.parent.document).load(function(){
      $(this).height(0); //用于每次刷新时控制IFRAME高度初始化 
      
      var height = $(this).contents().height() + 100; 
      $(this).height( height < 500 ? mainBodyHeight : height ); 
    });
	
	var mainIFrame = $('#main', window.parent.parent.document);
	var height = mainIFrame.contents().height() + 400;
	mainIFrame.height( height < 500 ? mainBodyHeight : height ); 
	
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
<form action="config/collateral_savesetting.html" method="post">
	<div class="main_content" id="config_div">
        <div class="main_content_orgnization"><p class="navbar"><a href="config/collateral.html">担保品</a> > 担保品设置</p></div>
        <div class="main_content_line1"></div>
        		<br/>
        		<c:if test="${!empty collateralMap }">
				<table  class="footable" style="text-align: left;" id="main_div5_table" >
					<thead>
	                     <tr align="center" style="height:15px;line-height:15px;">
	                       <th style="width:25%">类别</th>
	                       <th style="width:35%">品种</th>           
	                       <th style="width:35%">子类</th>           
	                      </tr>  
	                </thead>    
	                <tbody>
		               <c:forEach items="${collateralMap}" var="row" varStatus="st">
							<tr onmouseover="light(this)" onmouseout="lowrow(this)" class="rowcolor${(st.index+1)%2}">
								<td class="main_div5_table_padding" style="padding-left:80px;">
									<c:forEach items="${row.value}" var="varietyList" >
										<c:forEach items="${varietyList}" var="varietyMap" varStatus="vst">
											<c:forEach items="${varietyMap.value}" var="subVarietyList" varStatus="subvst" >
												<c:if test="${vst.index==0&&subvst.index==0}">
													<input type="checkbox" class="checkAll" name="ctype_id" value="<c:out value="${subVarietyList.ctype_id}"/>" <c:if test="${subVarietyList.ctype_checked eq 'isCheck' }" >checked="checked"</c:if> />
													<c:out value="${row.key}"/>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:forEach>
								</td>
								<td class="main_div5_table_padding" style="padding-left:0px;" colspan="2" >
									<table class="footable" height="100%" style="margin-top: -10px;margin-bottom: -10px;border: none">
										<c:forEach items="${row.value}" var="varietyList" >
												<c:forEach items="${varietyList}" var="varietyMap" >
													<tr>
														<td width="191" style="text-align:left;padding-left:100px">
															<c:forEach items="${varietyMap.value}" var="subVarietyList" varStatus="vast">
																<c:if test="${vast.index==0}">
																	<c:if test="${subVarietyList.varparent_id!=null}">
																		<input type="checkbox" class="checkItem1" id="${varietyMap.key}" name="cvar_id"  <c:if test="${subVarietyList.varparent_checked=='isCheck' }" >checked="checked"</c:if> value=<c:out value="${subVarietyList.varparent_id}"/> />
																		<c:out value="${varietyMap.key}" />
																	</c:if>
																	<c:if test="${subVarietyList.varparent_id==null}">
																		<input type="checkbox" class="checkItem2" name="cvar_id"  <c:if test="${subVarietyList.cvar_checked=='isCheck' }" >checked="checked"</c:if> value=<c:out value="${subVarietyList.cvar_id}"/> />
																		<c:out value="${varietyMap.key}" />
																	</c:if>
																</c:if>
															</c:forEach>
														</td>
														<td>
															<table class="footable" align="center" style="margin-top: -10px;margin-bottom: -10px;border: none">
																<c:forEach items="${varietyMap.value}" var="subVarietyMap" varStatus="sub">
																	<c:if test="${subVarietyMap.cvar_name!=null}">
																		<tr>
																			<td style="text-align:left;padding-left:100px">
																				<input type="checkbox" class="checkItem3" id="${subVarietyMap.varparent_name}" name="cvar_id" value=<c:out value="${subVarietyMap.cvar_id}"/>  <c:if test="${subVarietyMap.cvar_checked=='isCheck' }" >checked="checked"</c:if> />
																				<c:out value="${subVarietyMap.cvar_name}" />
																			</td>
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
             <br><br>
             <div class="buttontxt" style="margin-left:300px;">
  				<input class="buttony" type="submit" value="保存修改" />
				<input class="buttony" type="button" onclick="javascript:history.back(1);" value="返回" />
 			</div>
 			</c:if>
 			<c:if test="${empty collateralMap }">
 				<table  class="footable" style="text-align: left;" id="main_div5_table" >
					<thead>
	                     <tr align="center" style="height:15px;line-height:15px;">
	                       <th style="width:25%">类别</th>
	                       <th style="width:35%">品种</th>           
	                       <th style="width:35%">子类</th>           
	                      </tr>  
	                </thead>    
	                <tbody>
 						<tr>
 							<td colspan="3" align="center" style="font-family: 'microsoft yahei';font-size: 13px;color: red">
 								您所在银行的上级银行没有设置担保品，如需设置担保品，请联系上级银行管理员！
 							</td>
 						</tr>
	                </tbody>
	             </table>
	             <div class="buttontxt" style="padding-left:300px;">
					<input class="buttony" type="button" onclick="javascript:history.back(1);" value="返回" />
				 </div>
 			</c:if>
        </div>

</form>
<script type="text/javascript">
	
</script>
</body>
</html>