<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUploadMain.jsp</title>
<script>
	var isValidate = function(frm){
		
		if(frm.name.value == ""){
			alert("이름을 입력하세요");
			frm.name.focus();
			return false;
		}
		if(frm.title.value == ""){
			alert("제목을 입력하세요");
			frm.title.focus();
			return false;
		}
 		if(frm.chumFile1.value == ""){
			alert("첨부파일 1은 필수입력입니다.");
			frm.chumFile1.focus();
			return false;
		} 
	}
</script>
</head>
	
<body>
	<h2>파일 업로드 폼(DB처리X)</h2>
	
	<h4 style="color:red;">${errorMessage }</h4>
	
	<a href="FileList.jsp">파일목록 바로가기</a>
	
	<h3>파일업로드1 - 원본 파일명 그대로 업로드</h3>
	<form enctype="multipart/form-data" method="post" action="UploadProc.jsp" name="fileFrm"
			onsubmit="return isValidate(this)">
		작성자 : <input type="text" name="name" value="정우성" />
		<br />
		제목 : <input type="text" name="title" value="12" />
		<br />
		관심사항 : 
			<input type="checkbox" name="inter" 
				value="정치" checked="checked" />정치
			<input type="checkbox" name="inter" 
				value="경제" checked="checked" />경제
			<input type="checkbox" name="inter" 
				value="문화" />문화
		<br />
		첨부파일1 :
			<input type="file" name='chumFile1' />
		<br />
		첨부파일2 : 
			<input type="file" name="chumFile2" />
		<br />
		<input type="submit" value="파일업로드GoGo" />
	</form>
	
	<h3>파일업로드2 - 원본 파일명을 숫자로 변경 후 업로드</h3>
		<form enctype="multipart/form-data" method="post" action="UploadProc2.jsp"
			name="fileFrm2" onsubmit="return isValidate(this)">
		작성자 : <input type="text" name="name" value="정우성" />
		<br />
		제목 : <input type="text" name="title" value="12" />
		<br />
		관심사항 : 
			<input type="checkbox" name="inter" 
				value="정치" checked="checked" />정치
			<input type="checkbox" name="inter" 
				value="경제" checked="checked" />경제
			<input type="checkbox" name="inter" 
				value="문화" />문화
		<br />
		첨부파일1 :
			<input type="file" name='chumFile1' />
		<br />
		<input type="submit" value="파일업로드GoGo" />
	</form>

	<h3>파일업로드3 - DB처리 후 다운로드</h3>
		<form enctype="multipart/form-data" method="post" action="UploadProc3.jsp"
			name="fileFrm3" onsubmit="return isValidate(this)">
		작성자 : <input type="text" name="name" value="정우성" />
		<br />
		제목 : <input type="text" name="title" value="12" />
		<br />
		관심사항 : 
			<input type="checkbox" name="inter" 
				value="정치" checked="checked" />정치
			<input type="checkbox" name="inter" 
				value="경제" checked="checked" />경제
			<input type="checkbox" name="inter" 
				value="문화" />문화
		<br />
		첨부파일1 :
			<input type="file" name='chumFile1' />
		<br />
		<input type="submit" value="파일업로드GoGo" />
	</form>
	
</body>
</html>