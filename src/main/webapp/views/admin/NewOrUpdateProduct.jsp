<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Product Admin - Dashboard HTML Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet"
	href="<c:url value='../views/admin/css/fontawesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='../views/admin/css/bootstrap.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='../views/admin/css/templatemo-style.css'/>">
</head>

<body id="reportsPage">
	<div id="home">
		<nav class="navbar navbar-expand-xl">
			<div class="container h-100">
				<a class="navbar-brand" href="adminHome">
					<h1 class="tm-site-title mb-0">Product Admin</h1>
				</a>
				<button class="navbar-toggler ml-auto mr-0" type="button"
					data-toggle="collapse" data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars tm-nav-icon"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto h-100">
						<li class="nav-item"><a class="nav-link active" href="admin"><i
								class="fas fa-tachometer-alt"></i> HOME <span class="sr-only">(current)</span></a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"><i class="fas fa-shopping-cart"></i> <span>Products
									<i class="fas fa-angle-down"></i>
							</span></a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="/editProduct">New or Edit</a> <a
									class="dropdown-item" href="">Over view</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href=""><i
								class="far fa-user"></i> Accounts</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"><i class="far fa-file-alt"></i> <span>Reports
									<i class="fas fa-angle-down"></i>
							</span></a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Pending account</a> <a
									class="dropdown-item" href="/admin/products">Products</a> <a
									class="dropdown-item" href="/admin/statistics">Bill</a>
							</div></li>
					</ul>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link d-block"
							href="asmLogout"><b>Logout</b></a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container">
			<div class="row">
				<div class="col">
					<p class="text-white mt-5 mb-5">
						Welcome back, <b>${us.username}</b>
					</p>
				</div>
			</div>
			<div class="row tm-content-row">
				<div class="col-12 tm-block-col">
					<div
						class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
						<h2 class="tm-block-title">List Product</h2>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Mã SP</th>
									<th scope="col">Loại SP</th>
									<th scope="col">Tên SP</th>
									<th scope="col">Giá</th>
									<th scope="col">Màu Sắc</th>
									<th scope="col">Hình Ảnh</th>
									<th scope="col">Hành Động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${listProduct.content}">
									<tr>
										<td><div class="tm-status-circle moving">${item.maSP}</div></td>
										<td>${item.loaiSP.maLoaiSP}</td>
										<td>${item.tenSP}</td>
										<td>${item.gia}</td>
										<td>${item.mauSac}</td>
										<td><img alt="" class="img-fluid w-50"
											src="/img/${item.hinhAnh}"></td>
										<td><a href="/admin/Productedit?id=${item.maSP}"
											style="color: white">Sửa</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li
						class="page-item <c:if test="${listProduct.first}">disabled</c:if>"><a
						class="page-link" href="?p=0">First</a></li>
					<li
						class="page-item <c:if test="${listProduct.first}">disabled</c:if>"><a
						class="page-link" href="?p=${listProduct.number - 1}">Previous</a></li>
					<c:forEach begin="0" end="${listProduct.totalPages - 1}" var="i">
						<li
							class="page-item <c:if test='${i == listProduct.number}'>active</c:if>"><a
							class="page-link" href="?p=${i}">${i + 1}</a></li>
					</c:forEach>
					<li
						class="page-item <c:if test="${listProduct.last}">disabled</c:if>"><a
						class="page-link" href="?p=${listProduct.number + 1}">Next</a></li>
					<li
						class="page-item <c:if test="${listProduct.last}">disabled</c:if>"><a
						class="page-link" href="?p=${listProduct.totalPages - 1}">Last</a></li>
				</ul>
			</nav>

			<div class="row tm-content-row">
				<div class="col-12 tm-block-col">
					<div
						class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
						<h2 class="tm-block-title">EDIT PRODUCT</h2>
						<c:if test="${not empty message}">
							<h6 class="d-flex justify-content-center alert alert-success">${message}</h6>
						</c:if>
						<c:if test="${not empty error}">
							<h6 class="d-flex justify-content-center alert alert-danger">${error}</h6>
						</c:if>

						<form:form action="/admin/updateProduct" modelAttribute="sanpham"
							enctype="multipart/form-data" method="post"
							class="tm-edit-product-form">
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Mã SP</label>
									<form:input path="maSP" type="text" class="form-control" />
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Tên SP</label>
									<form:input path="tenSP" type="text"
										class="form-control validate" />
								</div>
							</div>

							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="category">Loại SP</label>
									<form:select class="custom-select tm-select-accounts"
										path="loaiSP.maLoaiSP">
										<c:forEach var="loai" items="${listLoaiSP}">
											<option value="${loai.maLoaiSP}"
												<c:if test="${loai.maLoaiSP == sanpham.loaiSP.maLoaiSP}">selected</c:if>>${loai.tenLoaiSP}</option>
										</c:forEach>
									</form:select>
								</div>

								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Giá</label>
									<form:input path="gia" type="number"
										class="form-control validate" />
								</div>
							</div>

							<div class="row">

								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Hình Ảnh</label> <img alt="" class="img-fluid w-50"
										src="/img/${sanpham.hinhAnh}" />
									<form:input path="hinhAnh" type="file" class="form-control " />
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Màu Sắc</label>
									<form:input path="mauSac" type="text"
										class="form-control validate" />
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<button type="submit"
										class="btn btn-primary btn-block text-uppercase">Lưu
									</button>
								</div>
								<div class="col-3">
									<button formaction="/admin/createProduct"
										class="btn btn-primary btn-block text-uppercase">Create</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2024</b> All rights reserved. Design: PS27495
			</p>
		</div>
	</footer>

	<script src="<c:url value='../views/admin/js/jquery-3.3.1.min.js'/>"></script>
	<script src="<c:url value='../views/admin/js/moment.min.js'/>"></script>
	<script src="<c:url value='../views/admin/js/Chart.min.js'/>"></script>
	<script src="<c:url value='../views/admin/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='../views/admin/js/tooplate-scripts.js'/>"></script>
	<script>
		Chart.defaults.global.defaultFontColor = 'white';
		$(function() {
			drawLineChart(); // Line Chart
			drawBarChart(); // Bar Chart
			drawPieChart(); // Pie Chart

			$(window).resize(function() {
				updateLineChart();
				updateBarChart();
			});
		})
	</script>
</body>
</html>
