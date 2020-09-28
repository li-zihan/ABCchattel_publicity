<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/common.jsp"></jsp:include> 
<link href="css/config/configManager/configManager.css" rel="stylesheet" type="text/css" />
<link href="css/config/configManager/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="script/config/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="script/config/js/config.js"></script> 

<script type="text/javascript">
$(document).ready(function(){ 
    $("#config_main").load(function(){ 
    $(this).height(0); //用于每次刷新时控制IFRAME高度初始化 
    
    var height = $(this).contents().height() + 2; 
    $(this).height( height < 500 ? 428 : height ); 
    
	var mainIFrame = $('#main', window.parent.document);
	$('#main', window.parent.parent.document).height(0); //用于每次刷新时控制IFRAME高度初始化 
	var height = mainIFrame.contents().height()+10;
	mainIFrame.height( height < 500 ? 458 : height ); 
  });
}); 
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
</head>
<body >

<div class="container">
	<div class="main">
		<div class="left">
          <ul>
          	<c:forEach items="${menuList }" var="childRow" varStatus="st">
         
				<a href='<c:out value="${childRow.menuUrl}"/>' target="config_main">
				<li>
					<div class="left_table_tr_td_div_left"><img src="images/common/<c:out value="${ st.index+1}"/>.png" /></div>
					<div class="left_table_tr_td_div_left_hidden"><img src="images/common/<c:out value="${ st.index+1}"/>_change.png" /></div>
					<div class="left_table_tr_td_div_right"><c:out value="${childRow.menuName}" /></div>
				</li>
				</a>
				
			</c:forEach>
          </ul>
        </div>
        <div id="div1" class="frameright">		
        	<c:forEach items="${menuList }" var="childRow" varStatus="st">	
        		<c:if test="${st.index==0}">
		 			<iframe frameborder="0" height="100%" width="840" id="config_main" name="config_main" src="<c:out value="${childRow.menuUrl}"/>" scrolling="no"></iframe>
		 		</c:if>
		 	</c:forEach>
		</div>
	</div>
</div>
</body>
</html>