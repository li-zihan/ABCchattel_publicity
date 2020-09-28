<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 	
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
</head>
<body>
<a href="<%=basePath%>account/user_info.html">账户信息</a>
<a href="<%=basePath%>account/update_password.html">修改密码</a>
<a href="<%=basePath%>account/user_manager.html">用户管理</a>
<a href="<%=basePath%>account/role_manager.html">角色管理</a>
<table width="300" border="1">
		<tr>
			<td colspan="2">
			 账户信息
			</td>
		</tr>
		<tr>
			<td>
			  所属机构
			</td>
			<td>
			  <c:out value="${managerInfo.orgName}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
			  机构类别
			</td>
			<td>
				<c:out value="${managerInfo.otypeName}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
			  所在地区
			</td>
			<td>
				<c:out value="${managerInfo.proName}"></c:out>&nbsp;<c:out value="${managerInfo.cityName}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
			 用户名
			</td>
			<td>
				<c:out value="${managerInfo.managerName}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
			  办公电话
			</td>
			<td>
				<c:out value="${managerInfo.managerTelphone}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
			  联系手机
			</td>
			<td>
				<c:out value="${managerInfo.managerMobilephone}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
			EMAIL
			</td>
			<td>
				<c:out value="${managerInfo.managerEmail}"></c:out>
			</td>
		</tr>
</table>
</body>
</html>