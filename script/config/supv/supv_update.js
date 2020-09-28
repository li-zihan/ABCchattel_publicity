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

function fn_selectSupervisionEnterpriseByNameUpdate() {
	$('#updateForm').submit();
//	var supvName = $("#supvName").val();
//	var reg1 = /^(\d{3,4}\-)?[1-9]\d{6,7}$/;
//	var reg2 = /^[1][358]\d{9}$/;
//	var supvTelphone = $("#supvTelphone").val();
//	var city = $("#combo_city").val();
//	var supvId = $("#supvId").val();
//	if(supvName != "") {
//		validateDwr.selectSupervisionEnterpriseByNameUpdate(supvName, supvId, function(data) {
//			if(data) {
////				alert('修改失败, 存在相同的监管公司名称.');
//				document.forms[0].submit();//无论返回false/true,都执行提交操作
//			} else {
//				if (city != "") {
//					if ((reg1.test(supvTelphone) || reg2.test(supvTelphone))) {
//						document.forms[0].submit();
//					}
//				}
//			}		
//		});
//	}
}

jQuery(document).ready(function(){
	jQuery("#updateForm").validationEngine();
});