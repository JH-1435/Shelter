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
			<h2>센터소개
				<span>Introduction</span>
			</h2>
			<ul class="animals-list-nav">
			<li>	
				<a href="/center" class="on">센터소개</a>
			</li>
			<li>
				<a href="/directions">오시는길</a>
			</li>
			</ul>
		</div>
		<div class="conRight" id="contents">
				<h3>센터소개</h3>
		<div class="contents">
		<div class="overflow-hidden-view"></div>
		
		<p class="sub-title">동물보호센터 설립 목적과 인력 및 업무에 대해 소개해 드립니다.</p>
				<h4>설립목적</h4>	
		<p class="sub-content">
			동물보호센터에서는 동물보호법과 동물보호조례에 의하여 유기,
			유실동물의 생명과 안전을 위해<br> 적정하게 보호,
			관리하고 재입양을 주선하여 새 삶의 기회를 통해 생명존중에 대한 정서함양에<br>이바지하고 
			인수 공통 전염병 방지와 위생적인 생활환경 조성을 위해 설립되었습니다.
		</p>
		<h4>직원안내</h4>
		<table class="sub-content-table">
				<caption>센터소개</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:20%;">
					<col style="width:60%;">
				</colgroup>
				<tbody>
					<tr>
						<th class="th-top" scope="row" colspan="2">직원구성</th>
						<th class="th-top" scope="row">담당업무</th>
					</tr>
					<tr>
						<td rowspan="2">수의사</td>
						<td>김xx</td>
						<td rowspan="2" class="td-end">
						보호동물 진료관련 일체<br>
						보호센터 및 동물병원 사무 총괄
						</td>
					</tr>
					<tr>
						<td>강xx</td>
					</tr>
					<tr>
						<td rowspan="2">관리팀장</td>
						<td>권xx</td>
						<td rowspan="2" class="td-end">
						동물 공고 및 분양<br>
						홈페이지 관리<br>
						시설관리 및 운영<br>
						진료보조
						</td>
					</tr>
					<tr>
						<td>김xx</td>
					</tr>
					<tr>
						<td rowspan="6">관리사</td>
						<td>박xx</td>
						<td rowspan="6" class="td-end">
						보호동물 사양관리<br>
						동물 미용 및 목욕<br>
						진료보조<br>
						분양안내
						</td>
					</tr>
					<tr>
						<td>강xx</td>
					</tr>
					<tr>
						<td>정xx</td>
					</tr>
					<tr>
						<td>나xx</td>
					</tr>
					<tr>
						<td>다xx</td>
					</tr>
					<tr>
						<td>라xx</td>
					</tr>
					<tr>
						<td>공무원</td>
						<td>김xx</td>
						<td class="td-end">
						동물보호센터 민원안내<br>
						동물보호센터 입양관리 및 사양관리 업무 보조 
						<div class="overflow-hidden-sub"></div>
						</td>
					</tr>
				</tbody>
		</table>
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