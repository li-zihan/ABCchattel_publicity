function fn_load_supv_add() {
	location.href = basePath + 'supv/load_supv_add.html';
}

function fn_load_supv_update(supvId) {
	location.href = basePath + 'supv/load_supv_update.html?supvId=' + supvId;
}

function fn_supv_delete(supvId) {
	if(confirm("确认删除？")) {
		supervisionEnterpriseService.deleteSupervEnterpriseById(supvId, function(data) {
			if(data){
				alert("当前监管公司已经作为动产登记关键信息，删除失败！");
			}else{
				supervisionEnterpriseService.delSupervEnterpriseById(supvId, function(data) {
					if(data) {
						location.href = basePath + 'supv/supv_delete.html?supvId=' + supvId;
					} else {
						alert('删除失败 , 当前监管公司有所辖仓库!');
					}
				});
			}
		});
	}	
}

function fn_supv_lock(supvId) {
	if(confirm("确认锁定？")) {
		
		supervisionEnterpriseService.lockSupervEnterpriseById(supvId, function(data) {
			if(data) {
				location.href = basePath + 'supv/supv_list.html';
				alert("锁定成功！");
			} else {
				alert('锁定失败 , 当前监管公司有所辖仓库!');
			}
		});
		
		
	}
}

function fn_supv_unlock(supvId) {
	if(confirm("确认解锁？")) {
		location.href = basePath + 'supv/supv_unlock.html?supvId=' + supvId;
		alert("解锁成功！");
	}
}

function fn_supv_search() {
	//var input = $("#search_input").val();
	//location.href = basePath + 'supv/supv_search.html?searchInput=' + input;
	document.forms[0].submit();
}

function fn_supv_warehouse(supvId) {
	location.href = basePath + 'supv/supv_warehouse.html?supvId=' + supvId;
}