<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
	
</head>
	
<body>
	<h2>JSP로 구구단 출력하기</h2>
	<%!
	//내장객체-> 나중에 설명 jsp영역과 함수의 영역은 다름
	//
	public void showGugudan(JspWriter out){
		
		try{
			out.println("<table border='1' width='700'>");
			for(int i=2; i<=9; i++){
				out.println("<tr>");
				for(int j=1; j<=9; j++){
					out.println("<td>" + i + "X" + j + "=" + (i*j) + "</td>");								
				}
				out.println("</tr>");
			}
			out.println("</table>");
		}
		catch(Exception e){}
	}
%>
	<h3>구구단 출력1 - 메소드로 구현</h3>
	<%
		showGugudan(out);
	%>
	
	<script>
		
	</script>
	
	<h3>구구단 출력2 - 표현식으로 구현</h3>
	<table border="1" width="700">

			<%for(int i=2; i<=9; i++){ %>
			<tr>
				<%for(int j=1; j<=9; j++){%>
					<%-- <td><% out.println(i + "X" + j + "=" + (i*j));%></td> --%>
					<td><%=i %>X<%=j %>=<%=(i*j) %></td>
				<%}%>
			</tr>
			<%}%>
	</table>
	
</body>
</html>