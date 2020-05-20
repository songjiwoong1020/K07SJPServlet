<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>

<style>

	input{
	    border: 1px solid black; background-color: white;
	}
	input:hover{
	    background-color: #e5e5e5;
	}
	div{
	    padding:40px;
	}
       
</style>


	
</head>
	
<body>

<% 
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String em = request.getParameter("em");
String se = request.getParameter("se");

%>
<script>
function end(){
	alert("<%=id %>님 환영");
	window.opener.location.href = "http://www.ikosmo.co.kr/"
	//window.open("http://www.ikosmo.co.kr/",
    //        "",
    //"");
	self.close();
}
</script>
<div>
	<form action="./RegiStep02.html" name="first">
		<table>
		    <tr>
		        <td>아이디</td>
		        <td><%=id %></td>
		    </tr>
		    <tr>
		        <td><br/></td>
		    </tr>
		    <tr>
		        <td>비밀번호</td>
		        <td><%=pw %></td>
		    </tr>
		    <tr>
		        <td><br/></td>
		    </tr>
		    <tr>
		        <td>이메일</td>
		        <td><%=em %></td>
		    </tr>
		    <tr>
		        <td><br/></td>
		    </tr>
		    <tr>
		        <td>성별</td>
		        <td><%=se %></td>
		    </tr>
		    <tr>
		        <td><br/></td>
		    </tr>	    
		    <tr>
		        <td><input type="button" value="이  전" onclick="history.go(-1);"></td>
		        <td><input style="margin-left: 50px;" type="button" value="확  인" onclick="end();"></td>
		    </tr>
		</table>
	</form>
</div>


</body>
</html>