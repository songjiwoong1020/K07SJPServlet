<%@page import="java.io.File"%>
<%@page import="sun.rmi.runtime.NewThreadAction"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");

String saveDirectory = application.getRealPath("/Upload");

int maxPostSize = 1024 * 5000;

String encoding = "UTF-8";

FileRenamePolicy policy = new DefaultFileRenamePolicy();

MultipartRequest mr = null;
String name = null;//이름
String title = null;//제목
StringBuffer inter = new StringBuffer();//관심사항

File oldFile = null;
File newFile = null;
String realFileName = null;

try{
	mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
	
	/*
		서버에 저장된 파일명 변경하기
		: 객체를 생성함과 동시에 업로드는 완료되므로 이미 저장된
		파일에 대해 파일명을 변경한다.
		이유는 한글이나 다른 언어 즉 유니코드로 구성된 파일명은
		서버에서 문제가 될 수지가 있으므로 숫자 혹은 영문으로
		변경하는것이 좋다.
	*/
	//////////////추가부분 start/////////////////
	
	//서버에 저장된 파일명 가져오기
	String fileName = mr.getFilesystemName("chumFile1");
	
	//파일명을 변경 하기 위해 현재시간을 가져온다.
	/*
		아래 서식문자중 대문자 S는 초를 1/1000단위로 가져옴.(0~999)
	*/
	String nowTime = new SimpleDateFormat("yyyy_mm_dd_H_m_s_S").format(new Date());
	
	//파일의 확장자를 가져옴
	/*
		파일명에 닷(.)이 2개이상 포함 될 수 있으므로 lastIndexOf()로
		마지막에 있는 점을 찾아온다. 해당 인덱스를 통해 확장자를 가져온다.
	*/
	int idx = -1;
	
	idx = fileName.lastIndexOf(".");
	realFileName = nowTime + fileName.substring(idx, fileName.length());
	
	/*
	서버의 물리적 경로와 생성된 파일명을 통해 File객체를 생성한다.
	※파일객체.separator : 파일경로를 나타낼때 윈도우는 역슬러쉬(\)
		리눅스는 슬러쉬(/)를 사용하게 되는데 OS에 따라 구분기호를
		자동으로 변환하여 설정 해주는 역할을 한다.
	*/
	oldFile = new File(saveDirectory + oldFile.separator + fileName);
	newFile = new File(saveDirectory + oldFile.separator + realFileName);
	
	//저장된 파일명을 변경한다.
	oldFile.renameTo(newFile);
	////////////////추가부분 end//////////////////////////
	
	name = mr.getParameter("name");
	title = mr.getParameter("title");
	String[] interArr = mr.getParameterValues("inter");
	for(String s : interArr){
		inter.append(s + "&nbsp;");
	}
}
catch(Exception e){
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UploadProc.jsp</title>
	
</head>
	
<body>

	<h2>파일 업로드 결과</h2>
	<ul>
		<li>
			작성자 : <%=name %>
		</li>
		<li>
			제목 : <%=title %>
		</li>
		<li>
			관심사항 : <%=inter %>
		</li>
	</ul>
	<h2>첨부파일1</h2>
	<ul>
		<li>원본파일명 :
		<%=mr.getOriginalFileName("chumFile1") %></li>
		<li>서버에저장된파일명(변경전) :
	 	<%=mr.getFilesystemName("chumFile1") %></li>
		<li>서버에저장된파일명(변경후) :
	 	<%=realFileName %></li>
		<li>컨텐츠타입 :
		<%=mr.getContentType("chumFile1") %></li>
		<li>파일크기 :
		<%=(int)Math.ceil(newFile.length() / 1024.0) %> kb</li>
		<li>이미지표현 :
		<img src="../Upload/<%=realFileName %>" width="200" /></li>
	</ul>
	
	
	<a href="FileList.jsp">파일목록 바로가기</a>
</body>
</html>























