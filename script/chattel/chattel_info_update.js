$(function(){
	//加载城市
	fn_getCity1($("#citycityId").val());
	//加载仓库
	lodewarehouse1($("#selectSupvId").val(), $("#warehousewarehouseId").val());
	//加载承办人
	fn_getManager1($("#managermanagerId").val());
});