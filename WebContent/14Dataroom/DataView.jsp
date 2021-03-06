<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardHead.jsp" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<body>
<div class="container">
	<jsp:include page="../common/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="../common/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<h3>자료실 - <small>View(상세보기)</small></h3>
						
			<div class="row mt-3 mr-1">
				<table class="table table-bordered">
				<colgroup>
					<col width="20%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center table-active align-middle">작성자</th>
						<td>${dto.name }</td>
						<th class="text-center table-active align-middle">작성일</th>
						<td>${dto.postdate }</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">다운로드수</th>
						<td>${dto.downcount }</td>
						<th class="text-center table-active align-middle">조회수</th>
						<td>${dto.visitcount }</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">제목</th>
						<td colspan="3">
							${dto.title }
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">내용</th>
						<td colspan="3" class="align-middle" style="height:200px;">
							<%-- 
							textarea에서 엔터키로 줄바꿈을 한 후 DB에 저장하면 \r\n으로 저장되므로,
							HTML 페이지에서 출력할 때는 <br>태그로 문자열을 변경해야 한다.
							 --%>
							${dto.content }
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">첨부파일</th>
						<td colspan="3">
						<!-- 첨부파일이 있는 경우에만 디스플레이 함. -->
							<c:if test="${not empty dto.attachedfile }">
								${dto.attachedfile }
								<a href="./Download?filename=${dto.attachedfile }&idx=${dto.idx}">
									[다운로드]
								</a>
							</c:if>
						</td>
					</tr>
				</tbody>
				</table>
				<form name="datFrm" method="post" onsubmit="return checkValidate(this);" action="dat.do"> 
					<table id="datTable" class="table table-bordered" style="margin-left: 180px;">
						<tr>
							<td>댓글 작성자</td>
							<td colspan="2">댓글 내용<button type="button" id="datButton">댓글달기</button></td>
						</tr>
						<tr>
							<td><input type="text" name="datId"/>아이디<br /><input type="text" name="datPass"/>비번</td>
							<td colspan="2"><input type="text" size="60" name="datContent"/><input type="submit"/></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="row mb-3">
				<div class="col-6">
					<button type="button" class="btn btn-secondary" 
						onclick="location.href='../DataRoom/DataPassword?idx=${param.idx}&mode=edit&nowPage=${param.nowPage }&searchColumn=${param.searchColumn}&searchWord=${param.searchWord}';">수정하기</button>
					<button type="button" class="btn btn-success" 
						onclick="location.href='../DataRoom/DataPassword?idx=${dto.idx}&mode=delete&nowPage=${param.nowPage }&searchColumn=${param.searchColumn}&searchWord=${param.searchWord}';">삭제하기</button>
				</div>
				<div class="col-6 text-right pr-5">
					<button type="button" class="btn btn-warning" onclick="location.href='./DataList?nowPage=${param.nowPage}&searchColumn=${param.searchColumn}&searchWord=${param.searchWord}';">리스트보기</button>
				</div>
				
			</div>
			
			<!-- 
			게시물삭제의 경우 로그인 된 상태이므로 해당 게시물의 일련번호만 서버로 전송하면 된다.
			이 때 hidden폼을 사용하고, JS의 submit()함수를 이용해서 폼값을 전송한다.
			해당 form태그는 HTML문서 어디든지 위치할 수 있다.
			 -->
			<form name="deleteFrm">
				<input type="hidden" name="num" value="" />
			</form>
			
		</div>
	</div>
	<jsp:include page="../common/boardBottom.jsp" />
</div>

<script>
$(function(){
	$('#datButton').click(function(){
		var test = "";
		test += "<table id='datTable' class='table table-bordered' style='margin-left: 180px;'>";
		test += "	<tr>";
		test += "		<td>댓글 작성자</td>";
		test +=	"		<td colspan='2'>댓글 내용<button type='button' id='datButton'>댓글달기</button></td>";	
		
		test += "	<tr> <td></td> <td><input type='text' size='30' /><input type='submit'/></td> </tr>";
		
		test += "	<tr>";
		test += "		<td><input type='text' />아이디<br /><input type='text' />비번</td>";
		test += "		<td colspan='2'><input type='text' size='60' /><input type='submit'/></td>";
		test += "	</tr>";
		test += "</table>";
		
		
		$('#datTable').html(test);
	});
});

function checkValidate(frm) {
	if (frm.datId.value=="") {
		alert("이름을 입력해주세요.");
		frm.datId.focus();
		return false;
	}
	if (frm.datPass.value=="") {
		alert("비밀번호를 입력해주세요.");
		frm.datPass.focus();
		return false;
	}
	if (frm.datContent.value=="") {
		alert("내용을 입력해주세요.");
		frm.datContent.focus();
		return false;
	}
}
</script>

</body>

</html>

<!-- 
	<i class='fas fa-edit' style='font-size:20px'></i>
	<i class='fa fa-cogs' style='font-size:20px'></i>
	<i class='fas fa-sign-in-alt' style='font-size:20px'></i>
	<i class='fas fa-sign-out-alt' style='font-size:20px'></i>
	<i class='far fa-edit' style='font-size:20px'></i>
	<i class='fas fa-id-card-alt' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-pen' style='font-size:20px'></i>
	<i class='fas fa-pen-alt' style='font-size:20px'></i>
	<i class='fas fa-pen-fancy' style='font-size:20px'></i>
	<i class='fas fa-pen-nib' style='font-size:20px'></i>
	<i class='fas fa-pen-square' style='font-size:20px'></i>
	<i class='fas fa-pencil-alt' style='font-size:20px'></i>
	<i class='fas fa-pencil-ruler' style='font-size:20px'></i>
	<i class='fa fa-cog' style='font-size:20px'></i>
	아~~~~힘들다...ㅋ
 -->