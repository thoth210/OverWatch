<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 추가  -->    
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!-- 추가  -->    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>

<script type="text/javascript">
	
	function resistform(){
		
		location.href="logincontroller.jsp?command=resistform";
	}
</script>
<style type="text/css">
	div{
	margin-top:3%;
	
	margin-bottom:10%; 
	}	
</style>
</head>
<body>
<%@ include file="forms/header.jsp"%>
<div>
	<form action="logincontroller.jsp" method="post">
		<input type="hidden" name="command" value="login"/>
		<table border="1" style="height:250px; width: 500px; margin:auto;">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"/></td>		
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw"/></td>		
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인"/>	
					<input type="button" value="회원가입" onclick="resistform();"/>
				</td>		
			</tr>
		</table>
	</form>
</div>	
</body>
<%@ include file="forms/footer.jsp"%>
</html>
