function fn_load_organization_add() {
	location.href = basePath + 'organization/load_organization_add.html';
}

function fn_load_org_update(id) {
	window.location.href = basePath + 'organization/organization_info.html?orgId=' + id;	
}

function fn_org_lock(id){
	if(confirm("确认要锁定当前的组织机构吗?")) {
		organizationService.lockOrganization(id, function(data) {
			if(data) {
				document.getElementById('span_update_href' + id).style.display = 'none';
				document.getElementById('span_update' + id).style.display = 'block';
				
				document.getElementById('span_lock' + id).style.display = 'none';
				document.getElementById('span_unlock' + id).style.display = 'block';
				
				alert("组织机构锁定成功!");
			} else {
				alert("组织机构锁定失败! 当前组织机构含有下级组织机构.");
			}
		});
	}
}

function fn_org_unlock(id){
	if(confirm("确认要解锁当前的组织机构吗?")) {
		organizationService.unlockOrganization(id, function(data) {
			document.getElementById('span_update' + id).style.display = 'none';
			document.getElementById('span_update_href' + id).style.display = 'block';
			
			document.getElementById('span_lock' + id).style.display = 'block';
			document.getElementById('span_unlock' + id).style.display = 'none';
			alert("组织机构解锁成功!");
		});
	}
}