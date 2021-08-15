<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"></jsp:include>
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
				<a href="/animals/list" class="on">유기동물공고</a>
			</li>
			</ul>
		</div>
	<div class="conRight" id="contents">
		<h3>유기동물공고</h3>
		<div class="contents">
			<div class="a-table view02">
				<div>
				<table>
					<caption>유기동물 공고내역</caption>
					<colgroup>
						<col style="width:20%;">
						<col style="width:80%;"> 
					</colgroup>
					<thead>
						<tr>
							<th scope="row" class="av-1">동물번호</th>
							<td class="av-1">${item.animalNum}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
						<td colspan="2">
							<div class="board-view02">
							<div class="photo-box">
							<div class="photo-big">
								<ul>
									<li>
										<img src="/ShelterUpload/${item.animalImg}" class="photo-img"
										alt="${item.animalImg}">
									</li>
								</ul>
							</div>
							</div>
							</div>
						</td>
						</tr>
						<tr>
							<th colspan="1" class="av-1">종류</th><td class="av-1">${item.animalTitle}</td>
						</tr>
						<tr>
							<th colspan="1" class="av-1">품종</th><td class="av-1">${item.animalName}</td>
						</tr>
						<tr>
							<th colspan="1" class="av-1">성별</th><td class="av-1">${item.animalSex}</td>
						</tr>
						<tr>
							<th colspan="1" class="av-1">발견장소</th><td class="av-1">${item.animalLocation}</td>
						</tr>
						<tr>	
							<th colspan="1" class="av-1">나이</th><td class="av-1">${item.animalAge}</td>
						</tr>
						<tr>
							<th colspan="1" class="av-1">상태</th><td class="av-1">${item.animalState}</td>
						</tr>
						<tr>
							<th colspan="1" class="av-1">구조일</th><td class="av-1"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.animalRegDate}"/></td>
						</tr>
						<c:if test="${sessionScope.admin.adminId == 'admin' }">
						<tr>
							<th colspan="1" class="av-1">관리</th><td class="av-1">
							<button type="button" onclick="location.href = '../${item.animalNum}/delete';">삭제</button>
							<button type="button" onclick="location.href = '../${item.animalNum}/update';">수정</button></td>
						</tr>
						</c:if>
						<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="11">공고 된 동물이 없습니다</td>
						</tr>
					</c:if>
					</tbody>
				</table>
				</div>
		<div class="overflow-hidden">
		<div class="btn-group">
			<a href="../content?animalNum=${item.animalNum}"><i class="fas fa-bars"></i>입양신청</a>
			<a href="../list"><i class="fas fa-bars"></i>목록</a>
		</div>	
		</div>
		</div>
	<!---- 유기동물공고 ---->
	<!---- 컨텐츠내용 ---->
		</div>
		</div>
		<!-- contents-layout  -->
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