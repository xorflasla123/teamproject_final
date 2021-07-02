<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Map</title>

<style type="text/css">
.map_wrap, .map_wrap * { margin: 0; padding: 0; font-family: 'Malgun Gothic', dotum, '돋움', sans-serif; font-size: 12px; }
.map_wrap a, .map_wrap a:hover, .map_wrap a:active { color: #000; text-decoration: none; }
.map_wrap { position: relative; width: 100%; height: 800px; }
#menu_wrap { position: absolute; top: 0; left: 0; bottom: 0; width: 250px; margin: 10px 0 30px 10px; padding: 5px; overflow-y: auto; background: rgba(255, 255, 255, 0.7); z-index: 1; font-size: 12px; border-radius: 10px; }
.bg_white { background: #fff; }
#menu_wrap hr { display: block; height: 1px; border: 0; border-top: 2px solid #5F5F5F; margin: 3px 0; }
#menu_wrap .option { text-align: center; }
#menu_wrap .option p { margin: 10px 0; }
#menu_wrap .option button { margin-left: 5px; }

#placesList li { list-style: none; }
#placesList .item { position: relative; border-bottom: 1px solid #888; overflow: hidden; cursor: pointer; min-height: 65px; }
#placesList .item span { display: block; margin-top: 4px; }
#placesList .item h5, #placesList .item .info { text-overflow: ellipsis; overflow: hidden; white-space: nowrap; }
#placesList .item .info { padding: 10px 0 10px 55px; }
#placesList .info .gray { color: #8a8a8a; }
#placesList .info .jibun { padding-left: 26px; background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat; }
#placesList .info .tel { color: #009900; }
#placesList .item .markerbg { float: left; position: absolute; width: 36px; height: 37px; margin: 10px 0 0 10px; background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat; }
#placesList .item .marker_1 { background-position: 0 -10px; }
#placesList .item .marker_2 { background-position: 0 -56px; }
#placesList .item .marker_3 { background-position: 0 -102px }
#placesList .item .marker_4 { background-position: 0 -148px; }
#placesList .item .marker_5 { background-position: 0 -194px; }
#placesList .item .marker_6 { background-position: 0 -240px; }
#placesList .item .marker_7 { background-position: 0 -286px; }
#placesList .item .marker_8 { background-position: 0 -332px; }
#placesList .item .marker_9 { background-position: 0 -378px; }
#placesList .item .marker_10 { background-position: 0 -423px; }
#placesList .item .marker_11 { background-position: 0 -470px; }
#placesList .item .marker_12 { background-position: 0 -516px; }
#placesList .item .marker_13 { background-position: 0 -562px; }
#placesList .item .marker_14 { background-position: 0 -608px; }
#placesList .item .marker_15 { background-position: 0 -654px; }
#pagination { margin: 10px auto; text-align: center; }
#pagination a { display: inline-block; margin-right: 10px; }
#pagination .on { font-weight: bold; cursor: default; color: #777; }

/*  */
#category { position: absolute; top: 10px; left: 10px; border-radius: 5px; border: 1px solid #909090; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4); background: #fff; overflow: hidden; z-index: 2; }
#category li { float: left; list-style: none; width: 50px; px; border-right: 1px solid #acacac; padding: 6px 0; text-align: center; cursor: pointer; }
#category li.on { background: #eee; }
#category li:hover { background: #ffe6e6; border-left: 1px solid #acacac; margin-left: -1px; }
#category li:last-child { margin-right: 0; border-right: 0; }
#category li span { display: block; margin: 0 auto 3px; width: 27px; height: 28px; }
#category li .category_bg { background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat; }
#category li .hotel { background-position: -10px 0; }
#category li .mart { background-position: -10px -36px; }
#category li .pharmacy { background-position: -10px -72px; }
#category li .oil { background-position: -10px -108px; }
#category li .cafe { background-position: -10px -144px; }
#category li .tour { background-position: -10px -180px; }
#category li.on .category_bg { background-position-x: -46px; }
.placeinfo_wrap { position: absolute; bottom: 28px; left: -150px; width: 300px; }
.placeinfo { position: relative; width: 100%; border-radius: 6px; border: 1px solid #ccc; border-bottom: 2px solid #ddd; padding-bottom: 10px; background: #fff; }
.placeinfo:nth-of-type(n) { border: 0; box-shadow: 0px 1px 2px #888; }
.placeinfo_wrap .after { content: ''; position: relative; margin-left: -12px; left: 50%; width: 22px; height: 12px; background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png') }
.placeinfo a, .placeinfo a:hover, .placeinfo a:active { color: #fff; text-decoration: none; }
.placeinfo a, .placeinfo span { display: block; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; }
.placeinfo span { margin: 5px 5px 0 5px; cursor: default; font-size: 13px; }
.placeinfo .title { font-weight: bold; font-size: 14px; border-radius: 6px 6px 0 0; margin: -1px -1px 0 -1px; padding: 10px; color: #fff; background: #d95050; background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; }
.placeinfo .tel { color: #0f7833; }
.placeinfo .jibun { color: #999; font-size: 11px; margin-top: 0; }

/* 버튼 숨김용 */
#hidden1 { display: none; }
#hidden2 { display: none; }
#btnhidden { display: none; }

/* 메모 */
.tablememo { border-collapse:collapse; height: 90px; width: 270px; margin-left:17px; opacity: 0.7; background-color:white; }
.container th{ text-align:center; }
#first { display: none; position: fixed; z-index: 9; margin: 0 auto; top: 30px; left: 100; right: 0; height: 900px; width: 330px; opacity: 0.7; }
#content { resize: none; height: 440px; width: 270px; }
#title { margin-left:10px; margin-bottom:30px; left:100px; height: 20px; width: 170px; }
#id { margin-bottom:10px; height: 20px; width: 170px; }
#hiddenMode button 
#btns11 button { display: none; width: 95px; height: 45px; }
#frm{ padding-top:30px; }
</style>

</head>
<body>
	<c:import url="../default/header.jsp" />
	<hr><br><br>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />

	<input id="hidden_name" type="hidden" name="place_name" value="">
	<input id="hidden_address" type="hidden" name="place_address" value="">
	<input id="hidden_userId" type="hidden" name="user_Id" value="${loginUser }">

	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		<button type="button" onclick="visible1()" id="">키워드 검색</button>
		<button type="button" onclick="visible2()" id="">카테고리 검색</button>

		<input type="button" onclick="slideClick()" value="메모">
		<button type="button" onclick="invisible()" id="btnhidden">닫기</button>

		<form action="${contextPath }/map/navi" method="get" target="_blank">
			<input type="text" name="dep" placeholder="출발지 입력"><br>
			<input type="text" name="arr" placeholder="도착지 입력">
			<input type="submit" value="검색">
		</form>

		<div id="hidden1">
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" value="" id="keyword" size="15">
							<button type="submit">검색하기</button>
						</form>
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
		<div id="hidden2">
			<ul id="category">
				<li id="AD5" data-order="0"><span class="category_bg hotel"></span>
					숙박</li>
				<li id="MT1" data-order="1"><span class="category_bg mart"></span>
					마트</li>
				<li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>
					약국</li>
				<li id="OL7" data-order="3"><span class="category_bg oil"></span>
					주유소</li>
				<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
					카페</li>
				<li id="AT4" data-order="5"><span class="category_bg tour"></span>
					관광명소</li>
			</ul>
		</div>
	</div>

	<div id="first">
		<div style="width: 250px; margin: 0 auto; padding-top: 10px;">
			<form id="frm">
				<br>
				<h3 style="position: absolute; top: 40px; right: 130px;" >여행일지</h3>
				<br> <b>작성자</b> <input type="text" id="id" name="user_id"
					value="${loginUser} " readonly>  <br> <b >제 목</b>
				<input type="text" id="title" size="30" name="title"><br>
				<b>내용</b> <br>
				<textarea rows="5" cols="30" id="content" name="content"></textarea>
				<br>
		
				<div id="btns11">
					<input type="button" id="repBtn" onclick="rep()" value="저장">
					<input type="button" id="cancelBtn" onclick="slide_hide()"
						value="취소"> <input type="button" id="listBtn"
						onclick="memoList()" value="메모 목록"><br><br>
				</div>

				<div id="hiddenMode">
					<input type="button" id="modiBtn" onclick="modify1()" value="수정" type="hidden">
					<input type="button" id="deleBtn" onclick="delete1()" value="삭제" type="hidden">
					<input type="button" id="backBtn" onclick="back1()" value="이전으로" type="hidden">
				</div>	

				<input type="hidden" name="memo_id" id="memo_id" value="">
			</form>
		</div>
		<div id="memolist"></div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=761a0a96bd36bae33e8d2523115b5777&libraries=services"></script>
																				<!-- appkey넣는 자리 -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<script>
		/* -------------- 기본 초기화+버튼 액션 -------------- */
		let keyword = '';
		$(document).ready(function() {
			let keyword1 = "${hs}";
			console.log(keyword);
			console.log(keyword1);
			if (keyword1 != null) {
				document.getElementById('keyword').value = keyword1;
			}
			searchPlaces();
			$("#hidden1").show();
			$("#btnhidden").show();
		});

		function visible1() { //키워드검색 클릭 시
			$("#hidden1").show();
			$("#hidden2").hide();
			$(".option").show();
			$("#btnhidden").show();
			kakao.maps.event.removeListener(map, 'idle', searchPlaces1);
			resetCategory();
			resetKeyword();
		}
		function visible2() { //카테고리검색 클릭 시
			$("#hidden2").show();
			$("#hidden1").hide();
			$("#btnhidden").show();
			$("#category").css('left', '10px');
			resetKeyword();
			kakao.maps.event.addListener(map, 'idle', searchPlaces1);
		}

		function invisible() { //닫기버튼 클릭 시
			$("#hidden1").hide();
			$("#hidden2").hide();
			$("#btnhidden").hide();
			kakao.maps.event.removeListener(map, 'idle', searchPlaces1);
			resetCategory();
			resetKeyword();
		}

		function resetKeyword() { //키워드검색 기능 리셋
			$("#keyword").val('');
			resetList();
			removeMarker();
			resetPagenation();
			placeOverlay.setMap(null);
		}

		function resetList() {
			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);
		}

		function resetPagenation() {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;
			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}
		}

		function resetCategory() {
			var category = document.getElementById('category'), children = category.children, i;

			for (i = 0; i < children.length; i++) {
				children[i].className = '';
			}
			removeMarker();
			placeOverlay.setMap(null);
		}
	
		/* -------------- API -------------- */
		// 마커를 담을 배열입니다
		var markers = [];

		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({
			zIndex : 1
		}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		markers = [], // 마커를 담을 배열입니다
		currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();
		var ps1 = new kakao.maps.services.Places(map);

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';

		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);

		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();

		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
			if (target.addEventListener) {
				target.addEventListener(type, callback);
			} else {
				target.attachEvent('on' + type, callback);
			}
		}

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
			keyword = document.getElementById('keyword').value;
			//console.log(keyword);
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
			keyword = '';
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces1() {
			if (!currCategory) {
				return;
			}

			// 커스텀 오버레이를 숨깁니다 
			placeOverlay.setMap(null);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			ps1.categorySearch(currCategory, placesSearchCB1, {
				useMapBounds : true
			});
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB1(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
				displayPlaces1(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

			} else if (status === kakao.maps.services.Status.ERROR) {
				// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, place) {
					kakao.maps.event.addListener(marker, 'click', function() {
						displayInfowindow(marker, place);
					});

					itemEl.onclick = function() {
						displayInfowindow(marker, place);
					};

				})(marker, places[i]);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces1(places) {
			$("#hidden1").show();
			$(".option").hide();
			$("#category").css('left', '300px');
			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();
			// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
			// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
			var order = document.getElementById(currCategory).getAttribute('data-order');

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), 
						marker = addMarker1(placePosition, order), 
						itemEl = getListItem(i, places[i]);

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목을 클릭 했을 때
				// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
				(function(marker, place) {
					kakao.maps.event.addListener(marker, 'click', function() {
						displayPlaceInfo(place);
					});
					itemEl.onclick = function() {
						displayPlaceInfo(place);
					};
				})(marker, places[i]);
				fragment.appendChild(itemEl);
			}
			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker1(position, order) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(11, 28)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, place) {
			var content = '<div class="placeinfo">'
					+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
					+ place.place_name + '</a>';

			if (place.road_address_name) {
				content += '    <span title="' + place.road_address_name + '">'
						+ place.road_address_name
						+ '</span>'
						+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
						+ place.address_name + ')</span>';
			} else {
				content += '    <span title="' + place.address_name + '">'
						+ place.address_name + '</span>';
			}

			content += '    <span class="tel">'
					+ place.phone
					+ '</span>'
					+ '<button type="button" onclick="memoAdd()">메모 추가</button></div>'
					+ '<div class="after"></div>';

			//infowindow.setContent(content);
			//infowindow.open(map, marker);
			contentNode.innerHTML = content;
			placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			placeOverlay.setMap(map);

			document.getElementById("hidden_name").value = place.place_name
			document.getElementById("hidden_address").value = place.address_name
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}

		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo(place) {
			var content = '<div class="placeinfo">'
					+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
					+ place.place_name + '</a>';

			if (place.road_address_name) {
				content += '    <span title="' + place.road_address_name + '">'
						+ place.road_address_name
						+ '</span>'
						+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
						+ place.address_name + ')</span>';
			} else {
				content += '    <span title="' + place.address_name + '">'
						+ place.address_name + '</span>';
			}

			content += '    <span class="tel">'
					+ place.phone
					+ '</span>'
					+ '<button type="button" onclick="memoAdd()">메모 추가</button></div>'
					+ '<div class="after"></div>';

			contentNode.innerHTML = content;
			placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			placeOverlay.setMap(map);

			document.getElementById("hidden_name").value = place.place_name
			document.getElementById("hidden_address").value = place.address_name
		}

		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
			var category = document.getElementById('category'), children = category.children;

			for (var i = 0; i < children.length; i++) {
				children[i].onclick = onClickCategory;
			}
		}

		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
			var id = this.id, className = this.className;

			placeOverlay.setMap(null);

			if (className === 'on') {
				currCategory = '';
				changeCategoryClass();
				removeMarker();
			} else {
				currCategory = id;
				changeCategoryClass(this);
				searchPlaces1();
			}
		}

		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
			var category = document.getElementById('category'), children = category.children, i;

			for (i = 0; i < children.length; i++) {
				children[i].className = '';
			}

			if (el) {
				el.className = 'on';
			}
		}
		
		/* -------------- 메모 -------------- */
		function slideClick() {
			var userId = document.getElementById("hidden_userId").value;
			if (userId == "") {
				alert('로그인 먼저 해주세요')
			} else {
				console.log('실행11')
				$("#first").slideDown("slow");
				$("#modal_wrap").show();
				$("#btns11").show();
				$("#hiddenMode").hide();
				document.getElementById("content").value = "";
				document.getElementById("title").value = "";

			}
		}
		
		function slide_hide() {
			$("#first").slideUp("fast");
			$("#modal_wrap").hide();
		}
		
		function rep() {
			let form = {};
			let arr = $("#frm").serializeArray();
			for (i = 0; i < arr.length; i++) {
				form[arr[i].name] = arr[i].value
			}
			$.ajax({
				url : "addMemo",
				type : "POST",
				data : JSON.stringify(form),
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(result) {
					alert("성공적으로 저장되었습니다");
					slide_hide();

				},
				error : function() {
					alert("문제 발생 !!!");
				}
			})
		}
		
		// 메모기능
		function saveMemo() {
			let form = {};
			let arr = $("#frm").serializeArray();
			for (i = 0; i < arr.length; i++) {
				form[arr[i].name] = arr[i].value
			}
			$.ajax({
				url : "addMemo",
				type : "POST",
				data : JSON.stringify(form),
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(result) {
					alert("성공적으로 저장되었습니다");
					slide_hide();

				},
				error : function() {
					alert("문제 발생 !!!");
				}
			})
		}
		
		function memoAdd() {
			var content = document.getElementById("content").value;
			var name1 = document.getElementById("hidden_name").value;
			var addr1 = document.getElementById("hidden_address").value;
			var newContent = content + " " + name1 + " " + addr1 + "\n"
			console.log(name1)
			console.log(addr1)
			$("#content").val(newContent);

		}

		function memoList() {
			$("#memolist").show();
			var userId = document.getElementById("hidden_userId").value;
			var num1 = 1;
			$
					.ajax({
						url : "memolist/" + $("#hidden_userId").val() + "/"
								+ num1,
						type : "GET",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(map) {
							console.log('성공 1 2')
							let html = ""
							html +=
								"<div class='container' align='center' ><table class='tablememo' border=1><tr><th>제목</th><th>날짜</th> </tr>";
							map.list.forEach(function(data) {
								
								html += " <tr><td><a href='#'onclick=modishow("
										+ data.memo_id + ")>" + data.title
										+ "</a></td><td>" +data.saveDate
										+ "</td></tr>";

							})
							html += "</table>";

							for (var num = 1; num <= map.repeat; num++) {
								html += "<a href='#' onclick='paging11(" + num
										+ ")'>[" + num + "]</a>&nbsp;";

							}
							html +="</div>";
							$("#memolist").html(html)
							document.getElementById("content").value = "";
							document.getElementById("title").value = "";

						},
						error : function() {
							alert("문제 발생 !!!");
						}
					})
		}
		
		function paging11(num1) {
			console.log(num1 + "나는123")
			$
					.ajax({
						url : "memolist/" + $("#hidden_userId").val() + "/"
								+ num1,
						type : "GET",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(map) {
							console.log('성공 1 2')
							let html = ""
							html += "<div class='container' align='center'><table class='tablememo' border=1><tr><th>제목</th><th>날짜</th> </tr>";
							map.list.forEach(function(data) {

								html += " <tr><td><a href='#'onclick=modishow("
										+ data.memo_id + ")>" + data.title
										+ "</a></td><td>" + data.saveDate
										+ "</td></tr>";

							})
							html += "</table>";

							for (var num = 1; num <= map.repeat; num++) {
								html += "<a href='#' onclick='paging11(" + num
										+ ")'>[" + num + "]</a>&nbsp;";

							}
							html +="</div>";
							$("#memolist").html(html)
						},
						error : function() {
							alert("문제 발생 !!!");
						}
					})
		}
		
		function modishow(memo_id) {
			$.ajax({
				url : "modishow/" + memo_id,
				type : "GET",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					console.log('성공 1 2')
					$("#btns11").hide();
					$("#hiddenMode").show();
					$("#id").val(data.user_id);
					$("#title").val(data.title);
					$("#content").val(data.content);
					$("#memo_id").val(memo_id);
				},
				error : function() {
					alert("문제 발생 !!!");
				}
			})
		}
		
		function modify1() {
			let form = {};
			let arr = $("#frm").serializeArray();
			for (i = 0; i < arr.length; i++) {
				form[arr[i].name] = arr[i].value
			}
			$.ajax({
				url : "modiMemo",
				type : "POST",
				data : JSON.stringify(form),
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(result) {
					alert("성공적으로 수정되었습니다");
				},
				error : function() {
					alert("문제가 발생하였씁낟 !!!");
				}
			})
		}

		function delete1() {
			var memo_id = document.getElementById("memo_id").value;
			$.ajax({
				url : "delete1/" + memo_id,
				type : "GET",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					console.log('성공 3 4')
					document.getElementById("content").value = "";
					document.getElementById("title").value = "";
					alert("삭제되었습니다");
					$("#btns11").show();
					$("#hiddenMode").hide();
					memoList();

				},
				error : function() {
					alert("문제 발생 !!!");
				}
			})
		}

		function back1() {
			$("#btns11").show();
			$("#hiddenMode").hide();
			document.getElementById("content").value = "";
			document.getElementById("title").value = "";
		}
	</script>
</body>
</html>