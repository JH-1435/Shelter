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
			<h2>입양신청
				<span>Adoption</span>
			</h2>
			<ul class="animals-list-nav">
			<li>	
				<a href="list" class="on">입양 신청</a>
			</li>
			</ul>
		</div>
		<div class="conRight" id="contents">
				<h3>입양신청</h3>
		<div class="contents">
		<!------ 컨텐츠 내용 ------>
		<div class="border-img">
			<img src="/resources/img/TEXT.png" alt="반려동물과 함께 행복한 삶을 살아보세요" class="img-title" />
		<ul>
			<li>◎ 입양신청 후 입양예정일까지 입양하지 않으시면 자동으로 입양이 취소됩니다.</li>
			<li>◎ <strong>대리인 입양 및 미성년자는 입양이 불가합니다.</strong></li>
			<li>◎ 입양 희망자는 반드시 센터에 방문하여 상담 및 분양신청서를 작성하셔야 합니다.</li>
			<li>◎ 입양후 휴대폰 등으로 사진을 전송해 주셔야 합니다.</li>
			<li>◎ 입양 완료 후 어떠한 사정에 의해서도 파양은 불가능합니다.</li>
			<li>◎ 입양은 신중히 생각하시고 결정해 주시기를 부탁드립니다.</li>
		</ul>
		</div>
		<button class="a-button" type="button" onclick="location.href = '../animals/list';">입양신청하기</button>
		<div class="a-table">
		<div class="table-spot">
		<div class="table-search">
			<form method="get" action="">
			<span></span>
				<span>
					<select name="search">
						<option value="0">선택</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>신청번호</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>제목</option>
						<option value="3" ${pager.search == 3 ? 'selected' : ''}>내용</option>
						<option value="4" ${pager.search == 4 ? 'selected' : ''}>아이디</option>
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
				<caption>게시글 리스트</caption>
				<colgroup>
					<col style="width:10%;">
					<col style="width:auto;">
					<col style="width:15%;">
					<col style="width:15%;">
					<col style="width:15%;">
					<col style="width:10%;">
					<!--<col style="width:15%;">-->
				</colgroup>
					<thead>
						<tr>
							<th colspan="1">신청번호</th>
							<th colspan="1">제목</th>
							<th colspan="1">작성자</th>
							<th colspan="1">작성일</th>
							<th colspan="1">입양 예정일</th>
							<th colspan="1">조회수</th>
							<c:if test="${sessionScope.admin.adminId == 'admin'}">
								<th colspan="1">관리</th>
							</c:if>							
						</tr>
					</thead>
					<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="6">등록 된 글이 없습니다</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.boardNum}</td>
							<td><a href="${item.boardNum}/view">${item.boardTitle}</a></td>
							<td>${item.userId}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.boardDate}" />
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.boardOkayDate}" /></td>
							<td>${item.boardReadCount}</td>
							<c:if test="${sessionScope.admin.adminId == 'admin' }">
								<td><button type="button" onclick="location.href = '${item.boardNum}/delete';">삭제</button> 
								<button type="button" onclick="location.href = '${item.boardNum}/update';">수정</button></td>
							</c:if>
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
			<a href="init"><i class="far fa-trash-alt"></i>초기화</a>
		</div>
	</div>
</c:if>	
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