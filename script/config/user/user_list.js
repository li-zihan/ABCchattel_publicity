function user_delete_submit(managerId, userId){
	if(confirm("确认删除")){
		//location.href = basePath + 'account/user_manager_delete.html?managerId=' + managerId + '&userId=' + userId;
		userService.deleteUserManagerInfo(managerId, userId, function(data) {
			if(!data) {
				alert('当前用户已被作为承办人或已做过动产登记，删除失败 !');
			} else {
				location.href = basePath + 'account/user_manager.html';
			}
				
		});
	}
	
}

function fn_user_lock(id){
	if(confirm("确认锁定？")){
		userService.lockUserManagerInfo(id, function(data) {
			if(!data) {
				alert('锁定失败, 当前用户已经作为承办人 !');
			} else {
				alert('锁定成功!');
				//window.location.href = basePath + 'account/user_manager_lock.html?managerId=' + id;
				location.href = basePath + 'account/user_manager.html';
			}
		});
	}
}

function fn_user_unlock(id){
	if(confirm("确认解锁？")){
		window.location.href = basePath + 'account/user_manager_unlock.html?managerId=' + id;
		alert("解锁成功！");
	}
}
