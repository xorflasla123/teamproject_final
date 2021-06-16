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
<script src="${contextPath }/resources/daumPost_js/daumpost.js"></script>
<script>


 function register(){
    addr1= $("#addr1").val()	 
    addr = addr1
    $("#addr1").val(addr)
    fo.submit()
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
   <input size="30" type="password" name="pwd" placeholder="비밀번호">
  <input size="30" type="password" name="chkPw" placeholder="비밀번호 확인">
  <input size="30" type="text" name="name" placeholder="이름">
    <input size="30" type="text" name="email" placeholder="이메일">
  <input size="30" type="text" name="num" placeholder="휴대전화">
 <input type="text" id="addr" name="addr" placeholder="주 소"><br>
  <input type="button" onclick="daumPost()" value="주소찾기"><br>

  <input type="submit"  value="가입" >
 <input type="button" onclick="location.href='history.back()'" value="취소" >
  </td>
  </tr>
  </table>
</form>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>