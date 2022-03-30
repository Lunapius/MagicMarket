<%@ page pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList,com.model.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>后台管理</title>		  
	</head>
	<link type="text/css" href="css/back_index.css" rel="stylesheet"/>
	<script>
      function getClass(className) { //className指class的值
       
                var tagname = document.getElementsByTagName('*');  //获取指定元素
                var tagnameAll = [];     //这个数组用于存储所有符合条件的元素
                for (var i = 0; i < tagname.length; i++) {     //遍历获得的元素
                    if (tagname[i].className.indexOf(className)>=0){     //如果获得的元素中的class的值等于指定的类名，就赋值给tagnameAll
                        tagnameAll[tagnameAll.length] = tagname[i];
                    }
                }
                return tagnameAll;
             
        }
 
 
 
        window.onload=function(){//载入事件
            var btn=getClass('tab_btn');//获取按钮数组
            var div=getClass('tab_div');//获取div数组
            for(i=0;i<btn.length;i++){
                btn[i].onclick=function(){//按钮点击事件
                    var index=(this.getAttribute('index')-0);//获取是第几个按钮按下
                    if(btn[index].className.indexOf('curr_btn')>=0) return;//如果按下的按钮为当前选中的按钮则无反应
                    for(i=0;i<btn.length;i++){
                        if(index==i){
                            btn[i].className='tab_btn curr_btn';
                            div[i].className='tab_div curr_div';
                        }else{
                            btn[i].className='tab_btn';
                            div[i].className='tab_div';
                        }
                    }
                }
            }
        };
    </script>
    
	<body>
		<div id="wrapper">
			<div id="header">
				<div class="bg_one">
					<div class="main_title">魔法集市系统后台管理</div>
					<div class="float_r">
						<span class="right_button">
							<a href="#"><img src="images/icon/change_pwd_bt.png" width="69" height="17"/></a>
							<a href="#"><img src="images/icon/user_bt.png" width="69" height="17"/></a>
							<a href="#"><img src="images/icon/back_bt.png" width="69" height="17"/></a>
						</span>
					</div>
				</div>
				<div class="bg_two">
					<div class="float_1">
						<span class="float_1 left_button">
							<a href="back_index_home.jsp"><img src="images/icon/index_icon.png" width="25px" height="25px" class="valign"/>首页</a>
							<a href="#"><img src="images/icon/back.png" width="25px" height="25px" class="valign"/>后退</a>
							<a href="#"><img src="images/icon/go.png" width="25px" height="25px" class="valign"/>前进</a>
							<a href="#"><img src="images/icon/refresh.png" width="25px" height="25px" class="valign"/>刷新</a>
							<a href="#"><img src="images/icon/help.png" width="25px" height="25px" class="valign"/>帮助</a>
						</span>
					</div>
				</div>
			</div>
			<div id="main">
				<div id="left">
					<div class="content">
						<img src="images/back_index/border.jpg" width="100%" height="5" />
						<ul class="menu">
							<li class="title">账户管理</li>
							<li><a href='javascript:void(0)' index='0' class='tab_btn curr_btn'>查询账户信息</a></li>
						</ul>
					</div>
					<div class="content">
						<img src="images/back_index/border.jpg" width="100%" height="5" />
						<ul class="menu">
							<li class="title">订单管理</li>
							<li><a href='javascript:void(0)' index='1' class='tab_btn'>查询订单信息</a></li>
						</ul>
					</div>
					<div class="content">
						<img src="images/back_index/border.jpg"  width="100%" height="5"/>
						<ul class="menu">
							<li class="title">商品管理</li>
							<li><a href='javascript:void(0)' index='2' class='tab_btn'>管理商品</a></li>
							<li><a href='javascript:void(0)' index='3' class='tab_btn'>添加商品</a></li>
						</ul>
					</div>

				</div>
				<div id="right">
<!-- 				<iframe src="" width="100%" height="400px" name="fuction"></iframe> -->
					
					<div class='tab_div curr_div'>
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="30">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="24" bgcolor="#353c44">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="6%" height="19" valign="bottom">
																	<div align="center">
																		<img src="images/icon/help.png" width="14" height="14" />
																	</div>
																</td>
																<td width="95%" valign="bottom">
																	<span class="title">查询账户信息</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<form method="post">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>						
											<td><input type="text" name="queryInfo" width="300" />&nbsp;&nbsp;	
												<select name="queryType" style="border-width: 3px;">
													<option value="" selected>&nbsp;请选择查询方式&nbsp;</option>
													<option value="0">--会员账号--</option>
													<option value="1">--会员姓名--</option>
													<option value="2">--联系电话--</option>
													<option value="3">--电子邮箱--</option>
												</select>&nbsp;&nbsp;
												<input type = "submit" formaction = "../select_member" value="查询">
<!-- 									<a href="selectResult.jsp" target="fuction">查询</a></button> --> 
											</td>				
										</tr>
									</table>
								
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
										<%ArrayList<Member> memberList = (ArrayList<Member>)request.getAttribute("memberList"); %>
										<% if(memberList!=null && memberList.size()!=0){ %>
											<% for(int i=0;i<memberList.size();i++){
												Member member=(Member)memberList.get(i);%> 
												<tr style="background: #fff">
													<td width="8%" align="center"><%=member.getUsername()%></td>
													<td width="8%" align="center"><%=member.getTruename()%></td>
													<td width="8%" align="center"><%=member.getCardno()%></td>
													<td width="8%" align="center"><%=member.getGrade()%></td>
													<td width="8%" align="center"><%=member.getAmount()%></td>
													<td width="8%" align="center"><%=member.getFreeze()%></td>
													<td width="8%" align="center">
													<a href = "freeze_member.jsp?username=<%=session.getAttribute("username")%>&freeze=<%=session.getAttribute("freeze")%>"><input name="submit" type="button" value="冻结/解冻" /></a>
														&nbsp;<input name="submit" type="button" value="删除" />
													</td>
												</tr>
											<%}
										 }%> 
									</table>
<!-- 								<iframe src="selectResult.jsp" width="100%" height="400px" name="fuction"></iframe> -->
								</form>
							</td>
						</tr>
						<tr>
							<td height="30">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="33%"><div align="left"><span>&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>18942</strong>条记录，当前第<strong>1</strong>页，共<strong>192</strong>页</span></div>
										</td>
										<td width="67%">
											<table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
												<tr>
													<td width="49"><div align="center"><img src="images/icon/index_bt.png" width="40" height="15"/></div></td>
													<td width="49"><div align="center"><img src="images/icon/back_page.png" width="45" height="15"/></div></td>
													<td width="49"><div align="center"><img src="images/icon/next_page.png" width="45" height="15"/></div></td>
													<td width="49"><div align="center"><img src="images/icon/end_page.png" width="40" height="15"/></div></td>
													<td width="37"><div align="center">转到</div></td>
													<td width="22">
														<div align="center">
															<input type="text" name="textfield" id="textfield" style="width: 20px;height: 12px;font-size: 12px;border: solid 1px #7aaebd;" />
														</div>
													</td>
													<td width="22"><div align="center">页</div></td>
													<td width="35">
														<img src="images/icon/turn.png" width="26" height="15" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					</div>
						
					<div class='tab_div'>
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="30">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="24" bgcolor="#353c44">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="6%" height="19" valign="bottom">
																	<div align="center">
																		<img src="images/icon/help.png" width="14" height="14" />
																	</div>
																</td>
																<td width="95%" valign="bottom">
																	<span class="title">查询订单信息</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<form method="post">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><input type="text" name="queryInfo" width="300" />&nbsp;&nbsp;
												<select name="queryType" style="border-width: 3px;">
													<option value="" selected>&nbsp;请选择查询方式&nbsp;</option>
													<option value="0">--用户名--</option>
													<option value="1">--订单号--</option>
													<option value="2">--商品名--</option>
												</select>&nbsp;&nbsp;
												<input type = "submit" formaction = "../select_order" value="查询">
												</td>
										</tr>
									</table>							
									<table width="100%" border="1" class="line_table">
										<tr style="background: #d3eaef">
											<td width="8%" align="center">用户名</td>
											<td width="13%" align="center">订单号</td>
											<td width="10%" align="center">商品号</td>
											<td width="12%" align="center">商品名</td>
											<td width="12%" align="center">数量</td>
											<td width="14%" align="center">操作</td>											
										</tr>
										<tr style="background: #fff">
											<td width="8%"></td>
											<td width="8%"></td>
											<td width="8%"></td>
											<td width="8%"></td>
											<td width="8%"></td>
											<td width="8%" align="center">
												<input name="submit" type="button" value="修改" />&nbsp;&nbsp;&nbsp;
												<input name="submit" type="button" value="删除" />
											</td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						<tr>
							<td height="30">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="33%"><div align="left"><span>&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>133</strong>条记录，当前第<strong>1</strong>页，共<strong>10</strong>页</span></div>
										</td>
										<td width="67%">
											<table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
												<tr>
													<td width="49"><div align="center"><img src="images/icon/index_bt.png" width="40" height="15"/></div></td>
													<td width="49"><div align="center"><img src="images/icon/back_page.png" width="45" height="15"/></div></td>
													<td width="49"><div align="center"><img src="images/icon/next_page.png" width="45" height="15"/></div></td>
													<td width="49"><div align="center"><img src="images/icon/end_page.png" width="40" height="15"/></div></td>
													<td width="37"><div align="center">转到</div></td>
													<td width="22">
														<div align="center">
															<input type="text" name="textfield" id="textfield" style="width: 20px;height: 12px;font-size: 12px;border: solid 1px #7aaebd;" />
														</div>
													</td>
													<td width="22"><div align="center">页</div></td>
													<td width="35">
														<img src="images/icon/turn.png" width="26" height="15" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					</div>
					
					
					
					
					<div class='tab_div'>
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="30">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="24" bgcolor="#353c44">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="6%" height="19" valign="bottom">
																	<div align="center">
																		<img src="images/icon/help.png" width="14" height="14" />
																	</div>
																</td>
																<td width="95%" valign="bottom">
																	<span class="title">查询医生排班信息</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<form method="post" action="../upload" enctype="multipart/form-data">
								    选择一个文件: <input type="file" name="uploadFile" />
								  &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="上传" />
								</form>
							</td>
						</tr>
						<tr>
							<td height="30">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="33%"><div align="left"><span>&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>133</strong>条记录，当前第<strong>1</strong>页，共<strong>10</strong>页</span></div>
										</td>
										<td width="67%">
											<table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
												<tr>
													<td width="49"><div align="center"><img src="images/icon/index_bt.png" width="40" height="15"/></div></td>
													<td width="49"><div align="center"><img src="images/icon/back_page.png" width="45" height="15"/></div></td>
													<td width="49"><div align="center"><img src="images/icon/next_page.png" width="45" height="15"/></div></td>
													<td width="49"><div align="center"><img src="images/icon/end_page.png" width="40" height="15"/></div></td>
													<td width="37"><div align="center">转到</div></td>
													<td width="22">
														<div align="center">
															<input type="text" name="textfield" id="textfield" style="width: 20px;height: 12px;font-size: 12px;border: solid 1px #7aaebd;" />
														</div>
													</td>
													<td width="22"><div align="center">页</div></td>
													<td width="35">
														<img src="images/icon/turn.png" width="26" height="15" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					</div>
					
					
					<div class='tab_div'>
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						
						<tr>
							<td height="30">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="24" bgcolor="#353c44">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="6%" height="19" valign="bottom">
																	<div align="center">
																		<img src="images/icon/help.png" width="14" height="14" />
																	</div>
																</td>
																<td width="95%" valign="bottom">
																	<span class="title">添加商品</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td>
						
							<form method="post">
								<div class="name">
								
									<label>商品类别</label>
									
								
									<select name="goodsType" style="border-width: 3px;">
													<option value="" selected>&nbsp;选择添加商品的类型&nbsp;</option>
													<option value="39">--等比例可动--</option>
													<option value="40">--1/7比例手办--</option>
													<option value="41">--Q版手办--</option>
													<option value="42">--漫画--</option>
													<option value="43">--小说--</option>
													<option value="1041">--演唱会门票--</option>													
													<option value="1042">--玩偶周边--</option>
												</select>
								</div>
								<div class="name">
									<label>商品名</label>
									<input class="input1" type="text" name="goodsName" placeholder="goodsName" required="">
								</div>
								<div class="dept">
									<label>商品简介</label>
									<input class="input1" type="text" name="introduce" placeholder="introduce" required="">
								</div>
								<div class="pass2">
									<label>商品原价</label>
									<input class="input1" type="text" name="price" placeholder="originalPrice" required="">
								</div>
								<div class="pass2">
									<label>商品现价</label>
									<input class="input1" type="text" name="nowPrice" placeholder="nowPrice" required="">
								</div>
								<div class="pass2">
									<label>商品图片名</label>
									<input class="input1" type="text" name="picture" placeholder="pictureName" required="">
								</div>
								<div class="pass2">
								<label>新上架</label>
									<select name="newGoods" style="border-width: 3px;">
										<option value="" selected>&nbsp;是否添加为新商品&nbsp;</option>
										<option value="1">--是--</option>
										<option value="0">--否--</option>
									</select>
								</div>
								<div class="pass2">
								<label>打折销售</label>
									<select name="sale" style="border-width: 3px;">
										<option value="" selected>&nbsp;商品是否在打折&nbsp;</option>
										<option value="1">--是--</option>
										<option value="0">--否--</option>
									</select>
								</div>
								<div class="pass2">
									<label>商品初始热度值</label>
									<input class="input1" type="text" name="hit" placeholder="hit" required="">
								</div>
								<div class="signup">
									<input type="submit" value="提交" formaction = "../insert_goods">
								</div>
							</form>
							</td>
						</tr>
					</table>
					</div>
					
					
				</div>
			</div>
			<div id="footer">
				<p>&copy;2021&nbsp;IWantToGoHome&nbsp;Team&nbsp;Design&nbsp;&amp;&nbsp;Development</p>
			</div>
		</div>
	</body>
</html>
