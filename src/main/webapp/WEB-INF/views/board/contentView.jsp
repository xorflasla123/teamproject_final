<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function alertLogin() {
		alert('로그인 먼저 하세요.')
	}

	function move(total,goodRate) {
		console.log('move 실행')
	    var elem = document.getElementById("myBar");
	    var pro = document.getElementById("myProgress");
	    var width = 1;
	    var id = setInterval(frame, 10);
	    pro.style.background = "gray";
		elem.style.background = "gray";
	    elem.style.width = 0;
	    console.log("frame-total : "+total)
	    function frame() {
	    	if(total != 0) {
	   			pro.style.background = "red";
	       		elem.style.background = "green";
	       		if(width >= goodRate) {
	       			clearInterval(id);
	       		}else {
	       			width++;
	          	    elem.style.width = width + "%";
	       		}
	    	}
		}
	}
	
	function boardCheck() {
		var boardId = $("#boardId").val();
		var userId = $("#userId").val();
		var form = {boardId:boardId, userId:userId}
		$.ajax({
			url : "boardcheck",
			type : "post",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(result) {
				if(result.like != 0) {
					$("#likeBtn").attr("src", "${contextPath }/resources/image/like.jpg");
				}else {
					$("#likeBtn").attr("src", "${contextPath }/resources/image/dislike.jpg");
				}
				var total = result.total;
				console.log("토탈 : "+total);
				if(total != 0) {
					var good = result.good;
					var bad = total - good;
					var goodRate = Math.round(((good/total)*100)*10)/10;
					var badRate = 100 - goodRate;
					$("#good").text(goodRate + "%")
					$("#bad").text(badRate + "%")
				}else {
					var goodRate = 0;
					$("#good").text(0 + "%")
					$("#bad").text(0 + "%")
				}
				move(total,goodRate);
			},
			error : function() {
				alert('문제발생')
			}
		})
	}
	
	function like() {
		var boardId = $("#boardId").val();
		var userId = $("#userId").val();
		var form = {boardId:boardId, userId:userId}
		$.ajax({
			url : "like",
			type : "post",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(result) {
				$("#like").text(result)
				var valueBtn = $("#likeBtn").attr("src");
				console.log(valueBtn)
				if(valueBtn == '${contextPath }/resources/image/like.jpg') {
					$("#likeBtn").attr("src", "${contextPath }/resources/image/dislike.jpg");
				}else {
					$("#likeBtn").attr("src", "${contextPath }/resources/image/like.jpg");
				}
			},
			error : function() {
				alert('문제발생')
			}
		})
	}
	function good() {
		var boardId = $("#boardId").val();
		var userId = $("#userId").val();
		var form = {boardId:boardId, userId:userId}
		$.ajax({
			url : "good",
			type : "post",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(result) {
				console.log('good성공')
				var total = result.total;
				if(total != 0) {
					var good = result.good;
					var bad = total - good;
					var goodRate = Math.round(((good/total)*100)*10)/10;
					var badRate = 100 - goodRate;
					$("#good").text(goodRate + "%")
					$("#bad").text(badRate + "%")
				}else {
					var goodRate = 0;
					$("#good").text(0 + "%")
					$("#bad").text(0 + "%")
				}
				move(total,goodRate);
			},
			error : function() {
				alert('문제발생')
			}
		})
	}
	function bad() {
		var boardId = $("#boardId").val();
		var userId = $("#userId").val();
		var form = {boardId:boardId, userId:userId}
		$.ajax({
			url : "bad",
			type : "post",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(result) {
				console.log('bad성공')
				var total = result.total;
				if(total != 0) {
					var bad = result.bad;
					var good = total - bad;
					var badRate = Math.round(((bad/total)*100)*10)/10;
					var goodRate = 100 - badRate;
					$("#good").text(goodRate + "%")
					$("#bad").text(badRate + "%")
				}else {
					var goodRate = 0;
					$("#good").text(0 + "%")
					$("#bad").text(0 + "%")
				}
				move(total,goodRate);
			},
			error : function() {
				alert('문제발생')
			}
		})
	}
	
	/* ---------- 댓글 ---------- */
	
	let data; //삭제를 돕기 위해 데이터 저장
	let re_id;
	var ls = '<c:out value="${loginUser}"/>';
	function rep(){ //댓글 저장
		let form={}; let arr=$("#frm").serializeArray();
		for(i=0; i<arr.length; i++){
			form[arr[i].name] = arr[i].value
		}
		console.log(ls); //null값 체크
		$.ajax({
			url: "addReply", type: "POST",
			data: JSON.stringify(form),
			contentType: "application/json; charset=utf-8",
			success: function(list){
				alert("성공적으로 댓글이 달렸습니다");
				$('textarea').val(''); //textarea 비우기
				replyData(); //화면에 보여주는 function
			}, error: function(){
				if(ls.length>=1){
					alert("내용을 적어주세요!!!");
				} else{
					alert("로그인 후 이용하실 수 있습니다.")
				}
			}
		})
	}
	
	function rerep(i){ //대댓글 저장
		let form={}; let arr=$("#re"+i).serializeArray();
		for(i=0; i<arr.length; i++){
			form[arr[i].name] = arr[i].value
		}
		//console.log(form);
		$.ajax({
			url: "addReply2", type: "POST",
			data: JSON.stringify(form),
			contentType: "application/json; charset=utf-8",
			success: function(list){
				alert("성공적으로 대댓글이 달렸습니다");
				$('textarea').val('');
				invisible();
				replyData();
			}, error: function(){
				alert("내용을 적어주세요!!!");
			}
		})
	}
	
	function remove(i){ //댓글 삭제(댓글 삭제 시 딸려있는 대댓글도 삭제되게 service쪽을 해놓음)
		$.ajax({
			url: "removeReply", type: "POST", 
			data: JSON.stringify(data[i]),
			contentType: "application/json; charset=utf-8",
			success: function(){
				alert("댓글이 삭제되었습니다.");
				replyData();
			}, error: function(){
				alert("문제 발생!!!");
			}
		})
	}
	
	function replyData(){ //댓글 보여주는 부분
		$.ajax({
			url : "replyData/"+${contentData.boardId }, type : "GET",
			contentType: "application/json; charset=utf-8",
			dataType : "json",
			success : function(rep){
				let html = '';
				data = rep;
				console.log('reply list : ');
				console.log(data);
				if(rep.length==0){
					html += "<h3>댓글이 없습니다.</h3>"
				} else{
					for(i=0;i<rep.length;i++){
						let date = new Date(rep[i].date);
						let hours = date.getHours();
						let minutes = date.getMinutes();
						let seconds = date.getSeconds();
						hours = hours > 9 ? hours : "0" + hours;
						minutes = minutes > 9 ? minutes : "0" + minutes;
						seconds = seconds > 9 ? seconds : "0" + seconds;
						let writeDate = date.getFullYear()+"."+(date.getMonth()+1)+"."
						writeDate += date.getDate()+" "+hours+":"
						writeDate += minutes+":"+seconds
						var userId = $("#userId").val();
						console.log(rep[i].user_id);
						console.log(userId);
						let user_id = rep[i].user_id;
						if(rep[i].layer==0){ //부모 댓글은 [댓글]버튼 추가
							html += "<div class= 'reply'>"
							html +=		rep[i].content+"<br>"
							html +=		"<font class= 'time'>"+writeDate+"</font><br>"
							
							if(userId==user_id){
								html +=	"<input type='button' id='"+i+"' value='삭제' onclick='remove(this.id)'>"
							}
							
							html +=		"<input type='button' id='"+rep[i].id+"' value='댓글' onclick='visible("+i+")'>"
							html +=		"<hr>"
							html += "</div>"
							
							html += "<div id='hidden"+i+"' class= 'reply' style='display:none'>"
							html +=		"<form id='re"+i+"' name='reform'>"
							html +=			"<input type='hidden' name='board_id' value='${contentData.boardId }'>"
							html +=			"<input type='hidden' name='user_id' value='${loginUser }'>"
							html +=			"<input type='hidden' name='group_id' value='"+rep[i].id+"'>"
							html +=			"<textarea class= 'writeBox' id='content' name='content'></textarea>"
							html +=			"<button type='button' onclick='rerep("+i+")'>대댓글 달기</button>"
							html +=			"<button type='button' onclick='invisible("+i+")'>취소</button>"
							html +=		"</form>"
							html += 	"<hr>"
							html += "</div>"
						}
						if(rep[i].layer==1){
							html += "<div class= 'reply' style= 'background-color: #D5D5D5'>"
							html +=		"└>"+rep[i].content+"<br>"
							html +=		"<font class= 'time'>"+writeDate+"</font><br>"
							
							if(userId==user_id){
								html +=	"<input type='button' id='"+i+"' value='삭제' onclick='remove(this.id)'>"
							}
							
							html +=		"<hr>"
							html += "</div>"
						}
					}
				}
				$("#show1").html(html)
			}, error : function(){
				alert('데이터를 가져올 수 없습니다')
			}
		})
	}
	
	function visible(i){
		if(ls.length>=1){
			$("#hidden"+i).show();
		} else{
			alert("로그인 후 이용하실 수 있습니다.")	
		}
	}
	
	function invisible(i){
		$("#hidden"+i).hide();
	}
	
	window.onload = function (){ //브라우저 시작과 동시에 댓글 보여주기
		boardCheck();
		replyData();
	}
</script>

<style type="text/css">
.contentview {
	padding-top: 100px;
}

.contenttable th {
	height: 40px;
	width: 100px;
}

.contenttable td {
	height: 40px;
	width: 600px;
}

.reco {
	display: flex;
}

#myProgress {
	width: 500px;
	background-color: grey;
}

#myBar {
	width: 0%;
	height: 30px;
	background-color: green;
}

/* 댓글 */
#hidden {
	display: none;
	align-content: center;
}

.time {
	font-size: 13px;
}

.replyBG {
	margin: auto;
	width: 600px;
	background-color: #EAEAEA;
}

.reply {
	width: 580px;
	padding: 10px 10px 0px 10px;
	word-break: break-all;
}

.writeBox {
	width: 570px;
	height: 60px;
	resize: none;
}
</style>
</head>
<body style="background-color: #fff7e6;">
<c:import url="../default/header.jsp"/><br>
	<div>
		<div class="contentview">
			<div style="margin: auto; width: 800px;">
				<input type="hidden" id="boardId" value="${ contentData.boardId }">
				<input type="hidden" id="userId" value="${ loginUser }">
				<table border="1" class="contenttable" style="background-color: #f8fdf1;">
					<tr>
						<th>글 번호</th>
						<td>&nbsp;${ contentData.boardId }</td>
						<th>작성자</th>
						<td>&nbsp;${ contentData.userId }</td>
					</tr>
					<tr>
						<th>제 목</th>
						<td>&nbsp;${ contentData.title }</td>
						<th>작성일</th>
						<td>&nbsp;${ contentData.day }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>&nbsp;${ contentData.hit }</td>
						<th>좋아요</th>
						<td id="like">&nbsp;${ contentLike }</td>
					</tr>
					<tr>
						<th colspan="4">내용</th>
					</tr>
					<tr>
						<td colspan="4">&nbsp;${ contentData.content }</td>
					</tr>
					<c:if test="${ contentData.picture != 'nan' }">
						<tr>
							<th colspan="4">
								<img width="200px" height="200px" src="${ contextPath }/board/download?pictureName=${ contentData.picture }">
							</th>
						</tr>
					</c:if>
					<c:if test="${ loginUser == contentData.userId }">
						<tr>
							<td colspan="4">
								<input type="button" onclick="location.href='${ contextPath }/board/modifyform?boardId=${ contentData.boardId }'" value="수정하기"> 
								<input type="button" onclick="location.href='${ contextPath }/board/delete?boardId=${ contentData.boardId }&pictureName=${ contentData.picture }'" value="삭제하기">
							</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="4" style="align-content: right;">
							<c:if test="${ loginUser != null }">
								<img src="${contextPath }/resources/image/dislike.jpg" id="likeBtn" onclick="like()" style="width: 20px; height: 20px;">
							</c:if>
							<input type="button" onclick="history.back()" value="돌아가기">
						</td>
					</tr>
				</table>
			</div>
			<div class="reco" style="padding-top: 30px; padding-bottom: 30px; margin: auto; width: 600px;">
				<c:choose>
					<c:when test="${ loginUser != null }">
						<input type="button" onclick="good()" value="추천">
					</c:when>
					<c:otherwise>
						<input type="button" onclick="alertLogin()" value="추천">
					</c:otherwise>
				</c:choose>
				<label id="good">0</label>&nbsp;
				<div id="myProgress">
					<div id="myBar"></div>
				</div>
				&nbsp;<label id="bad">0</label>
				<c:choose>
					<c:when test="${ loginUser != null }">
						<input type="button" onclick="bad()" value="비추천">
					</c:when>
					<c:otherwise>
						<input type="button" onclick="alertLogin()" value="비추천">
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div style="margin: auto; width: 600px;">
			<div style="padding: 10px 10px 10px 10px;">
				<form id="frm">
					<input type="hidden" name="board_id" value="${contentData.boardId }">
					<input type="hidden" name="user_id" value="${loginUser }">
					<textarea class="writeBox" id="content" name="content"></textarea>
					<div align="right">
						<button type="button" onclick="rep()">댓글 달기</button>
					</div>
				</form>
			</div>
		</div>

		<div id="show1" class="replyBG"></div>

		<table border="1" id="show" style="margin: auto;"></table>
		<!-- 댓글 보여주는 부분 -->
	</div>
	<br>
	<br>
	<hr>
	<c:import url="../default/footer.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>