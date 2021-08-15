<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="head.jsp"></jsp:include>	
<script>
	function submit() {
		const form = document.loginForm2;
		
		if(form.adminId.value == "") {
			alert("아이디를 입력 해 주세요");
			form.adminId.focus();
			return;
		}
		if(form.adminPw.value == "") {
			alert("비밀번호를 입력 해 주세요");
			form.adminPw.focus();
			return;
		}
		
		form.submit();
	}

</script>

</head>
<body class="login-bg">
<!-- <button>을 쓰면 내 의도와 상관없이 submit 되어버림,고로 form태그 바깥으로 놔야함 -->
 <div class="login-wrap">
	<div class="login-header">
		<a href="/"><img  src="/resources/img/logo-main.png"/></a>
	</div>
	<!-- Title  -->
		<div class="login-text">
			<h2>로그인(관리자)</h2>
		</div>
		<!-- Form 입력 -->
	<div class="login-form">
<form method="post" name="loginForm2">
	<div class="login-entry">
		<fieldset>
	<div class="login-list">
		<ul class="text">
		 	<li>
				<input name="adminId" type="text" placeholder="아이디를 입력해 주세요">
			</li>
			<li>
				<input name="adminPw" type="password" placeholder="비밀번호를 입력해 주세요">
			</li>
		</ul>
	</div>
		</fieldset>
	</div>
</form>
	<!-- 폼태그 안에 있는 버튼은 따로 지정을 안해도 무조건 submit이 된다, form태그 바깥에 버튼을 두면 엔터키가 안먹힘 -->
	<div id="login">
		<button onclick="submit()" class="signup-btn">로그인</button>
	</div>
	</div>
</div>
</body>
</html>