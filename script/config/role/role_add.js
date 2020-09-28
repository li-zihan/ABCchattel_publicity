jQuery(function() {
		jQuery("input:checkbox.checkAll").change(
				function() {
					if (jQuery(this).attr("checked")) {
						jQuery(this).parent().parent("tr").find(
								"td input:checkbox.checkItem").attr("checked",
								true);
					} else {
						jQuery(this).parent().parent("tr").find(
								"td input:checkbox.checkItem").attr("checked",
								false);
					}
				});
		jQuery("input:checkbox.checkItem").change(
				function() {
					if (jQuery(this).parents("td").find("input:checkbox.checkItem:checked").length > 0) {
						//jQuery(this).parents("tr").find("th input:checkbox.checkAll").attr("checked", true);
						
						var idValue = jQuery(this).next().val();
						jQuery('#' + idValue).attr("checked", true);
					} else {
						var idValue = jQuery(this).next().val();
						jQuery('#' + idValue).attr("checked", false);
					}
				});

	});

jQuery(document).ready(function(){
	jQuery("#roleAdd").validationEngine();
});

function fn_submit() {
	var roleName = document.getElementById('roleName').value;
	var otypeId = document.getElementById('otypeId').value;
	roleController.exsitsRole(roleName, otypeId, function(data) {
		if(!data) {
			$('#roleName').validationEngine('showPrompt', '创建失败, 存在相同的角色名称.', null, null, true);
		} else {
			if ($("#roleAdd").validationEngine("validate")){  //验证是否通过
				$('#confirmbutton').attr('disabled',"true");//添加disabled属性
     		   	$("#roleAdd").submit();  
			}
		}
	});
}

$(document).ready(function(){
	var height = $('#config_div').height() + 20;
	$('#config_div').height( height < 500 ? mainBodyHeight : height );
	
	$('#config_main', window.parent.document).load(function(){
      $(this).height(0); //用于每次刷新时控制IFRAME高度初始化 
      
      var height = $(this).contents().height() + 20; 
      $(this).height( height < 500 ? mainBodyHeight : height ); 
    });
	
	var mainIFrame = $('#main', window.parent.parent.document);
	$('#main', window.parent.parent.document).height(0); //用于每次刷新时控制IFRAME高度初始化 
	var height = mainIFrame.contents().height() + 200;
	mainIFrame.height( height < 500 ? mainBodyHeight : height ); 
	
});