<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 	
<jsp:include page="../common/common.jsp"></jsp:include>
<link type="text/css" href="css/account/userinfo.css" rel="stylesheet" />
<script type="text/javascript">
	function fn_loadupdatepassword(){
		location.href= basePath+"security/passwordupdateload.html";
	}
</script>
</head>
<body>
<input type="hidden" value="${managerInfo.proId}">
<input type="hidden" value="${managerInfo.cityId}">
<div class="center">
  <div style="height:15px;"></div>
 <div class="center_1_ale">
   <div class="center_2_ale" style="display:inline;float:left;margin-left:250px">账 户 信 息</div>
   <li class="new" style="list-style-type:none;margin-left:118px;"><input type="button" value="修改密码"  style=" border:none;font-family:'微软雅黑';" onclick="fn_loadupdatepassword()"></li>
   <div class="center_3_ale">
           <table>
            <tr><td>所属机构</td><td style="width:62%; border:1px solid #cccccc;"><c:out value="${managerInfo.orgName}"></c:out></td></tr>
            <tr><td>机构类别</td><td style="width:62%; border:1px solid #cccccc;"><c:out value="${managerInfo.otypeName}"></c:out></td></tr>
            <tr><td>所在地区</td><td style="width:62%; border:1px solid #cccccc;"><c:out value="${managerInfo.proName}"></c:out>&nbsp;<c:out value="${managerInfo.cityName}"></c:out></td></tr>
            <tr><td>用户名</td><td style="width:62%; border:1px solid #cccccc;"><c:out value="${managerInfo.managerName}"></c:out></td></tr>
            <tr><td>办公电话</td><td style="width:62%; border:1px solid #cccccc;"><c:out value="${managerInfo.managerMobilephone}"></c:out></td></tr>
            <tr><td>联系手机</td><td style="width:62%; border:1px solid #cccccc;"><c:out value="${managerInfo.managerMobilephone}"></c:out></td></tr>
            <tr><td>EMAIL</td><td style="width:62%; border:1px solid #cccccc;"><c:out value="${managerInfo.managerEmail}"></c:out></td></tr>
           </table>
           
   </div>
 </div>
</div>

</body>
</html>