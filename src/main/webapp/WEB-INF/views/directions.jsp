<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
	<div class="wrap">
	<header id="header-wrap">
		<div class="status-bar">
	<div>
		<!-- sessionScope => 세션(session -> user가 저장되어있음)에  저장되어있는(Scope)를  불러옴 -->
	<c:if test="${sessionScope.admin == null}">
		<div id="login-admin">
			<a href="/loginAdmin">로그인(Admin)</a>
		</div>
	</c:if>
		<c:if test="${sessionScope.admin != null}">
			
			<div>
				<div><a href="/indexAdmin" id="login-admin02">관리자 메인페이지로</a>
				(${sessionScope.admin.adminName})님<a href="/logout">로그아웃</a></div>
			</div>
			
		</c:if>
	</div>
	<c:if test="${sessionScope.admin.adminId != 'admin'}">
		<c:if test="${sessionScope.user == null}">
		<div>
			<a href="signup">회원가입</a> <a href="login">로그인</a>
		</div>
		</c:if>
		<c:if test="${sessionScope.user != null}">
			<div>
				<div>(${sessionScope.user.userName})님<a href="logout">로그아웃</a></div>
			</div>
		</c:if>
	</c:if>
	</div>
		<div class="nav-color">
			<nav class="nav">
			<div class="logo">
			<a href="/"><img  src="img/logo-main.png"/></a>
			</div>
			<ul class="nav-list">
				<li><a href="/center">센터소개</a></li>
				<li><a href="/information">사육정보</a></li>
				<li><a href="/animals/list">유기동물공고</a></li>
				<li><a href="/board/list">입양신청</a></li>
			</ul>
		</nav>
		</div>
</header>
<div id="banner-wrap">
		<div class="banner">
			<img src="/resources/img/banner-1.png">
		</div>
</div>
	<div id="#container-wrap">
	<div class="contents-layout">
	<!------ left-nav ------>
		<div class="left-wrap">
			<h2>센터소개
				<span>Introduction</span>
			</h2>
			<ul class="animals-list-nav">
			<li>	
				<a href="/center">센터소개</a>
			</li>
			<li>
				<a href="/directions" class="on">오시는길</a>
			</li>
			</ul>
		</div>
		<div class="conRight" id="contents">
				<h3>오시는길</h3>
		<div class="contents">
		<div class="overflow-hidden-view"></div>
		<h4>찾아오시는 길</h4>
		<ul class="map-font">
			<li>
				<h1>주소</h1>[34503] 대전광역시 동구 우암로 352-21
			</li>
		</ul>		
			<!-- * 카카오맵 - 지도퍼가기 -->
			<!-- 1. 지도 노드 -->
			<div id="daumRoughmapContainer1605794217787" class="root_daum_roughmap root_daum_roughmap_landing"></div>
			
			<!--
				2. 설치 스크립트
				* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
			-->
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
			
			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1605794217787",
					"key" : "232ek",
					"mapWidth" : "700",
					"mapHeight" : "520"
				}).render();
			</script>
			
			<h4 class="sub-h4">교통수단</h4>
			<ul class="map-font">
				<li>	
					<h1>버스 이용시</h1>
				</li>
				<li>
					<ul>
						<li class="sub-li-style">대전 복합터미널 하차 후 길건너</li>
						<li class="sub-li-style02">시내버스 105, 106 이용</li>	
						<li class="sub-li-style02">택시 10분 소요</li>
					</ul>
				</li>
				<li>
					<br><h1>기차 이용시</h1>
				</li>
				<li>
					<ul>
						<li class="sub-li-style">대전역 정문 하차 후</li>
						<li class="sub-li-style02">시내버스 103, 311, 613 이용</li>	
						<li class="sub-li-style02">택시 15~20분 소요</li>
					</ul>
				</li>
			</ul>		
		</div>
	<!---- 컨텐츠내용 ---->
	</div>	
	</div>
	<!-- contents-layout  -->
		<div class="clear"></div>
	</div>
		<footer id="footer-wrap">
		<div class="footer">
			<p>대전광역시 대덕구  [대표전화] 010-8272-6620<br>   
				COPYRIGHT 2020 BY Park Jun Hyuck. ALL RIGHTS RESERVED.</p>
			<img src="/resources/img/logo-footer.png">
		</div>
	</footer>
</div>	
</body>
</html>