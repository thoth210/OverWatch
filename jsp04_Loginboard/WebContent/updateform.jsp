<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.login.dto.MyLoginDto" %> 
    
<!DOCTYPE html>
<html>
<%
	MyLoginDto dto = (MyLoginDto)request.getAttribute("updateform");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function userupd(){
		location.href="logincontroller.jsp?command=updsus";
	}

	function usercan(){
		location.href="logincontroller.jsp?command=userinfo&no=<%=dto.getMyno()%>";
	}	
	
	

$(function(){
	$("button:eq(0)").click(function(event){

			var pwd=$("#pw").val();
			var pwch=$("#pwch").val();

			if(pwd!=pwch){
				$(this).next().html("<span>불일치</span>");
				return false;
			}else{
				$(this).next().html("<span>일치</span>");
				return false;
			}
			
	});
});
</script>
<style type="text/css">
span{
color:red;
}
</style>
</head>

<body>

	<h1>정보 수정</h1>
	<form action="logincontroller.jsp" method="post">
		<input type="hidden" name="command" value="updsus">
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
			<td><input type="password" name="pw" id="pw" value="<%=dto.getMypw()%>"></td>
		</tr>
		
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="pwcheck" id="pwch" value="<%=dto.getMypw()%>"><button>확인</button><span></span></td>
		</tr>
		
		<tr>
			<th>이름</th>
		<td><%=dto.getMyname()%></td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr" value="<%=dto.getMyaddr()%>"></td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="phone" value="<%=dto.getMyphone()%>"></td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td><input type="email" name="email" value="<%=dto.getMyemail()%>"></td>
		</tr>
		
		<tr>
			<th>등급</th>
		<td><%=dto.getMyrole()%></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정완료" onclick="userupd();">
				<input type="button" value="취소" onclick="usercan();">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>