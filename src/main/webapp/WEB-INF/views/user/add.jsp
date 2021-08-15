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
			<h2>회원 관리
				<span>User List</span>
			</h2>
			<ul class="animals-list-nav">
			<li>	
				<a href="/user/list" class="on">회원 관리</a>
			</li>
			</ul>
		</div>
		<div class="conRight" id="contents">
		<h3>회원 등록</h3>
		<div class="contents">
			<div class="a-table view02">
			<form method="post">
			<table>
			<caption>회원 등록</caption>
					<colgroup>
						<col style="width:20%;">
						<col style="width:auto;"> 
					</colgroup>
			<tbody>
				<tr class="content-text">
					<th><label>아이디:</label></th>
					<td colspan="1"><input name="userId" type="text"></td>
				</tr>
				<tr class="content-text">
					<th><label>비밀번호:</label></th>
					<td colspan="1"><input name="userPw" type="text"></td>
				</tr>
				<tr class="content-text">
					<th><label>이름:</label></th>
					<td colspan="1"><input name="userName" type="text"></td>
				</tr>
				<tr class="content-text">
					<th><label>전화번호:</label></th>
					<td colspan="1"><input name="userTel" type="number" placeholder=" '-'을 제외한 휴대폰번호를 입력해 주세요">
					</td> 
				</tr>
				<tr class="content-text">
					<th><label>주소:</label></th>
					<td colspan="1"><input name="userAddress" type="text"></td>
				</tr>
			<tr class="content-submit">
				<td colspan="5"><input type="submit" value="등록완료"></td>
			</tr>
				</tbody>
			</table>
		</form>
	</div>
		<div class="overflow-hidden">
		<div class="btn-group">
			<a href="list"><i class="fas fa-bars"></i>취소</a>
		</div>	
		</div>
	</div>
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
</body>
</html>