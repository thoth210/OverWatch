<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 추가  -->
<%
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.login.dto.*" %>
<%@ page import="com.login.dao.*" %>
<%@ page import="java.util.List" %>
<!-- 끝 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   /*
   controller 7단계
   1. command 값 받기
   2. dao 객체 생성
   3. command 확인
   4. 파라미터 받기
   5. dao. 메서드 실행(결과 리턴)
   6. 스코프에 객체를 담기
   7. 페이지 이동
   */
   
   //1. command 값 받기
   String command = request.getParameter("command");
   
   //2. dao 객체 생성
   MyLoginDao dao = new MyLoginDao();
   
   //3. command 확인
   if(command.equals("login")){
      
      //4.파라미터 받기
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      
      //5. dao 메서드 실행
      MyLoginDto dto = dao.selectLogin(id, pw);
      
      if(dto.getMyid() != null){
         //6. 스코프에 객체 담기
         session.setAttribute("dto", dto);
         //session.setMaxInactiveInterval(10*60);   //10분동안 활동이 없으면 session에 "dto"가 사라짐.
         
         //7. 페이지 이동
         if(dto.getMyrole().equals("ADMIN")){
            response.sendRedirect("adminmain.jsp");
            
         	} else if(dto.getMyrole().equals("USER")){
            	response.sendRedirect("usermain.jsp");
            
         	} else if(dto.getMyrole().equals("MANAGER")){
            	response.sendRedirect("managermain.jsp");
                	 
         	}else{
        	 
         	}
         
    	 }else{
%>   
         <script type="text/javascript">
            alert("아이디와 비밀번호를 다시 확인해 주세요!!");
            location.href="index.jsp";
         </script>      
<% 
     	 }
   }else if(command.equals("logout")){
	   //session 정보 삭제
	   session.invalidate();
	   response.sendRedirect("index.jsp");
	   
   }else if(command.equals("userlistall")){
	   //회원정보조회(all)
	   List<MyLoginDto> list =dao.selectAll();
	   request.setAttribute("list", list);
	   pageContext.forward("userlistall.jsp");
   
   }else if(command.equals("userlisten")){
	   //회원정보조회(en)
	   List<MyLoginDto> list=dao.selectEnabled();
	   request.setAttribute("list", list);
	   pageContext.forward("userlisten.jsp");
   
   }else if(command.equals("updateroleform")){
	   //select one (update 하기 위해 )
	   int myno = Integer.parseInt(request.getParameter("no"));
	   MyLoginDto dto = dao.selectUser(myno);
	   request.setAttribute("selectone", dto);
	   pageContext.forward("updateroleform.jsp");
	   
   }else if(command.equals("updaterole")){
	   //회원등급 조정
	   int myno = Integer.parseInt(request.getParameter("no"));
	   String myrole = request.getParameter("role");
	   int res=dao.updateRole(myno, myrole);
   	
	   if(res>0){
%>		   
	<script type="text/javascript">
		alert("회원등급 조정 성공");
		location.href="logincontroller.jsp?command=userlisten";
	</script>
<% 
	   }else{
%>
	<script type="text/javascript">
		alert("회원등급 조정 실패");
		location.href="logincontroller.jsp?command=updateroleform&no=<%=myno%>";
	</script>
<%
	   }
   }else if(command.equals("resistform")){
	   //회원가입
	   response.sendRedirect("resistform.jsp");
  
   }else if(command.equals("idchk")){
	   //id체크
	   String myid = request.getParameter("id");
   	   MyLoginDto dto= dao.idChk(myid);
   	   boolean idnotused=true;
   	   
   	   if(dto.getMyid() !=null){
   		   idnotused=false;
   	   }
   	   response.sendRedirect("idchk.jsp?idnotused="+idnotused);
 
   }else if(command.equals("insertuser")){
	   String myid = request.getParameter("id");
	   String mypw = request.getParameter("pw");
	   String myname = request.getParameter("name");
	   String myaddr = request.getParameter("addr");
	   String myphone = request.getParameter("phone");
	   String myemail = request.getParameter("email");
 		
		MyLoginDto dto= new MyLoginDto(myid,mypw,myname,myaddr,myphone,myemail);
		int res=dao.insertUser(dto);
		if(res>0){
%>		   
			   	<script type="text/javascript">
			   		alert("회원가입 성공");
			   		location.href="index.jsp";
			   	</script>
<% 
		}else{
%>
			   	<script type="text/javascript">
			   		alert("회원가입 실패");
			   		location.href="logincontroller.jsp?command=resistform";
			   	</script>	
<% 
		}
	}else if(command.equals("userinfo")){
		
			  int myno = Integer.parseInt(request.getParameter("no"));
			   MyLoginDto dto = dao.selectUser(myno);
			   request.setAttribute("selectone", dto);
			   pageContext.forward("userinfo.jsp");
	
	}else if(command.equals("updateform")){
		  	int myno = Integer.parseInt(request.getParameter("no"));
		  	 MyLoginDto dto = dao.selectUser(myno);
			   request.setAttribute("updateform", dto);
			   pageContext.forward("updateform.jsp");
	
	}else if(command.equals("updsus")){
			int myno=Integer.parseInt(request.getParameter("no"));
			String pw=request.getParameter("pw");
			String addr=request.getParameter("addr");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			int res=dao.update(new MyLoginDto(myno,pw,addr,phone,email));
			
		if(res>0){
%>		
			<script type="text/javascript">
			alert("회원정보 수정 성공")
			location.href="logincontroller.jsp?command=userinfo&no=<%=myno%>";
			</script>
<%		
			}else{
%>	
			<script type="text/javascript">
			alert("회원정보 수정 실패")
			location.href="logincontroller.jsp?command=userinfo&no=<%=myno%>";
			</script>
<% 				
		}   
	
	}else if(command.equals("userdelete")){
		int myno=Integer.parseInt(request.getParameter("no"));
		int res=dao.userdel(myno);
		
		if(res>0){
%>
		<script type="text/javascript">
		alert("회원 탈퇴 성공")
		location.href="index.jsp";
		</script>
<% 			
		}else{
%>	
		<script type="text/javascript">
		alert("회원 탈퇴 실패")
		location.href="logincontroller.jsp?command=userinfo&no=<%=myno%>";
		</script>
<%	
		}		
	}	 
%>	
</body>
</html>