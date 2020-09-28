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
<link href="css/chattel/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<link href="css/chattel/thickbox.css" rel="stylesheet" type="text/css" />
<link href="css/chattel/chattel_regist_submit_info.css" rel="stylesheet" type="text/css" />
<link href="script/validation/template.css" rel="stylesheet" type="text/css" />
<link href="script/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<style>
.conbox {background:#fff url(images/chattel/conboxbottombg.jpg) repeat-x 0 bottom;border:1px solid #c4d3e9;padding-bottom:15px;margin:8px 10px 0;}
.conbox .tag {height:33px;line-height:33px;font-size:16px;font-weight:bold;text-align:left;background:url(images/chattel/conboxtagbg.jpg) repeat-x;padding-left:15px;margin-bottom:15px;}

</style>
<script type='text/javascript' src='dwr/interface/areaDwr.js'></script>
<script type='text/javascript' src='dwr/interface/warehouseController.js'></script>
<script type='text/javascript' src='dwr/interface/warehouseService.js'></script>
<script type='text/javascript' src='dwr/interface/accountController.js'></script>

<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script src="script/chattel/chattel_query.js" type="text/javascript"></script>

<script type="text/javascript" src='script/jquery-1.7.1.min.js'></script>
<script type="text/javascript" src='script/chattel/chattel_regist_submit_info.js'></script>
<script src="script/chattel/jquery.autocomplete.js" type="text/javascript"></script> 
<script src="script/chattel/backshow.js" type="text/javascript"></script>
<script src="script/chattel/load_finan.js" type="text/javascript"></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>

<script src="script/chattel/Calendar5.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#regist_form").validationEngine();
});
        var c = new Calendar("c");
        document.write(c);
     
        function form_submit(){
        	if(confirm("您确认提交所有信息?")){
        	  var a=$("#remarks").val();
        	  
        	  if(!compareDate(document.all.financingBeginDate.value,document.all.financingEndDate.value)){
        		 alert("放贷结束时间应大于放贷开始时间！");
  				 document.all.financingEndDate.focus();
        	  }else if(a.length>=2000){
        		  
        		   alert("备注信息输入字数过多，请精简描述");
        	   }else{
        		   if(a=="可输入最大字符数:2000"){
        			   $("#remarks").val("");
        		   }
        		   if ($("#regist_form").validationEngine("validate")){  //验证是否通过
        			   $("a:first").removeAttr("href");//置提交按钮无效。
            		   $("#regist_form").submit();  
   					} 
        		   
        	   }
        	}
        	
        }
        
        function form_reset(){
        	location.href= basePath+"chattel/chattel_regist_info.html";
        }
//cs为1代表采购合同号div cs为 2代表采购发票号     
function showMsgBox(cs){
	$('#basequerytable').empty();//初始化表格
	if(cs==1){
		$("#conbox1").html("采购合同号<span onClick=\"AddRow('1')\"style=\"margin-right:15px;font-size: 20px;color: red;cursor: pointer;float:right;\">+</span>");
		var val=$("#guaranteeContractNo").val();
		val=val.split(",");
		for(var i=0;i<val.length;i++){
			if(val[i]!=null&&val[i]!=""){
				AddRowV(1,val[i]);
			}
			
		}
		if($("#basequerytable").find("tr").length<=0){
			 AddRow(1);
		}
	}else if(cs==2){
		$("#conbox1").html("采购发票号<span onClick=\"AddRow('2')\"style=\"margin-right:15px;font-size: 20px;color: red;cursor: pointer;float:right;\">+</span>");
		var val=$("#guaranteeInvoiceNo").val();
		val=val.split(",");
		for(var i=0;i<val.length;i++){
			if(val[i]!=null&&val[i]!=""){
				AddRowV(2,val[i]);
			}
			
		}
		if($("#basequerytable").find("tr").length<=0){
			 AddRow(2);
		}
	}
	var infoDiv = document.getElementById("conbox"); 
    with(infoDiv.style){
        zIndex = 1000; 
        position = "absolute"; 
        width = "300px";
        left =event.x-350; 
        top = event.y-150;
        display = "block";
    }
}
//cs为1代表采购合同号div cs为 2代表采购发票号     
function   AddRow(cs){ 
	if(cs==1){
		$("#basequerytable").append("<tr height=40 align=\"center\"><td><input id=\"guaranteeContractNos\" name=\"guaranteeContractNos\" type=\"text\" maxlength='40'> <input type=\"button\" value=\"删除\" onClick=\"delRow(this)\" /></td></tr>");
	}else if(cs==2){
		$("#basequerytable").append("<tr height=40 align=\"center\"><td><input id=\"guaranteeInvoiceNos\" name=\"guaranteeInvoiceNos\" type=\"text\" maxlength='40'> <input type=\"button\" value=\"删除\" onClick=\"delRow(this)\" /></td></tr>");
	}

}
//cs为1代表采购合同号div cs为 2代表采购发票号     val为input的默认值
function   AddRowV(cs,val){ 
	if(cs==1){
		$("#basequerytable").append("<tr height=40 align=\"center\"><td><input id=\"guaranteeContractNos\" name=\"guaranteeContractNos\" type=\"text\" value=\""+val+"\" maxlength='40'> <input type=\"button\" value=\"删除\" onClick=\"delRow(this)\" /></td></tr>");
	}else if(cs==2){
		$("#basequerytable").append("<tr height=40 align=\"center\"><td><input id=\"guaranteeInvoiceNos\" name=\"guaranteeInvoiceNos\" type=\"text\" value=\""+val+"\" maxlength='40'> <input type=\"button\" value=\"删除\" onClick=\"delRow(this)\" /></td></tr>");
	}

} 
function delRow(delbtn){

    $(delbtn).parents("tr").remove();

}
function cancelLogout(){
    var infoDiv = document.getElementById("conbox");
        infoDiv.style.display = "none";
}
function add(){
	var rowsdata="";
	var firstdata="";
	var returnbool=true;
	if($("input[name=guaranteeContractNos]").length>0){
		$("input[name=guaranteeContractNos]").each(function(){
			var val=$(this).val();
			if(val==null||val==""||val.indexOf(" ")!=-1){
				alert("添加的采购合同号有空数据,请删除或添加数据！");
				returnbool=false;
				return false;
			}else{
				if(rowsdata==""){
					rowsdata=val;
					firstdata=val;
				}else{
					rowsdata=rowsdata+","+val;
				}
			}
		});
		if(returnbool){
			$("#guaranteeContractNo").val(rowsdata);
			$("#guaranteeContractNo_temp").val(firstdata);
			var infoDiv = document.getElementById("conbox");
	        infoDiv.style.display = "none";
		}
	}else if($("input[name=guaranteeInvoiceNos]").length>0){
		$("input[name=guaranteeInvoiceNos]").each(function(){
			var val=$(this).val();
			if(val==null||val==""||val.indexOf(" ")!=-1){
				alert("添加的采购发票号有空数据,请删除或添加数据！");
				returnbool=false;
				return false;
			}else{
				if(isNaN(val)){
					alert("添加的采购发票号只能为数字！");
					returnbool=false;
					return false;
				}else{
					if(rowsdata==""){
						rowsdata=val;
						firstdata=val;
					}else{
						rowsdata=rowsdata+","+val;
					}
				}
			}
		});
		if(returnbool){
			$("#guaranteeInvoiceNo").val(rowsdata);
			$("#guaranteeInvoiceNo_temp").val(firstdata);
			var infoDiv = document.getElementById("conbox");
	        infoDiv.style.display = "none";
		}
	}
	
}


$(function() {
	$("#selectWarehouseId").change(function(){
		var warehouseselect = $("#selectWarehouseId");
		warehouseService.selectWarehouseById(warehouseselect.val(), function(data) {
			if(data != null) {
				$('#warehouseAddress').attr('value', data.warehouseAddress);
			} else {
				$('#warehouseAddress').attr('value', '');
			}
		});
	});
});
//日期比较
function compareDate(startDate,endDate){
	if (startDate != "" && endDate != "") {
		// 转换为日期格式
		startDate = startDate.replace(/-/g, "/");
		endDate = endDate.replace(/-/g, "/");
		// 如果起始日期大于结束日期
			if (Date.parse(endDate) - Date.parse(startDate) < 0) {
				return false;
			}else{
				return true;
			}
		}else{
		return true;
		}

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

	<form action="chattel/pledge_add.html" method="post" id="regist_form">
	<div class="conbox" id="conbox" style="display:none;" >
	<div class="tag" id="conbox1"></div>
	 <table cellSpacing=1 cellPadding=0 width=100% ID="basequerytable">
      <tbody>
      
      </tbody>
     </table>
     <table cellSpacing=1 cellPadding=0 width=100%>
     	<tr>
         <td colspan=2 align="center" style="padding-top:15px;">
         		<input id="submitbut" type="button" value=" 确 定 " name="input" class="btn" onclick="add()"> &nbsp;&nbsp;&nbsp;
         		<input id="cancelbut" type="button" value=" 关 闭 " name="input" class="btn" onclick="cancelLogout()" >
         </td>
      </tr>
     </table>  
	</div>
	<div class="content">
	
    <div class="main">
        <div class="height_35"></div>
        <div class="main_content main_01">
           <div class="biaoti_01">借款企业</div>
           <div class="main_01_content">
				<div class="form">
                  <ul>
                    <li class="margin_right">
                    <span class="wenben">企业名称：</span>
                    <input id="finanName" name="finanName"  type="text" class="validate[required,maxSize[36]] text-input">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li>
                    <span class="wenben">法人代表：</span>
                    <input id="finanLegalRep" name="finanLegalRep" type="text" class="validate[required,maxSize[36]] text-input">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li class="margin_right">
                    <span class="wenben">营业执照注册号：</span>
                    <input id="finanRegistNum" name="finanRegistNum" type="text" class="validate[required,maxSize[36],custom[chunshuzi]] text-input">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li>
                    <span class="wenben">组织机构代码：</span>
                    <input id="finanOrgCode" name="finanOrgCode" type="text" class="validate[required,custom[jigoudaima],maxSize[36]] text-input">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li class="margin_right">
                    <span class="wenben">税务登记证号：</span>
                    <input id="finanTaxRegNum" name="finanTaxRegNum" type="text" class="validate[required,maxSize[36],custom[numberandletter]] text-input">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li>
                    <span class="wenben">所在地区：</span>
                    	<select class="validate[required] selecty" name="" id="combo_province" onchange="fn_getCity();">
						<option value="">请选择...</option>
						<c:forEach var="row" items="${provinceList }">
							<option value="<c:out value="${row.proId}"/>" > 
								<c:out value="${row.proName}"/>
							</option>
						</c:forEach>
						</select>
						<select class="validate[required] selecty" name="cityId" id="combo_city">
						<option value="">请选择...</option>
						</select>
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li class="margin_right">
                    <span class="wenben">联系电话：</span>
                    <input id="finanTelphone" name="finanTelphone" type="text" class="validate[custom[phone]] text-input">
                    </li>
                    <li>
                    <span class="wenben">邮政编码：</span>
                    <input id="finanZipCode" name="finanZipCode" type="text"  class="validate[custom[zip]] text-input">
                    </li>
                    <li class="changbiaodan">
                    <span class="wenben">联系地址：</span>
                    <input id="finanAddress" name="finanAddress" type="text" class="validate[maxSize[36]] text-input">
                    </li>
                  </ul>
				</div>
           </div>
        </div>
       <!-- *********************************************************************-->
       <div class="main_content main_02">
           <div class="biaoti_01">担保品信息</div>
           <div class="main_02_content">
				<div class="form">
                  <ul>
                    <li class="margin_right">
                    <span class="wenben">出质人：</span>
                    <input id="guaranteePledgor" name="guaranteePledgor" type="text" class="validate[required,maxSize[36]] text-input">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li><span class="wenben">担保品：</span>
                        <select name="cvarId" class="validate[required] text-input">
                            <option value="">请选择...</option>
							<c:forEach var="co" items="${colls}" varStatus="st">
								<option value="${co.cvarId }">${co.cvarName }</option>
							</c:forEach>
                        </select>
                        <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li class="margin_right">
                    <span class="wenben">数量：</span>
                    <input id="guaranteeCount" name="guaranteeCount" type="text" class="validate[required,maxSize[9],min[0]] text-input">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li>
                    <span class="wenben">规格：</span>
                    <input id="specifical" name="specifical" type="text" class="validate[maxSize[30]] text-input">
                    </li>
                    <li class="margin_right">
                    <span class="wenben">单价（元）：</span>
                    <input id="guaranteePrice" name="guaranteePrice" type="text" class="validate[custom[number],maxSize[9],min[0]] text-input">
                    </li>
                    <li>
                    <span class="wenben">采购合同号：</span>
                    <input id="guaranteeContractNo_temp" name="guaranteeContractNo_temp" readonly="readonly" type="text" ><label style="font-size: 20px;color: red;cursor: pointer;" onclick="showMsgBox('1');">+</label>
                    <input id="guaranteeContractNo" name="guaranteeContractNo" readonly="readonly" type="hidden" >
                    </li>
                    <li class="margin_right">
                    <span class="wenben">采购发票号：</span>
                    <input id="guaranteeInvoiceNo_temp" name="guaranteeInvoiceNo_temp" type="text" readonly="readonly"><label style="font-size: 20px;color: red;cursor: pointer;"  onclick="showMsgBox('2');">+</label>
                    <input id="guaranteeInvoiceNo" name="guaranteeInvoiceNo" type="hidden" >
                    </li>
                    <li>
                    <span class="wenben">质押率（%）：</span>
                    <input id="guaranteePledgeRate" name="guaranteePledgeRate" type="text" class="validate[maxSize[9], custom[number100]] text-input">
                    </li>
                    <li class="margin_right">
                    <span class="wenben">仓单号：</span>
                    <input id="guaranteeWarehouseNo" name="guaranteeWarehouseNo" type="text" class="validate[maxSize[50]] text-input">
                    </li>
                  </ul>
				</div>
           </div>
        </div>
       <!-- *********************************************************************-->
        <div class="main_content main_03">
           <div class="biaoti_01">监管信息</div>
           <div class="main_03_content">
				<div class="form">
                  <ul>
                    <li class="margin_right">
                    <span class="wenben">监管企业：</span> 
                    	<select id="selectSupvId" name="supvId" class="validate[required] text-input">
                            <option value="">请选择...</option>
							<c:forEach var="su" items="${supers}" varStatus="st">
								<option value="${su.supvId }">${su.supvName }</option>
							</c:forEach>
                        </select>
                        <label style="color:red">&nbsp;&nbsp;*</label>
                    <li>
                    <span class="wenben">监管仓库：</span> 
                    	<select id="selectWarehouseId" name="warehouseId" class="validate[required] text-input" onchange="fn_load_warehouse_address()">
                            <option value="">请选择...</option>
                        </select><label style="color:red">&nbsp;&nbsp;*</label></li>
                    <li class="margin_right">
                    <span class="wenben">仓库地址：</span>
                    <input style="background: rgb(234, 233, 233);" id="warehouseAddress" name="guaranteeWarehouseAddress" type="text" readOnly>
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li>
                    <span class="wenben">监管仓位：</span>
                    <input id="guaranteeWarehousePosition" name="warehousePosition" type="text" class="validate[maxSize[50]] text-input">
                    </li>
                  </ul>
				</div>
           </div>
        </div>
       <!-- *********************************************************************-->
        <div class="main_content main_04">
           <div class="biaoti_01">融资信息</div>
           <div class="main_04_content">
				<div class="form">
                  <ul>
                    <li class="margin_right">
                    <span class="wenben">放贷开始时间：</span>
                    <input class="biaodan_03 validate[required] text-input" id="financingBeginDate" name="financingBeginDate" type="text" readonly>
                    <img class="more" src="images/chattel/more.png" onclick="c.showMoreDay = true;c.show(this,getObjById('financingBeginDate'))"/>
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li>
                    <span class="wenben">放贷结束时间：</span>
                    <input class="biaodan_03 validate[required] text-input" id="financingEndDate" name="financingEndDate" type="text" readonly>
                    <img class="more" src="images/chattel/more.png"  onclick="c.showMoreDay = true;c.show(this,getObjById('financingEndDate'))"/>
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li class="margin_right">
                    <span class="wenben">融资金额（万元）:</span>
                    <input id="financingAmount" name="financingAmount" type="text" class="validate[custom[number],maxSize[9],min[0]] text-input">
                    </li>
                    <li>
                    <span class="wenben">合同金额（万元）:</span>
                    <input id="financingContractAmount" name="financingContractAmount" type="text" class="validate[custom[number],maxSize[9],min[0]] text-input">
                    </li>
                    <li class="margin_right">
                    <span class="wenben">最低控货值（万元）:</span>
                    <input id="financingMincontrolValue" name="financingMincontrolValue" type="text" class="validate[custom[number],maxSize[9],min[0]] text-input">
                    </li>
                    <li>
                    <span class="wenben">保证金率（%）：</span>
                    <input id="financingBondRate" name="financingBondRate" type="text" class="validate[maxSize[9], custom[number100]] text-input">
                    </li>
                    <li class="margin_right">
                    <span class="wenben">质押交付时间：</span>
                    <input class="biaodan_03 validate[required] text-input" id="financingDeliveryDate" name="financingDeliveryDate" type="text" readonly>
                    <img class="more" src="images/chattel/more.png"  onclick="c.showMoreDay = true;c.show(this,getObjById('financingDeliveryDate'))"/>
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li><span class="wenben">承办人：</span>
                    	<select  class="validate[required] selecty" id="orgss"  onchange="fn_getManager();">
						<option value="">请选择...</option>
						<c:forEach var="org" items="${orgs}" varStatus="st">
							<option value="${org.orgId }">${org.orgName }</option>
						</c:forEach>
						</select>
						<select  class="validate[required] selecty" name="undertakerId" id="managery">
						<option value="">请选择...</option>
						</select>
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                  </ul>
				</div>
           </div>
        </div>
        
       <!-- ******************************************************************** -->
       
       <div class="main_content main_03">
           <div class="biaoti_01">备注信息</div>
           <div class="main_03_content">
				<div class="form">
                  <ul>
                    <li class="changbiaodan">
                    <span class="wenben" style="width:80px;">备注信息:</span>
                    <textarea rows="5" cols="110" id="remarks" name="remarks">可输入最大字符数:2000</textarea>
                    <!-- <input type="text" class="validate[maxSize[70]] text-input"> -->
                    </li>
                    <li>
                    <input type="hidden" name="registerId" value="${manager.managerId }">
                    </li>
                  </ul>
				</div>
           </div>
        </div>
		
       <!-- *********************************************************************-->
       <div class="anniu">
          <a href="javascript:form_submit()">提    交</a> 
          <a style="margin-left:120px" href="javascript:form_reset()">取    消</a>
       </div>
    </div>
</div>
</form>
</body>
</html>