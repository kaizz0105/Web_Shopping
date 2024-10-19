<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Product Admin - Edit Product</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href=" <c:url value='/views/admin/css/fontawesome.min.css'/> ">
<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href=" <c:url value='/views/admin/css/bootstrap.min.css'/> ">
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href=" <c:url value='/views/admin/css/viewsmo-style.css'/> ">
<!--
	Product Admin CSS views
	https://viewsmo.com/tm-524-product-admin
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
									Videos <i class="fas fa-angle-down"></i>
							</span>
						</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="editProduct">New or Edit</a> <a
									class="dropdown-item" href="">Over view</a>
							</div></li>

						<li class="nav-item"><a class="nav-link" href="">
								<i class="far fa-user"></i> Accounts
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
							</div></li>
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
						<h2 class="tm-block-title">List Product</h2>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">TITLE</th>
									<th scope="col">NAME</th>
									<th scope="col">INFO</th>
									<th scope="col">PRICE</th>
									<th scope="col">RANGES</th>
									

								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${videos}">
									<tr>
										<td>
											<div class="tm-status-circle moving"></div> <a
											href="/ASM_Java4/adEditVideo/?id=${item.href}" style="color: white"
											value="${item.href}" id="getHref">${item.title}</a>
										</td>

										<td>${item.href}</td>
										<td>${item.info}</td>
										<td>${item.poster}</td>
										<td>${item.ranges}</td>
										<td>${item.price}</td>

									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item ${thisPage == 1 ? 'disabled' : ''}  "><a
						class="page-link" href="adminEditVideo?page=${thisPage-1}">Previous</a></li>
					<c:forEach var="i" begin="1" end="${maxPage}">
						<li class="page-item ${thisPage == i ? 'active' : ''} "><a
							class="page-link" href="adminEditVideo?page=${i}">${i}</a></li>
					</c:forEach>
					<li class="page-item ${thisPage == maxPage ? 'disabled' : ''}  "><a
						class="page-link" href="adminEditVideo?page=${thisPage+1}">Next</a></li>
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
										<c:if test="${not empty error }">
											<h6 class="d-flex justify-content-center alert alert-danger">${error}</h6>
										</c:if>

						<form action="/ASM_Java4/adUpdateVideo" method="post"
							class="tm-edit-product-form">
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Product Title </label> <input id="title" name="title"
										type="text" value="${video.title}" class="form-control validate" />
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Product Href </label> <input id="href" name="href"
										type="text" value="${video.href}" class="form-control validate" />
								</div>
							</div>

							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="category">Ranges</label> <select
										class="custom-select tm-select-accounts" id="ranges" name="ranges">
										<option value="Music" <c:if test="${video.ranges == 'Music'}">selected</c:if>>Music</option>
										<option value="Movie" <c:if test="${video.ranges == 'Movie'}">selected</c:if>>Movie</option>
									</select>
								</div>

								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Product poster </label> <input id="poster" name="poster"
										type="text" class="form-control validate" value="${video.poster}" />
								</div>
							</div>
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Info </label> <input id="expire_date" name="info"
										type="text" class="form-control validate" value="${video.info}"
										data-large-mode="true" />
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Price </label> <input id="price" name="price"
										type="text" class="form-control validate" value="${video.price}" />
								</div>
							</div>
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Views </label> <input id="expire_date" name="views" readonly
										type="text" class="form-control validate" value="${video.views}"
										data-large-mode="true" />
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label>Share </label> <input id="price" name="shares"
										type="text" class="form-control validate" value="${video.shares}" readonly />
								</div>
							</div>
							<div class="row">
								<div class="form-check col-2">
								<input class="form-check-input" type="radio"
									name="isActive" id="active" value="true" ${video.isActive?'checked':'' }> <label
									class="form-check-label"  style="color:white">
									Active </label>
							</div>
							<div class="form-check col-2">
								<input class="form-check-input" type="radio"
									name="isActive" id="offline" value="false" ${video.isActive?'':'checked' }>
								<label class="form-check-label"  style="color:white">
									Offline </label>
							</div>
							<button class="ms-0" type="submit">Reset</button>
							</div>
							
					
					<div class="row">
						<div class="col-3">
							<button type="submit"
								class="btn btn-primary btn-block text-uppercase">Update
								Now</button>
							
						</div>
						<div class="col-3">
						<button formaction="/ASM_Java4/adCreateVideo"
								class="btn btn-primary btn-block text-uppercase">Create
								</button>
								</div>
					</div>

					</form>
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
	</div>

	<script src="<c:url value='/views/admin/js/jquery-3.3.1.min.js'/> "></script>
	<!-- https://jquery.com/download/ -->
	<script src="<c:url value='/views/admin/js/moment.min.js'/> "></script>
	<!-- https://momentjs.com/ -->
	<script src="<c:url value='/views/admin/js/Chart.min.js'/>"></script>
	<!-- http://www.chartjs.org/docs/latest/ -->
	<script src="<c:url value='/views/admin/js/bootstrap.min.js'/>"></script>
	<!-- https://getbootstrap.com/ -->
	<script src="<c:url value='/views/admin/js/tooplate-scripts.js'/>"></script>
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