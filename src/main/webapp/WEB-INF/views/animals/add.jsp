<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">		
	function fileCheck(obj) {
		pathPoint = obj.value.lastIndexOf(".");
		filePoint = obj.value.substring(pathPoint+1, obj.length);
		fileType = filePoint.toLowerCase();
		if(fileType == "jpg" || fileType == "gif" || fileType == "png" || 
				fileType == "jpeg" || fileType == "bmp" || fileType == "svg"){	
		} else {
			alert("이미지 파일만 선택 가능합니다.");

			//input 파일 초기화
			document.getElementById("file").value = null;
                
                return false;
			}
		}
</script>
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
		<h3>유기동물 등록</h3>
		<div class="contents">
			<div class="a-table view02">
				<div>
				<form method="post" action="" enctype="multipart/form-data">
				<table>
					<caption>유기동물 등록</caption>
					<colgroup>
						<col style="width:20%;">
						<col style="width:auto;"> 
					</colgroup>
			<tbody>
				<tr class="content-text">
					<th><label>종류</label></th>
					<td colspan="1"><input name="animalTitle" type="text" class="content-text-box"></td>
				</tr>
				<tr class="content-text">
					<th><label>품종</label></th>
					<td colspan="1"><input name="animalName" type="text"></td>
				</tr>
				<tr class="content-text">
					<th><label>성별</label></th>
					<td colspan="1"><input name="animalSex" type="text"></td>
				</tr>
				<tr class="content-text">
					<th><label>발견장소</label></th>
					<td colspan="1"><input name="animalLocation" type="text"></td>
				</tr>
				<tr class="content-text">
					<th><label>나이</label></th>
					<td colspan="1"><input name="animalAge" type="text"></td>
				</tr>
				<tr class="content-text">
					<th><label>상태</label></th>
					<td colspan="1"><input name="animalState" type="text"></td>
				</tr>
				<tr class="content-text02">
					<th><label>구조일</label></th>
					<td colspan="1"><input name="animalRegDate" type="date"></td>
				</tr>		
				<tr class="content-text">
					<th><label>이미지 업로드</label></th>
					<td colspan="1"><input name="uploadFile" type="file" id="file" onchange="fileCheck(this)" 
					accept="image/gif, image/jpg, image/jpeg, image/png, image/svg" />
					<p class="p-color">파일 크기는 최대 50MB 까지 가능합니다.</p></td>
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
</div>
</body>
</html>