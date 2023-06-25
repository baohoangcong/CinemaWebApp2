<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý hệ thống</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/display.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<style>
label {
	font-weight: bold;
	font-size: 25px;
}

small {
	color: red;
	font-size: 20px;
}

h2 {
	padding-left: 150px;
	font-size: 50px;
}

input {
	width: 500px;
	height: 50px;
}

input:invalid {
	color: #FF0000;
	animation: shake 300ms;
}

@
keyframes shake { 25%{
	transform: translateX(4px);
}
50%{
transform
:
 
translateX
(-4px);
}
75%{
transform
:
 
translateX
(4px);
}
}
</style>
</head>
<body class="d-flex flex-row justify-content-center text-white" style="background-color: #181616;">
	<%@ include file="/common/header.jsp"%>
	<div class="row">
		<div class="main-body col-10 d-flex flex-row justify-content-center">
			<div class="" style="margin-left:500px;">
				<form:form class="form"
					action="${pageContext.request.contextPath}/admin/dichvu/luu"
					method="post" modelAttribute="dichvu" id="form1">
					<div class="row mt-5">
						<h2 class="section-heading text-uppercase fw-bold" style="margin-left: 10%;"
							>Thêm dịch vụ</h2>
						<div class="col-12 ">
							<div class="form-group ">
								<form:label path="maDichVu" for="maDichVu">Mã dịch vụ</form:label>
								<form:input path="maDichVu" type="text" pattern="^DV\d{5}$" class="form-control"
									id="maDichVu" placeholder="Mã dịch vụ" style="width:500px" />
								<small style="color:red !important;"><form:errors path="maDichVu" />${maDichVuError}</small>
							</div>
							<br>
							<div class="form-group">
								<form:label path="tenDichVu" for="tenDichVu">Tên dịch vụ</form:label>
								<form:input path="tenDichVu" type="text" class="form-control"
									id="tenDichVu" placeholder="Tên dịch vụ" style="width: 500px;"></form:input>
								<small><form:errors path="tenDichVu" /></small>
							</div>
							<br>
							<div class="form-group">
								<form:label path="moTaDichVu" for="moTaDichVu">Mô tả dịch vụ</form:label>
								<form:input path="moTaDichVu" type="text" class="form-control"
									id="moTaDichVu" placeholder="Mô tả dịch vụ"
									style="width: 500px;"></form:input>
								<small><form:errors path="moTaDichVu" /></small>
							</div>
							<br>
							<div class="form-group">
								<form:label path="donGia" for="donGia">Đơn giá</form:label>
								<form:input path="donGia" type="text" class="form-control"
									id="donGia" placeholder="Đơn giá" style="width: 500px;"></form:input>
								<small><form:errors path="donGia" /></small>
							</div>

							<br>
							<form:button value="list" type="submit"
								class="btn btn-danger d-flex justify-content-center" style="font-size: 25px"
								id="submit" >Thêm dịch vụ</form:button>
						</div>
					</div>
					<p id= style="color: red" class="mb-3"></p>
				</form:form>
				<br />
			</div>
		</div>
	</div>
	<script>
	/* 	$('#maDichVu').change(checkMaDV);
		function checkMaDV() {
			console.log("vào hàm check");
			var maDichVu = document.getElementById('maDichVu').value;
			console.log(maDichVu);
			var format = "^DV[0-9]{5}$";
			if (maDichVu.match(format)) {
				console.log("hàm check đúng");
				$("#messageMaDV").hide();
				return 1;
			} else {
				console.log("hàm check sai");
				$("#messageMaDV").show();
				$("#messageMaDV")
						.html(
								"<small>Mã dịch vụ không đúng định dạng: DVxxxxx(x là 1 chữ số) client<small>");
				return 0;
			}
		} */

		$("#form1").submit(function(e) {
			var val1 = checkMaDV();
			if ((val1 == 1)) {
				console.log("form dung");
				return true;
			} else {
				console.log("form sai");
				return false;
			}
		})

		const numberInput = document.getElementById("donGia");

		numberInput.addEventListener("input", function(event) {
			const inputValue = event.target.value;
			const onlyNumbers = /^\d*$/.test(inputValue);
			if (!onlyNumbers) {
				event.target.value = inputValue.replace(/\D/g, "");
			}
		});
	</script>
	<script src="<c:url value="/resources/js/scripts.js"/>"></script>
</body>
</html>