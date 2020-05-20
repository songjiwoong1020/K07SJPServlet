<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
//선언부
	public int getBeasu(int min, int max, int num){
		
		int total=0;
		for(int i=min; i<=max; i++){
			if(i%num == 0){
				total += i;
			}
		}
	return total;
	}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MethodDefine.jsp</title>
	
</head>
	
<body>
	<h2>선언부에서 메소드 정의</h2>
	<h3>스크립트렛에서 결과값 출력</h3>
	<%
	/*
	연습문제] 1부터 100사이의 숫자중 3의 배수의 합을
		반환하는 함수를 선언 후 결과를 출력하시오.
		함수명 : getBaesu()
	*/
		int hapResult = getBeasu(1, 100, 3);
		out.println("1~100사이의 3의 배수의 합:" + hapResult);
	%>
	<h3>표현식에서 결과값 출력</h3>
	1~200사이의 숫자중 5의 배수의 합은?
		<%=getBeasu(1, 200, 5) %>
		
		<%=getBeasu(1, 10, 1) %>
		
</body>
</html>