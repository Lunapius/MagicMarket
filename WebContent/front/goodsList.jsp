<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" /><%--创建com.tools.ConnDB类的对象 --%>
<%
	/* 商品信息 */
	int Type=Integer.parseInt(request.getParameter("type"));
	ResultSet rs_new = conn.executeQuery(
		"select top 12 t1.ID, t1.GoodsName,t1.price,t1.picture,t2.TypeName "
		+"from tb_goods t1,tb_subType t2 where t1.typeID=t2.ID and "
		+"t2.superType="+ Type + "order by t1.INTime desc");		//查询商品信息
	int new_ID=0;	//保存商品的id变量
	String new_goodsname="";	//保存商品名称的变量
	float new_nowprice=0;	//保存商品的价格变量
	String new_picture="";	//保存商品的图片变量
	String typeName="";		//保存商品的分类变量		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
<script src="js/jsArr01.js" type="text/javascript"></script>
<script src="js/module.js" type="text/javascript"></script>
<script src="js/jsArr02.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="index-loginCon.jsp" />
	<%@ include file="common-header.jsp"%>
	<nav class="container mr-masstop  hidden-sm hidden-xs">
	<div class="custom">
		<div>
			<div class="ja-tabswrap default" style="width: 100%;">
				<div id="myTab" class="container">

					<h3 class="index_h3">
						<span class="index_title">分类</span>
					</h3>
					<!-- //最新上架选项卡 -->
					<div class="ja-tab-content ja-tab-content col-6 active"
						style="opacity: 1; width: 100%; visibility: visible;">
						<div class="ja-tab-subcontent">
							<div class="mijoshop">
								<div class="container_oc">
									<div class="row">
										<!-- 循环显示上架商品 ：添加12条商品信息-->
										<%
											while(rs_new.next()){
												new_ID=rs_new.getInt(1);	//上架商品的id
												new_goodsname=rs_new.getString(2);	//上架商品的名称
												new_nowprice=rs_new.getFloat(3);	//上架商品当前价格
												new_picture=rs_new.getString(4);	//上架商品的图片
												typeName=rs_new.getString(5);	//上架商品的类别
											
										%>
												<div
													class="product-grid col-lg-2 col-md-3 col-sm-6 col-xs-12">
													<div class="product-thumb transition">
														<div class="actions">
															<div class="image">
																<a href="goodsDetail.jsp?ID=<%=new_ID%>">
																<img src="images/goods/<%=new_picture%>" alt="<%=new_goodsname %>" class="img-responsive"></a>
															</div>
															<div class="button-group">
																<div class="cart">
																	<button class="btn btn-primary btn-primary" type="button" data-toggle="tooltip"
																		onclick='javascript:window.location.href="cart_add.jsp?goodsID=56&num=1"; '
																		style="display: none; width: 33.3333%;" data-original-title="加入到购物车">
																		<i class="fa fa-shopping-cart"></i>
																	</button>
																</div>
															</div>
														</div>
														<div class="caption">
															<div class="name" style="height: 40px">
																<a href="goodsDetail.jsp?ID=<%=new_ID%>"> <span style="color: #0885B1">商品名：</span><%=new_goodsname %></a>
															</div>
															<div class="name" style="margin-top: 10px"><p class="price">价格：<%=new_nowprice%> 元</p></div>
														</div>
													</div>
												</div>
										<%} %>
										<!-- //循环显示上架商品：添加12条商品信息 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //最新上架选项卡 -->					
			</div>
		</div>
	</div>
	</nav>
	<%@ include file="common-footer.jsp"%>
</body>
</html>