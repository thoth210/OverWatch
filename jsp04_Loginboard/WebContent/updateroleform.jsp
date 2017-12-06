<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <추가>  -->
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.login.dto.*" %>
<!-- </추가>  -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateform</title>

<script type="text/javascript">



</script>
</head>
<%
	MyLoginDto dto = (MyLoginDto)request.getAttribute("selectone");
%>

<body>

	<h1>회원등급 변경 페이지</h1>
	
	<form action="logincontroller.jsp" method="post">
		<input type="hidden" name="command" value="updaterole"/>
		<input type="hidden" name="no" value="<%=dto.getMyno()%>"/>
		
		<table border="1">
			<tr>
				<th>번호</th>
				<td><%=dto.getMyno()%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=dto.getMyname()%></td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					<select name="role">
						<option value="USER" <%=dto.getMyrole().equals("USER")?"selected":""%>>일반회원</option>
						<option value="ADMIN" <%=dto.getMyrole().equals("ADMIN")?"selected":""%>>관리자</option>
						<option value="MANAGER" <%=dto.getMyrole().equals("MANAGER")?"selected":""%>>매니저</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="변경완료"/>
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>