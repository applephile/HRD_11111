<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./Style.css" rel="stylesheet">
</head>
<body>
	<script src="check.js"></script>
	<jsp:include page="./header.jsp"/>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String mod_custno = request.getParameter("mod_custno");
		
		String custname = "";
		String phone = "";
		String address = "";
		Date joindate;
		String grade = "";
		String city = "";
		
		//가입일자를 yyyy-mm-dd형태로 표시하기 위한 변수 생성
		String joindateStr = "";
		try{
			conn = JDBConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = "SELECT * FROM member_tbl_02 WHERE custno = " + mod_custno;
			
			rs = stmt.executeQuery(sql);
			
			rs.next();
			
			mod_custno = rs.getString("custno");
			custname = rs.getString("custname");
			phone = rs.getString("phone");
			address = rs.getString("address");
			joindate = rs.getDate("joindate");
			grade = rs.getString("grade");
			city = rs.getString("city");
						
			//날짜를 지정된 형식의 텍스트로 변환
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			joindateStr = sd.format(joindate);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	%>
	
	<section>
		<h2>홈쇼핑 회원 정보 수정</h2>		
		<form name="frm" action="modifyProcess.jsp" mothod="post">
			<table border="1">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=mod_custno%>"></td>				
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value="<%=custname%>"></td>				
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value="<%=phone%>"></td>				
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" value="<%=address%>"></td>				
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value=<%=joindateStr%>></td>				
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade" value="<%=grade%>"></td>				
				</tr> 
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%=city%>"></td>				
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정" onclick="return modify()">
						<input type="button" value="조회" onclick="return search()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<jsp:include page="./footer.jsp"/>
</body>
</html>