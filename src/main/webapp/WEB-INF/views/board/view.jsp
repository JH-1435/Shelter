<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<h2>입양신청
				<span>Adoption</span>
			</h2>
			<ul class="animals-list-nav">
			<li>	
				<a href="/board/list" class="on">입양 신청</a>
			</li>
			</ul>
		</div>
		<div class="conRight" id="contents">
				<h3>입양신청 내역</h3>
		<div class="contents">
		<!------ 컨텐츠 내용 ------>
	<div class="a-table view">
	<div class="overflow-hidden-view"></div>
<table>
		<caption>입양신청 내역</caption>
		<colgroup>
			<col style="width:20%;">
			<col style="width:20%;">
			<col style="width:20%;">
			<col style="width:20%;">
			<col style="width:20%;">
		</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="av-1">제목</th>
					<td colspan="5">${item.boardTitle}</td>
				</tr>
				<tr>
					<th scope="row" class="av-1">작성자</th>
					<td>${item.userName}(${item.userId})</td>
					<th scope="row" class="av-1">작성일</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.boardDate}" /></td>
					<th scope="row" class="av-1">조회수(${item.boardReadCount})</th>
				</tr>
			<c:if test="${item.orders.size() < 1}">
				<tr>
					<td colspan="6">입양 신청 하지 않으셨습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="orders" items="${item.orders}">
			<tr>
				<td colspan="5">
						<div class="board-view02">
							<div class="photo-box">
							<div class="photo-big">
								<ul>
									<li>
										<img src="/ShelterUpload/${orders.animalImg}" class="photo-img"
										alt="${orders.animalImg}">
									</li>
								</ul>
							</div>
						 </div>
						</div>
					</td>
				</tr>
				<tr class="content-text">
					<th colspan="5">동물정보</th>
				</tr>
				<tr class="content-text">
					<th colspan="1" class="av-1">동물번호</th>
					<td colspan="4" class="av-1">${orders.animalNum}</td>
				</tr>
				<tr class="content-text">
					<th colspan="1" class="av-1">동물 종류</th>
					<td colspan="4" class="av-1">${orders.animalTitle}</td>
				</tr>
				<tr class="content-text">
					<th colspan="1" class="av-1">품종</th>
					<td colspan="4" class="av-1">${orders.animalName}</td>
				</tr>	
				<tr class="content-text">
					<th colspan="1" class="av-1">성별</th>
					<td colspan="4" class="av-1">${orders.animalSex}</td>
				</tr>
				<tr class="content-text">
					<th colspan="1" class="av-1">입양예정일</th>
					<td colspan="4" class="av-1"><fmt:formatDate pattern="yyyy-MM-dd" value="${orders.boardOkayDate}" /></td>
				</tr>
			</c:forEach>
		<tr>
			<td colspan="5">
				<div class="left">
					${item.boardContent}
				</div>
				<c:if test="${sessionScope.admin.adminId == 'admin' }">
					<div class="btn-group">
						<a href="../${item.boardNum}/okDate"><i class="fas fa-check"></i>승인(Admin)</a>
					</div>
				</c:if>
			</td>
		</tr>
	</tbody>
</table>
	</div>
	<div class="overflow-hidden">
		<div class="btn-group">
			<a href="../list"><i class="fas fa-bars"></i>목록</a>
		</div>
	</div>
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