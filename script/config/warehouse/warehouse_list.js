//添加
function fn_open_warehouse_add() {
	location.href = basePath + 'warehouse/load_warehouse_add.html';
}
//更新
function fn_update_submit(id) {
	window.location.href = basePath + 'warehouse/load_warehouse_update.html?warehouseId=' + id;
	
}
//删除
function fn_delete_submit(id){
	if(confirm("确认删除")){
		warehouseService.deleteWarehouseByWarehouseId(id, function(data) {
			if(data){
				alert("当前监管仓库已经作为动产登记关键信息，删除失败！");
			}else{
				window.location.href = basePath + 'warehouse/delete_warehouse.html?warehouseId=' + id;
			}
		});
		
	}
	
}
//锁定
function fn_lock_submit(id){
	if(confirm("确认锁定？")) {
		window.location.href = basePath + 'warehouse/lock_warehouse.html?warehouseId=' + id;
		alert("锁定成功！");
	}
}

//解锁
function fn_unlock_submit(id){
	if(confirm("确认解锁？")) {
		window.location.href = basePath + 'warehouse/unlock_warehouse.html?warehouseId=' + id;
		alert("解锁成功！");
	}
}

