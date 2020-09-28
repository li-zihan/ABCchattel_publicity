<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme() + "://" 
+ request.getServerName() + ":" + request.getServerPort() 
+ path + "/"; 
%> 
<script type="text/javascript">
	var basePath = '<%=basePath%>';
	var mainBodyHeight = 507;
</script>
<base href="<%=basePath%>"/>

