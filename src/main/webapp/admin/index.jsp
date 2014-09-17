<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>创新中心网站后台</title>
<jsp:include page="inc.jsp"></jsp:include>
</head>

<body class="easyui-layout">
	<div data-options="region:'north', href:'${pageContext.request.contextPath}/admin/layout/north.jsp'" style="height: 60px;overflow:hidden;"></div>
	<div data-options="region:'west', title:'功能导航', href:'${pageContext.request.contextPath}/admin/layout/west.jsp'" style="width:300px;overflow:hidden;"></div>
	<%-- <div data-options="region:'east', split: true, title:'日历',href:'${pageContext.request.contextPath}/admin/layout/east.jsp'" style="width: 200px;overflow:hidden;"></div> --%>
	<div data-options="region:'center', title:'欢迎使用创新中心网站后台系统',href:'${pageContext.request.contextPath}/admin/layout/center.jsp'"></div>
	<div data-options="region:'south', href:'${pageContext.request.contextPath}/admin/layout/south.jsp'" style="height: 20px;overflow:hidden;"></div>
	
	
	<jsp:include page="user/login.jsp"></jsp:include>
	<jsp:include page="isIe.jsp"></jsp:include>
</body>
</html>
