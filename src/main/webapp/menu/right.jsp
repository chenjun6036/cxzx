<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>right</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/foot.css" type="text/css" />
	<script type="text/javascript" src="jslib/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("div.rightcon ul li:eq(0)").css("border-top","1px dashed #aaa");
			
		});
	</script>
  </head>
  
  <body>
   <div id="right">
		<div class="rightcon">
			<ul>
				<li><a href="http://www.njust.edu.cn/"><img src="images/right1.png"></img></a></li>
				<li><a href="http://www.imr.cas.cn/"><img src="images/right2.png"></img></a></li>
				<li><a href="http://www.cqu.edu.cn/"><img src="images/right3.png"></img></a></li>
				<li><a href="http://www.hhu.edu.cn/"><img src="images/right4.png"></img></a></li>				
				<li><a href="http://yj0012.ourmetal.com/"><img src="images/right5.png"></img></a></li>
				<li><a href="http://www.chinafasten.com/"><img src="images/right6.png"></img></a></li>
				<li><a href="http://www.pangucement.com/"><img src="images/right7.png"></img></a></li>
				<li><a href="http://www.ju-hui.net/"><img src="images/right8.png"></img></a></li>			
			</ul>
		</div>
	</div>
  </body>
</html>
