$(function(){
//	$("#finanName").focus();
//	//首次加载监管仓库
//	lodewarehouse1($("#selectSupvId").val(), $("#warehousewarehouseId").val());
//	//首次加载城市
//	fn_getCity1($("#citycityId").val());
	//加载承办人
//	fn_getManager1($("#managermanagerId").val());
	//监管企业发生变化时，监管仓库的选择范围发生变化
	$("#selectSupvId").change(function(){
		var supvidchanged = $(this).val();
		lodewarehouse(supvidchanged);
	});
	$("#remarks").focus(function(){
		var a=$("#remarks").val();
		if(a=="可输入最大字符数:2000"){
			$("#remarks").val("");
		}
	});
	$("#remarks").blur(function(){
	    var a=$("#remarks").val();
	   if(a.length>=2000){
		   alert("备注信息输入字数过多，请精简描述");
	   }
	    
	});

});

//承办人
function fn_getManager(){
	var manager = $("#orgss");
	accountController.getManagerByOrgId(manager.val(), function(date){
		$("#managery").empty();
		for(var i=0;i<date.length;i++) {
			$("#managery").append("<option value="+date[i].managerId+">"+date[i].managerName+"</option>");
		}
	});
}

function fn_getManager1(managerId){
	var manager = $("#orgss");
	accountController.getManagerByOrgId(manager.val(), function(date){
		$("#managery").empty();
		for(var i=0;i<date.length;i++) {
			if(managerId==date[i].managerId){
				$("#managery").append("<option selected='selected' value="+date[i].managerId+">"+date[i].managerName+"</option>");
			}else{
				$("#managery").append("<option value="+date[i].managerId+">"+date[i].managerName+"</option>");
			}
		}
	});
}

//城市
function fn_getCity() {
	var comboProvince = document.getElementById('combo_province');
	areaDwr.loadCitysByProvince(comboProvince.value, function(data){
		
		var comboCity = document.getElementById('combo_city');
		
		comboCity.options.length = 0;
		for(var i=0;i<data.length;i++) {
			comboCity.options.add(new Option(data[i].cityName, data[i].cityId));
		}
	});
}

//城市
function fn_getCity1(citycityId) {
	var comboProvince = document.getElementById('combo_province');
	areaDwr.loadCitysByProvince(comboProvince.value, function(data){
		$("#combo_city").empty();
		for(var i=0;i<data.length;i++) {
			if(citycityId==data[i].cityId){
				$("#combo_city").append("<option selected='selected' value="+data[i].cityId+">"+data[i].cityName+"</option>");
			}else{
				$("#combo_city").append("<option value="+data[i].cityId+">"+data[i].cityName+"</option>");
			}
		}
	});
}

//加载监管仓库
function lodewarehouse(supvId){
	warehouseController.lodeAllWarehouseListBySupvId(supvId,function(warehouses){
		var warehouseselect = $("#selectWarehouseId");
		warehouseselect.empty();
		for(var j=0;j<warehouses.length;j++){
			warehouseselect.append("<option value="+warehouses[j].warehouseId+">"+warehouses[j].warehouseName+"</option>");
		}
		
		warehouseService.selectWarehouseById(warehouseselect.val(), function(data) {
			if(data != null) {
				$('#warehouseAddress').attr('value', data.warehouseAddress);
			} else {
				$('#warehouseAddress').attr('value', '');
			}
		});
	});
}

function lodewarehouse1(supvId, warehouseId){
	warehouseController.lodeAllWarehouseListBySupvId(supvId,function(warehouses){
		var warehouseselect = $("#selectWarehouseId");
		warehouseselect.empty();
		for(var j=0;j<warehouses.length;j++){
			if(warehouseId==warehouses[j].warehouseId){
				warehouseselect.append("<option selected='selected' value="+warehouses[j].warehouseId+">"+warehouses[j].warehouseName+"</option>");
			}else{
				warehouseselect.append("<option value="+warehouses[j].warehouseId+">"+warehouses[j].warehouseName+"</option>");
			}
		}
	});
}

//验证金钱，价格，正数或者最多带两个小数
function isPrise(obj){
	var pattern = /(^[-+]?[1-9]\d*(\.\d{1,2})?$)|(^[-+]?[0]{1}(\.\d{1,2})?$)/;
	var str = obj.val();
	if(pattern.test(str)){
		obj.next().text("");
	}else{
		obj.next().text("格式不正确");
	}
}

//判断是否全是数字
function isNum(obj){
	var flag = true;
	var str = obj.val();
	for(var i=0;i<str.length;i++){
		if((str.charAt(i)<="9"&&str.charAt(i)>="0")||str.charAt(i)=="."){
			if(flag){
				obj.next().text("");
			}
		}else{
			obj.next().text("请输入数字");
			flag = false;
		}
	}
	return flag;
}

//验证电话号码
function phone(obj){
	var str = obj.val();
	var pattern=/(^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$)|(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
	if(pattern.test(str)) { 
		obj.next().text("");
		return true;
	}else{
		obj.next().text("电话号码格式不正确"); 
		return false;
	}
}

//验证邮编
function zipNum(obj){
	var str = obj.val();
	var pattern = /^[1-9]{1}[0-9]{5}$/;
	if(pattern.test(str)) { 
		obj.next().text("");
	}else{
		obj.next().text("邮编格式不正确"); 
	}
}

//非空验证
function isEmpty(obj, error){
	var text = $.trim(obj.val());
	if(text.length<=0){
		obj.next().text(error);
		return false;
	}else{
		obj.next().text("");
		return true;
	}
}

//长度验证
function lengthLimit(obj,maxLen,str){
	var text = $.trim(obj.val());
	if(text.length>maxLen){
		obj.next().text(str+"长度不能大于"+maxLen);
		return false;
	}else{
		obj.next().text("");
		return true;
	}
}

//下拉框验证
function selectchack(obj){
	if(obj.val()=="-1"){
		obj.next().text("请选择");
	}else{
		obj.next().text("");
	}
}

//提交验证
function submitchack(){
	isEmpty($("#financingBeginDate"),"时间不能为空");
	isEmpty($("#financingEndDate"),"时间不能为空");
	isEmpty($("#financingDeliveryDate"),"时间不能为空");
	
	$(".selecty").each(function(){
		selectchack($(this));
	});
	var flag = true;
	$(".msgy").each(function(){
		if(!$(this).text()==""){
			flag = false;
		}
	});
	return flag;
}



