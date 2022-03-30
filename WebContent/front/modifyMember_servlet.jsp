<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 导入java.sql.PreparedStatement类 --%>	
<%@ page import="java.sql.*"%>
<%-- 创建ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String username=request.getParameter("username");
		username = new String(username.getBytes("ISO8859-1"), "UTF-8");
		
		String truename=request.getParameter("truename");
		truename = new String(truename.getBytes("ISO8859-1"), "UTF-8");
		
		String passWord=request.getParameter("pwd");
		passWord = new String(passWord.getBytes("ISO8859-1"), "UTF-8");
		
		String city=request.getParameter("city");
		city = new String(city.getBytes("ISO8859-1"), "UTF-8");
		
		String address=request.getParameter("address");
		address = new String(address.getBytes("ISO8859-1"), "UTF-8");
		
		String postcode=request.getParameter("postcode");
		postcode = new String(postcode.getBytes("ISO8859-1"), "UTF-8");
		
		String cardNO=request.getParameter("cardNO");
		cardNO = new String(cardNO.getBytes("ISO8859-1"), "UTF-8");
		
		String cardType=request.getParameter("cardType");
		cardType = new String(cardType.getBytes("ISO8859-1"), "UTF-8");
		
		String grade=request.getParameter("grade");
		String amount=request.getParameter("amount");
	
		String tel=request.getParameter("tel");
		tel = new String(tel.getBytes("ISO8859-1"), "UTF-8");
		
		String email=request.getParameter("email");
		email = new String(email.getBytes("ISO8859-1"), "UTF-8");
		
		String sql = "update tb_Member set username=? ,truename=? ,passWord=? ,"
				+"city=? ,address=? ,postcode=? ,cardNO=? ,cardType=? ,grade=? ,"
				+"amount=? ,tel=? ,email=? where username=?";
		try(PreparedStatement pstmt=conn.prepareStatement(sql)){
			pstmt.setString(1,username);
			pstmt.setString(2,truename);
			pstmt.setString(3,passWord);
			pstmt.setString(4,city);
			pstmt.setString(5,address);
			pstmt.setString(6,postcode);
			pstmt.setString(7,cardNO);
			pstmt.setString(8,cardType);
			pstmt.setString(9,grade);
			pstmt.setString(10,amount);
			pstmt.setString(11,tel);
			pstmt.setString(12,email);
			pstmt.setString(13,username);
			int i = pstmt.executeUpdate();
			if (i!=0) {//如果成功修改
				out.println(
						"<script language='javascript'>alert('修改成功');"
								        +"window.location.href='modifyMember.jsp?username="+username+"';</script>");
			}else{
					out.println(
							"<script language='javascript'>alert('修改失败');"
									        +"window.location.href='modifyMember.jsp?username="+username+"';</script>");
				}
		}catch (Exception e) {//处理异常
			out.println(
					"<script language='javascript'>alert('您的操作有误!');"
			        +"window.location.href='modifyMember.jsp?username="+username+"';</script>");
		}
		conn.close();//关闭数据库连接
	%>
</body>
</html>