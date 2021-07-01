<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> 
	function authNum(){
		an = document.getElementById("auth").value;
		userkey = document.getElementById("userkey").value;
		if(an == userkey){
			alert('인증성공')
			
			location.href='member/possRegi'
				window.close();
		}else{
			alert('인증 실패')
		}
	}
</script>
</head>
<body>
	<input type="text" id = "auth" name = "authNum" placeholder="인증번호를 입력해주세요" >
	<input type="button" onclick="authNum()" value="확인">
	<input type="hidden" id="userkey" value="${userkey}">
</body>
</html>