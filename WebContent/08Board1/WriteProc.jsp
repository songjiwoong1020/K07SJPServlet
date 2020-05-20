<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/isLogin.jsp" %>
<%
//out.println("제목:" + request.getParameter("title"));
//out.println("내용:" + request.getParameter("content"));
request.setCharacterEncoding("UTF-8");

//폼값전송받기
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼값을 DTO객체에 저장
BbsDTO dto = new BbsDTO();
dto.setTitle(title);
dto.setContent(content);
//세션영역에 저장된 회원인증정보를 가져와서 저장.(오브젝트로 저장되있으므로 toString()로 String로만들어줌)
dto.setId(session.getAttribute("USER_ID").toString());

//DAO객체 생성시 application내장객체를 인자로 전달
BbsDAO dao = new BbsDAO(application);

//사용자의 입력값을 DTO객체에 저장 후 파라미터로 전달
int affected = dao.insertWrite(dto);

if(affected == 1){
	//글쓰기에 성공했을때
	response.sendRedirect("BoardList.jsp");
} else {
	//글쓰기에 실패했을때...
%>
	<script>
		alert("글쓰기에 실패하였습니다.");
		history.go(-1);
	</script>
<%
}
%>
