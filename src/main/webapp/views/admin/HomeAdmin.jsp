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
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href=" <c:url value='../views/admin/css/fontawesome.min.css'/> ">
<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href=" <c:url value='../views/admin/css/bootstrap.min.css'/> ">
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href=" <c:url value='../views/admin/css/templatemo-style.css'/> ">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">
	<div class="" id="home">
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
						<li class="nav-item"><a class="nav-link active" href="admin">
								<i class="fas fa-tachometer-alt"></i> HOME <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-shopping-cart"></i> <span>
									Products <i class="fas fa-angle-down"></i>
							</span>
						</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="/editProduct">New or Edit</a> <a
									class="dropdown-item" href="">Over view</a>
							</div></li>

						<li class="nav-item"><a class="nav-link"
							href="/ASM_Java4/asmAdEditUser"> <i class="far fa-user"></i>
								Accounts
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="far fa-file-alt"></i> <span>
									Reports <i class="fas fa-angle-down"></i>
							</span>
						</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Pending account</a>
								<a class="dropdown-item" href="/admin/products">Products</a>
								<a class="dropdown-item" href="/admin/statistics">Bill</a>
							</div>
						</li>
					</ul>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link d-block"
							href="asmLogout"><b>Logout</b> </a></li>
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
			<!-- row -->
			<div class="row tm-content-row">


				<div class="col-12 tm-block-col">
					<div
						class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
						<h2 class="tm-block-title">Bill List</h2>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Mã Đơn</th>
									<th scope="col">Khách Hàng</th>
									<th scope="col">Ngày</th>
									<th scope="col">Tình Trạng</th>
									<th scope="col">Xem</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach var="dh" items="${listDonHang.content}">
									<tr>
										<td>
											<div class="tm-status-circle moving">${dh.maDonHang}</div>
										</td>
										<td><b>${dh.user.tenTaiKhoan}</b></td>
										<td><b>${dh.ngayTao}</b></td>
										<td><c:choose>
											<c:when test="${dh.tinhTrang == false ||empty dh.tinhTrang }">
											<form action="" method="post">
												<button formaction="/admin/donhang?id=${dh.maDonHang}" formmethod="post" class="btn btn-primary">Chưa Hoàn
													thành</button>
												<!-- Khi `tinhTrang` là true, nút sẽ bị vô hiệu -->
											</form>
												
											</c:when>
											<c:otherwise>
												<button type="submit" disabled="disabled">Hoàn thành</button>
												<!-- Khi `tinhTrang` là false, nút sẽ được kích hoạt -->
											</c:otherwise>
										</c:choose></td>
										<td><a href="/admin/donhangCT?id=${dh.maDonHang}" style="color: white">Xem chi tiết</a></td>
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<!-- Nút về trang đầu -->
					<li
						class="page-item <c:if test="${listDonHang.first}">disabled</c:if>">
						<a class="page-link" href="?p=0">First</a>
					</li>

					<!-- Nút trang trước -->
					<li
						class="page-item <c:if test="${listDonHang.first}">disabled</c:if>">
						<a class="page-link" href="?p=${listDonHang.number - 1}">Previous</a>
					</li>

					<!-- Hiển thị các số trang -->
					<c:forEach begin="0" end="${listDonHang.totalPages - 1}" var="i">
						<li
							class="page-item <c:if test='${i == listDonHang.number}'>active</c:if>">
							<a class="page-link" href="?p=${i}">${i + 1}</a>
						</li>
					</c:forEach>

					<!-- Nút trang sau -->
					<li
						class="page-item <c:if test="${listDonHang.last}">disabled</c:if>">
						<a class="page-link" href="?p=${listDonHang.number + 1}">Next</a>
					</li>

					<!-- Nút về trang cuối -->
					<li
						class="page-item <c:if test="${listDonHang.last}">disabled</c:if>">
						<a class="page-link" href="?p=${listDonHang.totalPages - 1}">Last</a>
					</li>
				</ul>
			</nav>


			<div class="row tm-content-row">
				<div class="col-12 tm-block-col">
					<div
						class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
						<h2 class="tm-block-title">List Bill Detail</h2>
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Mã Đơn Hàng CT</th>
									<th scope="col">Tên Sản Phẩm</th>
									<th scope="col">Số lượng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dhct" items="${listDHCT}">
									<tr>
										<td>
											<div class="tm-status-circle moving">${dhct.maDonHangCT}</div>
										</td>
										<td><b>${dhct.sp.tenSP}</b></td>
										<td><b>${dhct.soLuong}</b></td>
									</tr>
								</c:forEach>


							</tbody>
						</table>
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
		</div>

		<script src="<c:url value='../views/admin/js/jquery-3.3.1.min.js'/> "></script>
		<!-- https://jquery.com/download/ -->
		<script src="<c:url value='../views/admin/js/moment.min.js'/> "></script>
		<!-- https://momentjs.com/ -->
		<script src="<c:url value='../views/admin/js/Chart.min.js'/>"></script>
		<!-- http://www.chartjs.org/docs/latest/ -->
		<script src="<c:url value='../views/admin/js/bootstrap.min.js'/>"></script>
		<!-- https://getbootstrap.com/ -->
		<script src="<c:url value='../views/admin/js/tooplate-scripts.js'/>"></script>
		<script>
			
		</script>

		<script>
			Chart.defaults.global.defaultFontColor = 'white';
			let ctxLine, ctxBar, ctxPie, optionsLine, optionsBar, optionsPie, configLine, configBar, configPie, lineChart;
			barChart, pieChart;
			// DOM is ready
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