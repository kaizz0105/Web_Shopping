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
						class="breadcrumb-item active">Shop Detail</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Detail Start -->
	<div class="container-fluid pb-5">

		<div class="row px-xl-5">
			<div class="col-lg-5 mb-30">
				<div id="product-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner bg-light">
						<div class="carousel-item active">
							<img class="w-100 h-100" src="/img/${product.hinhAnh}"
								alt="Image">
						</div>
					</div>
					<a class="carousel-control-prev" href="#product-carousel"
						data-slide="prev"> <i class="fa fa-2x fa-angle-left text-dark"></i>
					</a> <a class="carousel-control-next" href="#product-carousel"
						data-slide="next"> <i
						class="fa fa-2x fa-angle-right text-dark"></i>
					</a>
				</div>
			</div>

			<div class="col-lg-7 h-auto mb-30">
				<div class="h-100 bg-light p-30">
					<h3>${product.tenSP}</h3>
					<div class="d-flex mb-3">
						<div class="text-primary mr-2">
							<small class="fas fa-star"></small> <small class="fas fa-star"></small>
							<small class="fas fa-star"></small> <small
								class="fas fa-star-half-alt"></small> <small class="far fa-star"></small>
						</div>
						<small class="pt-1">(99 Reviews)</small>
					</div>
					<h3 class="font-weight-semi-bold mb-4">${product.gia}</h3>
					<p class="mb-4">Volup erat ipsum diam elitr rebum et dolor. Est
						nonumy elitr erat diam stet sit clita ea. Sanc ipsum et, labore
						clita lorem magna duo dolor no sea Nonumy</p>

					<div class="d-flex mb-4">
						<strong class="text-dark mr-3">Colors: ${product.mauSac}</strong>
					</div>
					<!-- Form gửi yêu cầu thêm vào giỏ hàng -->
					<form action="${pageContext.request.contextPath}/cart/addToCart"
						method="post" class="d-flex align-items-center">
						<input type="hidden" name="maSP" value="${product.maSP}" />

						<div class="input-group quantity mr-3" style="width: 130px;">
							<input type="number" name="quantity"
								class="form-control bg-secondary border-0 text-center" value="1"
								min="1" required />
						</div>

						<button type="submit" class="btn btn-primary px-3">
							<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
						</button>
					</form>
					<div class="d-flex pt-2">
						<strong class="text-dark mr-2">Share on:</strong>
						<div class="d-inline-flex">
							<a class="text-dark px-2" href=""> <i
								class="fab fa-facebook-f"></i>
							</a> <a class="text-dark px-2" href=""> <i class="fab fa-twitter"></i>
							</a> <a class="text-dark px-2" href=""> <i
								class="fab fa-linkedin-in"></i>
							</a> <a class="text-dark px-2" href=""> <i
								class="fab fa-pinterest"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>

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