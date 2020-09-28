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

function fn_selectSupervisionEnterpriseByName() {
	if ($("#supv_add_form").validationEngine("validate")){  //验证是否通过
		$('#add_btn').attr('disabled',"true");//添加disabled属性
		   	$("#supv_add_form").submit();  
	}
}

/*$(function() {
	$('#supv_add_btn').click(function(){
		$('#addForm').submit();
	});
});*/

jQuery(document).ready(function(){
	jQuery("#supv_add_form").validationEngine();
});

