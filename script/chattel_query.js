$(function(){

    $("#pledge_find_like").submit(function(){
    	
        var flag=false;
        if(check() >= 3){
        	flag = true;
        }else{
        	check();
        	alert("查询条件需设置三项以上（含三项）");
        }
        return flag;
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
    
    
    $(".formchild[type='text']").focus(function(){
    	$(this).next().text("");
        $(this).next().text("请输入");
    }).blur(function(){
    	$(this).next().text("");
    	if($(this).val().length>30){
    		$(this).next().text("输入过长");
    	}
    });;
    
    
    
    
//    windows.location.href="/jsp/registSuccess.jsp"
//    window.location.href="a.asp?name="+username"
//    http://localhost:8080/chattel_publicity/chattel/pledge_find_like.do?
//    finanName=&finanZipCode=11&cvarId=&guaranteeContractNo=11&guaranteeInvoiceNo=&guaranteePledgor=11&supvName=&guaranteeWarehouseNo=&undertakerId=
});