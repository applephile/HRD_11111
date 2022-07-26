<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	try{
		
		conn = JDBConnection.getConnection();
		
		String sql = " UPDATE member_tbl_02 " 
					+ " SET custname = ?,  phone = ?, address = ?, joindate = ?, grade = ?, city = ? WHERE custno = ? ";
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, custname);
		psmt.setString(2, phone);
		psmt.setString(3, address);
		psmt.setString(4, joindate);
		psmt.setString(5, grade);
		psmt.setString(6, city);
		psmt.setString(7, custno);
		
		int result = psmt.executeUpdate();
		
		System.out.println("ㅇㅇ");
		
		response.sendRedirect("./modify.jsp");
		
	}catch(Exception e) {
		e.printStackTrace();
	}
%>