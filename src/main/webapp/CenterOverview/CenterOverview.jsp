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
    <title>${title}-创新中心</title>
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
  </head>
  
  <body>
	<div id="wrapper">
		<div class="headertop">
		<div class="headpic"></div>
		</div>
		<div class="mainbox">
			<div class="mainleft">
				<div id="menu">
		  			<jsp:include page="../menu/menu.jsp"></jsp:include>
		  		</div>
		  		<div class="mainsp">		  			
		  			<s:action name="multiPurposeAction!getNoticeList" executeResult="true" namespace="/"> 
				    	<s:param name="type" value="2"></s:param> 
				    	<s:param name="page" value="1"></s:param> 
				    	<s:param name="rows" value="10"></s:param> 
				   	</s:action>
		  		</div>
			</div>
			<div class="mainmid">
				<div class="mainmidhead">
					${title}
				</div>
				<div class="content">${content}</div>
			</div>
			<div class="rightbox"><jsp:include page="../menu/right.jsp"></jsp:include></div>
		</div><%-- 
		<div class="mainfoot">
			<div id="mfoot">
				<jsp:include page="../menu/foot.jsp"></jsp:include>
			</div>
		</div> --%>
		<div class="mainbottom">
			<jsp:include page="../menu/foot.jsp"></jsp:include>
		</div>
	</div>
  </body>
</html>
