<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Signin</title>
<!--* Project:Cinema WebApp
    * @author TuNC8
    * Team 2  
   - Đăng Nhập Form-->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/display.css"/>"
	rel="stylesheet">

<style>
html, body {
	height: 110%;
}

.form-signin {
	max-width: 400px;
	padding: 15px;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-floating {
	margin-top: 30px;
	margin-bottom: 20px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

img {
	border-radius: 8px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
}

h1 {
	text-align: center;
}

button {
	margin-top: 10px;
	margin-bottom: 20px;
	text-align: center;
}

.right {
	text-align: right;
	float: right;
}

.center {
	text-align: center;
	float: center;
}

a {
	color: blue;
}
</style>
</head>
<%@ include file="/common/headerkhach.jsp"%>
<body class="d-flex flex-row justify-content-center">
	<div class="main-body container mt-3">
		<main class="form-signin w-100 m-auto">
			<form id="loginForm"
				action="${pageContext.request.contextPath}/j_spring_security_check"
				method="POST" modelAttribute="taikhoan">

				<img class="mb-4"
					src="https://i.pinimg.com/564x/c4/c8/08/c4c8085cd050efafd96b021591e6f75c.jpg"
					alt="" width="250" height="220">
				<h1 class="h3 mb-3 fw-normal">ĐĂNG NHẬP</h1>
				<p style="color: blue">${messagePassword}</p>
				<div class="form-floating">
					<input type="text" class="form-control" id="account" name="account"
						path="account" placeholder="Password"> <label
						path="account">UserName</label>
					<div id="usernameErrow" style="color: red;"></div>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="password"
						name="password" path="password" placeholder="Password"> <label
						path="password">Password</label>
					<div id="passwordErrow" style="color: red;"></div>
					<p style="color: red">${messageAccount}</p>
				</div>
				<div class="checkbox mb-3">
					<input type="checkbox" value="remember-me" name="rememberme" id="rememberme">
					<label> Remember me</label>
					<div class="right">
						<a href="${pageContext.request.contextPath}/taikhoan/quenmatkhau">Quên
							Mật Khẩu !</a>
					</div>
				</div>

				<button class=" w-100 btn btn-lg btn-warning" id="myBtn"
					type="submit">ĐĂNG NHẬP</button>
				<div class="center">
					<a href="${pageContext.request.contextPath}/taikhoan/dangky">Bạn
						Chưa Có Tài Khoản, Đăng Ký Tại Đây !</a>
				</div>
			</form>
		</main>
	</div>
	<%@ include file="/common/footer.jsp"%>
	<script>
		document.getElementById("loginForm").onsubmit = function(e) {
			let account = document.getElementById("account").value;
			let password = document.getElementById("password").value;
			if (account == "") {
				account = "";
				document.getElementById("account").style.borderColor = "red"
				document.getElementById("usernameErrow").innerHTML = "Vui Lòng Nhập UserName ";
				e.preventDefault();
			} else {
				document.getElementById("account").style.borderColor = ""
				document.getElementById("usernameErrow").innerHTML = "";
			}
			if (password == "") {
				password = "";
				document.getElementById("password").style.borderColor = "red"
				document.getElementById("passwordErrow").innerHTML = "Vui Lòng Nhập Password ";
				e.preventDefault();
			} else {
				document.getElementById("password").style.borderColor = ""
				document.getElementById("passwordErrow").innerHTML = "";
				return true;
			}
		}
	</script>
</body>
</html>