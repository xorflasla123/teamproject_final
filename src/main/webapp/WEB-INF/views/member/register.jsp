<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--  <script src="${contextPath }/resources/daumPost_js/daumpost.js"></script>-->
<script>
function myFocus(){
	console.log('비밀번호 확인 실행')
	pwd = document.getElementById("pwd");
		chkPw = document.getElementById("chkPw");
		if(pwd.value== chkPw.value){
			alert('비밀번호가 일치합니다')
		}else{
			alert('비밀번호가 틀렸습니다')
			chkPw.value =""
				chkPw.focus()
		}
}
</script>
<script>

 function register(){
	 possRegi = document.getElementById("possRegi").value;
	 chkPw = document.getElementById("chkPw");
	 pwd = document.getElementById("pwd");
	 if(chkPw.value !=pwd.value){
		 alert('비밀번호를 다시 확인해주세요')
		 chkPw.focus()
	 }else{
		 if(possRegi != ""){
			 fo.submit()
		 }else{
			 alert('이메일 인증해주세요')
		 }
	 }
	 
   
 }   
</script>
<script>
function email22(){
	var email = $("#email").val();
	console.log(email)
	$.ajax({
	   url : "${contextPath }/auth", type:"POST",
	   data : JSON.stringify(email), //보낼 데이터(form을 json타입으로 변경)
	   contentType : "application/json; charset=utf-8", //보낼 데이터 타입 지정 
	   dataType : "json", //리턴 type
	   success:function(result){
		   alert('인증번호가 전송되었습니다')
		   $("#userkey").val(result);
		  
	   }, error: function(){
		   alert('문제 발생했어요')
	   }
	})
	
	
	<!--location.href="${contextPath }/auth_form?email=" + email1-->
}
</script>
<script> 
function authNum1(){
	console.log('authNum 실행')
	an = document.getElementById("auth").value;
	userkey = document.getElementById("userkey").value;
	if(an == userkey){
		alert('인증성공')
		$("#possRegi").val("success");
	}else{
		alert('인증 실패')
	}
}
</script>
</head>
<body>
<!--<c:import url="../default/header.jsp" />-->
<div class="wrap" style="width:300px; margin: 0 auto;" >
<form id="fo" action="register" method="post">
  <table border="1" style="width:300px;">
  <tr><td>
  <input size="30" type="text" name="id" placeholder="아이디"> <!-- name과 dto 이름과 같아야 함  -->
   <input size="30" type="password" name="pwd" id="pwd" placeholder="비밀번호">
  <input size="30" type="password" name="chkPw" id="chkPw" onchange="myFocus()"placeholder="비밀번호 확인">
  <input size="30" type="text" name="name" placeholder="이름">
    <input size="30" type="text" name="email" id="email" placeholder="이메일">
    <input type="button" onclick="email22()" value="인증하기"><br>
    <input type="text" id = "auth" name = "authNum" placeholder="인증번호를 입력해주세요" >
<input type="button" onclick="authNum1()" value="확인">
<input type="hidden" id="userkey" value="">
<input type="hidden" id="possRegi" value="">
    
     
  <input size="30" type="text" name="num" placeholder="휴대전화">
 <input type="text" id="addr" name="addr" placeholder="주 소"><br>
  <input type="button" onclick="daumPost()" value="주소찾기"><br>

  <input type="button" onclick="register()" name="join" value="가입" >
 <input type="button" onclick="location.href='history.back()'" value="취소" >
  </td>
  </tr>
  </table>
</form>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>