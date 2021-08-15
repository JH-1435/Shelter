<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="head.jsp"></jsp:include>	
<script>
	// 1 == '1' => value(값)이 같으면 true, |  1 === '1' => type과 value 가 같아야 하므로 false
	// confirmId 에서 사용한 코드들 = 에이젝, 즉 에이젝을 사용함
	function confirmId(){
		// 에이젝을 사용하기 위한 객체생성
		const form = document.signupForm;
		
		const xhr = new XMLHttpRequest();
		
		// 비동기방식(true),에이젝의 제대로된 성능을 내려면 비동기 방식 채용
		xhr.open("GET", "confirmId?userId=" + form.userId.value, true);  
		
		xhr.onreadystatechange = function() {
			// DONE(처리가 됨)인 상태가 된다면..
			if(xhr.readyState == XMLHttpRequest.DONE) {
								
				// AJAX 요청이 정상적으로 처리되었는지 아닌지만을 검사하기 위해 응답 코드가 200 인지 확인
				if(xhr.status == 200) {
					if(xhr.responseText == 'OK') { 
						alert("사용할수 있는 아이디 입니다");
						form.id_confirm.value = form.userId.value;
		
					} else {
						alert('다른 사용자가 이미 사용하고 있는 아이디 입니다');
					}
				}
			}	
		};
		
		xhr.send();
		
	}
	
	// 벨리데이션(검증)하는 코드들
	function submit() {
		const form = document.signupForm;
		
		if(form.userId.value != form.id_confirm.value) {
			alert('아이디 중복확인을 하세요');
			return;
		}
		
		if(form.userId.value == "") {
			alert('아이디를 입력 해 주세요');
			form.userId.focus();
			return;
		}
		
		if(form.userPw.value == "") {
			alert('비밀번호를 입력 해 주세요');
			form.userPw.focus();
			return;
		}
		if(form.userPw_confirm.value == "") {
			alert('비밀번호를 입력 해 주세요');
			form.userPw_confirm.focus();
			return;
		}
		
		if(form.userPw.value != form.userPw_confirm.value) {
			alert('비밀번호가 일치하지 않습니다');
			form.userPw_confirm.value = "";
			form.userPw_confirm.focus();
			return;
		}
		
		if(form.userName.value == "") {
			alert('이름을 입력 해 주세요');
			form.userName.focus();
			return;
		}
		
		if(form.userAddress.value == "") {
			alert('주소를 입력 해 주세요');
			form.userAddress.focus();
			return;
		}
		
		if(form.userTel.value == "") {
			alert('번호를 입력 해 주세요');
			form.userTel.focus();
			return;
		}
		
		form.submit();
	}
</script>
</head>
<body class="login-bg">
<!-- <button>을 쓰면 내 의도와 상관없이 submit 되어버림,고로 form태그 바깥으로 놔야함 -->
	<div class="sign-wrap">
	<div class="login-header">
		<a href="/"><img  src="img/logo-main.png"/></a>
	</div>
	<!-- Title  -->
		<div class="login-text">
			<h2>회원가입</h2>
		</div>
		<!-- Form 입력 -->
		<div class="login-form">
			<form name="signupForm" method="post">
				<input name="id_confirm" type="hidden" value="" >
				<div class="login-entry">
				<fieldset>
				<div class="signup-list">
				<ul class="text">
					<li>
						<label>아이디:</label>
						<input name="userId" type="text" > 
						<button type="button" onclick="location.href='javascript:confirmId()';">중복검사</button>
					</li>
				<li>
					<label>비밀번호:</label>
					<input name="userPw" type="password">
				</li>
				<li>
					<label>비밀번호 재확인:</label>
					<input name="userPw_confirm" type="password" >
				</li>
				<li>
					<label>이름:</label>
					<input name="userName" type="text">
				</li>
				<li>
					<label>전화번호:</label>
					<input name="userTel" type="tel" placeholder="'-'을 제외한 휴대폰번호를 입력해 주세요">
				</li>
				<li>
					<label>주소:</label>
					<input name="userAddress" type="text">
				</li>
			</ul>
				</div>
					</fieldset>
				</div>
				</form>
			<!-- form태그 바깥에 버튼을 두면 엔터키가 안먹힘 -->
			<div id="signup02">
				<button onclick="submit()" class="signup-btn">회원가입 완료</button>
			</div>
		</div>
	</div>
</body>
</html>