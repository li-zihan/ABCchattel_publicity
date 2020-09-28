<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>动产登记-更新信息</title>
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

<link href="css/chattel/chattel_regist_submit_info.css" rel="stylesheet" type="text/css" />
<link href="script/validation/template.css" rel="stylesheet" type="text/css" />
<link href="script/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<style>
.conbox {background:#fff url(images/chattel/conboxbottombg.jpg) repeat-x 0 bottom;border:1px solid #c4d3e9;padding-bottom:15px;margin:8px 10px 0;}
.conbox .tag {height:33px;line-height:33px;font-size:16px;font-weight:bold;text-align:left;background:url(images/chattel/conboxtagbg.jpg) repeat-x;padding-left:15px;margin-bottom:15px;}

</style>
<script type='text/javascript' src='dwr/interface/areaDwr.js'></script>
<script type='text/javascript' src='dwr/interface/warehouseService.js'></script>
<script type='text/javascript' src='dwr/interface/warehouseController.js'></script>
<script type='text/javascript' src='dwr/interface/accountController.js'></script>

<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

<script type="text/javascript" src='script/jquery-1.7.1.min.js'></script>
<script type="text/javascript" src='script/chattel/chattel_regist_submit_info.js'></script>

<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>

<script src="script/chattel/Calendar5.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#update_regist_form").validationEngine();
});
        var c = new Calendar("c");
        document.write(c);
        function form_reset(){
        	location.href= basePath+"chattel/chattel_regist_info.html";
        }
        function form_submit(){
        	if(confirm("您确认更新所有信息?")){
        	 if(!compareDate(document.all.financingBeginDate.value,document.all.financingEndDate.value)){
        		 alert("放贷结束时间应大于放贷开始时间！");
  				 document.all.financingEndDate.focus();
        	  }else {
        		  if ($("#update_regist_form").validationEngine("validate")){  //验证是否通过
       			   $("a:first").removeAttr("href");//置提交按钮无效。
           		   $("#update_regist_form").submit();  
  					}
        	  }
        	}
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
      //定义鼠标拖动对象 
        drag=function (a,o){ 
             var d=document;if(!a)a=window.event; 
                if(!a.pageX)a.pageX=a.clientX; 
                if(!a.pageY)a.pageY=a.clientY; 
             var x=a.pageX,y=a.pageY; 
             if(o.setCapture) 
                 o.setCapture(); 
             else if(window.captureEvents) 
                 window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP); 
             var backData = {x : o.style.top, y : o.style.left}; 
             d.onmousemove=function(a){ 
                 if(!a)a=window.event; 
                 if(!a.pageX)a.pageX=a.clientX; 
                 if(!a.pageY)a.pageY=a.clientY; 
                 var tx=a.pageX-x+parseInt(o.style.left),ty=a.pageY-y+parseInt(o.style.top); 
                 o.style.left=tx+"px"; 
                 o.style.top=ty+"px"; 
                    x=a.pageX; 
                    y=a.pageY; 
             }; 
             d.onmouseup=function(a){ 
                 if(!a)a=window.event; 
                 if(o.releaseCapture) 
                     o.releaseCapture(); 
                 else if(window.captureEvents) 
                     window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP); 
                 d.onmousemove=null; 
                 d.onmouseup=null; 
                 if(!a.pageX)a.pageX=a.clientX; 
                 if(!a.pageY)a.pageY=a.clientY; 
                 if(!document.body.pageWidth)document.body.pageWidth=document.body.clientWidth; 
                 if(!document.body.pageHeight)document.body.pageHeight=document.body.clientHeight; 
                 if(a.pageX < 1 || a.pageY < 1 || a.pageX > document.body.pageWidth || a.pageY > document.body.pageHeight){ 
                     o.style.left = backData.y; 
                     o.style.top = backData.x; 
                 } 
             }; 
        } 
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
	<form action="chattel/pledge_update.html" method="post" id="update_regist_form">
	<input id="pledgeId" name="pledgeId" type="hidden" value="${pledge.pledge_id }">
	<input id="finanId" name="finanId" type="hidden" value="${pledge.finan_id }">
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
                    <input id="finanName" name="finanName"  type="text" class="validate[required,maxSize[30]] text-input" value="${pledge.finan_name }">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li>
                    <span class="wenben">法人代表：</span>
                    <input id="finanLegalRep" name="finanLegalRep" type="text" class="validate[required,maxSize[25]] text-input" value="${pledge.finan_legal_rep }">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li class="margin_right">
                    <span class="wenben">营业执照注册号：</span>
                    <input id="finanRegistNum" name="finanRegistNum" type="text" class="validate[required,maxSize[20],custom[chunshuzi]] text-input" value="${pledge.finan_regist_num }">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li>
                    <span class="wenben">组织机构代码：</span>
                    <input id="finanOrgCode" name="finanOrgCode" type="text" class="validate[required,custom[jigoudaima],maxSize[25]] text-input" value="${pledge.finan_org_code }">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li class="margin_right">
                    <span class="wenben">税务登记证号：</span>
                    <input id="finanTaxRegNum" name="finanTaxRegNum" type="text" class="validate[required,maxSize[25],custom[numberandletter]] text-input" value="${pledge.finan_tax_reg_num }">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                     <li><span class="wenben">所在地区：</span>
                    	<select class="validate[required] selecty" name="" id="combo_province" onchange="fn_getCity();">
						<option value="">请选择...</option>
						<c:forEach var="row" items="${provinceList }">
							<c:choose>
									<c:when test="${row.proId == city.proId }">
										<option selected="selected" value="<c:out value="${row.proId}"/>" ><c:out value="${row.proName}"/></option>
									</c:when>	
									<c:otherwise>
										<option value="<c:out value="${row.proId}"/>" ><c:out value="${row.proName}"/></option>
									</c:otherwise>
								</c:choose>
							
						</c:forEach>
						</select>
						<input id="citycityId" type="hidden" value="${city.cityId }">
						<select class="validate[required] selecty" name="cityId" id="combo_city">
							<c:forEach var="row" items="${cityList }">
								<option value="<c:out value="${row.cityId}"/>" <c:if test="${city.cityId==row.cityId }">selected="selected"</c:if>> 
								<c:out value="${row.cityName}"/>
							</option>
						</c:forEach>
						</select>
                    <img src="images/chattel/xinghao.jpg" /></li>
                    <li class="margin_right">
                    <span class="wenben">联系电话：</span>
                    <input id="finanTelphone" name="finanTelphone" type="text" class="validate[custom[phone]] text-input" value="${pledge.finan_telphone }">
                    </li>
                    <li>
                    <span class="wenben">邮政编码：</span>
                    <input id="finanZipCode" name="finanZipCode" type="text"  class="validate[custom[zip]] text-input" value="${pledge.finan_zip_code }">
                    </li>
                    <li class="changbiaodan">
                    <span class="wenben">联系地址：</span>
                    <input id="finanAddress" name="finanAddress" type="text" class="validate[maxSize[30]] text-input" value="${pledge.finan_address }">
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
                    <input id="guaranteePledgor" name="guaranteePledgor" type="text" class="validate[required,maxSize[30]] text-input" value="${pledge.guarantee_pledgor }">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                          <li><span class="wenben">担保品：</span>
                        <select name="cvarId" class="validate[required] text-input">
                            <option value="">请选择...</option>
							<c:forEach var="co" items="${colls}" varStatus="st">
								<c:choose>
									<c:when test="${co.cvarId == pledge.cvar_id }">
										<option selected="selected" value="${co.cvarId }">${co.cvarName }</option>
									</c:when>	
									<c:otherwise>
										<option value="${co.cvarId }">${co.cvarName }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
                        </select>
                           <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li class="margin_right">
                    <span class="wenben">数量：</span>
                    <input id="guaranteeCount" name="guaranteeCount" type="text" class="validate[required,maxSize[9],min[0]] text-input" value="${pledge.guarantee_count }">
                    <label style="color:red">&nbsp;&nbsp;*</label>
                    </li>
                    <li>
                    <span class="wenben">规格：</span>
                    <input id="specifical" name="specifical" type="text" class="validate[maxSize[30]] text-input"  value="${pledge.guarantee_count }">
                    </li>
                    <li class="margin_right">
                    <span class="wenben">单价（元）：</span>
                    <input id="guaranteePrice" name="guaranteePrice" type="text" class="validate[custom[number],maxSize[9],min[0]] text-input" value="${pledge.guarantee_price }">
                    </li>
                    <li>
                    <span class="wenben">采购合同号：</span>
                    <input id="guaranteeContractNo_temp" name="guaranteeContractNo_temp" readonly="readonly" type="text" value="${pledge.guarantee_contract_no }" ><label style="font-size: 20px;color: red;cursor: pointer;"  onclick="showMsgBox('1');">+</label>
                    <input id="guaranteeContractNo" name="guaranteeContractNo" readonly="readonly" type="hidden" value="${con_no.purchase_contract_no}" >                    
                    </li>
                    <li class="margin_right">
                    <span class="wenben">采购发票号：</span>
                    <input id="guaranteeInvoiceNo_temp" name="guaranteeInvoiceNo_temp" type="text" readonly="readonly" value="${pledge.guarantee_Invoice_no }"><label style="font-size: 20px;color: red;cursor: pointer;"  onclick="showMsgBox('2');">+</label>
                    <input id="guaranteeInvoiceNo" name="guaranteeInvoiceNo" type="hidden" value="${invo_no.purchase_invoice_no}">
                    </li>
                    <li>
                    <span class="wenben">质押率（%）：</span>
                    <input id="guaranteePledgeRate" name="guaranteePledgeRate" type="text" class="validate[custom[number100]] text-input" value="${pledge.guarantee_pledge_rate }">
                    </li>
                    <li class="margin_right">
                    <span class="wenben">仓单号：</span>
                    <input id="guaranteeWarehouseNo" name="guaranteeWarehouseNo" type="text" class="validate[maxSize[50]] text-input" value="${pledge.guarantee_warehouse_no }">
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
                    <li class="margin_right"><span class="wenben">监管企业：</span> <select id="selectSupvId" name="supvId" class="validate[required] text-input">
                            <option value="">请选择...</option>
							<c:forEach var="su" items="${supers}" varStatus="st">
								<c:choose>
									<c:when test="${su.supvId == warehouse.supvId }">
										<option selected="selected" value="${su.supvId }">${su.supvName }</option>
									</c:when>	
									<c:otherwise>
										<option value="${su.supvId }">${su.supvName }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
                        </select><img src="images/chattel/xinghao.jpg" /></li>
                        <input type="hidden" id="warehousewarehouseId" value="${warehouse.warehouseId }">
                    <li><span class="wenben">监管仓库：</span> <select id="selectWarehouseId" name="warehouseId" class="validate[required] text-input">
                            <option value="${warehouse.warehouseId }">${warehouse.warehouseName}</option>
                        </select><img src="images/chattel/xinghao.jpg" /></li>
                    <li class="margin_right"><span class="wenben">仓库地址：</span><input id="warehouseAddress" name="guaranteeWarehouseAddress" style="background: rgb(234, 233, 233);" type="text" value="${pledge.guarantee_warehouse_address }" readonly="readonly"><img src="images/chattel/xinghao.jpg" /></li>
                    <li><span class="wenben">监管仓位：</span><input class="validate[maxSize[50]] text-input" id="guaranteeWarehousePosition" name="warehousePosition" type="text" value="${pledge.guarantee_warehouse_position }"></li>
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
                    <li class="margin_right"><span class="wenben">放贷开始时间：</span><input class="biaodan_03 validate[required] text-input" id="financingBeginDate" name="financingBeginDate" type="text" readonly value="${pledge.financing_begin_date }"><img class="more" src="images/chattel/more.png" onclick="c.showMoreDay = true;c.show(this,getObjById('financingBeginDate'))"/><img src="images/chattel/xinghao.jpg" /></li>
                    <li><span class="wenben">放贷结束时间：</span><input class="biaodan_03 validate[required] text-input" id="financingEndDate" name="financingEndDate" type="text" readonly value="${pledge.financing_end_date }"><img class="more" src="images/chattel/more.png"  onclick="c.showMoreDay = true;c.show(this,getObjById('financingEndDate'))"/><img src="images/chattel/xinghao.jpg" /></li>
                    <li class="margin_right"><span class="wenben">融资金额（万元）:</span><input class="validate[custom[number],maxSize[9],min[0]] text-input" id="financingAmount" name="financingAmount" type="text" value="${pledge.financing_amount }"></li>
                    <li><span class="wenben">合同金额（万元）:</span><input class="validate[custom[number],maxSize[9],min[0]] text-input" id="financingContractAmount" name="financingContractAmount" type="text" value="${pledge.financing_contract_amount }"></li>
                    <li class="margin_right"><span class="wenben">最低控货值（万元）:</span><input class="validate[custom[number],maxSize[9],min[0]] text-input" id="financingMincontrolValue" name="financingMincontrolValue" type="text" value="${pledge.financing_mincontrol_value }"></li>
                    <li><span class="wenben">保证金率（%）：</span><input class="validate[maxSize[9], custom[number100]] text-input" id="financingBondRate" name="financingBondRate" type="text" value="${pledge.financing_bond_rate }"></li>
                    <li class="margin_right"><span class="wenben">质押交付时间：</span><input class="biaodan_03 validate[required] text-input" id="financingDeliveryDate" name="financingDeliveryDate" type="text" readonly value="${pledge.financing_delivery_date }"><img class="more" src="images/chattel/more.png"  onclick="c.showMoreDay = true;c.show(this,getObjById('financingDeliveryDate'))"/><img src="images/chattel/xinghao.jpg" /></li>
                    <li><span class="wenben">承办人：</span>
                    	<select class="validate[required] selecty" id="orgss"  onchange="fn_getManager();">
						<option value="">请选择...</option>
						<c:forEach var="org" items="${orgs}" varStatus="st">
							<c:choose>
									<c:when test="${org.orgId == manager1.orgId }">
										<option selected="selected" value="${org.orgId }">${org.orgName }</option>
									</c:when>	
									<c:otherwise>
										<option value="${org.orgId }">${org.orgName }</option>
									</c:otherwise>
								</c:choose>
							
						</c:forEach>
						</select>
						<input id="managermanagerId" type="hidden" value="${manager1.managerId}">
						<select class="validate[required] selecty" name="undertakerId" id="managery">
						<option value="${manager1.managerId}">${manager1.managerName }</option>
						</select>
                    <img src="images/chattel/xinghao.jpg" /></li>
                   
                    <li><input type="hidden" name="registerId" value="${manager.managerId }"></li>
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
                    <span class="wenben">备注信息:</span>
                    <textarea rows="5" cols="110" id="remarks" name="remarks">${pledge.remarks }</textarea>
                    <!-- <input type="text" class="validate[maxSize[70]] text-input"> -->
                    </li>
                  </ul>
				</div>
           </div>
        </div>
		
       <!-- *********************************************************************-->
		
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