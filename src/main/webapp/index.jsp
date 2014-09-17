<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.njust.cxzx.model.Multipurpose"%> 
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>创新中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/index.css" type="text/css" />
	<script type="text/javascript" src="js/menu.js"></script>
	<script type="text/javascript" src="jslib/jquery-easyui-1.3.2/jquery-1.8.0.min.js" charset="UTF-8"></script>
	<script type="text/javascript">
		
	</script>
  </head>
  
  <body>
	<div id="wrapper">
		<div class="headertop"></div>
		<div class="mainbox">
			<div class="mainleft">
				<div id="menu">
		  			<jsp:include page="menu/menu.jsp"></jsp:include>
		  		</div>
		  		<div class="mainsp">
		  			<h3><span class="boxhead">通知公告</span></h3>
		  			<ul>
						<li><a href="#">公告一</a></li>
						<li><a href="#">公告二</a></li>
						<li><a href="#">公告三</a></li>
						<li><a href="#">公告四</a></li>
					</ul>
		  		</div>
			</div>
			<div class="mainmid">
				<div class="mainmidhead"></div>
				<div>${content}</div>
			</div>
		</div>
		<div class="mainbottom">
		
		</div>
	</div>
  </body>
</html>
