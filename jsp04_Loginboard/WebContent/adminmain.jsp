<%
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

/*  
데이터가 변경되었을 때, 이전 내용을 화면에 보여주는 이유
->서버값이 아닌 캐시에 저장된 내용을 가져오기 때문

브라우저가 캐시에 응답결과를 저장하지 않도록 설정

response.setHeader("Cache-control", "no-store");   ->http 1.1
response.setHeader("Pragma", "no-cache");		   ->http 1.0
response.setHeader("Expires", "0");				   ->proxy server
*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>    
<%@ page import="java.util.List" %>
<%@ page import="com.login.dto.MyLoginDto" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminmain</title>
</head>
<%
	MyLoginDto dto=(MyLoginDto)session.getAttribute("dto");
	if(dto==null){
	pageContext.forward("index.jsp");
	}
%>
<body>

	<div>
		<span><%=dto.getMyname() %>님 환영합니다 (등급: <%=dto.getMyrole()%>)</span>
		<a href="logincontroller.jsp?command=logout">로그아웃</a>
	</div>
	<div>
		<div>
			<a href="logincontroller.jsp?command=userlistall">회원정보 조회(All)</a>
		</div>
		<div>
			<a href="logincontroller.jsp?command=userlisten">회원정보 조회(Enabled=Y)</a>
		</div>
		
	</div>		
</body>
</html>