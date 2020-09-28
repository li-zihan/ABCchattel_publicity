function fn_selectOrganizationByNameUpdate() {
	var orgId = $("#orgId").val();
	var orgName = $("#orgName").val();
	var orgAddress = $("#orgAddress").val();
	var bankType = $("#bankType").val();
	if(orgName != "") {
		validateDwr.selectOrganizationByNameUpdate(orgName, orgId, function(data) {
			if(data) {
				alert('修改失败, 存在相同的组织结构名称.');
			} else {
				if(orgAddress != "") {
					if (bankType != "") {
						if ($("#updateForm").validationEngine("validate")){  //验证是否通过
							document.forms[0].submit();
						}
					}
				}
			}		
		});
	}
}

jQuery(document).ready(function(){
	jQuery("#updateForm").validationEngine();
});