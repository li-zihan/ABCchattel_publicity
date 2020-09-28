function fn_ischecked() {
	var checkIds = document.getElementsByName('roleId');
	
	for(var i=0;i<checkIds.length;i++) {
		if(checkIds[i].checked) {
			checkId = checkIds[i].value;
			return true;
		}
	}
	return false;
}

function fn_load_add() {
	location.href = basePath + 'role/load_role_add.html';
}

function fn_load_update() {
	if(!fn_ischecked()) {
		alert("请至少选择一项");
	} else {
		document.forms[0].action = basePath + 'role/load_role_update.html';
		document.forms[0].submit();
	}
}

function fn_delete() {
	
	var checkIds = document.getElementsByName('roleId');
	
	var checkId = "";
	for(var i=0;i<checkIds.length;i++) {
		if(checkIds[i].checked) {
			checkId = checkIds[i].value;
			break;
		}
	}
	
	if(!fn_ischecked()) {
		alert("请至少选择一项");
	} else {
		roleController.deleteRole(checkId, function(data){
			
			if(data) {
				location.href = basePath + 'role/role_list.html';
			} else {
				alert('存在使用中的用户，删除失败');
			}
		});
	}
}

function role_delete_submit(id){
	
	if(confirm("确认删除")){
		roleController.deleteRole(id, function(data){
			
			if(data) {
				alert('角色删除成功！');
				location.href = basePath + 'role/role_list.html';
			} else {
				alert('存在使用中的用户，删除失败！');
			}
		});
	}
	
}