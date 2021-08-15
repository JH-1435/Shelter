<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</div>
<div class="nav-color">
			<nav class="nav">
			<div class="logo">
			<a href="/"><img  src="/resources/img/logo-main.png"/></a>
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
<div id="banner-wrap">
		<div class="banner">
			<img src="/resources/img/banner-1.png">
		</div>
</div>
<div id="#container-wrap">
	<div class="contents-layout">
	<!------ left-nav ------>
		<div class="left-wrap">
			<h2>관리자 관리
				<span>Admin List</span>
			</h2>
			<ul class="animals-list-nav">
			<li>	
				<a href="/admin/list" class="on">관리자 관리</a>
			</li>
			</ul>
		</div>
		<div class="conRight" id="contents">
		<h3>관리자 관리</h3>
		<div class="contents">
		<div class="a-table">
		<div class="table-spot">
		<div class="table-search">
			<form method="get" action="">
			<span></span>
				<span>
					<select name="search">
						<option value="0">선택</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>아이디</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>이름</option>
					</select>
				</span>
				<span>
					<input type="text" name="keyword" placeholder="검색어를 입력해 주세요" value="${pager.keyword}">
				</span>
				<span>
					<input type="submit" value="검색">
				</span>
			</form>
			</div>
	</div>
			<div>
		<table border="1">
				<caption>유저정보 리스트</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:20%;">
				<col style="width:35%;">
				<col style="width:15%;">
			</colgroup>
			<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
					<c:if test="${sessionScope.admin.adminId == 'admin'}">
						<th>비밀번호</th>
						<th>관리</th>
					</c:if>
					</tr>
			</thead>
			<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="5">등록 된 관리자 가 없습니다</td>
						</tr>
					</c:if>
					
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.adminId}</td>
							<td>${item.adminName}</td>
							<td>${item.adminPw}</td>
							<td><button type="button" onclick="location.href = '${item.adminId}/delete';">삭제</button> 
							<button type="button" onclick="location.href = '${item.adminId}/update';">변경</button></td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
			</div>
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
			</div>
	<c:if test="${sessionScope.admin.adminId == 'admin' }">
		<div class="overflow-hidden">
			<div class="btn-group">
				<a href="add"><i class="fas fa-file-signature"></i>등록</a>
			</div>	
		</div>
	</c:if>
	</div>
	</div>
	</div>
	<div id="overflow-hidden-admin"></div>
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