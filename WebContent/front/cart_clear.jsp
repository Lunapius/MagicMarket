<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Vector" %>
<%@ page import="com.model.Goodselement" %> <!-- 导入购物车模型类 -->
<%@ page import="java.text.DecimalFormat" %><!-- 导入格式化数字类 -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>我的购物车-51商城</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
<script src="js/jsArr01.js" type="text/javascript"></script>
<script src="js/module.js" type="text/javascript"></script>
<script src="js/jsArr02.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
</head>

<body>
	<jsp:include page="index-loginCon.jsp" />
	<!-- 网站头部 -->
	<%@ include file="common-header.jsp"%>
	<!-- //网站头部 -->
	<% 
			Vector cart = (Vector) session.getAttribute("cart");//获取购物车对象
			session.removeAttribute("cart");			//清空购物车
			out.println("<script language='javascript'>alert('购物车已清空！');window.location.href='cart_null.jsp';</script>");
	%>
</body>
</html>