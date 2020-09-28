$(function(){
	$("#finanName").keyup(ac);
	$("#finanName").blur(function(){
    	var wp = $("#finanName").val();
    	$("#guaranteePledgor").val(wp);
    	$("#");
		var fname=$("#finanName").val();
		if(fname.length>1){
			$.post("chattel/niuB1.html",{username:fname},function(data){
					$("#finanLegalRep").val(data.finanLegalRep);
					$("#finanRegistNum").val(data.finanRegistNum);
					$("#finanOrgCode").val(data.finanOrgCode);
					$("#finanTaxRegNum").val(data.finanTaxRegNum);
					$("#supvName").val(data.supvName);
			},"JSON");
			
		}
	});
});
//键弹起时执行方法
function ac(){
	var typedname=$("#finanName").val();
	if(typedname.length>1&&typedname!="公司"&&typedname!="企业"&&typedname!="有限"){
	$.post("chattel/niuB.html",{username:typedname},function(data){
		$("#finanName").autocomplete(eval(data) ,{ 
			scroll: true
		},"JSON");
		
	});
	}
}
