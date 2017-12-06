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
<title>userinfo</title>
<script type="text/javascript">
function userform(){
	
	location.href="logincontroller.jsp?command=updateform";
}

function userdelete(no){
	
	location.href="logincontroller.jsp?command=userdelete&no="+no;
}

function userclear(){
	
	location.href="usermain.jsp";
}
</script>
</head>
<%
	MyLoginDto dto = (MyLoginDto)request.getAttribute("selectone");
%>
<body>
	<h1>나의 정보</h1>
	<form action="logincontroller.jsp" method="post">
		<input type="hidden" name="command" value="updateform">	
		<input type="hidden" name="no" value="<%=dto.getMyno()%>">
		
		<table border="1">
			<col width="100px">
			<col width="300px">		
		<tr>
			<th>아이디</th>
		<td><%=dto.getMyid()%></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
		<td><%=dto.getMypw()%></td>
		</tr>
		
		<tr>
			<th>이름</th>
		<td><%=dto.getMyname()%></td>
		</tr>
		
		<tr>
			<th>주소</th>
		<td><%=dto.getMyaddr()%></td>
		</tr>
		
		<tr>
			<th>전화번호</th>
		<td><%=dto.getMyphone()%></td>	
		</tr>
		
		<tr>
			<th>이메일</th>
		<td><%=dto.getMyemail()%></td>
		</tr>
		
		<tr>
			<th>등급</th>
		<td><%=dto.getMyrole()%></td>
		</tr>
		
		<tr>
			<td colspan="3">
			<input type="submit" value="수정" onclick="userform();"/>
			<input type="button" value="회원탈퇴" onclick="userdelete(<%=dto.getMyno()%>);"/>
			<input type="button" value="확인" onclick="userclear();"/>
			</td>
		</tr>
		</table>
	</form>
</body>
</html>