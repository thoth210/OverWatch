<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!--  <추가>  -->   
 <%
 	request.setCharacterEncoding("UTF-8");
 	response.setContentType("text/html; charset=UTF-8");	 
 %>
  <!-- </추가>  -->   
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>resist</title>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	function idchk(){
		var doc = document.getElementsByName("id")[0];
		open("logincontroller.jsp?command=idchk&id="+doc.value);		
	}

	function idchkconfirm(){
		var chk = document.getElementsByName("id")[0].title;
		if(chk=="0"){
			alert("아이디 중복체크를 해주세요");
			document.getElementsByName("id")[0].focus();
		}
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
	
	<h1>회원가입</h1>
	<form action="logincontroller.jsp" method="post">
		<input type="hidden" name="command" value="insertuser">
		
		<table border="1" style="height:250px; width: 500px; margin:auto;">
		
		<tr>
			<th>아이디</th>
		<td>
			<input type="text" name="id" title="n" required="required"/>
			<input type="button" value="중복체크" onclick="idchk();"/>
		</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
		<td><input type="password" name="pw" id="pw" onclick="idchkconfirm();" required="required"/></td>
		</tr>
		
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="pwcheck" id="pwch" required="required"/><button>확인</button><span></span></td>
		</tr>
		
		<tr>
			<th>이름</th>
		<td><input type="text" name="name" onclick="idchkconfirm();" required="required"/></td>
		</tr>
		
		<tr>
			<th>주소</th>
		<td><input type="text" name="addr" onclick="idchkconfirm();" required="required"/></td>
		</tr>
		
		<tr>
			<th>전화번호</th>
		<td><input type="tel" name="phone" onclick="idchkconfirm();" required="required"/></td>
		
		</tr>
		
		<tr>
			<th>이메일</th>
		<td><input type="email" name="email" onclick="idchkconfirm();" required="required"/></td>
		</tr>
		
		<tr>
			<td colspan="2"><input type="submit" value="가입"/></td>
		</tr>
		</table>
	</form>
	
</body>
</html>