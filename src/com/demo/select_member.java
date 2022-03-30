package com.demo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.Member;
import com.tools.ConnDB;

/**
 * Servlet implementation class select_member
 */
@WebServlet("/select_member")
public class select_member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public select_member() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
						HttpServletResponse response) 
					throws ServletException, IOException {
		String queryInfo=request.getParameter("queryInfo");
		queryInfo = new String(queryInfo.getBytes("ISO8859-1"), "UTF-8");
		String queryType=request.getParameter("queryType");
		String select="";
		ConnDB cDB = new ConnDB();
		switch(queryType){
		case "0"://按会员账号查询
			select="username = ?";
			break;
		case "1"://按真实姓名查询
			select="trueName = ?";
	  		break;
		case "2"://按联系电话查询
			select="tel = ?";
			break;
		case "3"://按电子邮箱查询
			select="email = ?";
			break;
		default:
			break;
		}
		String sql="select * from tb_Member where "+ select;
		try(	Connection conn = cDB.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);){
			ArrayList<Member> memberList = null;
			memberList = new ArrayList<Member>();
			pstmt.setString(1, queryInfo);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setUsername(rs.getString("userName"));
				member.setTruename(rs.getString("trueName"));
				member.setCardno(rs.getString("cardNO"));
				member.setGrade(rs.getString("grade"));
				member.setAmount(rs.getString("Amount"));
				member.setFreeze(rs.getString("freeze"));
				memberList.add(member);
			}
			request.setAttribute("memberList", memberList);
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/back/selectResult.jsp");
			rd.forward(request, response);
			conn.close();
		}catch (Exception e) {//处理异常
			e.printStackTrace();
		}
	}

}
