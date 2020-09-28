$(function(){
	$("#content_div_d1_title").toggle(function(){
		$("#content_div_d3").removeClass("displayblock");
		$("#content_div_d3").addClass("displaynone");
		$('#main', window.parent.document).height(0);
	  	var height = $('#main', window.parent.document).contents().height() + 20;
	  	$('#main', window.parent.document).height( height < 500 ? 500 : height ); 
	},function(){			
		$("#content_div_d3").removeClass("displaynone");
		$("#content_div_d3").addClass("displayblock");
		$('#main', window.parent.document).height(0);
	  	var height = $('#main', window.parent.document).contents().height() + 20;
	  	$('#main', window.parent.document).height( height < 500 ? 500 : height ); 
	});
});

$(function(){
	var whid = $("#selectWarehouseId1").val();
	lodewarehouse($("#selectSupvId").val(),whid);
	$("#selectSupvId").change(function(){
		var supvidchanged = $(this).val();
		lodewarehouse(supvidchanged,"");
	});
});

$(function(){
	$("#content_div_d1_title").click();
});


function lodewarehouse(supvId, warehouseId){
	warehouseController.lodeAllWarehouseListBySupvId(supvId,function(warehouses){
		var warehouseselect = $("#selectWarehouseId");
		warehouseselect.empty();
		warehouseselect.append("<option value=''>请选择..</option>");
		for(var j=0;j<warehouses.length;j++){
			if(warehouses[j].warehouseId==warehouseId){
				warehouseselect.append("<option selected='selected' value="+warehouses[j].warehouseId+">"+warehouses[j].warehouseName+"</option>");
			}else{
				warehouseselect.append("<option value="+warehouses[j].warehouseId+">"+warehouses[j].warehouseName+"</option>");
			}			
		}
	});
}