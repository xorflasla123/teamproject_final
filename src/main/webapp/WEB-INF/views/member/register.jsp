<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath }/resources/daumPost_js/daumpost.js"></script>

<script>
	function id22() {
		console.log('아이디 중복확인')
		var id1 = $("#id").val();
		$.ajax({
			url : "${contextPath }/member/id_chk",
			type : "POST",
			data : JSON.stringify(id1), //보낼 데이터(form을 json타입으로 변경)
			contentType : "application/json; charset=utf-8", //보낼 데이터 타입 지정 
			dataType : "json", //리턴 type
			success : function(data) {
				console.log(data)
				if (data == 0) {
					alert('중복된 아이디입니다')
					$('#id').val('');
				} else {
					alert('사용가능한 아이디입니다')
				}
			},
			error : function() {
				alert('문제 발생했어요')
			}

		})
	}
</script>

<script>
	function myFocus() {
		console.log('비밀번호 확인 실행')
		pwd = document.getElementById("pwd");
		chkPw = document.getElementById("chkPw");
		if (pwd.value == chkPw.value) {
			alert('비밀번호가 일치합니다')
		} else {
			alert('비밀번호가 틀렸습니다')
			chkPw.value = ""
			chkPw.focus()
		}
	}
</script>
<script>
	function register() {
		possRegi = document.getElementById("possRegi").value;
		chkPw = document.getElementById("chkPw");
		pwd = document.getElementById("pwd");
		addr1 = $("#addr1").val()
		addr2 = $("#addr2").val()
		addr3 = $("#addr3").val()
		addr = addr1 + "/" + addr2 + "/" + addr3
		$("#addr3").val(addr)
		if (chkPw.value != pwd.value) {
			alert('비밀번호를 다시 확인해주세요')
			chkPw.focus()
		} else {
			if (possRegi != "") {
				alert('회원가입이 완료되었습니다')
				fo.submit()
			} else {
				alert('이메일 인증해주세요')
			}
		}
	}
</script>
<script>
	function email22() {
		var email = $("#email").val();
		console.log(email)
		$.ajax({
			url : "${contextPath }/auth",
			type : "POST",
			data : JSON.stringify(email), //보낼 데이터(form을 json타입으로 변경)
			contentType : "application/json; charset=utf-8", //보낼 데이터 타입 지정 
			dataType : "json", //리턴 type
			success : function(result) {
				alert('인증번호가 전송되었습니다')
				$("#userkey").val(result);

			},
			error : function() {
				alert('문제 발생했어요')
			}
		})

		<!--location.href = "${contextPath }/auth_form?email=" + email1-->
	}
</script>
<script>
	function authNum1() {
		console.log('authNum 실행')
		an = document.getElementById("auth").value;
		userkey = document.getElementById("userkey").value;
		if (an == userkey) {
			alert('인증성공')
			$("#possRegi").val("success");
		} else {
			alert('인증 실패')
		}
	}
</script>

<style type="text/css">
.registertable tr {
	height: 50px;
}

.registertable input {
	height: 30px;
}
</style>
</head>
<body>

	<c:import url="../default/header.jsp" />
	<div class="wrap"
		style="width: 550px; height: 762px; margin: 0 auto; padding-top: 150px;">
		<form id="fo" action="register" method="post">
			<table class="registertable">
				<tr>
					<td colspan="3" align="center"
						style="font-size: 25px; padding-bottom: 40px;"><h1>회원가입</h1></td>
				</tr>
				<tr>
					<td style="width: 150px; font-size: 20px; text-align: center;">아이디
						:</td>
					<td style="width: 250px;"><input size="35" type="text"
						name="id" id="id" placeholder="아이디"></td>
					<td><input type="button" onclick="id22()" value="중복인증"></td>
				</tr>
				<tr>
					<td style="font-size: 20px; text-align: center;">비밀번호 :</td>
					<td><input size="35" type="password" name="pwd" id="pwd"
						placeholder="비밀번호"></td>
					<td></td>
				</tr>
				<tr>
					<td style="font-size: 20px; text-align: center;">비밀번호 확인 :</td>
					<td><input size="35" type="password" name="chkPw" id="chkPw"
						onchange="myFocus()" placeholder="비밀번호 확인"></td>
				</tr>
				<tr>
					<td style="font-size: 20px; text-align: center;">이름 :</td>
					<td><input size="35" type="text" name="name" placeholder="이름"></td>
					<td></td>
				</tr>
				<tr>
					<td style="font-size: 20px; text-align: center;">이메일 :</td>
					<td><input size="35" type="text" name="email" id="email"
						placeholder="이메일"></td>
					<td><input type="button" onclick="email22()" value="인증하기"></td>
				</tr>
				<tr>
					<td></td>
					<td><input size="35" type="text" id="auth" name="authNum"
						placeholder="인증번호를 입력해주세요"></td>
					<td><input type="button" onclick="authNum1()" value="확인"></td>
				</tr>
				<tr>
					<td style="font-size: 20px; text-align: center;">전화번호 :</td>
					<td><input size="35" type="text" name="num" placeholder="휴대전화"></td>
					<td></td>
				</tr>
				<tr>
					<td style="font-size: 20px; text-align: center;">우편번호 :</td>
					<td><input size="35" type="text" id="addr1" name="addr1"
						placeholder="우편번호"></td>
					<td><input type="button" onclick="daumPost()" value="주소찾기"></td>

				</tr>
				<tr>
					<td style="font-size: 20px; text-align: center;">주 소 :</td>
					<td><input size="35" type="text" id="addr2" placeholder="주 소"></td>
					<td></td>
				</tr>
				<tr>
					<td style="font-size: 20px; text-align: center;">상세주소 :</td>

					<td><input size="35" type="text" id="addr3" name="addr"
						placeholder="상 세 주 소"></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="3" align="center"><input type="button"
						onclick="register()" name="join" value="가입"> <input
						type="button"
						onclick="location.href='${contextPath}/member/login'" value="취소">
					</td>
				</tr>
			</table>
			<input type="hidden" id="userkey" value=""> <input
				type="hidden" id="possRegi" value="">
		</form>
	</div>
	<hr>
	<c:import url="../default/footer.jsp" />

</body>
</html>