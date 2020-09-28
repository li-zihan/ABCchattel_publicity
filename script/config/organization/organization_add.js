jQuery(document).ready(function(){
	jQuery("#org_add_form").validationEngine();
});

function doSubmit(){  
	  
}; 
$(function(){
	$('#org_add_btn').click(function(){
		validateDwr.selectOrganizationByName($("#orgName").val(), function(data) {
			if(data) {
				$('#orgName').validationEngine('showPrompt', '创建失败, 存在相同的组织结构名称.', null, null, true);
			} else {
				if ($("#org_add_form").validationEngine("validate")){  //验证是否通过
					$('#org_add_btn').attr('disabled',"true");//添加disabled属性
					$("#org_add_form").submit();  
				}			
			}		
		});
	});
});

function fn_selectOrganizationByName() {
	var orgName = $("#orgName").val();
	var orgAddress = $("#orgAddress").val();
	var bankType = $("#bankType").val();
	
	if(orgName != "") {
		validateDwr.selectOrganizationByName(orgName, function(data) {
			if(data) {
				alert('创建失败, 存在相同的组织结构名称.');
			} else {
				if(orgAddress != "") {
					if (bankType != "") {
						$('#org_add_form').submit();
					}
				}
			}		
		});
	}
}

