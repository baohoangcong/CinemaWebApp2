<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYpE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý hệ thống</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<link href="<c:url value="/resources/css/display.css" />"
	rel="stylesheet" type="text/css">
<style>
label {
	font-weight: bold;
	font-size: 25px;
}

small{
	color: red !important;
	font-size: 20px;
}
.error{
*: unset;
color: red;
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
<body class="d-flex flex-row justify-content-center">
	<%@ include file="/common/header.jsp"%>
	<div class=" main-body d-flex justify-content-center">

		<form:form class="form d-flex justify-content-center"
			action="${pageContext.request.contextPath}/admin/khuyenmai/luu"
			method="post" modelAttribute="khuyenmai" id="form1">
			<div class="row" style="margin-left: 21%">
				<h2 class="section-heading text-uppercase fw-bold">Thêm khuyến mãi</h2>
				<div class="col mt-4">
					<div class="form-group  ">
						<form:label path="maKhuyenMai" for="maKhuyenMai ">Mã khuyến mãi</form:label>
						<form:input path="maKhuyenMai" pattern="^KM\d{5}$" type="text"
							class="form-control" id="maKhuyenMai" placeholder="Mã khuyến mãi"
							style="width:500px"></form:input>
						<p style="color: red !important;"><form:errors path="maKhuyenMai" />
							${maKhuyenMaiError}</p>
					</div>
					<br>
					<div class="form-group">
						<form:label path="tenKhuyenMai" for="tenKhuyenMai">Tên khuyến mãi</form:label>
						<form:input path="tenKhuyenMai" type="text" class="form-control"
							id="tenKhuyenMai" placeholder="Tên khuyến mãi"
							style="width: 500px;"></form:input>
						<div class="error"><form:errors path="tenKhuyenMai" /></div>
					</div>
					<br>
					<div class="form-group">
						<form:label path="moTaKhuyenMai" for="moTaKhuyenMai">Mô tả khuyến mãi</form:label>
						<form:input path="moTaKhuyenMai" type="text" class="form-control"
							id="moTaKhuyenMai" placeholder="Mô tả khuyến mãi"
							style="width: 500px;"></form:input>
						<div class="error"><form:errors path="moTaKhuyenMai" /></div>
					</div>
					<br>
					<div class="form-group">
						<form:label path="ngayBatDau" for="ngayBatDau">Ngày bắt đầu khuyến mãi</form:label>
						<form:input path="ngayBatDau" type="date" class="form-control"
							id="ngayBatDau" style="width: 500px;"></form:input>
						<div class="error"><form:errors path="ngayBatDau" />${ngayBatDauError}</div>
					</div>

					<br>
					<div class="form-group">
						<form:label path="ngayKetThuc" for="ngayKetThuc">Ngày kết thúc khuyến mãi</form:label>
						<form:input path="ngayKetThuc" type="date" class="form-control"
							id="ngayKetThuc" style="width: 500px;"></form:input>
						<div class="error"><form:errors path="ngayKetThuc" />${ngayKetThucError}</div>
					</div>

					<br>
					<div class="form-group">
						<form:label path="tiLeKhuyenMai" for="tiLeKhuyenMai">Tỉ lệ khuyến mãi</form:label>
						<form:input path="tiLeKhuyenMai" type="number"
							class="form-control" id="tiLeKhuyenMai" style="width: 500px;"></form:input>
						<div class="error"><form:errors path="tiLeKhuyenMai" /></div>
					</div>

					<br>
					<form:button value="list" type="submit"
						class="btn btn-warning d-flex justify-content-center mt-3" id="submit"
						style="font-size: 25px">Thêm khuyến mãi</form:button>
				</div>
			</div>
			<p id=messageMaKM class="error"></p>
		</form:form>
		<br />
	</div>
	<script>
		$("#maKhuyenMai").change(checkMaKM);
		function checkMaKM() {
			console.log("Ham check");
			var maKhuyenMai = document.getElementById('maKhuyenMai').value;
			var format = /^KM[0-9]{5}$/;
			if (maKhuyenMai.match(format)) {
				console.log("Ham check dung");
				$("#messageMaKM").hide();
				return 1;
			} else {
				console.log("Ham check sai");
				$("#messageMaKM").show();
				$("#messageMaKM")
						.html(
								"<div>Mã dịch vụ không đúng định dạng: KMxxxxx(x là 1 chữ số)<div>");
				return 0;
			}
		}

		$("#form1").submit(function(e) {
			var val1 = checkMaDV();
			if ((val1 == 1)) {
				console.log("form check dung");
				return true;
			} else {
				console.log("form check sai");
				return false;
			}
		});
		const numberInput = document.getElementById("tiLeKhuyenMai");
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