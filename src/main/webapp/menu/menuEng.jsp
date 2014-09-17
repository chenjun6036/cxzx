<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menuleftEng.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/menuEng.css" type="text/css" />
	<script type="text/javascript" src="js/menu.js"></script>

  </head>
  
  <body>
    <div id="menu">
	  <dl class="dropdown">
	    <dt id="001-ddheader" class="upperdd"><a href="index.asp">Invitation</a></dt>
	  </dl>
	  <dl class="dropdown">
	    <dt id="one-ddheader" class="upperdd" onmouseover="ddMenu('one',1)" onmouseout="ddMenu('one',-1)">Information</dt>
	    <dd id="one-ddcontent" onmouseover="cancelHide('one')" onmouseout="ddMenu('one',-1)">
	      <ul>
	        <li><a href="show.asp?id=2014" class="underline">Conference Language</a></li>
	        <li><a href="show.asp?id=2015" class="underline">Committees</a></li>
	        <li><a href="show.asp?id=2016" class="underline">Important Dates</a></li>
	        <li><a href="show.asp?id=2017" class="underline">Sponsoring & Exhibition</a></li>
	        <li><a href="show.asp?id=2018">NanoSPD conferences</a></li>
	        <li><a href="show.asp?id=2018">NanoSPD conferences</a></li>
	      </ul>
	    </dd>
	  </dl>
	  <dl class="dropdown">
	    <dt id="two-ddheader" class="upperdd" onmouseover="ddMenu('two',1)" onmouseout="ddMenu('two',-1)">Programme</dt>
	    <dd id="two-ddcontent" onmouseover="cancelHide('two')" onmouseout="ddMenu('two',-1)">
	      <ul>
	        <li><a href="show.asp?id=2019" class="underline">Programme</a></li>
	        <li><a href="show.asp?id=2020" class="underline">Invited Speakers</a></li>
	        <li><a href="show.asp?id=2021">Social Programme</a></li>
	      </ul>
	    </dd>
	  </dl>
	  <dl class="dropdown">
	    <dt id="three-ddheader" class="upperdd" onmouseover="ddMenu('three',1)" onmouseout="ddMenu('three',-1)">Venue</dt>
	    <dd id="three-ddcontent" onmouseover="cancelHide('three')" onmouseout="ddMenu('three',-1)">
	      <ul>
	        <li><a href="show.asp?id=2022" class="underline">Venue</a></li>
	        <li><a href="show.asp?id=2023" class="underline">About Nanjing</a></li>
	        <li><a href="show.asp?id=2024">Access to Nanjing</a></li>
	      </ul>
	    </dd>
	  </dl>
	  <dl class="dropdown">
	    <dt id="five-ddheader" class="upperdd" onmouseover="ddMenu('five',1)" onmouseout="ddMenu('five',-1)">Abstracts & Publication</dt>
	    <dd id="five-ddcontent" onmouseover="cancelHide('five')" onmouseout="ddMenu('five',-1)">
	      <ul>
	        <li><a href="regabstract.asp" class="underline1">Abstract Submission</a></li>
	        <li><a href="regmanuscript.asp" class="underline1">Manuscript Submission</a></li>
	        <li><a href="show.asp?id=2026">Proceedings</a></li>
	      </ul>
	    </dd>
	  </dl>
	  <dl class="dropdown">
	    <dt id="four-ddheader" class="upperdd" onmouseover="ddMenu('four',1)" onmouseout="ddMenu('four',-1)">Registration</dt>
	    <dd id="four-ddcontent" onmouseover="cancelHide('four')" onmouseout="ddMenu('four',-1)">
	      <ul>
	        <li><a href="registration.asp">On-line Registration</a></li>
	        <li><a href="show.asp?id=2025" class="underline">Registration Information</a></li>
	      </ul>
	    </dd>
	  </dl>
	  <dl class="dropdown">
	    <dt id="002-ddheader" class="upperdd"><a href="show.asp?id=2027">Download</a></dt>
	  </dl>
	  <dl class="dropdown">
	    <dt id="002-ddheader" class="upperdd"><a href="photo.asp" class="underline1">NanoSPD5 Photos</a></dt>
	  </dl>
	  <dl class="dropdown">
	    <dt id="six-ddheader" onmouseover="ddMenu('six',1)" onmouseout="ddMenu('six',-1)">Contact</dt>
	    <dd id="six-ddcontent" onmouseover="cancelHide('six')" onmouseout="ddMenu('six',-1)">
	      <ul>
	        <li><a href="show.asp?id=2028" class="underline">Contact</a></li>
	        <li><a href="#">Disclaimer</a></li>
	      </ul>
	    </dd>
	  </dl>
    </div>
  </body>
</html>
