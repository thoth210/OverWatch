<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.login.dto.MyLoginDto" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	MyLoginDto dto= (MyLoginDto)session.getAttribute("dto");
%>
<body>

	<h1>메인 화면 (일반사용자)</h1>
	
	<div>
		<span><%=dto.getMyname() %>님 환영합니다.(등급 : <%=dto.getMyrole() %>) </span>
		<br/>
		<a href="logincontroller.jsp?command=logout">로그아웃</a>
	</div>
	
	<div>
		<a href="logincontroller.jsp?command=userinfo&no=<%=dto.getMyno()%>">나의정보</a>
	</div>
</body>
</html>