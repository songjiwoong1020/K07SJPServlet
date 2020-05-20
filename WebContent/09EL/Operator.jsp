<%@page import="java.util.Vector"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Operator.jsp</title>
	
</head>
	
<body>
	<h2>EL의 연산자들</h2>
	
	<h3>EL에서의 null연산</h3>
	<%--
	int a = null + 10; <- null과의 연산이므로 에러 발생됨 
	--%>
	
	\${null + 10 } : ${null + 10 } <br /><!-- 결과 : 10 -->
	\${param.myNumber + 10 } : ${param.myNumber + 10 } <br />
	<br />
	
	\${param.myNum > 10 } : ${param.myNum > 10 } <br />
	\${param.myNum < 10 } : ${param.myNum < 10 } <br />
	${param.myNum}  <br />
	${param.myNumber}  <br />
	
	<h3>JSTL로 EL에서 사용 할 변수 선언</h3>
	<%
	String varScriptLet = "스크립트렛 안에서 변수선언";
	%>
	
	\${varScriptLet + 100 } : ${varScriptLet + 100 } <br />
	
	<c:set var = "elVar" value = "<%=varScriptLet %>" />
	\${elVar } : ${elVar }
	
	<h3>EL변수에 값 할당</h3>
	<c:set var="fnum" value="9" />
	<c:set var="snum" value="5" />
	\${fnum = 99 } : ${fnum = 99 }
	
	<h3>EL의 산술연산자</h3>
	<ul>
		<li>\${fnum + snum } : ${fnum + snum }</li>
		<li>\${fnum / snum } : ${fnum / snum }</li>
		<li>\${fnum div snum } : ${fnum div snum }</li>
		
		<li>\${fnum % snum } : ${fnum % snum }</li>
		<li>\${fnum mod snum } : ${fnum mod snum }</li>
		
		<li>\${"100" + 100 } : ${"100" + 100 }</li>
		<li>\${"Hello~" + "EL~" } : \${"Hello~" + "EL~" }</li>
		<li>\${"일" + 2 } : \${"일" + 2 }</li>
	</ul>
	
	<%-- 뭐야 fnum snum연산결과가 이상한데 --%>
	<h3>EL의 비교연산자</h3>
	<c:set var = "fnum" value="100" />
	<c:set var = "snum" value="90" />
	<ul>
		<li>\${fnum } : ${fnum }</li>
		<li>\${snum } : ${snum }</li>
		<li>\${fnum > snum } : ${fnum > snum }</li>
		
		<li>\${100 > 90 } : ${100 > 90 }</li>
		<li>\${"JAVA" == 'JAVA' } : ${"JAVA" == 'JAVA' }</li>
		<li>\${"Java" == 'JAVA' } : ${"Java" == 'JAVA' }</li>
	</ul>
	<!-- 
	Java에서는 문자열을 비교할때 equals()메소드를 통해 비교하지만
	EL에서는 == 형태로 비교한다.
	 -->
	 
	 <h3>EL의 논리연산자</h3>
	 <ul>
	 	<li>\${5 >= 5 && 10 != 10 } :
	 			${ 5 ge 5 and 10 ne 10 }</li>
	 	<li>\${5 > 6 || 10 < 100 } :
	 			${ 5 gt 6 or 10 lt 100 }</li>
	 </ul>
	
	<h3>EL의 삼항연산자</h3>
	\${10 gt 9 ? "참이닷" : "거짓이닷" }
		: ${10 gt 9 ? "참이닷" : "거짓이닷" }	
	
	<!-- 
	null이거나 ""(빈문자열)일때
	혹은 배열인 경우 길이가 0일떄
	혹은 컬렉션인경우 size가 0일때
	true를 반환하는 연산자이다.
	 -->
	<h3>EL의 empty 연산자 : null일때 true를 반환하는 연산자</h3>
	<%
		String nullStr = null;
		String emptyStr = "";
		Integer[] lengthZero = new Integer[0];
		Collection sizeZero = new Vector();
	%>
	<c:set var="elnullStr" value="<%=nullStr %>" />
	<c:set var="elemptyStr" value="<%=emptyStr %>" />
	<c:set var="ellengthZero" value="<%=lengthZero %>" />
	<c:set var="elsizeZero" value="<%=sizeZero %>" />
	<ul>
		<li>\${empty elnullStr } : ${empty elnullStr }</li>
		<li>\${not empty elnullStr } : ${not empty elnullStr }</li>
		<li>${empty ellengthZero ? "배열크기가0임" : "배열크기가0이아님" }</li>
		<li>${not empty elsizeZero ?
			"컬렉션에 저장된 객체 있음" : "컬렉션에 저장된 객체 없음" }</li>
	</ul>
	
</body>
</html>