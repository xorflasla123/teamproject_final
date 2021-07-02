<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<style>
#login_box * {
	margin: 0;
	padding: 0;
}

ul {
	list-style-type: none;
}

.body {
	font-family: "맑은고딕", "돋움";
	font-size: 12px;
	color: 444444;
}

#login_box {
	position: absolute;
	top: 10%;
	left: 30%;
	margin-top: -80px;
	margin-left: -80px;
	text-align: center;
	margin: auto;
	padding-top: 100px;
	width: 420px;
	height: 450px;
	margin: 80px;
	padding: 80px;
}

h1 {
	font-family: "Arial";
	font-size: 35px;
	margin-bottom: 10px;
}

#login_box input {
	width: 370px;
	height: 45px;
	font-size: 17px;
}

#id_pass {
	display: inline-block;
	vertical-align: top;
}

#id_pass span {
	display: inline-block;
	width: 50px;
}

#pass {
	margin-top: 3px;
}

#login_btn button {
	font-size: 20px;
	margin-left: 5px;
	padding: 12px;
	border-radius: 5px;
	width: 340px;
	height: 45px;
}

#btns {
	margin: 50px 35px 0 0;
	text-decoration: underline;
}

#btns li {
	margin-left: 30px;
	display: inline;
	font-size: 15px;
}

#chk_login {
	display: inline-block;
	margin: 20px 0px 0px;
	margin-bottom: 10px;
	font-size: 18px;
	text-align: left;
}

#chk_loin {
	font-size: 16px;
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
}

#login_box li {
	padding-top: 20px;
}
</style>

</head>
<body style="background-color: #fff7e6;">

	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" />

<<<<<<< HEAD
	<div class="wrap body" align="center"

		style="width: 100%; height: 900px; background-image: url('${contextPath }/resources/image/mainN.jpg');">



=======
	<div class="wrap body" align="center" style="width: 100%; height: 900px; background-image: url('${contextPath }/resources/image/mainN.jpg');">
>>>>>>> 9a2cc95649b1f3e597a0ede36b31aa8fa7be7727
		<header>
			<form action="${contextPath }/member/pwd_check" method="post">
				<div id="login_box" style="padding-left: 60px;">
					<h1>비밀번호 찾기</h1>
					<br><br><br><br><br>
					<input type="text" name="email" placeholder="등록한 이메일 입력"><br><br><br>
					<input type="submit" value="확 인">
					<ul id="btns">
						<li><a href="register_form">회원 가입 </a></li>
						<li><a href="${contextPath }/member/forgotId">아이디 찾기 </a></li>
						<li><a href="${contextPath }/member/forgotPwd">비밀번호 찾기 </a></li>
					</ul>
				</div>
			</form>
			<!-- login_box -->
		</header>
	</div><hr>
	<c:import url="../default/footer.jsp" />
</body>
</html>
