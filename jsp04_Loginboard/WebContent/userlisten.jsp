<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 
<!--<추가>  -->
<%@ page import="java.util.List"%>
<%@ page import="com.login.dto.MyLoginDto"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%> 
<!--</추가>  -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userlist(enabled)</title>

<script type="text/javascript">
	
	function updaterole(no){
		location.href="logincontroller.jsp?command=updateroleform&no="+no;
	}

</script>
</head>
<%
List<MyLoginDto> list = (List<MyLoginDto>)request.getAttribute("list");
%>
<body>
		
	<h1>회원정보조회 (enabled)</h1>
		
<table border="1">	
		<tr>
			<th>번호</th>	
			<th>아이디</th>	
			<th>이름</th>			
			<th>이메일</th>		
			<th>등급</th>	
			<th>등급변경</th>	
		</tr>
<%
		for(MyLoginDto dto:list){
%>
		<tr>
			<td><%=dto.getMyno() %></td>	
			<td><%=dto.getMyid() %></td>	
			<td><%=dto.getMyname() %></td>			
			<td><%=dto.getMyemail() %></td>		
			<td><%=dto.getMyrole() %></td>	
			<td><button onclick="updaterole(<%=dto.getMyno() %>);">변경</button></td>	
		</tr>
<%
		}
%>		
	<tr>
		<td colspan="6">
			<button onclick="location.href='adminmain.jsp'">메인</button>
		</td>
	</tr>	 
</table>
</body>
</html>