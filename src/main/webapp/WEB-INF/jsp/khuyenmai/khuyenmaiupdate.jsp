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
<link href="<c:url value="/resources/css/display.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<style>
label {
	font-weight: bold;
	font-size: 25px;
	margin-top: 2%;
}

small {
	color: red;
	font-size: 20px;
}

h2 {
	padding-left: 150px;
}

input {
	width: 500px;
}

table, th, td {
	border: none;
}

h2 {
	font-size: 50px;
}

* {
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

input:focus {
	font-size: 25px;
}
</style>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="row d-flex justify-content-center">
		<div class="col-3 mt-5">
			<h2 class="text-uppercase fw-bold" style="margin-left: -15%">Chỉnh
				sửa khuyến mãi</h2>
			<form:form
				action="${pageContext.request.contextPath}/admin/khuyenmai/luukhuyenmaicapnhat"
				method="post" modelAttribute="KhuyenMaiForm" id="form1" class="mt-3">
				<table>
					<tr class="form-group flex-column">
						<form:label path="maKhuyenMai">Mã khuyến mãi</form:label>
						<form:input path="maKhuyenMai" id="maKhuyenMai" readonly="true"
							class="form-control" style="font-size: 20px;" />
						<form:errors path="maKhuyenMai" />
					</tr>
					<tr>
						<form:label path="tenKhuyenMai">Tên khuyến mãi</form:label>
						<form:input path="tenKhuyenMai" readonly="false"
							class="form-control" style="font-size: 20px;" />
						<small><form:errors path="tenKhuyenMai" /></small>
					</tr>
					<tr>
						<form:label path="moTaKhuyenMai">Mô tả khuyến mãi</form:label>
						<form:input path="moTaKhuyenMai" type="text" readonly="false"
							class="form-control" style="font-size: 20px;" />
						<small><form:errors path="moTaKhuyenMai" /></small>
					</tr>
					<tr>
						<form:label path="ngayBatDau">Ngày bắt đầu khuyến mãi</form:label>
						<form:input path="ngayBatDau" type="date" readonly="false"
							class="form-control" style="font-size: 20px;" />
						<small><form:errors path="ngayBatDau" />${ngayBatDauError}</small>
					</tr>
					<tr>
						<form:label path="ngayKetThuc">Ngày kết thúc khuyến mãi</form:label>
						<form:input path="ngayKetThuc" type="date" readonly="false"
							class="form-control" style="font-size: 20px;" />
						<small><form:errors path="ngayKetThuc" />${ngayKetThucError}</small>
					</tr>
					<tr>
						<form:label path="tiLeKhuyenMai">Tỉ lệ khuyến mãi</form:label>
						<form:input path="tiLeKhuyenMai" type="number" id="tiLeKhuyenMai"
							readonly="false" class="form-control" style="font-size: 20px;" />
						<small><form:errors path="tiLeKhuyenMai" /></small>
					</tr>

					<tr>

						<form:button value="them"
							class="btn btn-warning d-flex justify-content-center mt-5"
							style="font-size: 30px">Cập nhật</form:button>
					</tr>


				</table>
				<p style="color: red">${message1}</p>
				<p id=messageMaDV style="color: red"></p>
				<p id="messageDonGia" style="color: red"></p>
			</form:form>
		</div>
	</div>

	<script src="<c:url value="/resources/js/scripts.js"/>"></script>
</body>
</html>