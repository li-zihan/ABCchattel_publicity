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

<link href="css/chattel/chattel_regist_submit_info.css" rel="stylesheet" type="text/css" />
<link href="script/validation/template.css" rel="stylesheet" type="text/css" />
<script type='text/javascript' src='dwr/interface/areaDwr.js'></script>
<script type='text/javascript' src='dwr/interface/warehouseController.js'></script>
<script type='text/javascript' src='dwr/interface/accountController.js'></script>

<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

<script type="text/javascript" src='script/jquery-1.7.1.min.js'></script>
<script type="text/javascript" src='script/chattel/chattel_regist_submit_info.js'></script>
<script type="text/javascript" src='script/chattel/chattel_info_update.js'></script>

<script src="script/chattel/Calendar5.js" type="text/javascript"></script>
<script type="text/javascript">
        var c = new Calendar("c");
        document.write(c);
        function form_reset(){
        	location.href= basePath+"chattel/chattel_regist_info.html";
        }
        function form_submit(){
        	$("#update_regist_form").submit();
        }
</script>
</head>
<body>
	<form action="chattel/pledge_update.html" id="update_regist_form" method="post">
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
                    <li class="margin_right"><span class="wenben">企业名称：</span><input id="finanName" name="finanName"  type="text" value="${pledge.finan_name }"><img src="images/chattel/xinghao.jpg" /></li>
                    <li><span class="wenben">法人代表：</span><input id="finanLegalRep" name="finanLegalRep" type="text" value="${pledge.finan_legal_rep }"><img src="images/chattel/xinghao.jpg" /></li>
                    <li class="margin_right"><span class="wenben">营业执照注册号：</span><input id="finanRegistNum" name="finanRegistNum" type="text" value="${pledge.finan_org_code }"><img src="images/chattel/xinghao.jpg" /></li>
                    <li><span class="wenben">组织机构代码：</span><input id="finanOrgCode" name="finanOrgCode" type="text" value="${pledge.finan_org_code }"><img src="images/chattel/xinghao.jpg" /></li>
                    <li class="margin_right"><span class="wenben">税务登记证号：</span><input id="finanTaxRegNum" name="finanTaxRegNum" type="text" value="${pledge.finan_tax_reg_num }"><img src="images/chattel/xinghao.jpg" /></li>
                    <li><span class="wenben">所在地区：</span>
                    	<select class="selecty" name="" id="combo_province" onchange="fn_getCity();">
						<option value="-1">请选择...</option>
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
						<select class="selecty" name="cityId" id="combo_city">
						<option value="${city.cityId }">${city.cityName }</option>
						</select>
                    <img src="images/chattel/xinghao.jpg" /></li>
                    <li class="margin_right"><span class="wenben">联系电话：</span><input id="finanTelphone" name="finanTelphone" type="text" value="${pledge.finan_telphone }"></li>
                    <li><span class="wenben">邮政编码：</span><input id="finanZipCode" name="finanZipCode" type="text" value="${pledge.finan_zip_code }"></li>
                    <li class="changbiaodan"><span class="wenben">联系地址：</span><input id="finanAddress" name="finanAddress" type="text" value="${pledge.finan_address }"></li>
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
                    <li class="margin_right"><span class="wenben">出质人：</span><input id="guaranteePledgor" name="guaranteePledgor" type="text" value="${pledge.guarantee_pledgor }"><img src="images/chattel/xinghao.jpg" /></li>
                    <li><span class="wenben">担保品：</span>
                        <select name="cvarId">
                            <option value="-1">请选择...</option>
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
                        <img src="images/chattel/xinghao.jpg" />
                    </li>
                    <li class="margin_right"><span class="wenben">数量：</span><input id="guaranteeCount" name="guaranteeCount" type="text" value="${pledge.guarantee_count }"><img src="images/chattel/xinghao.jpg" /></li>
                    <li class="margin_right"><span class="wenben">规格：</span><input id="guaranteeCount" name="guaranteeCount" type="text" value="${pledge.guarantee_count }"></li>
                    <li><span class="wenben">单价（万元）：</span><input id="guaranteePrice" name="guaranteePrice" type="text" value="${pledge.guarantee_price }"></li>
                    <li class="margin_right"><span class="wenben">采购合同号：</span>&nbsp;&nbsp;&nbsp;&nbsp;<input id="guaranteeContractNo" name="guaranteeContractNo" type="text" value="${pledge.guarantee_contract_no }"></li>
                    <li><span class="wenben">采购发票号：</span><input id="guaranteeInvoiceNo" name="guaranteeInvoiceNo" type="text" value="${pledge.guarantee_Invoice_no }"></li>
                    <li class="margin_right"><span class="wenben">质押率（%）：</span><input id="guaranteePledgeRate" name="guaranteePledgeRate" type="text" value="${pledge.guarantee_pledge_rate }"></li>
                    <li><span class="wenben">仓单号：</span><input id="guaranteeWarehouseNo" name="guaranteeWarehouseNo" type="text" value="${pledge.guarantee_warehouse_no }"></li>
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
                    <li class="margin_right"><span class="wenben">监管企业：</span> <select id="selectSupvId" name="supvId">
                            <option value="-1">请选择...</option>
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
                    <li><span class="wenben">监管仓库：</span> <select id="selectWarehouseId" name="warehouseId">
                            <option value="${warehouse.warehouseId }">${warehouse.warehouseName}</option>
                        </select><img src="images/chattel/xinghao.jpg" /></li>
                    <li class="margin_right"><span class="wenben">仓库地址：</span><input id="warehouseAddress" name="warehouseAddress" type="text" value="${pledge.warehouse_address }"><img src="images/chattel/xinghao.jpg" /></li>
                    <li><span class="wenben">监管仓位：</span><input id="guaranteeWarehousePosition" name="warehousePosition" type="text" value="${pledge.guarantee_warehouse_position }"></li>
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
                    <li class="margin_right"><span class="wenben">放贷开始时间：</span><input class="biaodan_03" id="financingBeginDate" name="financingBeginDate" type="text" readonly value="${pledge.financing_begin_date }"><img class="more" src="images/chattel/more.png" onclick="c.showMoreDay = true;c.show(this,getObjById('financingBeginDate'))"/><img src="images/chattel/xinghao.jpg" /></li>
                    <li><span class="wenben">放贷结束时间：</span><input class="biaodan_03" id="financingEndDate" name="financingEndDate" type="text" readonly value="${pledge.financing_end_date }"><img class="more" src="images/chattel/more.png"  onclick="c.showMoreDay = true;c.show(this,getObjById('financingEndDate'))"/><img src="images/chattel/xinghao.jpg" /></li>
                    <li class="margin_right"><span class="wenben">融资金额（万元）:</span><input id="financingAmount" name="financingAmount" type="text" value="${pledge.financing_amount }"></li>
                    <li><span class="wenben">合同金额（万元）:</span><input id="financingContractAmount" name="financingContractAmount" type="text" value="${pledge.financing_contract_amount }"></li>
                    <li class="margin_right"><span class="wenben">最低控货值（万元）:</span><input id="financingMincontrolValue" name="financingMincontrolValue" type="text" value="${pledge.financing_mincontrol_value }"></li>
                    <li><span class="wenben">保证金率（%）：</span><input id="financingBondRate" name="financingBondRate" type="text" value="${pledge.financing_bond_rate }"></li>
                    <li class="margin_right"><span class="wenben">质押交付时间：</span><input class="biaodan_03" id="financingDeliveryDate" name="financingDeliveryDate" type="text" readonly value="${pledge.financing_delivery_date }"><img class="more" src="images/chattel/more.png"  onclick="c.showMoreDay = true;c.show(this,getObjById('financingDeliveryDate'))"/><img src="images/chattel/xinghao.jpg" /></li>
                    <li><span class="wenben">承办人：</span>
                    	<select class="selecty" id="orgss"  onchange="fn_getManager();">
						<option value="-1">请选择...</option>
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
						<select class="selecty" name="undertakerId" id="managery">
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
                    <li>
                    <input type="hidden" name="registerId" value="${manager.managerId }">
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