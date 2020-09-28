<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>动产登记-提交信息</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<jsp:include page="../common/common.jsp"></jsp:include> 

<link href="css/chattel/chattel_regist_info.css" rel="stylesheet" type="text/css"/>
<link href="css/base/jquery.ui.all.css" rel="stylesheet" type="text/css"/>

<style>
.conbox {background:#fff url(images/chattel/conboxbottombg.jpg) repeat-x 0 bottom;border:1px solid #c4d3e9;padding-bottom:15px;margin:8px 10px 0;}
.conbox .tag {height:33px;line-height:33px;font-size:16px;font-weight:bold;text-align:left;background:url(images/chattel/conboxtagbg.jpg) repeat-x;padding-left:15px;margin-bottom:15px;}

</style>
<script type='text/javascript' src='dwr/interface/chattelController.js'></script>
<script type='text/javascript' src='dwr/interface/warehouseController.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

<script type="text/javascript" src='script/jquery-1.7.1.min.js'></script>
<script type="text/javascript" src='script/jquery-ui-1.10.4.custom.js'></script>
<script type="text/javascript" src='script/chattel/chattel_regist_info.js'></script>
<script type="text/javascript">
function remove_message(id){
	if(confirm("您确定要解除该条信息吗？")){
		 //location.href= basePath+"chattel/delete_pledge.html?id="+id ;
		chattelController.deletePledge(id, function(){
			$("#isdeleteisnoty"+id).text("已解除");
			$("#anniu_div_isdeleteisnot"+id).html("<div class='content_div_d4_image1'><span class='content_div_d4_text isdelete'>解除</span></div><div class='content_div_d4_image2'><span class='content_div_d4_text' onclick=\"submitWarn()\">返回</span></div>");
			alert("该动产信息解除成功。");
			$("#select_form").submit();
		});
	}
}
function update_message(id){
	location.href= basePath+"chattel/select_pledge_info_like_by_pledge_id.html?pledgeId="+id ;
}
function submit_select(){
	$("#select_form").submit();
}
$(function(){
	$("#danbi").click(function(){
		location.href= basePath+"chattel/chattel_regist_submit_info.html";
	});
	$("#piliang").click(function(){
		location.href= basePath+"chattel/batch_regist_load.html";
	});
});

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
	/*
	var infoDiv = document.getElementById("conbox"); 
    with(infoDiv.style){
        zIndex = 1000; 
        position = "absolute"; 
        width = "300px";
        left =event.x-100; 
        top = event.y-100;
        display = "block";
    }*/
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
function submitWarn(){
	document.all.form1.submit();
}
</script>
</head>
<body>
<div id="dialog"  style="display: none">
	
</div>
	<form  id="form1" action="<%=basePath %>workbench/load_Relieve.html" method="post">
	<div id="content_div">

	<div class="table_div">	
		<table class="content_table">
					<tr>	
						<td width="115px">&nbsp;&nbsp;借款企业：</td>
						<td width="175px"><c:out value="${row.finan_name}"></c:out></td>
						<td width="115px">&nbsp;&nbsp;监管企业：</td>
						<td width="175px"><c:out value="${row.supv_name}"></c:out></td>
						<td width="115px">&nbsp;&nbsp;出质人：</td>
						<td width="175px"><c:out value="${row.guarantee_pledgor}"></c:out></td>
					</tr>
					<tr>	
						<td>&nbsp;&nbsp;组织机构代码：</td>
						<td ><c:out value="${row.finan_org_code}"></c:out></td>
						<td>&nbsp;&nbsp;监管仓库：</td>
						<td ><c:out value="${row.warehouse_name}"></c:out></td>
						<td >&nbsp;&nbsp;放贷开始时间：</td>
						<td><c:out value="${row.financing_begin_date}"></c:out></td>
					</tr>
					<tr>	
						<td>&nbsp;&nbsp;担保品：</td>
						<td ><c:out value="${row.cvar_name}"></c:out></td>
						<td>&nbsp;&nbsp;仓库地址：</td>
						<td ><c:out value="${row.warehouse_address}"></c:out></td>
						<td >&nbsp;&nbsp;放贷结束时间：</td>
						<td><c:out value="${row.financing_end_date}"></c:out></td>
					</tr>
					<tr>	
						<td>&nbsp;&nbsp;数量：</td>
						<td ><c:out value="${row.guarantee_count}"></c:out></td>
						<td>&nbsp;&nbsp;监管仓位：</td>
						<td ><c:out value="${row.guarantee_warehouse_position}"></c:out></td>
						<td >&nbsp;&nbsp;质押交付时间：</td>
						<td><c:out value="${row.financing_delivery_date}"></c:out></td>
					</tr>
					<tr>	
						<td>&nbsp;&nbsp;采购合同号：</td>
						<td ><span onClick="showMsgBox(1,'<c:out value="${row.guarantee_contract_no}"></c:out>')" style="cursor: pointer;color: blue"> <c:out value="${row.guarantee_contract_no}"></c:out> </span> 
							<input type="hidden" id="guaranteeContractNo<c:out value="${row.guarantee_contract_no}"></c:out>" value="<c:out value="${row.guarantee_contract_nos}"></c:out>">
						</td>
						<td>&nbsp;&nbsp;仓单号：</td>
						<td ><c:out value="${row.guarantee_warehouse_no}"></c:out></td>
						<td >&nbsp;&nbsp;承办人：</td><td><c:out value="${row.manager_name }"></c:out></td>
					</tr>
					<tr>	
						<td>&nbsp;&nbsp;采购发票号：</td>
						<td ><span onClick="showMsgBox(2,'<c:out value="${row.guarantee_Invoice_no}"></c:out>')" style="cursor: pointer;color: blue"><c:out value="${row.guarantee_Invoice_no}"></c:out></span>
							<input type="hidden" id="guaranteeInvoiceNo<c:out value="${row.guarantee_Invoice_no}"></c:out>" value="<c:out value="${row.guarantee_Invoice_nos}"></c:out>">
						</td>
						<td>&nbsp;&nbsp;项目状态：</td>
						<td  id="isdeleteisnoty${row.pledge_id }">
						<c:choose>
							<c:when test="${row.is_delete == 0 }">
								正在进行
							</c:when>	
							<c:otherwise>
								已解除
							</c:otherwise>
						</c:choose>
						</td>
						<td >&nbsp;&nbsp;登记时间：</td><td><c:out value="${row.update_time }"></c:out></td>
					</tr>
					<c:if test="${row.remove_time!=null && row.remove_time!=''}">
						<tr>
							<td>&nbsp;&nbsp;解除时间：</td><td><c:out value="${row.remove_time }"></c:out></td>
						</tr>
					</c:if>
				</table>
	</div>
	<c:choose>
		<c:when test="${row.is_delete == 0 }">
			<div class="anniu_div" id="anniu_div_isdeleteisnot${row.pledge_id }">
				<div class="content_div_d4_image1" onclick="remove_message('${row.pledge_id }')">
        			<span class="content_div_d4_text">解 除</span>
        		</div>
        		<div class="content_div_d4_image2" onclick="submitWarn()">
        			<span class="content_div_d4_text">返回</span>
        	</div>
    		</div>
		</c:when>	
		<c:otherwise>
			<div class="anniu_div">
				<div class='content_div_d4_image1'>
					<span class='content_div_d4_text isdelete'>解除</span>
				</div>
				<div class="content_div_d4_image2"  onclick="submitWarn()">
        			<span class="content_div_d4_text">返回</span>
        	</div>
        	</div>
		</c:otherwise>
	</c:choose>


    <div id="default"></div>
</div>
</form>
<script type="text/javascript">
	window.parent.document.all("queryrelieve").style.height = document.body.scrollHeight + 10;
</script>
</body>
</html>