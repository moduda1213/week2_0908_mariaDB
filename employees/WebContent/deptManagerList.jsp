<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/employees",
				"root",
				"java1004");
		
		String sql = "SELECT dept_no, emp_no,from_date,to_date FROM dept_manager ORDER BY emp_no ASC LIMIT 0, 10";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
	%>
	<table border = "1">
		<thead>
			<tr>
				<th>dept_no</th>
				<th>emp_no</th>
				<th>from_date</th>
				<th>to_date</th>
			</tr>
		</thead>
		<tbody>
	<%
			while(rs.next()){
	%>	
			<tr>
				<td><%=rs.getString("dept_no") %></td>
				<td><%=rs.getInt("emp_no") %></td>
				<td><%=rs.getString("from_date") %></td>
				<td><%=rs.getString("to_date") %></td>
			</tr>
	<%
			}
	%>
		</tbody>
	</table>
</body>
</html>