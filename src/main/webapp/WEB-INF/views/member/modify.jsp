<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#moditable th, #moditable td {
	font-size: 20px;
	margin: auto;
	text-align: center;
    vertical-align:middle;
}
#moditable{
	align: center;
	vertical-align:middle;
	margin-top: 240px;
	margin-left: 15%;
	margin-right: 15%;
	width: 70%;
}
 .wrap {
	width: 1300px;
	margin: auto;
	margin-top: 110px;
	font-size: 20px;

}

input {
	width: 190px;
	height: 45px;

}

#moditable td input {
	height: 37px;
	width: 270px;
	font-size: 22px;
}

#button1 button{
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

td input {
	height: 37px;
	width: 230px;
	font-size: 24px;
}

button {
	font-size: 18px;
	padding: 12px;
	border-radius: 2px;
	width: 95px;
	height: 45px;
	align: center;

}
</style>
</head>
<body style="background-color: #fff7e6;">
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" />
	
	<div class=container>
		<div style="width: auto; margin: 0 auto;">
			<h1 style="position: absolute; top: 150px; left: 770px;">개인정보 수정</h1>
			<br>
			<form id="modi" action="modify" method="post">
				<table class="table table-striped" id="moditable"
					style="width: 60%; height: 500px;">

					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" value="${info.id}" readonly></td>
					</tr>

					<tr>
						<th>비밀번호</th>
						<td><input type="text" name="pwd" value="${info.pwd}"></td>
					</tr>

					<tr>
						<th>이 름</th>
						<td><input type="text" name="name" value="${info.name}"
							readonly></td>
					</tr>

					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" value="${info.email }"></td>
					</tr>

					<tr>
						<th>전화번호</th>
						<td><input type="text" name="num" value="${info.num }"></td>
					</tr>

					<tr>
						<th>주 소</th>
						<td style="text-align: center;"><input type="text"
							name="addr" value="${info.addr }" placeholder="우편번호"><br>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button id="button1" type="submit">저 장</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>