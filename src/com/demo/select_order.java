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

import com.model.order;
import com.tools.ConnDB;

/**
 * Servlet implementation class select_order
 */
@WebServlet("/select_order")
public class select_order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public select_order() {
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
		case "0"://按用户名查询
			select="username = ?";
			break;
		case "1"://按订单号查询
			select="o.orderID = ?";
	  		break;
		case "2"://按商品名查询
			select="goodsName = ?";
			break;
		default:
			break;
		}
		String sql="select username,o.orderID,goodsID,goodsName,number "+
		"from tb_order o,tb_order_detail od,tb_goods g where o.orderID=od.orderID and od.goodsID=g.ID and "+ select;
		try(	Connection conn = cDB.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);){
			ArrayList<order> orderList = null;
			orderList = new ArrayList<order>();
			pstmt.setString(1, queryInfo);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				order order = new order();
				order.setUserName(rs.getString("userName"));
				order.setOrderID(rs.getString("orderID"));
				order.setGoodsID(rs.getString("goodsID"));
				order.setGoodsName(rs.getString("goodsName"));
				order.setNumber(rs.getString("number"));
				orderList.add(order);
			}
			request.setAttribute("orderList", orderList);
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/back/selectResult_order.jsp");
			rd.forward(request, response);
			conn.close();
		}catch (Exception e) {//处理异常
			e.printStackTrace();
		}
	}

}
