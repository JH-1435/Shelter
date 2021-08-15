<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>	
<meta charset="UTF-8">
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
		<div class="main-img">
			<img src="img/main-img.png">
		</div>
	<div id="main-wrap">
		<div class="announcement-text">
			<h2>유기동물공고</h2>
			<p>동물보호센터의 새식구를 소개합니다.</p>
		</div>
		<div class="index-hidden"></div>
		<ul class="announcement-index">
			<c:forEach var="item" items="${animals}">
				<li>
					<a href="animals/${item.animalNum}/animalView">
					<img src="/ShelterUpload/${item.animalImg}" class="announcement-avatar" ></a>
				<ul>
					<li>동물번호: ${item.animalNum}</li>
					<li>품종: ${item.animalName}</li>
					<li>성별: ${item.animalSex}</li>
					<li>발견장소: ${item.animalLocation}</li>
				</ul>
				</li>
				</c:forEach>
				</ul>
			<div class="announcement-list2">
				<c:if test="${animals.size() < 1}">
					<h2>공고된 동물이 없습니다.</h2>
				</c:if>
			</div>
		
		<div class="card-list">
			<div class="card">
			<i class="far fa-clock fa-5x"></i>
			<h2>운영시간</h2>
			<ul>
				<li>운영시간 10 : 00 ~ 18 : 00</li>
				<li>점심시간 12 : 00 ~ 13 : 00</li>
				<li>분양시간 13 : 00 ~ 16 : 30</li>
			</ul>
		</div>
		<div class="card">
			<i class="fas fa-phone-volume fa-5x"></i>
			<h2>연락처</h2>
			<ul>
				<li>TEL 042-670-0600</li>
			</ul>
			<p>상처받은 아이들에게 입양은<br>
			마지막 기회이자 유일한 희망입니다.</p>
		</div>
		<div class="card">
			<i class="far fa-envelope fa-5x"></i>
			<h2>Mail</h2>
			<ul>
				<li>cjstk1435@naver.com</li>
			</ul>
		</div>
	</div>
	<div class="procedure">
		<img src="img/main3.png">
	</div>
</div>
		<div class="footer">
			<p>대전광역시 대덕구  [대표전화] 010-8272-6620<br>   
				COPYRIGHT 2020 BY Park Jun Hyuck. ALL RIGHTS RESERVED.</p>
			<img src="/resources/img/logo-footer.png">
		</div>
	</div>
</body>
</html>