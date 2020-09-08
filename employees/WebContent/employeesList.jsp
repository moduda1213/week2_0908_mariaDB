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
		String sql = "SELECT emp_no,birth_date,first_name,last_name,gender,hire_date FROM employees ORDER BY emp_no ASC LIMIT 0,10";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR); // 현재 년도
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
					
					<!-- 과제 2 . 나이 구하기 -->
					<td>
						<%
							String birth = rs.getString("birth_date"); //생년월일 가져오기
							int personYear = Integer.parseInt(birth.substring(0,4));//년도만 따로 떼서 문자열 -> 숫자로 변형
							int age = year - personYear; //현재 년도 - 출생년도
							out.print(age);
						%>
					</td>
					
					<td><%=rs.getString("first_name") %></td>
					<td><%=rs.getString("last_name") %></td>
					
					<!-- 과제 1. 성별 한글화 -->
					<td>
					<%
						if(rs.getString("gender").equals("M")){ // gender가 M이라면 남자로 출력
					%>
							남자
					<%
						}else{ //외에는 여자로 출력
					%>
							여자
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