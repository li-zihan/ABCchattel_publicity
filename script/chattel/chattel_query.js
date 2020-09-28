$(function(){
	
	$("#content_head_top_btn").click(function(){
		
		if(check() >= 3){
			if($.trim($("#cvarId").val()).length > 0 && $.trim($("#cvarId").val()) != null){
				//if(SelectSignCert())
					document.queryform.submit();
			}else{
				alert("担保品为必填");
			}
        }else{
        	check();
        	alert("查询条件需设置三项以上（含三项）");
        }
		
	});
    
    
    function check(){
    	
    	var num = 0;
    	
    	$(".formchild").each(function(){
    		
    		if($.trim($(this).val()) != null && $.trim($(this).val()).length > 0){
    			num += 1;
    		}
    		
    		
    	});
    	return num;

    	
    }

	

});