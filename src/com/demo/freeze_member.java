package com.demo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tools.ConnDB;

/**
 * Servlet implementation class freeze_member
 */
@WebServlet("/freeze_member")
public class freeze_member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public freeze_member() {
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
		ConnDB cDB = new ConnDB();
		String username = request.getParameter("username");
		String freeze = request.getParameter("freeze");
		String a = null;//判断是否冻结
		String b = null;
		if(freeze.equals("0")){//冻结账号
			a="1";b="冻结";
		}else{//解除冻结
			a="0";b="解冻";
		}
		try(Connection conn = cDB.getConnection();
			PreparedStatement pstmt=conn.prepareStatement("update tb_Member set freeze="+a+" where username=?");){
		pstmt.setString(1,username);
		pstmt.executeQuery();
		System.out.println("<script language='javascript'>alert('用户已冻结！');window.location.href='back_index_home.jsp';</script>");
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("yonghu");
	}
}
