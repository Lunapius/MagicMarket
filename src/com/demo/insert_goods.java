package com.demo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tools.ConnDB;

/**
 * Servlet implementation class insert_goods
 */
@WebServlet("/insert_goods")
public class insert_goods extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert_goods() {
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
		request.setCharacterEncoding("UTF-8");
		ConnDB cDB = new ConnDB();
		String sql = "insert into tb_goods(typeID,goodsName,introduce,price,nowPrice,picture,newGoods,sale,hit) values (?,?,?,?,?,?,?,?,?)";
		try (	Connection conn = cDB.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);){
			pstmt.setString(1,request.getParameter("goodsType"));
			pstmt.setString(2,request.getParameter("goodsName"));
			pstmt.setString(3,request.getParameter("introduce"));
			pstmt.setString(4,request.getParameter("price"));
			pstmt.setString(5,request.getParameter("nowPrice"));
			pstmt.setString(6,request.getParameter("picture"));
			pstmt.setString(7,request.getParameter("newGoods"));
			pstmt.setString(8,request.getParameter("sale"));
			pstmt.setString(9,request.getParameter("hit"));
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
