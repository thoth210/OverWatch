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
<title>idchk</title>

<script type="text/javascript">

onload=function(){
	var id = opener.document.getElementsByName("id")[0].value;
	document.getElementsByName("id")[0].value=id;
}

function confirm(bool){
	if(bool=="true"){
		opener.document.getElementsByName("pw")[0].focus();
		opener.document.getElementsByName("id")[0].title="y";
	}else{
		opener.document.getElementsByName("id")[0].focus();
	}
	self.close();
}
</script>


</head>
<%
	String idnotused = request.getParameter("idnotused");
%>
<body>
	<table border="1">
		<tr>
			<td><input type="text" name="id"/></td>
		</tr>
		
		<tr>
			<td><%=idnotused.equals("true")?"아이디 생성 가능":"중복된 아이디 존재" %></td>
		</tr>		
		<tr>
			<td><input type="button" value="확인" onclick="confirm('<%=idnotused %>')"></td>
		</tr>
	</table>
</body>
</html>