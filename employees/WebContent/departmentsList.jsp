<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>departmentsList</title>
</head>
<body>
	<!-- 메뉴 -->
	<div>
		<table border = "1">
			<tr>
				<td><a href ="./index.jsp">HOME으로</a></td>
				<td><a href ="./departmentsList.jsp">departments 테이블 목록</a></td>
				<td><a href ="./deptEmpList.jsp">dept_emp 테이블 목록</a></td>
				<td><a href ="./deptManagerList.jsp">dept_manager 테이블 목록</a></td>
				<td><a href ="./employeesList.jsp">employees 테이블 목록</a></td>
				<td><a href ="./salariesList.jsp">salaries 테이블 목록</a></td>
				<td><a href ="./titlesList.jsp">titles 테이블 목록</a></td>
			</tr>
		</table>
	</div>
	
	<h1>departments 테이블 목록</h1>
	<%
		// 1. mariadb(sw)를 사용할 수 있게
		Class.forName("org.mariadb.jdbc.Driver");
	
		// 2. mariadb 접속(주소 + 포트넘버 + db이름, db계정암호)
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/employees",
				"root",
				"java1004");
		System.out.println(conn+ "<-conn");
		
		// 3. conn안에 쿼리(sql)를 만든다
		String sql = "SELECT dept_no, dept_name FROM departments ORDER BY dept_no ASC LIMIT 0, 10";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt+ "<-stmt");
		
		// 4. 쿼리(실행)에 결과물을 가지고 온다
		ResultSet rs = stmt.executeQuery();
		System.out.println(rs+ "<-rs");
	%>	
		<!-- 출력 -->
		<table border = "1">
			<thead>
					<tr>
						<th>dept_no</th>
						<th>dept_name</th>
					</tr>	
			</thead>
			<tbody>
				<%
					while(rs.next()){
				%>
					<tr>
						<td><%=rs.getString("dept_no") %></td>
						<td><%=rs.getString("dept_name") %></td>
					</tr>
				<%
					}
				%>
			</tbody>
		</table>	
	
</body>
</html>