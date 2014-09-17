<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'notice.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="jslib/MSClass.js" type="text/javascript"></script>
	
	
  </head>
  
  <body>
    <h3 class="notice"><span class="boxhead">通知公告<a href="multiPurposeAction!getMultiList.action?type=2&page=1&rows=8" class="more">更多</a></span></h3>
    <div id="noticeroll" style="width:158px;height:200px;overflow:auto;">
		<ul id="roll">
			<s:iterator value="#list" var="notice">
			<li><a href="multiPurposeAction!getMultiDetail.action?id=<s:property value="#notice.id"/>" title="<s:property value="#notice.title"/>"><s:property value="#notice.title"/></a></li>
			</s:iterator>
		</ul>
	</div>
	<script language="javascript">
		new Marquee(["noticeroll","roll"],0,2,158,200,50,0,0);
	</script>
  </body>
</html>
