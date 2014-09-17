<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/menu.css" type="text/css" />
	<script type="text/javascript" src="js/menu.js"></script>

  </head>
  
  <body>
    <div id="chmenu">
	  <dl class="dropdown">
	    <dt id="001-ddheader" class="upperdd" onmouseover="ddMenu('001',1)" onmouseout="ddMenu('001',-1)"><a href="multiPurposeAction!getUnique.action?type=11">中心概况</a></dt>
	    <dd id="001-ddcontent" onmouseover="cancelHide('001')" onmouseout="ddMenu('001',-1)">
	      <ul>
	        <li><a href="multiPurposeAction!getUnique.action?type=12" class="underline">理事会</a></li>
	        <li><a href="multiPurposeAction!getUnique.action?type=13" class="underline">学术委员会</a></li>
	        <li><a href="multiPurposeAction!getUnique.action?type=14" class="underline">中心行政管理机构</a></li>
	        <li><a href="multiPurposeAction!getUnique.action?type=15" class="underline">研究部</a></li>
	        <li><a href="multiPurposeAction!getUnique.action?type=16" >微纳米材料分析测试中心</a></li>
	      </ul>
	    </dd>
	  </dl>
	  <dl class="dropdown">
	    <dt id="one-ddheader" class="upperdd" onmouseover="ddMenu('one',1)" onmouseout="ddMenu('one',-1)">研究团队</dt>
	    <dd id="one-ddcontent" onmouseover="cancelHide('one')" onmouseout="ddMenu('one',-1)">
	      <ul>
	        <li><a href="multiPurposeAction!getMultiList.action?type=21&page=1&rows=8" class="underline">微纳米金属结构材料研究部</a></li>
	        <li><a href="multiPurposeAction!getMultiList.action?type=22&page=1&rows=8" class="underline">纳米功能材料研究部</a></li>
	        <li><a href="multiPurposeAction!getMultiList.action?type=23&page=1&rows=8" class="underline">微纳米材料加工装备研究部</a></li>
	        <li><a href="multiPurposeAction!getMultiList.action?type=3&page=1&rows=8">人才招聘</a></li>
	      </ul>
	    </dd>
	  </dl>
	  <dl class="dropdown">
	    <dt id="two-ddheader" class="upperdd" onmouseover="ddMenu('two',1)" onmouseout="ddMenu('two',-1)">项目成果</dt>
	    <dd id="two-ddcontent" onmouseover="cancelHide('two')" onmouseout="ddMenu('two',-1)">
	      <ul>
	        <li><a href="multiPurposeAction!getMultiList.action?type=24&page=1&rows=8" class="underline">研发项目</a></li>
	        <li><a href="multiPurposeAction!getMultiList.action?type=25&page=1&rows=8">技术成果</a></li>
	      </ul>
	    </dd>
	  </dl>	  
	  
	  <dl class="dropdown">
	    <dt id="002-ddheader" class="upperdd" onmouseover="ddMenu('002',1)" onmouseout="ddMenu('002',-1)">人才培养</dt>
	    <dd id="002-ddcontent" onmouseover="cancelHide('002')" onmouseout="ddMenu('002',-1)">
	      <ul>
	        <li><a href="multiPurposeAction!getMultiList.action?type=6&page=1&rows=8" class="underline">青年教师培养</a></li>
	        <li><a href="multiPurposeAction!getMultiList.action?type=7&page=1&rows=8">学生培养</a></li>
	      </ul>
	    </dd>
	  </dl>
	  <dl class="dropdown">
	    <dt id="002-ddheader" class="upperdd"><a href="multiPurposeAction!getMultiList.action?type=4&page=1&rows=8" >交流合作</a></dt>
	  </dl>
	  <dl class="dropdown">
	    <dt id="three-ddheader"><a href="multiPurposeAction!getMultiList.action?type=1&page=1&rows=8" >新闻动态</a></dt>
	  </dl><!-- 
	  <dl class="dropdown">
	    <dt id="three-ddheader"><a href="multiPurposeAction!getMultiList.action?type=2&page=1&rows=8" >公示通知</a></dt>
	  </dl> -->
    </div>
  </body>
</html>
