<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'indexEnglish.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/indexEng.css" type="text/css" />
	<script type="text/javascript" src="js/menu.js"></script>
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
		  			<h3><span class="boxhead">Important Dates</span></h3>
		  			<ul>
						Deadline for abstracts submission by <br/>
						Notification of acceptance on <br/>
						Submission of manuscripts by <br/>
						Reduced registration fee until <br/>
						Deadline for registration by
					</ul>
		  		</div>
			</div>
			<div class="mainmid"></div>
		</div>
		<div class="mainbottom">
		
		</div>
	</div>
  </body>
</html>