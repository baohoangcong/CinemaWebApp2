<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SignUp</title>
<!-- @TuNC8 
   - Đăng Ký Form-->

<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/display.css"/>"
	rel="stylesheet">

<style>
html, body {
	height: 130%;
}

.form-signin {
	max-width: 360px;
	padding: 15px;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-group {
	margin-top: 10px;
	margin-bottom: 10px;
}

img {
	border-radius: 8px;
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
}

.center {
	text-align: center;
	float: center;
}

label {
	font-weight: bold;
}

a{
text-decoration: none
}
</style>
</head>
<body class="d-flex flex-row justify-content-center">
	<%@ include file="/common/headerkhach.jsp"%>
	<div class="main-body container mt-3">
		<main class="form-signin w-100 m-auto">
			<form id="loginForm" action="${pageContext.request.contextPath}/taikhoan/dangky" method="Post"
				modelAttribute="khachhang">
				<img class="mb-4"
					src="https://i.pinimg.com/564x/c4/c8/08/c4c8085cd050efafd96b021591e6f75c.jpg"
					alt="" width="250" height="220">
				<h1 class="h3 mb-3 fw-normal">ĐĂNG KÝ</h1>
				<div class="form-group col-sm-12">
					<label path="tenKhachHang">Họ Tên</label> <input
						class="form-control" type="text" path="tenKhachHang"
						name="tenKhachHang" id="tenKhachHang" />
					<div id="tenKhachHangErrow" style="color: red;"></div>
				</div>
				<div class="form-group col-sm-12">
					<label path="sdt">Số Điện Thoại</label> <input class="form-control"
						type="text" path="sdt" id="sdt" name="sdt" />
					<div id="sdtErrow" style="color: red;"></div>

				</div>
				<div class="form-group col-sm-12">
					<label path="email">Email</label> <input class="form-control"
						type="text" path="email" id="email" name="email" />
						<p style="color: red">${messageEmail}</p>
					<div id="emailErrow" style="color: red;"></div>
				</div>
				<div class="form-group col-sm-12">
					<label path="account">UserName</label> <input class="form-control"
						type="text" path="account" id="account" name="account" />
						<p style="color: red">${messageAccount}</p>
					<div id="accountErrow" style="color: red;"></div>
				</div>
				<div class="form-group col-sm-12">
					<label path="password">Mật Khẩu</label> <input class="form-control"
						type="password" path="" id="password" name="password" />
					<div id="passwordErrow" style="color: red;"></div>
				</div>
				<div class="form-group col-sm-12">
					<label path="repassword">Nhập Lại Mật Khẩu</label> <input
						class="form-control" type="password" path="" id="repassword"
						name="repassword" />
					<div id="repasswordErrow" style="color: red;"></div>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gioiTinh"
						id="gioiTinh" value="Nam" path="gioiTinh" required> <label
						class="form-check-label" path="gioiTinh">Nam</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gioiTinh"
						id="gioiTinh" value="Nu" path="gioiTinh" required> <label
						class="form-check-label" path="gioiTinh">Nữ</label>
				</div>
				<div class="form-group col-sm-12">
					<label path="ngaySinh">Ngày Sinh</label> <input
						class="form-control" type="date" path="ngaySinh" id="ngaySinh"
						name="ngaySinh" />
					<div id="ngaySinhErrow" style="color: red;"></div>
				</div>
				<div class="form-group col-sm-12">
					<label path="diaChi">Địa Chỉ</label> <input class="form-control"
						type="text" path="diaChi" id="diaChi" name="diaChi" />
				</div>

				<div class="checkbox mb-3">
					<div class="center"></div>
					<input type="checkbox" value="" required> <label>Tôi
						đồng ý với </label> <a href="https://www.cgv.vn/default/terms-conditions/"> Điều khoản dịch vụ!</a>
				</div>
				<button class="w-100 btn btn-lg btn-warning" id="myBtn"
					type="submit" style="color: white">ĐĂNG KÝ</button>
			</form>
		</main>
	</div>
	<%@ include file="/common/footer.jsp"%>
	<script>
		document.getElementById("loginForm").onsubmit = function(e) {
			let account = document.getElementById("account").value;
			let password = document.getElementById("password").value;
			let repassword = document.getElementById("repassword").value;
			let tenKhachHang = document.getElementById("tenKhachHang").value;
			let email = document.getElementById("email").value;
			let sdt = document.getElementById("sdt").value;
			let ngaySinh = document.getElementById("ngaySinh").value;
			if (tenKhachHang.trim() == "") {
				tenKhachHang = "";
				document.getElementById("tenKhachHang").style.borderColor = "red"
				document.getElementById("tenKhachHangErrow").innerHTML = "Vui Lòng Nhập Họ Tên ! ";
				e.preventDefault();
			} else if (/^[a-zA-Z_ÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\ ]+$/
					.test(tenKhachHang)) {
				tenKhachHang = "";
				document.getElementById("tenKhachHang").style.borderColor = ""
				document.getElementById("tenKhachHangErrow").innerHTML = "";
			} else {
				document.getElementById("tenKhachHang").style.borderColor = "red"
				document.getElementById("tenKhachHangErrow").innerHTML = "Họ Tên Sai Định Dạng";
				e.preventDefault();
			}

			if (account == "") {
				account = "";
				document.getElementById("account").style.borderColor = "red"
				document.getElementById("accountErrow").innerHTML = "Vui Lòng Nhập UserName  !";
				e.preventDefault();
			} else if (/^(\w{6,20})$/.test(account)) {
				account = "";
				document.getElementById("account").style.borderColor = ""
				document.getElementById("accountErrow").innerHTML = "";
			} else {
				document.getElementById("account").style.borderColor = "red"
				document.getElementById("accountErrow").innerHTML = "UserName Có Độ Dài Từ 6-20 Ký Tự Và Không Được Chứa Kí Tự Đặc Biệt !";
				e.preventDefault();
			}

			if (sdt == "") {
				sdt = "";
				document.getElementById("sdt").style.borderColor = "red"
				document.getElementById("sdtErrow").innerHTML = "Vui Lòng Nhập SDT ! ";
				e.preventDefault();
			} else if (/^[0][0-9]{9}$/.test(sdt)) {
				sdt = "";
				document.getElementById("sdt").style.borderColor = ""
				document.getElementById("sdtErrow").innerHTML = "";
			} else {
				document.getElementById("sdt").style.borderColor = "red"
				document.getElementById("sdtErrow").innerHTML = "SDT Sai Định Dạng !";
				e.preventDefault();
			}

			if (email == "") {
				email = "";
				document.getElementById("email").style.borderColor = "red"
				document.getElementById("emailErrow").innerHTML = "Vui Lòng Nhập Email !";
				e.preventDefault();
			} else if (/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/
					.test(email)) {
				email = "";
				document.getElementById("email").style.borderColor = ""
				document.getElementById("emailErrow").innerHTML = "";
			} else {
				document.getElementById("email").style.borderColor = "red"
				document.getElementById("emailErrow").innerHTML = "Email Sai Định Dạng !";
				e.preventDefault();

			}
			if (ngaySinh == "") {
				ngaySinh = "";
				document.getElementById("ngaySinh").style.borderColor = "red"
				document.getElementById("ngaySinhErrow").innerHTML = "Vui Lòng Nhập Ngày Sinh !";
				e.preventDefault();
			} else if (Date.parse(ngaySinh) > Date.now()) {
				ngaySinh = "";
				document.getElementById("ngaySinh").style.borderColor = "red"
				document.getElementById("ngaySinhErrow").innerHTML = "Ngày Sinh Không Được Lớn Hơn Ngày Hiện Tại !";
				e.preventDefault();
			} else {
				document.getElementById("ngaySinh").style.borderColor = ""
				document.getElementById("ngaySinhErrow").innerHTML = "";
			}

			if (repassword == "") {
				repassword = "";
				document.getElementById("repassword").style.borderColor = "red"
				document.getElementById("repasswordErrow").innerHTML = "Vui Lòng Nhập Lại Mật Khẩu ! ";
				e.preventDefault();
			} else if (repassword != password) {
				repassword = "";
				document.getElementById("repassword").style.borderColor = "red"
				document.getElementById("repasswordErrow").innerHTML = "Mật Khẩu Phải Trùng Với Mật Khẩu Bạn Đã Nhập !";
				e.preventDefault();
			} else {
				document.getElementById("repassword").style.borderColor = ""
				document.getElementById("repasswordErrow").innerHTML = "";
			}

			if (password == "") {
				password = "";
				document.getElementById("password").style.borderColor = "red"
				document.getElementById("passwordErrow").innerHTML = "Vui Lòng Nhập Password ! ";
				e.preventDefault();
			} else if ((/^(.{0,7}|[^0-9]*|[^A-Z]*|[^a-z]*|[a-zA-Z0-9]*)$/
					.test(password))) {
				password = "";
				document.getElementById("password").style.borderColor = "red"
				document.getElementById("passwordErrow").innerHTML = "Mật Khẩu Phải Bao Gồm 1 Kí Tự Viết Hoa, Viết Thường Và 1 Ký Tự Đặc Biệt !";
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