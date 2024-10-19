<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.poly.entity.Cart"%>
<%@ page import="com.poly.entity.SanPham"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shopping Cart</title>
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
					class="breadcrumb-item active">Shopping Cart</span>
			</nav>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->

<!-- Cart Start -->
<div class="container-fluid">
	<div class="row px-xl-5">
		<div class="col-lg-8 table-responsive mb-5">
			<table
					class="table table-light table-borderless table-hover text-center mb-0">
				<thead class="thead-dark">
				<tr>
					<th>Products</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Total</th>
					<th>Remove</th>
				</tr>
				</thead>
				<tbody class="align-middle">
				<c:set var="cart" value="${sessionScope.cart}" />
				<c:if test="${empty cart.items}">
					<tr>
						<td colspan="5">Your cart is empty!</td>
					</tr>
				</c:if>
				<c:forEach var="entry" items="${cart.items}">
					<tr>
						<td class="align-middle"><img
								src="img/${entry.key.hinhAnh}" alt="${entry.key.tenSP}"
								style="width: 50px;"> ${entry.key.tenSP}</td>
						<td class="align-middle">${entry.key.gia}VND</td>
						<td class="align-middle">
							<form action="/cart/updateQuantity" method="post">
								<input type="hidden" name="productId"
									   value="${entry.key.maSP}">
								<div class="input-group quantity mx-auto"
									 style="width: 100px;">
									<div class="input-group-btn">
										<button class="btn btn-sm btn-primary btn-minus"
												type="submit" name="action" value="decrease">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<input type="text"
										   class="form-control form-control-sm bg-secondary border-0 text-center"
										   value="${entry.value}" readonly>
									<div class="input-group-btn">
										<button class="btn btn-sm btn-primary btn-plus"
												type="submit" name="action" value="increase">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>
							</form>
						</td>

						<td class="align-middle">${entry.key.gia * entry.value}VND</td>
						<td class="align-middle">
							<form action="/cart/removeFromCart" method="post">
								<!-- Đường dẫn đến phương thức xóa -->
								<input type="hidden" name="productId"
									   value="${entry.key.maSP}">
								<!-- ID sản phẩm -->
								<button class="btn btn-sm btn-danger" type="submit">
									<!-- Nút xóa -->
									<i class="fa fa-times"></i>
								</button>
							</form>
						</td>

					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-lg-4">
			<form class="mb-30" action="">
				<div class="input-group">
					<input type="text" class="form-control border-0 p-4"
						   placeholder="Coupon Code">
					<div class="input-group-append">
						<button class="btn btn-primary">Apply Coupon</button>
					</div>
				</div>
			</form>
			<h5 class="section-title position-relative text-uppercase mb-3">
				<span class="bg-secondary pr-3">Cart Summary</span>
			</h5>
			<div class="bg-light p-30 mb-5">
				<c:set var="subtotal" value="${cart.getTotal()}" />
				<div class="border-bottom pb-2">
					<div class="d-flex justify-content-between mb-3">
						<h6>Subtotal</h6>
						<h6>${subtotal}VND</h6>
					</div>
					<div class="d-flex justify-content-between">
						<h6 class="font-weight-medium">Shipping</h6>
						<h6 class="font-weight-medium">10,000 VND</h6>
						<!-- Có thể điều chỉnh giá trị này -->
					</div>
				</div>
				<div class="pt-2">
					<div class="d-flex justify-content-between mt-2">
						<h5>Total</h5>
						<h5>${subtotal + 10000}VND</h5>
						<!-- Cộng thêm phí vận chuyển -->
						<!-- Nút Checkout -->
					</div>
					<form action="/checkout" method="post">
						<button
								class="btn btn-block btn-primary font-weight-bold my-3 py-3"
								type="submit">Proceed To Checkout
						</button>
						<c:if test="${not empty error}">
							<div class="alert alert-danger">${error}</div>
						</c:if>

					</form>
				</div>
			</div>
		</div>
		<!-- Cart End -->

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
