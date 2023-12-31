<!-- 
SinhDN
30/08/1998
Trang danh sách phim đang chiếu
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Phim Sắp Chiếu</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
	<link href="<c:url value="/resources/css/display.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/fontawesome/css/all.min.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body class="d-flex flex-row justify-content-center">
	<%@ include file="/common/header.jsp"%>



	<div class="main-body"
		style="margin-top: 100px; margin-bottom: 100px; width: 80%">
		<h1 style=" color: white;">Danh Sách Phim</h1>
		<p style="color: green;">${msgSave}</p>
		<p style="color: green;">${msgUpdate}</p>
		<p style="color: green;">${msgDelete}</p>
		<div class="mb-3">
			<a href="them" class="btn" id="button">Thêm Mới Phim</a>
			<a href="listPhimDangChieu" class="btn" id="button">Phim Đang Chiếu</a>
			<a href="listPhimSapChieu" class="btn" id="button">Phim Sắp Chiếu</a>
		</div>


		<div>
			<form class="d-flex"
				action="${pageContext.request.contextPath}/admin/phim/searchPhimSapChieu"
				method="get">
				<input type="search" name="searchKey" class="form-control" placeholder="Tên Phim">
				 <input
					type="submit" value="Search" class="btn mx-2" id="button">
			</form>
			<br>
				<div align="center" style="color: red;">${msg3}</div>
		</div>

		<hr>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">MÃ PHIM</th>
					<th scope="col">TÊN PHIM</th>
					<th scope="col">MÔ TẢ PHIM</th>
					<th scope="col">ĐẠO DIỄN</th>
					<th scope="col">NGÀY KHỞI CHIẾU</th>
					<th scope="col">NGÀY KẾT THÚC</th>
					<th scope="col">THỜI LƯỢNG</th>
					<th scope="col">EDIT</th>
					<th scope="col">DELETE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${listThongTinPhim}" varStatus="status">
					<tr style="border: 1px black solid;">
							<td scope="col">${c.maPhim}</td>
							<td scope="col">${c.tenPhim}</td>
							<td scope="col">${c.moTaPhim}</td>
							<td scope="col">${c.daoDien}</td>
							<td scope="col">${c.ngayKhoiChieu}</td>
							<td scope="col">${c.ngayKetThuc}</td>
							<td scope="col">${c.thoiLuong}</td>
							<td scope="col"><form
									action="${pageContext.request.contextPath}/admin/phim/phimupdatesapchieu/${c.maPhim}">
									<button type="submit" class="btn btn-primary">Edit</button>
								</form></td>
							<td scope="col"><form
									action="${pageContext.request.contextPath}/admin/phim/deletephimsapchieu/${c.maPhim}" onclick="return confirm('Bạn có chắc chắn muốn xóa bộ phim này không?')">
									<button type="submit" class="btn btn-danger">Delete</button>
								</form></td>
						</tr>
				</c:forEach>
			</tbody>

		</table>

		<br>

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
	</div>



</body>
</html>