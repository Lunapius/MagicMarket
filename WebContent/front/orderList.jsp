<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page import="java.sql.ResultSet" %>  <%--导入java.sql.ResultSet类 --%>
<%--创建com.tools.ConnDB类的对象 --%>
<%@ page import="java.util.Vector" %>
<%@ page import="com.model.Goodselement" %> <!-- 导入购物车模型类 -->
<%@ page import="java.text.DecimalFormat" %><!-- 导入格式化数字类 -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	String username=request.getParameter("username");
	/* 顾客查询订单信息 */
	ResultSet rs_odList = conn.executeQuery(
		"select tb_goods.picture,tb_goods.goodsName,tb_order.OrderID,"
		+"goodsID,number,tb_order.receiveName,tb_order.address,tb_goods.price "
		+"from tb_order,tb_order_detail,tb_goods where username='"+username+"' " 
		+"and tb_order.orderID=tb_order_detail.orderID "
		+"and tb_goods.ID=tb_order_detail.goodsID");
	String odList_picture = "";
	String odList_goodsName = "";
	int odList_orderID = 0;
	String odList_receiveName ="";
	int odList_goodsID = 0;
	int odList_number = 0;
	String odList_address = "";
	float odList_price=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- 页面主体内容 -->
			<div id="mr-content" class="mr-content col-xs-12">
				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<h1>我的订单</h1>
								<!-- 显示订单中的商品 -->
								<div class="table-responsive cart-info">
									<table class="table table-bordered">
										<thead>
											<tr>
												<td class="text-center image">商品图片</td>
												<td class="text-left name">商品名称</td>
												<td class="text-left quantity">订单号</td>
												<td class="text-left quantity">购买数量</td>
												<td class="text-right price">总价</td>
												<td class="text-right total">收件人</td>
												<td class="text-right total">收件地址</td>
											</tr>
										</thead>
										<tbody>
										<!-- 遍历订单中的商品并显示 -->
											<% while(rs_odList.next()){ 
												odList_picture=rs_odList.getString(1);
												odList_goodsName=rs_odList.getString(2);
												odList_orderID=rs_odList.getInt(3);
												odList_goodsID=rs_odList.getInt(4);
												odList_number=rs_odList.getInt(5);
												odList_receiveName=rs_odList.getString(6);
												odList_address=rs_odList.getString(7);
												odList_price=rs_odList.getFloat(8);
											%>
											<!-- 显示一条订单信息 -->
											<tr>
												<td class="text-center image" width="20%">
												<a href="goodsDetail.jsp?ID=<%=odList_goodsID%>">
													<img width="80px" src="images/goods/<%=odList_picture%>"> </a>
												</td>
												<td class="text-left name"><a
													href="goodsDetail.jsp?ID=<%=odList_goodsID%>"><%=odList_goodsName%></a>
												</td>
												<td class="text-left quantity"> <%=odList_orderID %></td>
												<td class="text-left quantity"> <%=odList_number %></td>
												<td class="text-right price"><%=odList_price * odList_number%></td>
												<td class="text-right total"><%=odList_receiveName %></td>
												<td class="text-right total"> <%=odList_address %></td>
											</tr>
											<!-- 显示一条订单信息 -->
											<%
												}												
											%>
										<!-- //遍历订单中的商品并显示 -->
										</tbody>
									</table>
								</div>
								<!-- //显示订单中的商品 -->
								
							</div>
						</div>

						
						
					</div>
				</div>
			</div>
			<!-- //页面主体内容 -->
		</div>
	</div>
	<!-- 版权栏 -->
	<%@ include file="common-footer.jsp"%>
	<!-- //版权栏 -->
	
<%-- 	ID号<%=odList_orderID%>  --%>
<%-- 	商品号<%=odList_goodsID%>  --%>
<%-- 	购买数量 <%=odList_number %> --%>
<%-- 	收件人 <%=odList_receiveName %>  --%>
<!-- 	<br/> -->
	


</body>
</html>