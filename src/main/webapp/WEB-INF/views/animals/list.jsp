<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
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
			<a href="/signup">회원가입</a> <a href="/login">로그인</a>
		</div>
		</c:if>
		<c:if test="${sessionScope.user != null}">
			<div>
				<div>(${sessionScope.user.userName})님<a href="/logout">로그아웃</a></div>
			</div>
		</c:if>
	</c:if>
	</div>
		<div class="nav-color">
			<nav class="nav">
			<div class="logo">
			<a href="/"><img  src="/resources/img/logo-main.png"/></a>
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
			<h2>유기동물공고
				<span>Animals List</span>
			</h2>
			<ul class="animals-list-nav">
			<li>	
				<a href="list" class="on">유기동물공고</a>
			</li>
			</ul>
		</div>
	<div class="conRight" id="contents">
		<h3>유기동물공고</h3>
		<div class="contents">
		<!------ 컨텐츠 내용 ------>
		<div class="board-top">
		<div class="search-list">
			<form method="get" action="">
			<div class="search">
				<span>
					<select name="search">
						<option value="0">선택</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>동물번호</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>종류</option>
						<option value="3" ${pager.search == 3 ? 'selected' : ''}>품종</option>
						<option value="4" ${pager.search == 4 ? 'selected' : ''}>성별</option>
						<option value="5" ${pager.search == 5 ? 'selected' : ''}>나이</option>
					</select>
				</span>
				<span>
					<input type="text" name="keyword" placeholder="검색어를 입력해 주세요" value="${pager.keyword}">
				</span>
				<span>
					<input type="submit" value="검색" class="button">
				</span>
				</div>
			</form>
		</div>		
			<ul class="announcement-list">
				<c:forEach var="item" items="${list}">
					<li>
						<a href="${item.animalNum}/animalView">
						<img src="/ShelterUpload/${item.animalImg}" class="announcement-avatar"></a>
					<ul>
						<li><span>동물번호: </span>${item.animalNum}</li>
						<li><span>종류: </span>${item.animalTitle}</li>
						<li><span>품종: </span>${item.animalName}</li>
						<li><span>성별: </span>${item.animalSex}</li>
						<li><span>나이: </span>${item.animalAge}</li>
						<c:if test="${sessionScope.admin.adminId == 'admin' }">
							<li><span>관리: </span><button type="button" onclick="location.href = '${item.animalNum}/delete';">삭제</button>
							<button type="button" onclick="location.href = '${item.animalNum}/update';" >수정</button></li>
						</c:if>
					</ul>
					</li>
					</c:forEach>
				</ul>
						<c:if test="${list.size() < 1}">
							<div class="announcement-list2">
								<h2>공고 된 동물이 없습니다</h2>
							</div>
						</c:if>
			
		<div id="page-wrap">		
			<div class="group-page">
				<ul class="page-nation">
					<li><a href="?page=1&${pager.query}">
					<img src="/resources/img/page_pprev.png"></a></li>
					<li><a href="?page=${pager.prev}&${pager.query}">
					<img src="/resources/img/page_prev.png"></a></li>
				<c:forEach var="page" items="${pager.list}">
					<li id="pager-list" class="${page == pager.page ? 'active' : ''}"><a href="?page=${page}">${page}</a></li>
				</c:forEach>
					<li><a href="?page=${pager.next}&${pager.query}">
					<img src="/resources/img/page_next.png"></a></li>
					<li><a href="?page=${pager.last}&${pager.query}">
					<img src="/resources/img/page_nnext.png"></a></li>
				</ul>
			</div>
		</div>
	</div>
<c:if test="${sessionScope.admin.adminId == 'admin' }">
		<div class="overflow-hidden">
		<div class="btn-group">
				<a href="add"><i class="fas fa-file-signature"></i>등록</a>
		
				<a href="dummy"><i class="far fa-plus-square"></i>더미등록</a>
		
				<a href="init"><i class="far fa-trash-alt"></i>초기화</a>
								
			</div>
			</div>
</c:if>
			</div>
			</div>
			<div class="clear"></div>
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