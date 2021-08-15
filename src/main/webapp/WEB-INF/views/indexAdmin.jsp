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
				<div>(${sessionScope.admin.adminName})님<a href="/logout">로그아웃</a></div>
			</div>
		</c:if>
	</div>
		</div>
		<div class="nav-color">
			<nav class="nav">
			<div class="logo">
			<a href="/"><img  src="img/logo-main.png"/></a>
		</div>
		<ul class="nav-list">
				<li><a href="/admin/list">관리자관리</a></li>
				<li><a href="/user/list">회원관리</a></li>
				<li><a href="/animals/list">유기동물공고</a></li>
				<li><a href="/board/list">입양신청</a></li>
			</ul>
		</nav>
		</div>
</header>
	<div id="#container-wrap">
	<div class="contents-layout">
	<!------ left-nav ------>
		</div>
		<div class="conRight" id="contents">
		<div class="contents">
		<!------ 컨텐츠 내용 ------>
		<div class="admin-main-text">
		<h3>시설별 관리 지침</h3>
		<h2>1. 사육실</h2>
		<ul>
			 <li>동물의 위생적이고 건강한 관리를 위하여 온도(10～30℃) 및 습도(30～70% RH)를 유지한다.</li>
			 <li>환기시설을 매일 확인하여 사육실내 공기가 원활히 순환될 수 있도록 한다.</li>
			 <li>종별, 암수, 크기, 질병, 공격성여부, 임신동물 등을 고려하여 구분 관리하여야 한다.</li>
			 <li>신선한 사료 및 물이 공급되도록 한다.</li>
			 <li>분변은 매일 1회 이상 청소하여, 위생적인 동물관리를 위해 노력한다.</li>
		</ul>
		<h2>2. 격리실</h2>
		<ul>
			 <li>질병, 전염성동물 및 임신동물 등 개체별로 관리가 가능토록 분리 수용하여야 한다.</li>
			 <li>온도(10～30℃) 및 습도(30～70% RH)를 유지한다.</li>
			 <li>매일 2회 이상 환기를 실시한다.</li>
			 <li>개별 케이지 청소는 매일 1회 이상 실시한다.</li>
		</ul>
			<h2>3. 창고</h2>
		<ul>
			 <li>쥐 및 해충, 기타 동물의 침입을 방지하도록 한다.</li>
			 <li>상호 오염원이 될 수 있는 사료 및 기타 관리물품을 보관하는 경우 서로 분리하여 구별할 수 있도록 하여야 한다.</li>
			 <li>사료의 유통기간 등을 정기적으로 확인하여 유통기간이 경과된 사료가 동물에게 공급되지 않도록 한다.</li>
		</ul>
			<h2>4. 진료 및 수술실</h2>
		<ul>
			 <li>2차 감염을 방지하기 위하여 진료대 및 진료기구를 위생적으로 관리한다.</li>
			 <li>진료약품 및 안락사 약품의 유효기간이 경과되지 않도록 관리하여야 한다.</li>
		</ul>
			<h2>5. 사무실</h2>
		<ul>
			 <li>보호시설 동물의 개체 관리 및 보호시설 운영에 관련된 서류를 보관한다.</li>
			 <li>분양신청서 및 개인정보가 포함된 문서는 외부에 노출되지 않도록 캐비넷에 보관한다.</li>
		</ul>
			<h2>6. 운동장</h2>
		<ul>
			 <li>1회 운동장 이용 개체수를 조절하여 동물의 적정한 운동을 위한 공간을 확보한다.</li>
			 <li>암수를 구분하여 관리하며 전염성 질환 및 공격적인 동물을 격리하여야 한다.</li>
			 <li>음수공급시설의 이상 유무를 매일 확인하고 자외선 노출에 따른 동물의 스트레스를 최소화하기 위해 차단막 설치 등으로 동물을 보호 관리하여야 한다.</li>
		</ul>
		</div>
		</div>	
<!---- 컨텐츠내용 ---->
</div>	
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