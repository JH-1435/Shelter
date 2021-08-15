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
			<h2>입양 신청
				<span>Adoption</span>
			</h2>
			<ul class="animals-list-nav">
			<li>	
				<a href="/board/list" class="on">입양신청</a>
			</li>
			</ul>
		</div>
	<div class="conRight" id="contents">
		<h3>게시글 수정</h3>
		<div class="contents">
		<!------ 컨텐츠 내용 ------>
	<div class="a-table view02">
		<div>
		<!-- submit 하면 form 값을 @GM("/orders")로 보냄 -->
			<form method="post" >
			<table>
			<caption>게시글 수정</caption>
			<colgroup>
			<col style="width:20%;">
			<col style="width:20%;">
			<col style="width:20%;">
			<col style="width:20%;">
			<col style="width:20%;">
		</colgroup>
		<tbody>
				<tr>
					<th scope="row" class="av-1"><label>신청글 번호</label></th>
					  <td>${item.boardNum}</td> 
					  <th scope="row" class="av-1"><label>작성자</label></th>  
					<td>${item.userName}(${item.userId})</td> 
				</tr>
				<tr class="content-text">
					<th colspan="1"><label>제목(*)</label></th>
					<td colspan="3"><input class="content-text-box" name="boardTitle" type="text" value="${item.boardTitle}"></td>
				</tr>
				<tr>
					<th colspan="1" class="av-1"><label>내용(*)</label></th>
					<td colspan="3"><textarea rows="6" cols="72" name="boardContent" maxlength="2048"></textarea>
					</td> 
				</tr>
				<tr class="content-submit">
					<td colspan="4"><input type="submit" value="수정완료"></td>
				</tr>
				</tbody>
			</table>
			</form>
		</div>
		<div class="overflow-hidden">
		<div class="btn-group">
			<a href="../list"><i class="fas fa-bars"></i>취소</a>
		</div>	
	</div>
	</div>
	<!---- 입양선택 ---->
	<!---- 컨텐츠내용 ---->
	</div>
	</div>
	<!-- contents-layout  -->
		<div class="clear"></div>
	</div>
	</div>
	<div id="overflow-hidden-update"></div>
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