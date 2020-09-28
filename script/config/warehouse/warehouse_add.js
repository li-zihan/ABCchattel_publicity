 function form_submit(){
	 if ($("#addWarehouse").validationEngine("validate")){  //验证是否通过
			$('#add_btn').attr('disabled',"true");//添加disabled属性
		   	$("#addWarehouse").submit();  
		}
 }
        
jQuery(document).ready(function(){
	jQuery("#addWarehouse").validationEngine();
});