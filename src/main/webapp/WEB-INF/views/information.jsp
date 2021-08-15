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
			<h2>사육정보
				<span>Animal Information</span>
			</h2>
			<ul class="animals-list-nav">
			<li>	
				<a href="/center" class="on">사육정보</a>
			</li>
			</ul>
		</div>
		<div class="conRight" id="contents">
				<h3>사육정보</h3>
		<div class="contents">
		<div class="overflow-hidden-view"></div>
		<p class="information-p">
			반려동물과 함께 생활하기 위한 사육 기본 정보를  알려드립니다.
		</p>
		<p>
			<img src="/resources/img/cat-and-dog.png" class="img-scroll">
		</p>
		<h4>강아지(Dog)</h4>
		<p class="information-p">먹이는 갑자기 바꾸지 말고 데려오기 전부터먹던 먹이를 당분간 (10일 이상)주도록 합시다. 새로운 집에 적응하게 되는 기간은 보통 7일 
		정도 걸리고 이 기간 동안은 목욕이나 먹이 변화, 이동 등의 스트레스를 주는 것은 삼가도록 합니다. 애견의 목욕은 1~15일에 1회 정도
		가 적당하지만 일반적으로 주1회 정도가 무난합니다. 광견병 백신 및 심상사상충 예방은 필수이며 자세한 사항은 수의사 지시에 따르기 바랍니다.</p>
		<br>
		<h4>고양이(Cat)</h4>
		<p class="information-p">하루에 먹이 주는 횟수는 1일 2회 정도가 적당합니다. 육류는 닭 가슴살이 가장 좋으며 육류의 량은전체 먹이의 3분의 1 정도가 좋습니다.<br>
		생선은 넙치처럼 살이 흰 종류가 좋으며 곡류는 균형 잡힌 영양섭취를 위해 소량 먹입니다.<br>
		양파는 소화가 잘 되지 않으므로 강아지나 고양이 모두에게 좋지 않습니다.</p>
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