<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../lib/animate/animate.min.css" rel="stylesheet">
<link href="../lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="../css/style.css" rel="stylesheet">
</head>

<body>
	<c:import url="Header.jsp"></c:import>


	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="#">Home</a> <a
						class="breadcrumb-item text-dark" href="#">Shop</a> <span
						class="breadcrumb-item active">Shop List</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<!-- Shop Sidebar Start -->
			<div class="col-lg-3 col-md-4">
				<!-- Price Start -->
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Filter by price</span>
				</h5>
				<div class="bg-light p-4 mb-30">
					<form action="/filter" method="get">
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" name="priceRange" value="all"
								class="custom-control-input" id="price-0"> <label
								class="custom-control-label" for="price-0">All Price</label>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" name="priceRange" value=0-10000
								class="custom-control-input" id="price-1"> <label
								class="custom-control-label" for="price-1">1 - 10000</label>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" name="priceRange" value="100-200"
								class="custom-control-input" id="price-2"> <label
								class="custom-control-label" for="price-2">10001 - 20000</label>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" name="priceRange" value="200-300"
								class="custom-control-input" id="price-3"> <label
								class="custom-control-label" for="price-3">20001 - 30000</label>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" name="priceRange" value="300-400"
								class="custom-control-input" id="price-4"> <label
								class="custom-control-label" for="price-4">30001 - 40000</label>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
							<input type="checkbox" name="priceRange" value="400-500"
								class="custom-control-input" id="price-5"> <label
								class="custom-control-label" for="price-5">40001 - 50000</label>
						</div>
						<button type="submit" class="btn btn-primary mt-3">Filter</button>
					</form>
				</div>

				<!-- Price End -->

			</div>
			<!-- Shop Sidebar End -->

			<!-- Shop Product Start -->
			<div class="col-lg-9 col-md-8">
				<div class="row pb-3">
					<div class="col-12 pb-1">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<div>
								<button class="btn btn-sm btn-light">
									<i class="fa fa-th-large"></i>
								</button>
								<button class="btn btn-sm btn-light ml-2">
									<i class="fa fa-bars"></i>
								</button>
							</div>
							<div class="ml-2">
								<div class="btn-group">
									<button type="button"
										class="btn btn-sm btn-light dropdown-toggle"
										data-toggle="dropdown">Sorting</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item"
											href="/sort/?field=gia&loai=${param.loai}">Price</a> <a
											class="dropdown-item"
											href="/sort/?field=tenSP&loai=${param.loai}">Name</a>
	
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:forEach items="${listSanPham.content}" var="sp">
						<div class="col-lg-4 col-md-6 col-sm-6 pb-1">

							<div class="product-item bg-light mb-4">
								<div class="product-img position-relative overflow-hidden">
									<img class="img-fluid w-100" src="/img/${sp.hinhAnh}" alt="">
									<div class="product-action">
										<a class="btn btn-outline-dark btn-square" href=""><i
											class="fa fa-shopping-cart"></i></a> <a
											class="btn btn-outline-dark btn-square" href=""><i
											class="far fa-heart"></i></a> <a
											class="btn btn-outline-dark btn-square" href=""><i
											class="fa fa-sync-alt"></i></a> <a
											class="btn btn-outline-dark btn-square" href=""><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="text-center py-4">
									<a class="h6 text-decoration-none text-truncate"
										href="/sanpham/?id=${sp.maSP}">${sp.tenSP}</a>
									<div
										class="d-flex align-items-center justify-content-center mt-2">
										<h5>${sp.gia}</h5>
									</div>
									<div
										class="d-flex align-items-center justify-content-center mb-1">
										<small class="fa fa-star text-primary mr-1"></small> <small
											class="fa fa-star text-primary mr-1"></small> <small
											class="fa fa-star text-primary mr-1"></small> <small
											class="fa fa-star text-primary mr-1"></small> <small
											class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
									</div>
								</div>
							</div>


						</div>
					</c:forEach>

					<div class="col-12">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
								<!-- Nút về trang đầu -->
								<c:if test="${listSanPham.first}">
									<li class="page-item disabled"><a class="page-link"
										href="#">First</a></li>
								</c:if>
								<c:if test="${!listSanPham.first}">
									<li class="page-item"><a class="page-link"
										href="?priceRange=${param.priceRange}&?loai=${param.loai}&field=${param.field}&p=0">First</a></li>
								</c:if>

								<!-- Nút trang trước -->
								<c:if test="${listSanPham.first}">
									<li class="page-item disabled"><a class="page-link"
										href="#">Previous</a></li>
								</c:if>
								<c:if test="${!listSanPham.first}">
									<li class="page-item"><a class="page-link"
										href="?priceRange=${param.priceRange}&?loai=${param.loai}&field=${param.field}&p=${listSanPham.number - 1}">Previous</a></li>
								</c:if>

								<!-- Hiển thị các số trang -->
								<c:if test="${listSanPham.totalPages > 0}">
									<c:forEach begin="0" end="${listSanPham.totalPages - 1}"
										var="i">
										<li
											class="page-item ${i == listSanPham.number ? 'active' : ''}">
											<a class="page-link"
											href="?priceRange=${param.priceRange}&?loai=${param.loai}&field=${param.field}&p=${i}">${i + 1}</a>
										</li>
									</c:forEach>
								</c:if>

								<!-- Nút trang sau -->
								<c:if test="${listSanPham.last}">
									<li class="page-item disabled"><a class="page-link"
										href="#">Next</a></li>
								</c:if>
								<c:if test="${!listSanPham.last}">
									<li class="page-item"><a class="page-link"
										href="?priceRange=${param.priceRange}&?loai=${param.loai}&field=${param.field}&p=${listSanPham.number + 1}">Next</a></li>
								</c:if>

								<!-- Nút về trang cuối -->
								<c:if test="${listSanPham.last}">
									<li class="page-item disabled"><a class="page-link"
										href="#">Last</a></li>
								</c:if>
								<c:if test="${!listSanPham.last}">
									<li class="page-item"><a class="page-link"
										href="?priceRange=${param.priceRange}&?loai=${param.loai}&field=${param.field}&p=${listSanPham.totalPages - 1}">Last</a></li>
								</c:if>
							</ul>
						</nav>

					</div>
				</div>
			</div>
			<!-- Shop Product End -->
		</div>
	</div>
	<!-- Shop End -->


	<!-- Footer -->
	<c:import url="Footer.jsp"></c:import>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>