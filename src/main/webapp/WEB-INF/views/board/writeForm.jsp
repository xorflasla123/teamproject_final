<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0]
		console.log(file)
		if (file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file); // 읽고
			reader.onload = function(e) { // 로드한 값을 표현한다.
				$('#preview').attr('src', e.target.result);
			}
		}
	}
	function writeChk() {
		var title = document.getElementById("title").value;
		if (title != "") {
			fo.submit()
		} else {
			alert('제목을 입력해주세요.');
		}
	}
</script>
<style type="text/css">
#content {
	resize: none;
}

.writeform {
	padding-top: 50px;
	height: 730px;
}

.writeform b {
	font-size: 18px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<hr>
	<div class="main" style="height: 830px; width: 900px; padding-left: 300px;">
		<h1 style="padding-top: 50px; padding-right: 300px;">게시글 작성</h1>
		<form id="fo" class="writeform" action="${contextPath}/board/writesave" enctype="multipart/form-data" method="post">
			<table border="1">
				<tr>
					<td><b>작성자</b></td>
					<td><input style="height: 25px; width: 300px;" type="text" name="userId" value="${ loginUser }" readonly></td>
					<td><b>카테고리</b></td>
					<td>
						<select size="1" name="boardLocal" style="height: 30px;">
							<option value="서울" <c:if test="${boardLocal == '서울'}">selected</c:if>>서울</option>
							<option value="경기/인천" <c:if test="${boardLocal == '경기/인천'}">selected</c:if>>경기/인천</option>
							<option value="강원" <c:if test="${boardLocal == '강원'}">selected</c:if>>강원</option>
							<option value="충청/대전" <c:if test="${boardLocal == '충청/대전'}">selected</c:if>>충청/대전</option>
							<option value="경상/부산" <c:if test="${boardLocal == '경상/부산'}">selected</c:if>>경상/부산</option>
							<option value="전라/광주" <c:if test="${boardLocal == '전라/광주'}">selected</c:if>>전라/광주</option>
							<option value="제주" <c:if test="${boardLocal == '제주'}">selected</c:if>>제주</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><b>제목</b></td>
					<td colspan="3"><input style="height: 25px; width: 500px;" type="text" name="title" id="title" placeholder="제목" style="width: 400px;"></td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td colspan="3"><textarea rows="20" cols="75" id="content" name="content"></textarea></td>
				</tr>
				<tr>
					<td><b>이미지 첨부</b></td>
					<td><input type="file" name="boardPicture" onchange="readURL(this)" /></td>
					<td colspan="2"><img style="padding-top: 5px;" id="preview" alt="선택된 이미지가 없습니다." src="#" width="100" height="100" /></td>
				<tr>
					<td colspan="4"><input type="button" value="글쓰기" onclick="writeChk()">
					<input type="button" value="목록" onclick="location.href='${contextPath}/board/main'"></td>
				</tr>
			</table>
		</form>
	</div>
	<hr>
	<c:import url="../default/footer.jsp" />
</body>
</html>