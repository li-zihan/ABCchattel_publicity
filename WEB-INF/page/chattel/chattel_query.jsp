<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>动产查询</title>
<meta http-equiv="X-UA-Compatible" content="IE=8">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + 
	
	"/";
	%>
<jsp:include page="../common/common.jsp"></jsp:include>
<link href="resources/css/jquery-ui-themes.css" type="text/css"
	rel="stylesheet">
	<link href="css/base/jquery.ui.all.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/axure_rp_page.css" type="text/css"
	rel="stylesheet">
<link href="动产公示_files/axurerp_pagespecificstyles.css" type="text/css"
	rel="stylesheet">
<link type="text/css" href="css/chattel/chattel_query.css"
	rel="stylesheet" />
		 <link type="text/css" href="css/chattel/jquery.autocomplete.css" rel="stylesheet" />
    <link type="text/css" href="css/chattel/thickbox.css" rel="stylesheet" />
<style>
.conbox {background:#fff url(images/chattel/conboxbottombg.jpg) repeat-x 0 bottom;border:1px solid #c4d3e9;padding-bottom:15px;margin:8px 10px 0;}
.conbox .tag {height:33px;line-height:33px;font-size:16px;font-weight:bold;text-align:left;background:url(images/chattel/conboxtagbg.jpg) repeat-x;padding-left:15px;margin-bottom:15px;}

</style>
<!--[if IE 6]>
    <link href="动产公示_files/axurerp_pagespecificstyles_ie6.css" type="text/css" rel="stylesheet">
<![endif]-->

<script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src='script/jquery-ui-1.10.4.custom.js'></script>
<script src="script/chattel/chattel_query.js" type="text/javascript"></script>
<script src="script/chattel/backshow.js" type="text/javascript"></script>
  <script src="script/chattel/jquery.autocomplete.js" type="text/javascript"></script>
  <script src="raplugin/raOperation.js" type="text/javascript"></script>
<style>
#tiao{
 margin-left:-10px;
}
.prompt{
margin-top: 10px;
text-align: center;
font-family: "微软雅黑";
color: midnightblue;
}

</style>
<script type="text/javascript">
//cs为1代表采购合同号div cs为 2代表采购发票号     
function showMsgBox(cs,id){
	//$('#basequerytable').empty();//初始化表格
	if(cs==1){
		//$("#conbox1").html("采购合同号");
		var val=$("#guaranteeContractNo"+id).val();
		val=val.split(",");
		var ats="";
		for(var i=0;i<val.length;i++){
			if(val[i]!=null&&val[i]!=""){
				//AddRowV(1,"采购合同"+(i+1)+":   "+val[i]);
				ats+="<p style='margin-top:5px;margin-bottom:5px'>采购合同"+(i+1)+":   "+val[i]+"</p>";
			}
			
		}
		if(ats.length>15){
			$( "#dialog" ).html(ats);
			$( "#dialog" ).dialog({
				position:[event.x-100,event.y-100],
				modal:true,
				title:"采购合同"	
			});
		}
	}else if(cs==2){
		//$("#conbox1").html("采购发票号");
		var val=$("#guaranteeInvoiceNo"+id).val();
		val=val.split(",");
		var ats="";
		for(var i=0;i<val.length;i++){
			if(val[i]!=null&&val[i]!=""){
				//AddRowV(2,"采购发票"+(i+1)+":    "+val[i]);
				ats+="<p style='margin-top:5px;margin-bottom:5px'>采购发票"+(i+1)+":    "+val[i]+"</p>";
			}
			
		}
		if(ats.length>15){
			$( "#dialog" ).html(ats);
			$( "#dialog" ).dialog({
				position:[event.x-100,event.y-100],
				modal:true,
				title:"采购发票"	
			});
		}
	}
}
//cs为1代表采购合同号div cs为 2代表采购发票号     val为input的默认值
function   AddRowV(cs,val){ 
	if(cs==1){
		$("#basequerytable").append("<tr height=40 align=\"center\"><td>"+val+"</td></tr>");
	}else if(cs==2){
		$("#basequerytable").append("<tr height=40 align=\"center\"><td>"+val+"</td></tr>");
	}

} 
function cancelLogout(){
    var infoDiv = document.getElementById("conbox");
        infoDiv.style.display = "none";
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

<body background="images/chattel/main_bg.jpg" onload="OnLoad();">
<div id="dialog"  style="display: none">
	
</div>
<!-- ra插件加载容器 -->
<div id="FakeCryptoAgent" style="display: none">
</div>
<input type="hidden" name="idcard" id="idcard" value="${sessionUser.manager.idcard}">
<input type="hidden" name="signdata" id="signdata" value="${signdata}">
	<form action="<%=basePath %>chattel/pledge_find_like_from.html"
		method="post" id="pledge_find_like" name="queryform">
		<div class="content_head">

			<div id="content_head_top">
				<div class="content_head_top_text">查询条件需设置三项以上(含三项)</div>
			</div>
			<div id="content_head_top_item">

				<table width="860" border="0" cellspacing="0" cellpadding="0"
					style="margin-left: 35px;">
					<tr>
						<td>&nbsp;&nbsp;借款企业：</td>
						<td width="300"><INPUT type=text
							value="${pledgeSelectLog.finanName }" name="finanName"
							id="finanName" class="formchild" maxlength="36"></td>
						<td>组织机构代码：</td>
						<td width="300"><INPUT type=text
							value="${pledgeSelectLog.finanOrgCode }" name="finanOrgCode"
							id="finanOrgCodes" class="formchild" maxlength="36"></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;担保品：</td>
						<td><select name="cvarId" id="cvarId" class="formchild"
							style="float: left; margin-top: 2px;">
								<OPTION value="">请选择</OPTION>
								<c:forEach var="co" items="${colls}" varStatus="st">
									<c:choose>
										<c:when test="${pledgeSelectLog.cvarId == co.cvarId }">
											<option selected value="${co.cvarId }">${co.cvarName }</option>
										</c:when>
										<c:otherwise>
											<option value="${co.cvarId }">${co.cvarName }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</select> <label
							style="color: red; width: 5px; margin-top: 10px; padding-top: 1px; display: inline-block;">&nbsp;&nbsp;*</label>
						</td>
						<td>采购合同号：</td>
						<td width="300"><INPUT type=text
							value="${pledgeSelectLog.guaranteeContractNo }"
							name="guaranteeContractNo" id="guaranteeContractNo"
							class="formchild" maxlength="36"></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;采购发票号：</td>
						<td width="300"><INPUT type=text
							value="${pledgeSelectLog.guaranteeInvoiceNo }"
							name="guaranteeInvoiceNo" id="guaranteeInvoiceNo"
							class="formchild" maxlength="36"></td>
						<td>出质人：</td>
						<td width="300"><INPUT type=text
							value="${pledgeSelectLog.guaranteePledgor }"
							name="guaranteePledgor" id="guaranteePledgors" class="formchild"
							maxlength="36"></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;监管企业：</td>
						<td width="300"><INPUT type=text
							value="${pledgeSelectLog.supvName }" name="supvName"
							id="supvName" class="formchild" maxlength="36"></td>
						<td>监管仓库：</td>
						<td width="300"><INPUT type=text
							value="${pledgeSelectLog.warehouseName }" name="warehouseName"
							id="guaranteeWarehouseNo" class="formchild" maxlength="36"></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;质权人：</td>
						<td>
						<select name="pledgeeId" id="pledgeeId" class="formchild">
							<option value="">请选择</option>
							<c:forEach var="row" items="${orglist}" varStatus="st">
								<option value="${row.orgId }" <c:if test="${pledgeSelectLog.pledgeeId == row.orgId }">selected="selected" </c:if>>
								${row.orgName}
								</option>
							</c:forEach>
						</select>						
						</td>
					</tr>

				</table>
			</div>
			<div id="content_head_top_btn">
				<img src="images/chattel/buton.png" />

			</div>

		</div>


		<c:forEach var="row" items="${list}" varStatus="st">
		  <div class="prompt" style="color: red">
				<c:if test="${ not empty row.error }">
			提示！&nbsp;${ row.error }
			</c:if>

			<c:if test="${ not empty row.log_id && myOrgId != row.org_id }">
				预警提示！&nbsp;${ row.org_name } 在       ${ row.update_time } 对以上条件进行了查询
			</c:if>
              
				
				</div>
			<c:if test="${ not empty row.pledge_id  }">
			<div id="content_body_item">
					<table align="center" width="900" class="content_body_item_table">

						<tr>
							<td width="100" style="padding-left: 20px">借款企业：</td>
							<td width="157"><c:out value="${row.finan_name}"></c:out></td>
							<td width="80">监管企业：</td>
							<td width="165"><c:out value="${row.supv_name}"></c:out></td>
							<td width="105">出质人:</td>
							<td ><c:out value="${row.guarantee_pledgor}"></c:out></td>
						</tr>

						<tr>
							<td style="padding-left: 20px">组织机构代码：</td>
							<td ><c:out value="${row.finan_org_code}"></c:out></td>
							<td>监管仓库：</td>
							<td><c:out value="${row.warehouse_name}"></c:out></td>
							<td>放贷开始时间：</td>
							<td><c:out value="${row.financing_begin_date}"></c:out></td>
						</tr>

						<tr>
							<td style="padding-left: 20px">担保品：</td>
							<td><c:out value="${row.cvar_name}"></c:out></td>
							<td>仓库地址：</td>
							<td><c:out value="${row.warehouse_address}"></c:out></td>
							<td>放贷结束时间：</td>
							<td><c:out value="${row.financing_end_date}"></c:out></td>
						</tr>

						<tr>
							<td style="padding-left: 20px"> 数量：</td>
							<td><c:out value="${row.guarantee_count}"></c:out></td>
							<td>监管仓位：</td>
							<td ><c:out value="${row.guarantee_warehouse_position}"></c:out></td>
							<td>质押交付时间：</td>
							<td><c:out value="${row.financing_delivery_date}"></c:out></td>
						</tr>

						<tr>
							<td style="padding-left: 20px">采购合同号：</td>
							<td><span onClick="showMsgBox(1,'<c:out value="${row.guarantee_contract_no}"></c:out>')" style="cursor: pointer;color: blue"> <c:out value="${row.guarantee_contract_no}"></c:out> </span> 
							<input type="hidden" id="guaranteeContractNo<c:out value="${row.guarantee_contract_no}"></c:out>" value="<c:out value="${row.guarantee_contract_nos}"></c:out>"></td>
							<td>仓单号：

							</td>
							<td><c:out value="${row.guarantee_warehouse_no}"></c:out></td>
							<td>质权人：</td>
							<td><c:out value="${row.org_name}"></c:out></td>
						</tr>

						<tr>
							<td style="padding-left: 20px">采购发票号：</td>
							<td><span onClick="showMsgBox(2,'<c:out value="${row.guarantee_Invoice_no}"></c:out>')" style="cursor: pointer;color: blue"><c:out value="${row.guarantee_Invoice_no}"></c:out></span>
							<input type="hidden" id="guaranteeInvoiceNo<c:out value="${row.guarantee_Invoice_no}"></c:out>" value="<c:out value="${row.guarantee_Invoice_nos}"></c:out>"></td>
							<td>&nbsp;&nbsp;</td>
							<td></td>
							<td>登记时间：</td>
							<td width="150"><c:out value="${row.insert_time}"></c:out></td>
						</tr>						
					</table>
				
				<table cellpadding="0" cellspacing="0" width="900" style=" height:22px;margin-top:-2px; margin-left:-4px;background: url(images/chattel/tbg2.png) no-repeat;">
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
				<br>
			</div>
			</c:if>
		</c:forEach>

	<div style="width:500px;height:50px;margin-left:50px">
	<c:if test="${ not empty list }">
		<jsp:include page="../common/page.jsp"></jsp:include>
	</c:if>
	</div>


	</form>
</body>

</html>