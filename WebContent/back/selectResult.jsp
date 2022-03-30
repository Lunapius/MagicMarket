<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.model.Member"%>
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
				<td width="14%" align="center">账号</td>
				<td width="13%" align="center">真实姓名</td>
				<td width="10%" align="center">身份证号</td>
				<td width="12%" align="center">会员等级</td>
				<td width="12%" align="center">账户余额</td>
				<td width="14%" align="center">冻结状态</td>
				<td width="14%" align="center">操作</td>											
			</tr>
<%-- 			<%String result = (String)request.getAttribute("result"); --%>
<%--  			if(result.equals("")){}else{out.write(result);}%>  --%>
			<%ArrayList<Member> memberList = (ArrayList<Member>)request.getAttribute("memberList"); %>
			<% if(memberList!=null && memberList.size()!=0){ %>
				<% for(int i=0;i<memberList.size();i++){
					Member member=(Member)memberList.get(i);%>
					<form method="post">
						<tr style="background: #fff">
							<td width="8%" align="center"><textarea name="username"  readonly="readonly" style= "overflow-x:hidden;overflow-y:hidden;border:none;resize:none;outline: none" rows=1><%=member.getUsername()%></textarea></td>
							<td width="8%" align="center"><%=member.getTruename()%></td>
							<td width="8%" align="center"><%=member.getCardno()%></td>
							<td width="8%" align="center"><%=member.getGrade()%></td>
							<td width="8%" align="center"><%=member.getAmount()%></td>
							<td width="8%" align="center"><textarea name="freeze"  readonly="readonly" style= "overflow-x:hidden;overflow-y:hidden;border:none;resize:none;outline: none" rows=1><%=member.getFreeze()%></textarea></td>
							<td width="8%" align="center">
							<input type = "submit" value = "冻结/解冻" formaction = "freeze_member">
									&nbsp;<input type="submit" value="删除" formaction = "delete_member">
							</td>
						</tr>
					</form>
				<%}
			}%>
		</table>
	  </form>
	  <%String massage = (String)session.getAttribute("massage");%>
	  <%if(massage != null) {
		  out.println(massage);
	  session.removeAttribute("massage"); }%>
	</body>
</html>
