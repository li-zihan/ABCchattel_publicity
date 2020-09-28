<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>中国物流金融服务平台</title>
<meta name="keywords" content="中国物流金融服务平台,中国物流金融 物流金融服务平台"/>
<meta name="description" content="国家级行业协会联合支持的首家国家全国性物流金融业务全过程管理与增值服务平台" />
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="common/common.jsp"></jsp:include>   
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<link rel="shortcut icon" href="images/security/favicon.png" type="image/x-icon" />
<link href="css/security/login.css" rel="stylesheet" type="text/css" />
<link href="script/validation/template.css" rel="stylesheet" type="text/css" />
<link href="script/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine-en.js'></script>
<script type="text/javascript" src='script/validation/jquery.validationEngine.js'></script>
<style>
.danwei{
margin-top: -100px;
color:#333;

}
</style>
<script type="text/javascript">

$(function(){
	$("#loginBtn").click(function(){
		$("#loginform").submit();
		});
	});

$(function() {
	document.onkeydown = function(e) {
		var ev = document.all ? window.event : e;
		if (ev.keyCode == 13) {
			$('#loginform').submit();
			// 处理事件
		}
	}
	
});

/* $(document).ready(function() {
	$('input')[0].focus();
}); */

$(document).ready(function(){
	$("#loginform").validationEngine();
});

function fn_refresh_img() {
	var imgcode = document.getElementById('imgcode');
	imgcode.src = basePath + 'security/imgcode.html?arg=' + Math.random();
}
function submit(){
	
	$("form").submit();;
}
function op(){
	
	window.open(basePath+"security/bada.html");
}
</script>
</script>
</head>
<center>
<body >
	<div id="content_div_big">
    	<div id="content_div_big_head">
        	<div id="content_div_big_head_top">
            	<div id="content_div_big_head_top_left">
                	<img src="images/security/logo.png" />
                </div>
                <div id="content_div_big_head_top_right">
<!--                 	<img src="images/security/tel.jpg" /> -->
                </div>
            </div>
            <div id="content_div_big_head_red">
            </div>
        </div>
        
        <div id="content_div_big_body">
    <a href="javascript:op()">
        <div class="bada"> 
       
            </div>
        	</a> 
    
        	<div id="content_div_big_body_login">
        	<div style="position: absolute;color: maroon;margin-left:40px; font-family:微软雅黑; font-size:15px">
        		<%if(request.getParameter("map")!=null){
        			if(request.getParameter("map").equals("checkCodeError")){
        				out.print("验证码输入错误！");
        			}else if(request.getParameter("map").equals("authError")){
        				out.print("请联系管理员配置权限！");
        			}else if(request.getParameter("map").equals("loginError")){
        				out.print("用户名或密码输入错误！");
        			}else if(request.getParameter("map").equals("loginLockError")){
        				out.print("用户被锁定！");
        			}
        		} %></div>
            	<form name="loginform" action="security/login.html" id="loginform" method="post">
                    <div class="content_div_big_body_login_css">
                        <div class="content_div_big_body_login_css_text mt3">用户名：<input name="username" type="text" class="content_div_big_body_login_css_text_input_text validate[required,maxSize[30]] text-input" id="username"/></div> 
                    </div>
                    <div class="content_div_big_body_login_css">
                        <div class="content_div_big_body_login_css_text mt4"> 密&nbsp;&nbsp;&nbsp;码：<input name="password" type="password" class="content_div_big_body_login_css_text_input_text validate[required] text-input" /></div>
                    </div>
                    <div class="content_div_big_body_login_css">
                        <div class="content_div_big_body_login_css_text mt6">验证码：<input type="text" name="checkCode" value="1111" style="width:60px;border:0px;" class="validate[required] text-input"/></div>
                        <div class="content_div_big_body_login_css_text" style="float:right; width:75px;margin-top:-3px">
                            <img src="security/imgcode.html" title="单击换一张"  class="validationcode" id="imgcode" onclick="fn_refresh_img();"/>
                        </div>
                    </div>
                    <div class="content_div_big_body_login_sub">
                    	<a href="javascript:submit()">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
                    </div>
            	</form>
            	<ul>
            </div>
        </div>
<!--     	<div id="content_div_big_body_two">
        	
        </div> -->
        <div class="cc">
        <a href="javascript:op()"><div class="liuxiang"></div></a> 
         <a href="javascript:op()"><div class="liuxiang1"></div></a> 
         <a href="javascript:op()"><div class="liuxiang2"></div></a>
         <a href="javascript:op()"><div class="liuxiang3"></div></a>  
         <a href="javascript:op()"><div class="liuxiang4"></div></a> 
         <a href="javascript:op()"><div class="liuxiang5"></div></a> 
        </div>
   	  <div id="content_div_big_body_three">
        	<div id="content_div_big_body_three_left">
            	<table width="605" border="0"  style="margin-top: 20px">

                  <tr height="120">
                    <td width="145px" style="font-weight:bold;font-size:16px;"> 联合支持:</td>
                    <td width="200px"><img style="float: left;" src="images/security/xiehui.png" /></td>
                    <td width="200px"><img style="float: left;" src="images/security/caigou.png" /></td>
                  </tr>

                  <tr height="120">
                    <td  style="font-weight:bold;font-size:16px; color:#333">战略合作：</td>
                    <td colspan="2"><img style="float: left;margin-left: 25px" src="images/security/cangchu.png" /></td>
                  </tr>
                  <tr height="120">
                    <td style="font-weight:bold;font-size:16px; color:#333">合作伙伴：</td>
                    <td><img style="float: left;margin-left: 18px;" src="images/security/cfca.png" /></td>
                    <td><img style="float: left;"src="images/security/aliyun.png" /></td>
                  </tr>
                </table>
   	    </div>
			<div id="content_div_big_body_three_right">
            	<table width="250" border="0"  >
            	  <caption style="margin-bottom: 20px">
            	  	<img alt="数据统计" src="images/security/datastat.png">
            	  </caption>
                  <tr height="32" >
                    <td   align="left" style="font-size:16px; font-family:'微软雅黑'; font-weight:bold; color:#333;";>合作银行总数</td>
                    <td align="right" style="color:#333">262家</td>
                  </tr>
                  	<tr>
	                    <td align="left" style="color:#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大型商业银行</td>
	                    <td align="right" style="color:#333">5家</td>
	                </tr>
	                	<tr>
	                    <td align="left" style="color:#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政储蓄银行</td>
	                    <td align="right" style="color:#333">1家</td>
	                </tr>
	                 	<tr>
	                    <td align="left" style="color:#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;股份制银行</td>
	                    <td align="right" style="color:#333">12家</td>
	                </tr>
	                  	<tr>
	                    <td align="left" style="color:#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;城市商业银行</td>
	                    <td align="right" style="color:#333">66家</td>
	                </tr>
	                   	<tr>
	                    <td align="left" style="color:#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;农村商业银行/农村信用社</td>
	                    <td align="right" style="color:#333">30家</td>
	                </tr>
	                    	<tr>
	                    <td align="left" style="color:#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;外资银行</td>
	                    <td align="right" style="color:#333">16家</td>
	                </tr>
	                     	<tr>
	                    <td align="left" style="color:#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;村镇银行</td>
	                    <td align="right" style="color:#333">132家</td>
	                </tr>
                  <tr height="32">
                    <td colspan="2" align="left"  style="font-size:16px; font-family:'微软雅黑'; font-weight:bold;color:#333" >公示信息</td>
                  </tr>
                  <tr>
                    <td align="left"  style="color:#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已登记</td>
                    <td align="right" style="color:#333"><c:out value="${statisticsResult.registCount }"/>笔</td>
                  </tr>
                  <tr>
                    <td align="left"  style="color:#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已解除</td>
                    <td align="right" style="color:#333"><c:out value="${statisticsResult.relieveCount }"/>笔</td>
                  </tr>
                  <tr>
                    <td align="left"  style="color:#333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正在进行</td>
                    <td align="right" style="color:#333"><c:out value="${statisticsResult.onGoingCount }"/>笔</td>
                  </tr>

            	</table>

          </div>
   	  </div>
       <div id="content_div_big_body_four">
       		<iframe frameborder="0" width="1000" id="footer" name="footer" src="security/foot_load.html" scrolling="no"></iframe>
       </div>
    </div>
</body>
</center>
</html>