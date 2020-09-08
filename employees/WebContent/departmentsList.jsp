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
	<!-- �޴� -->
	<div>
		<table border = "1">
			<tr>
				<td><a href ="./index.jsp">HOME����</a></td>
				<td><a href ="./departmentsList.jsp">departments ���̺� ���</a></td>
				<td><a href ="./deptEmpList.jsp">dept_emp ���̺� ���</a></td>
				<td><a href ="./deptManagerList.jsp">dept_manager ���̺� ���</a></td>
				<td><a href ="./employeesList.jsp">employees ���̺� ���</a></td>
				<td><a href ="./salariesList.jsp">salaries ���̺� ���</a></td>
				<td><a href ="./titlesList.jsp">titles ���̺� ���</a></td>
			</tr>
		</table>
	</div>
	
	<h1>departments ���̺� ���</h1>
	<%
		// 1. mariadb(sw)�� ����� �� �ְ�
		Class.forName("org.mariadb.jdbc.Driver");
	
		// 2. mariadb ����(�ּ� + ��Ʈ�ѹ� + db�̸�, db������ȣ)
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/employees",
				"root",
				"java1004");
		System.out.println(conn+ "<-conn");
		
		// 3. conn�ȿ� ����(sql)�� �����
		String sql = "SELECT dept_no, dept_name FROM departments ORDER BY dept_no ASC LIMIT 0, 10";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt+ "<-stmt");
		
		// 4. ����(����)�� ������� ������ �´�
		ResultSet rs = stmt.executeQuery();
		System.out.println(rs+ "<-rs");
	%>	
		<!-- ��� -->
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