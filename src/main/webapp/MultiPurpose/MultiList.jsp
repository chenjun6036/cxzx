<%@page import="cn.njust.cxzx.utils.ResourceUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="headpic"></div></div>
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
				<div class="package">
					<h2 class="tit">
						<em class="fl">
							<img src="images/ico17.png" class="png">
						</em>
						<s:if test="#request.type==1">
						<span class="fl">新闻动态</span>
						</s:if>
						<s:elseif test="#request.type==2">
						<span class="fl">公示通知</span>
						</s:elseif>
						<s:elseif test="#request.type==3">
						<span class="fl">人才招聘</span>
						</s:elseif>
						<s:elseif test="#request.type==4">
						<span class="fl">交流合作</span>
						</s:elseif>
						<s:elseif test="#request.type==5">
						<span class="fl">项目成果</span>
						</s:elseif>
						<s:elseif test="#request.type==6">
						<span class="fl">青年教师培养</span>
						</s:elseif>
						<s:elseif test="#request.type==7">
						<span class="fl">学生培养</span>
						</s:elseif>
						<s:elseif test="#request.type==21">
							<span class="fl">微纳米金属结构材料研究部</span>
						</s:elseif>
						<s:elseif test="#request.type==22">
							<span class="fl">纳米功能材料研究部</span>
						</s:elseif>
						<s:elseif test="#request.type==23">
							<span class="fl">微纳米材料加工装备研究部</span>
						</s:elseif>
						<s:elseif test="#request.type==24">
							<span class="fl">研发项目</span>
						</s:elseif>
						<s:elseif test="#request.type==25">
							<span class="fl">技术成果</span>
						</s:elseif>
						<span class="all_bg"></span>						
					</h2>
					<ul class="list_05">
					<s:iterator value="#list" var="mul">
						<li>
							<span class="fr">[<s:property value="#mul.time"/>]</span>
							<a href="multiPurposeAction!getMultiDetail.action?id=<s:property value="#mul.id"/>" title="<s:property value="#mul.title"/>">
								<s:property value="#mul.title"/>
							</a>
						</li>
					</s:iterator>
					</ul>
					<div class="page">
						<div style="border-top:1px solid #d4d4d4;width:100%; margin-top:20px;"></div>
						 <span class="fr">
						 	<span class="title">总共</span>
						 	<span class="title_text">${total} </span>
						 	<span class="title">页&nbsp;</span>
						 	<span class="title">当前第</span>
						 	<span class="title_text">${page}</span>
						 	<span class="title">/</span>
						 	<span class="title_text">${total}</span>
						 	<span class="title">页&nbsp;&nbsp;</span> 
						 	<table border="0" cellspacing="0" cellpadding="0">
						 		<tbody>
						 			<tr>
						 				<td>
						 					<table width="55" border="0" cellpadding="0" cellspacing="0">
						 						<tbody>
						 							<tr> 
						 								<td width="11">
						 									<img src="images/ico43.gif" width="11" height="12/">
						 								</td>
						 								<td width="24">
						 									<a href="multiPurposeAction!getMultiList.action?type=${type}&rows=10&page=1" class="page">首页</a>
						 								</td>
						 							</tr>
						 						</tbody>
						 					</table>
						 				</td>
						 				<td>
							 				<table width="67" border="0" cellpadding="0" cellspacing="0">
							 					<tbody>
							 						<tr> 
							 							<td width="11">
							 								<img src="images/ico44.gif" width="11" height="12/">
							 							</td>
							 							<td width="36">
							 								<a href="multiPurposeAction!getMultiList.action?type=${type}&rows=10&page=${prior}" class="page">上一页</a>
							 							</td>
							 						</tr>
							 					</tbody>
							 				</table>
						 				</td>
						 				<td>
						 					<table width="67" border="0" cellpadding="0" cellspacing="0">
						 						<tbody>
						 							<tr> 
						 								<td width="11">
						 									<img src="images/ico45.gif" width="11" height="12/">
						 								</td>
						 								<td width="36">
						 									<a href="multiPurposeAction!getMultiList.action?type=${type}&rows=10&page=${next}" class="page" target="_self">下一页</a>
						 								</td>
						 							</tr>
						 						</tbody>
						 					</table>
						 				</td>
						 				<td>
						 					<table width="55" border="0" cellpadding="0" cellspacing="0">
						 						<tbody>
						 							<tr> 
						 								<td width="11">
						 									<img src="images/ico46.gif" width="11" height="12/">
						 								</td>
						 								<td width="24">
						 									<a href="multiPurposeAction!getMultiList.action?type=${type}&rows=10&page=${total}" class="page" target="_self">尾页</a>
						 								</td>
						 							</tr>
						 						</tbody>
						 					</table>
						 				</td>
						 				<td>
						 					<select name="select" style="margin-bottom:-3px;" onchange="location.replace(this.value)">
						 						<option selected=" ">跳至</option>
						 						<c:forEach var="i" begin="1" end="${total}" step="1">
												  <option value="multiPurposeAction!getMultiList.action?type=${type}&rows=10&page=${i}">${i}</option>
												</c:forEach>
						 						
						 					</select>
						 				</td>
						 			</tr>
						 		</tbody>
						 	</table>
						 </span><br>
					</div>
				</div>
			</div>
			<div class="rightbox"><jsp:include page="../menu/right.jsp"></jsp:include></div>
		</div><%-- 
		<div class="mainfoot">
			<div id="mfoot">
				<jsp:include page="../menu/foot.jsp"></jsp:include>
			</div>
		</div> --%>
		<div class="mainbottom">
			
		</div>
	</div>
  </body>
</html>
