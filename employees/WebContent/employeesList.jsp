<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ page import ="java.sql.*" %>
   <%@ page import ="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/employees",
				"root",
				"java1004");
		String sql = "SELECT emp_no,birth_date,first_name,last_name,gender,hire_date FROM employees ORDER BY emp_no ASC LIMIT 0,10";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR); // ���� �⵵
	%>
	<table border ="1">
		<thead>
			<tr>
				<th>emp_no</th>
				<th>birth_date</th>
				<th>age</th>
				<th>first_name</th>
				<th>last_name</th>
				<th>gender</th>
				<th>hire_date</th>
			</tr>
		</thead>
		
		<tbody>
			<%
				while(rs.next()){
			%>
				<tr>
					<td><%=rs.getInt("emp_no") %></td>
					<td><%=rs.getString("birth_date") %></td>
					
					<!-- ���� 2 . ���� ���ϱ� -->
					<td>
						<%
							String birth = rs.getString("birth_date"); //������� ��������
							int personYear = Integer.parseInt(birth.substring(0,4));//�⵵�� ���� ���� ���ڿ� -> ���ڷ� ����
							int age = year - personYear; //���� �⵵ - ����⵵
							out.print(age);
						%>
					</td>
					
					<td><%=rs.getString("first_name") %></td>
					<td><%=rs.getString("last_name") %></td>
					
					<!-- ���� 1. ���� �ѱ�ȭ -->
					<td>
					<%
						if(rs.getString("gender").equals("M")){ // gender�� M�̶�� ���ڷ� ���
					%>
							����
					<%
						}else{ //�ܿ��� ���ڷ� ���
					%>
							����
					<%
						}
					%>
					</td>
					
					<td><%=rs.getString("hire_date") %></td>
				</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>