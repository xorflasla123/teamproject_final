<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#infotable th, #infotable td {
	font-size: 20px;
	margin: auto;
	text-align: center;
    vertical-align:middle;
}

#infotable{
	align: center;
	vertical-align:middle;
	margin-top: 240px;
	margin-left: 15%;
	margin-right: 15%;
	width: 80%;

}
#btns button{
align:right;
font-size:19px;
    margin-left:24px;
    padding:9px;
    border-radius:4px;
     width:95px;
    height:45px;
}
h1 {
	text-align: center;
}
</style>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" />

	<div class="container">
		<div style="width: auto; margin: 0 auto;">
			<h1 style="position: absolute; top:150px; left:770px;">개인정보</h1>
			<table class="table table-striped" id="infotable"style="width: 60%; height: 500px;">
				<tr>
					<th>아이디</th>
					<td>${info.id }</td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td >${info.pwd }</td>
				</tr>

				<tr>
					<th>이 름</th>
					<td>${info.name }</td>
				</tr>

				<tr>
					<th>이메일</th>
					<td>${info.email }</td>
				</tr>

				<tr>
					<th>전화번호</th>
					<td>${info.num }</td>
				</tr>

				<tr>
					<th>주 소</th>
					<td>${info.addr }</td>
				</tr>

				<c:if test="${loginUser == info.id }">
					<tr>
						<td colspan="2" id="btns">

							<button id="delete"
								onclick="location.href='delete?id=${info.id}'">삭 제</button>
							<button id="infomodify"
								onclick="location.href='modify_form?id=${info.id}'">수 정</button>
							<button id="info" onclick="location.href='/root/index'">돌아가기</button>

						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>

</body>
</html>