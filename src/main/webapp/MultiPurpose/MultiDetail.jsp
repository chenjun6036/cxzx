<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="cn.njust.cxzx.model.Multipurpose"%> 
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="cn.njust.cxzx.utils.ResourceUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <s:if test="#request.type==1">
		<title>新闻动态<%=ResourceUtil.getTitle()%></title>
	</s:if>
	<s:elseif test="#request.type==2">
		<title>公示通知<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
	<s:elseif test="#request.type==3">
		<title>人才招聘<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
	<s:elseif test="#request.type==4">
		<title>交流合作<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
	<s:elseif test="#request.type==5">
		<title>项目成果<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
	<s:elseif test="#request.type==6">
		<title>青年教师培养<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
	<s:elseif test="#request.type==7">
		<title>学生培养<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
	<s:elseif test="#request.type==21">
		<title>微纳米金属结构材料研究部<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
	<s:elseif test="#request.type==22">
		<title>纳米功能材料研究部<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
	<s:elseif test="#request.type==23">
		<title>微纳米材料加工装备研究部<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
	<s:elseif test="#request.type==24">
		<title>研发项目<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
	<s:elseif test="#request.type==25">
		<title>技术成果<%=ResourceUtil.getTitle()%></title>
	</s:elseif>
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
				<s:if test="#request.type==1">
					新闻动态
				</s:if>
				<s:elseif test="#request.type==2">
					公示通知
				</s:elseif>
				<s:elseif test="#request.type==3">
					人才招聘
				</s:elseif>
				<s:elseif test="#request.type==4">
					交流合作
				</s:elseif>
				<s:elseif test="#request.type==5">
					项目成果
				</s:elseif>
				<s:elseif test="#request.type==6">
					青年教师培养
				</s:elseif>
				<s:elseif test="#request.type==7">
					学生培养
				</s:elseif>
				<s:elseif test="#request.type==21">
					微纳米金属结构材料研究部
				</s:elseif>
				<s:elseif test="#request.type==22">
					纳米功能材料研究部
				</s:elseif>
				<s:elseif test="#request.type==23">
					微纳米材料加工装备研究部
				</s:elseif>
				<s:elseif test="#request.type==24">
					研发项目
				</s:elseif>
				<s:elseif test="#request.type==25">
					技术成果
				</s:elseif>
				</div>
				<div class="detail">
					<h2 class="tit2">${title}</h2>
					<h3 class="time">${time} </h3>
					<div style="width:100%">
						${content}
					</div>
				</div>
			</div>
			<div class="rightbox"><jsp:include page="../menu/right.jsp"></jsp:include></div>
		</div>
		<%-- 
		<div class="mainfoot">
			<div id="mfoot">
				<jsp:include page="../menu/foot.jsp"></jsp:include>
			</div>
		</div> --%>
		
		<div class="mainbottombox">
			<div class="mainbottom"></div>
		</div>
	</div>
  </body>
</html>
