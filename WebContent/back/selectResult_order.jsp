<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.model.order"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>后台管理</title>
		
	</head>
	<body>
	  <form method="post">
		<table width="100%" border="1" class="line_table">
			<tr style="background: #d3eaef">
				<td width="14%" align="center">用户名</td>
				<td width="13%" align="center">订单号</td>
				<td width="10%" align="center">商品号</td>
				<td width="12%" align="center">商品名</td>
				<td width="12%" align="center">数量</td>		
				<td width="12%" align="center">操作</td>									
			</tr>
<%-- 			<%String result = (String)request.getAttribute("result"); --%>
<%--  			if(result.equals("")){}else{out.write(result);}%>  --%>
			<%ArrayList<order> orderList = (ArrayList<order>)request.getAttribute("orderList"); %>
			<% if(orderList!=null && orderList.size()!=0){ %>
				<% for(int i=0;i<orderList.size();i++){
					order order=(order)orderList.get(i);%>
					<form method="post">
						<tr style="background: #fff">
							<td width="8%" align="center"><textarea name="username"  readonly="readonly" style= "overflow-x:hidden;overflow-y:hidden;border:none;resize:none;outline: none" rows=1><%=order.getUserName()%></textarea></td>
							<td width="8%" align="center"><%=order.getOrderID()%></td>
							<td width="8%" align="center"><%=order.getGoodsID()%></td>
							<td width="8%" align="center"><%=order.getGoodsName()%></td>
							<td width="8%" align="center"><%=order.getNumber()%></td>
							<td width="8%" align="center">
							<input type = "submit" value = "修改" formaction = "freeze_member">
									&nbsp;<input type="submit" value="删除" formaction = "delete_member">
							</td>
						</tr>
					</form>
				<%}
			}%>
		</table>
	  </form>
	</body>
</html>