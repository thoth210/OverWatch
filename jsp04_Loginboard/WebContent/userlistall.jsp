<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 추가  -->    
<%@ page import="java.util.List" %>
<%@ page import="com.login.dto.MyLoginDto" %>
<% 
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!-- 종료  -->   
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userlist(all)</title>
</head>
<%
	List<MyLoginDto> list = (List<MyLoginDto>)request.getAttribute("list");

%>
<body>

	<h1>회원정보조회(All)</h1>
	<table border="1">
		<tr>
			<th>번호</th>	
			<th>아이디</th>	
			<th>비밀번호</th>	
			<th>이름</th>	
			<th>주소</th>	
			<th>전화번호</th>	
			<th>이메일</th>	
			<th>가입여부</th>	
			<th>등급</th>	
		</tr>
<%		
		for(MyLoginDto dto : list){
%>		
		<tr>
			<td><%=dto.getMyno() %></td>
			<td><%=dto.getMyid() %></td>
			<td><%=dto.getMypw() %></td>	
			<td><%=dto.getMyname() %></td>
			<td><%=dto.getMyaddr() %></td>
			<td><%=dto.getMyphone() %></td>
			<td><%=dto.getMyemail() %></td>
			<td><%=dto.getMyenabled().equals("Y")?"가입":"탈퇴" %></td>
			<td><%=dto.getMyrole() %></td>			
		</tr>
<%
		}
%>		
	<tr>
		<td colspan ="9">
			<button onclick="location.href='adminmain.jsp'">메인 </button>
		</td>	
	</table>	
</body>
</html>

