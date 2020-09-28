<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>动产查询</title>
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
	<%@ page language="java" contentType="text/html; charset=utf-8"
	    pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
	<jsp:include page="../common/common.jsp"></jsp:include> 

<!--[if IE 6]>
    <link href="动产公示_files/axurerp_pagespecificstyles_ie6.css" type="text/css" rel="stylesheet">
<![endif]-->
	<link type="text/css" href="css/footable-0.1.css" rel="stylesheet" />
	<link type="text/css" href="css/chattel/chattel_publicity.css" rel="stylesheet" />
	<link href="css/base/jquery.ui.all.css" rel="stylesheet" type="text/css"/>
	<script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script src="script/footable-0.1.js" type="text/javascript"></script>
    <script src="script/chattel/chattel_publicity.js" type="text/javascript"></script>
    <script type="text/javascript" src='script/jquery-ui-1.10.4.custom.js'></script>
    
    <script>
    $(function(){
		$("tbody tr:even").css('background',"#f7f7f7").attr('bgcol',"#f7f7f7");
    });
    $(function(){
		$("tbody tr:odd").css('background',"#eae9e9").attr('bgcol',"#eae9e9");
    });
        $(function() {
            $('table').footable();
          });
      //cs为1代表采购合同号div cs为 2代表采购发票号     
        function showMsgBox(cs,id){
        	//$('#basequerytable').empty();//初始化表格
        	if(cs==1){
        		//$("#conbox1").html("采购合同号");
        		var val=$("#guaranteeContractNo"+id).val();
        		val=val.split(",");
        		var ats="";
        		for(var i=0;i<val.length;i++){
        			if(val[i]!=null&&val[i]!=""){
        				//AddRowV(1,val[i]);
        				ats+="<p style='margin-top:5px;margin-bottom:5px'>采购合同"+(i+1)+":   "+val[i]+"</p>";
        			}
        			
        		}
        		if(ats.length>15){
        			$( "#dialog" ).html(ats);
        			$( "#dialog" ).dialog({
        				position:[event.x+300,event.y+20],
        				modal:true,
        				title:"采购合同"	
        			});
        		}
        	}else if(cs==2){
        		//$("#conbox1").html("采购发票号");
        		var val=$("#guaranteeInvoiceNo"+id).val();
        		val=val.split(",");
        		var ats="";
        		for(var i=0;i<val.length;i++){
        			if(val[i]!=null&&val[i]!=""){
        				//AddRowV(2,val[i]);
        				ats+="<p style='margin-top:5px;margin-bottom:5px'>采购发票"+(i+1)+":    "+val[i]+"</p>";
        			}
        			
        		}
        		if(ats.length>15){
        			$( "#dialog" ).html(ats);
        			$( "#dialog" ).dialog({
        				position:[event.x+300,event.y+20],
        				modal:true,
        				title:"采购发票"	
        			});
        		}
        	}
        	/*var infoDiv = document.getElementById("conbox"); 
            with(infoDiv.style){
                zIndex = 100000; 
                position = "absolute"; 
                width = "300px";
                left =event.x+300; 
                top = event.y+20;
                display = "block";
            }*/
        }
        //cs为1代表采购合同号div cs为 2代表采购发票号     val为input的默认值
        function   AddRowV(cs,val){ 
        	if(cs==1){
        		$("#basequerytable").append("<tr height=40 align=\"center\"><td>"+val+"</td></tr>");
        	}else if(cs==2){
        		$("#basequerytable").append("<tr height=40 align=\"center\"><td>"+val+"</td></tr>");
        	}

        } 
        function cancelLogout(){
            var infoDiv = document.getElementById("conbox");
                infoDiv.style.display = "none";
        }
        //屏蔽backspace按键
        $(document).keydown(function (e) {  
        	  
            var doPrevent;  
              
            // for IE && Firefox   
            var varkey = (e.keyCode) || (e.which) || (e.charCode);  
              
            if (varkey == 8) {  

                var d = e.srcElement || e.target;   

                if (d.tagName.toUpperCase() == 'INPUT' || d.tagName.toUpperCase() == 'TEXTAREA') {  

                    doPrevent = d.readOnly || d.disabled;  

                    // for button,radio and checkbox   
                    if (d.type.toUpperCase() == 'SUBMIT'  
                        || d.type.toUpperCase() == 'RADIO'  
                        || d.type.toUpperCase() == 'CHECKBOX'  
                        || d.type.toUpperCase() == 'BUTTON') {  

                        doPrevent = true;  
                    }  
                }  
                else {  

                    doPrevent = true;  
                }  
            }  
            else {  

                doPrevent = false;  
            }  

        if (doPrevent)  

            e.preventDefault();  
        });  

    </script>
<style type="text/css">
.mydiv{
width:928px;
padding:13px;
margin-left: 10px;
margin-top: 15px;
background-color: #ffffff;
-moz-box-shadow: 0px 2px 10px #909090;/*firefox*/
-webkit-box-shadow: 0px 2px 10px #909090;/*safari或chrome*/
box-shadow:0px 2px 10px #909090;/*opera或ie9*/
/*direction 阴影角度 0°为从下往上 顺时针方向 strength 阴影段长度*/
 -ms-filter:"progid:DXImageTransform.Microsoft.Shadow(color=#E9E9E9, direction=0, strength=6)\
 progid:DXImageTransform.Microsoft.Shadow(color=#E9E9E9, direction=90, strength=6)\
 progid:DXImageTransform.Microsoft.Shadow(color=#E9E9E9, direction=180, strength=6)\
 progid:DXImageTransform.Microsoft.Shadow(color=#E9E9E9, direction=270, strength=6)";
 filter:
 progid:DXImageTransform.Microsoft.Shadow(color=#909090, direction=90, strength=6)
 progid:DXImageTransform.Microsoft.Shadow(color=#909090, direction=180, strength=6)
 progid:DXImageTransform.Microsoft.Shadow(color=#909090, direction=270, strength=6);
 }
.footable .table_tr_td_div { padding-left:8px;}
</style>
    
</head>

<body background="images/chattel/main_bg.jpg" onmousemove="HideMenu()" oncontextmenu="return false"  onselectstart ="return false" onselect="document.selection.empty()" oncopy="document.selection.empty()" onbeforecopy="return false" onmouseup="document.selection.empty()">
<div id="dialog" style="display: none">
	
</div>
<form action="<%=basePath %>chattel/pledge_find.html" method="post" id="pledge_find_like" name="queryform">

	<div class ="mydiv">  

				<table class="footable"  border="1px" cellspacing="0px" style="border-collapse:collapse;">
				<thead>
					<tr >
						<th width="30">序号</th>
						<th width="135">登记时间</th>
						<th width="170">借款企业</th>			
						<th width="110">组织机构代码</th>			
						<th width="50">担保品</th>
						<th width="50">数量</th>
						<th width="100">采购合同号</th>
						<th width="100">采购发票号</th>
						<th width="80">质权人</th>
	
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}" varStatus="st">
					<tr onmouseover="light(this)" onmouseout="low(this)">
						<td style="text-align: center;width: 40px;">
							<span title="${(page.thisPage-1) * page.pageSize + (st.index + 1) }">
								<c:out value="${(page.thisPage-1) * page.pageSize + (st.index + 1) }"></c:out>
							</span>
						</td>
						<td width="135" align="center">
							<div class="table_tr_td_div" style="width:150px">
								<div class="table_tr_td_div_div">
									<span title="${row.insert_time }">
										<c:out value="${row.insert_time }"></c:out>
									</span>
								</div>
							</div>
						</td>	
						<td width="170" align="center">
							<div class="table_tr_td_div" style="width:185px">
							<div class="table_tr_td_div_div">
    								<span title="${row.finan_name }">
    									<c:if test="${fn:length(row.finan_name) >= 14 }">
    										<c:out value="${fn:substring(row.finan_name, 0, 10)}......"></c:out>
    									</c:if>
    									<c:if test="${fn:length(row.finan_name) < 14 }">
    										<c:out value="${row.finan_name }"></c:out>
    									</c:if>
    								</span>
    							</div>
							</div>
						</td>
						<td width="110" align="center">
							<div class="table_tr_td_div" style="width:94px">
								<div class="table_tr_td_div_div">
									<span title="${row.finan_org_code}">
										<c:if test="${fn:length(row.finan_org_code) >= 11 }">
											<c:out value="${fn:substring(row.finan_org_code, 0, 8)}......"></c:out>
										</c:if>
										<c:if test="${fn:length(row.finan_org_code) < 11 }">
   											<c:out value="${row.finan_org_code }"></c:out>
   										</c:if>
									</span>
								</div>
							</div>
						</td>
						<td width="50" align="center">
							<div class="table_tr_td_div" style="width:54px">
								<div class="table_tr_td_div_div" >
									<span title="${row.cvar_name}">
										<c:if test="${fn:length(row.cvar_name) >= 4 }">
											<c:out value="${fn:substring(row.cvar_name, 0, 2)}..."></c:out>
										</c:if>
										<c:if test="${fn:length(row.cvar_name) < 4 }">
   											<c:out value="${row.cvar_name }"></c:out>
   										</c:if>
									</span>
								</div>
							</div>
						</td>
						<td width="50" align="center">
							<div class="table_tr_td_div" style="width:45px">
								<div class="table_tr_td_div_div">
									<span title="${row.guarantee_count}">
										<c:if test="${fn:length(row.guarantee_count) >= 4 }">
											<c:out value="${fn:substring(row.guarantee_count, 0, 3)}..."></c:out>
										</c:if>
										<c:if test="${fn:length(row.guarantee_count) < 4 }">
    										<c:out value="${row.guarantee_count }"></c:out>
    									</c:if>
									</span>
								</div>
							</div>
						</td>
						<td width="100" align="center">
							<div class="table_tr_td_div" style="width:100px">
								<div class="table_tr_td_div_div" >
									<c:if test="${fn:length(row.guarantee_contract_no) >= 11 }">
										<span style="cursor: pointer;color:blue;" title="${row.guarantee_contract_no}" onClick="showMsgBox(1,'<c:out value="${row.guarantee_contract_no}"></c:out>')">
											<c:out value="${fn:substring(row.guarantee_contract_no, 0, 8)}......"></c:out>
										</span>
										<input type="hidden" id="guaranteeContractNo<c:out value="${row.guarantee_contract_no}"></c:out>" value="<c:out value="${row.guarantee_contract_nos}"></c:out>">
									</c:if>
									<c:if test="${fn:length(row.guarantee_contract_no) < 11 }">
   										<span style="cursor: pointer;color:blue;" title="${row.guarantee_contract_no}" onClick="showMsgBox(1,'<c:out value="${row.guarantee_contract_no}"></c:out>')">
											<c:out value="${row.guarantee_contract_no }"></c:out>
										</span>
										<input type="hidden" id="guaranteeContractNo<c:out value="${row.guarantee_contract_no}"></c:out>" value="<c:out value="${row.guarantee_contract_nos}"></c:out>">
    								</c:if>
								</div>
							</div>
						</td>
						<td width="100" align="center">
						<div class="table_tr_td_div" style="width:100px;">
							<div class="table_tr_td_div_div" >
								<c:if test="${fn:length(row.guarantee_Invoice_no) >= 11 }">
									<span style="cursor: pointer;color: blue" title="${row.guarantee_Invoice_no}" onClick="showMsgBox(2,'<c:out value="${row.guarantee_Invoice_no}"></c:out>')"> 
										<c:out value="${fn:substring(row.guarantee_Invoice_no, 0, 8)}......"></c:out>
									</span>
									<input type="hidden" id="guaranteeInvoiceNo<c:out value="${row.guarantee_Invoice_no}"></c:out>" value="<c:out value="${row.guarantee_Invoice_nos}"></c:out>">
								</c:if>
								<c:if test="${fn:length(row.guarantee_Invoice_no) < 11 }">
    								<span style="cursor: pointer;color: blue" title="${row.guarantee_Invoice_no}" onClick="showMsgBox(2,'<c:out value="${row.guarantee_Invoice_no}"></c:out>')"> 
										<c:out value="${row.guarantee_Invoice_no }"></c:out>
									</span>
									<input type="hidden" id="guaranteeInvoiceNo<c:out value="${row.guarantee_Invoice_no}"></c:out>" value="<c:out value="${row.guarantee_Invoice_nos}"></c:out>">
    							</c:if>
							</div>
						</div>
						</td>
						<td width="80" align="center">
							<div class="table_tr_td_div table_tr_td_div_type_name">
								<div class="table_tr_td_div_div">
									<span title="${row.type_name}"><c:out value="${row.type_name}"></c:out></span>
						    	</div>
    						</div>
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<br />
				
				<jsp:include page="../common/page.jsp"></jsp:include>

	</div>
    </form>  
	
</body>

</html>