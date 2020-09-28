<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="common.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
<center>
<table width="100px" border="1">
	<c:forEach items="${menuList }" var="childRow">
		<tr>
			<td><a href="<c:out value="${childRow.menuUrl}"/>" target="config_main"><c:out value="${childRow.menuName}" /></a></td>
		</tr>
	</c:forEach>
</table>
</center>
</body>
</html>