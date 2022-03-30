<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 导入java.sql.ResultSet类 --%>	
<%@ page import="java.sql.ResultSet"%>
<%-- 创建ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>会员账户信息-51商城</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
</head>
<body>
	<%
		ResultSet rs=conn.executeQuery("select * from tb_member where userName='" + request.getParameter("username") + "'");
		if (rs.next()) {
	%>
	<!-- 主体内容 -->
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<div id="mr-content" class="mr-content col-xs-12">
				<div class="login-wrap" style="margin-bottom: 60px; margin-top: 50px">
					<div style="max-width: 540px; margin: 0 auto;">
						<a href="index.jsp" title="点击返回首页"><img src="images/mfjslogo.png"></a>
					</div>
					<div class="login">
						<div class="page-header" style="pause: 0px;">
							<h1 class="login_h1">会员资料</h1>
						</div>
						<!-- 会员信息表单 -->
						<form id="member-modify" action="modifyMember_servlet.jsp"
							 method="post" class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="username-lbl" for="username" class="required">
											账户 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 账户文本框 -->
										<input type="text" name="username" id="username" value="<%=request.getParameter("username")%>"
											class="required" size="38" required="required"
											aria-required="true" readonly="readonly"><span class="star">&nbsp;</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											真实姓名 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 真实姓名文本框 -->
										<input type="text" name="truename" id="truename"
											value="<%=rs.getString("trueName")%>" class="validate-username required" size="38"
											required="required" aria-required="true"><span
											class="star">&nbsp;</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											密码 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 密码文本框 -->
										<input type="password" name="pwd" id="pwd" value="<%=rs.getString("passWord")%>"
											autocomplete="off" class="validate-password required"
											size="38" maxlength="99" required="required"
											aria-required="true"><span class="star">&nbsp;</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											居住城市 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 居住城市文本框 -->
										<input type="text" name="city" id="city"
											value="<%=rs.getString("city")%>" class="validate-username required" size="38"
											required="required" aria-required="true"><span
											class="star">&nbsp;</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											具体住址 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 具体住址文本框 -->
										<input type="text" name="address" id="address"
											value="<%=rs.getString("address")%>" class="validate-username required" size="38"
											required="required" aria-required="true"><span
											class="star">&nbsp;</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											邮政编码 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 邮政编码文本框 -->
										<input type="text" name="postcode" id="postcode"
											value="<%=rs.getString("postcode")%>" class="validate-username required" size="38"
											required="required" aria-required="true"><span
											class="star">&nbsp;</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											证件号 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 证件号文本框 -->
										<input type="text" name="cardNO" id="cardNO"
											value="<%=rs.getString("cardNO")%>" class="validate-username required" size="38"
											required="required" aria-required="true"><span
											class="star">&nbsp;</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											证件类型 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 证件类型文本框 -->
										<input type="text" name="cardType" id="cardType"
											value="<%=rs.getString("cardType")%>" class="validate-username required" size="38"
											required="required" aria-required="true"><span
											class="star">&nbsp;</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											会员等级 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 会员等级文本框 -->
										<input type="text" name="grade" id="grade"
											value="<%=rs.getInt("grade")%>" class="validate-username required" size="38"
											required="required" aria-required="true" readonly="readonly"><span
											class="star">&nbsp;</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											账户余额 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- 账户余额文本框 -->
										<input type="text" name="amount" id="amount"
											value="<%=rs.getString("amount")%>" class="validate-username required" size="38"
											required="required" aria-required="true" readonly="readonly"><span
											class="star">&nbsp;</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											联系电话 ：</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<!-- 联系电话文本框 -->
										<input type="text" name="tel" class="validate-email " id="tel"
											value="<%=rs.getString("tel")%>" size="38" aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											邮箱 ：</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<!-- 邮箱文本框 -->
										<input type="text" name="email" class="validate-email"
											id="email" value="<%=rs.getString("email")%>" size="38" aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="submit" class="btn btn-primary login">确认并修改</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		conn.close();//关闭数据库连接
	%>
</body>
</html>