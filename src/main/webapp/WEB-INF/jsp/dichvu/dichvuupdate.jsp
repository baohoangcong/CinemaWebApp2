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
	height: 50px;
}

input:focus {
	font-size: 25px;
}
</style>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="row  d-flex justify-content-center">
		<div class="col-4  d-flex justify-content-center" style="margin-top: 5%;">
			<div class="col">
				<h2 class="section-heading text-uppercase fw-bold">Chỉnh sửa
					dịch vụ</h2>
				<form:form
					action="${pageContext.request.contextPath}/admin/dichvu/luudichvucapnhat"
					method="post" modelAttribute="DichVuForm" id="form1" class="mt-3">
					<table>
						<tr class="form-group flex-column">
							<form:label path="maDichVu">Mã dịch vụ</form:label>
							<form:input path="maDichVu" id="maDichVu" readonly="true"
								class="form-control" style="font-size: 20px;" />
							<form:errors path="maDichVu" />
						</tr>
						<tr>
							<form:label path="tenDichVu">Tên dịch vụ</form:label>
							<form:input path="tenDichVu" readonly="false"
								class="form-control" style="font-size: 20px;" />
							<small><form:errors path="tenDichVu" /></small>
						</tr>
						<tr>
							<form:label path="moTaDichVu">Mô tả dịch vụ</form:label>
							<form:input path="moTaDichVu" type="text" readonly="false"
								class="form-control" style="font-size: 20px;" />
							<small><form:errors path="moTaDichVu" /></small>
						</tr>
						<tr>
							<form:label path="donGia">Đơn giá</form:label>
							<form:input path="donGia" type="number" id="donGia"
								readonly="false" class="form-control"
								style="font-size: 20px;" />
							<small><form:errors path="donGia" /> </small>
						</tr>
						<tr>
							<form:button value="them"
								class="btn btn-warning d-flex justify-content-center mt-3"
								style="font-size: 30px">Cập nhật</form:button>
						</tr>
					</table>
					<p style="color: red">${message1}</p>
					<p id=messageMaDV style="color: red"></p>
					<p id="messageDonGia" style="color: red"></p>
				</form:form>
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/js/scripts.js"/>"></script>
</body>
</html>