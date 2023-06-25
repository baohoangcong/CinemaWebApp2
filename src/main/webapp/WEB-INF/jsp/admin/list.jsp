<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

<style>
table, td, th {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
	width: 50%;
}

td {
	text-align: center;
}
</style>
</head>
<body style="background-color: #E6E9EB">


	<%@ include file="/common/header.jsp"%>
	<br>
	<div class="container bg-light text-dark" style="margin-top: 95px">


		<br>  <br> <br>
		<div class="align-self-center" style="margin-left: 530px;">
			<h1>List Khách Hàng</h1>
			<form action="${pageContext.request.contextPath}/admin/search"
				method="get">
				<input type="text" name="tenKhachHang"
					style="width: 365px; margin-left: -50px;"> <input
					type="submit" value="Search">

			</form>
		</div>
		<br>
		<table class="table table-hover table-striped">
			<thead class="bg-warning text-white">
				<tr>

					<th>mã Khách Hàng</th>
					<th>Tên Khách Hàng</th>
					<th>Ngày Sinh</th>
					<th>Giới Tính</th>
					<th>Email</th>
					<th>SDT</th>
					<th>Items</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${khachHang}" varStatus="status">
					<tr>

						<td>${c.maKhachHang}</td>
						<td>${c.tenKhachHang}</td>
						<td>${c.ngaySinh}</td>
						<td>${c.gioiTinh}</td>
						<td>${c.email}</td>
						<td>${c.sdt}</td>
						<td><a
							href="${pageContext.request.contextPath}/admin/update/${c.maKhachHang}"><i
								class="fa-sharp fa-solid fa-pen-to-square"></i></a> <a
							href="${pageContext.request.contextPath}/admin/listmuave/${c.maKhachHang}"><i
								class="fa-solid fa-circle-info" "></i></a> <a
							href="${pageContext.request.contextPath}/admin/listdichvu/${c.maKhachHang}"><i
								class="fa-solid fa-pen"></i></a> <a
							href="${pageContext.request.contextPath}/admin/delete/${c.maKhachHang}"><i
								class="fa-solid fa-delete-left"
								onclick="return confirm('Bạn có muốn xóa không?')"></i></a></td>
					</tr>
				</c:forEach>

			</tbody>
		<p style="color: green">${search}</p>
		</table>
		
		
	<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="listPhimSapChieu?page=${currentPage-1}" class="btn btn-light btn-direction">&laquo;
					Previous</a>
			</c:if>

			<c:forEach var="i" begin="1" end="${totalPages}" varStatus="status">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<a class="active active-red">${i}</a>
					</c:when>
					<c:otherwise>
						<c:if
							test="${status.index <= 2 || status.index >= totalPages - 1}">
							<a href="listPhimSapChieu?page=${i}">${i}</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${currentPage lt totalPages}">
				<a href="listPhimSapChieu?page=${currentPage+1}" class="btn btn-light btn-direction">Next
					&raquo;</a>
			</c:if>
		</div>
	<br>
	
	
	</div>
	
	
	<%@ include file="/common/footer.jsp"%> 




</body>
</html>