<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Shop Website</title>
<!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400&display=swap" rel="stylesheet">
	

	
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
    
</head>


<body>
<c:import url="Header.jsp"></c:import>
<!-- Carousel Start -->
    <div class="container-fluid mb-3">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#header-carousel" data-slide-to="1"></li>
                        <li data-target="#header-carousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item position-relative active" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="img/dienthoai.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Điện thoại</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                    <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="img/laptop.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Laptop</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                    <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="img/dongho.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Smart Watch</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                    <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="product-offer mb-30" style="height: 200px;">
                    <img class="img-fluid" src="img/apple-watch.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase">Save 20%</h6>
                        <h3 class="text-white mb-3">Special Offer</h3>
                        <a href="" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
                <div class="product-offer mb-30" style="height: 200px;">
                    <img class="img-fluid" src="img/cat-2.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase">Save 20%</h6>
                        <h3 class="text-white mb-3">Special Offer</h3>
                        <a href="" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->
    
    <!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->
    
    
    
    
    <!-- Products Start -->
    <div class="container-fluid pt-5 pb-3">
    		<h2
    			class="section-title position-relative text-uppercase mx-xl-5 mb-4">
    			<span class="bg-secondary pr-3">Featured Products</span>
    		</h2>
    		<div class="row px-xl-5">
    			<c:forEach items="${listSanPham.content}" var="sp">
    				<div class="col-lg-3 col-md-4 col-sm-6 pb-1">
    					<div class="product-item bg-light mb-4">
    						<div class="product-img position-relative overflow-hidden">
    							<img class="img-fluid w-100 h-100" src="img/${sp.hinhAnh}"
    								alt="${sp.tenSP}">
    							<div class="product-action row">
    								<div class="col-auto">
    									<form action="/cart/addToCart" method="post" class="row">
    										<button type="submit" class="btn btn-outline-dark btn-square col-auto">
    											<i class="fa fa-shopping-cart"></i>
    										</button>
    										<input type="hidden" name="maSP" value="${sp.maSP}" class="col-auto">
    										<input class="col-auto" type="number" name="quantity" value="1" min="1" style="width: 60px;">
    									</form>
    								</div>
    								<div class="col-auto row">
    									<a class="col-auto btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
    									<a class="col-auto btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
    									<a class="col-auto btn btn-outline-dark btn-square" href="/sanpham/?id=${sp.maSP}"><i class="fa fa-eye"></i></a>
    								</div>
    							</div>
    						</div>
    						<div class="text-center py-4">
    							<h5 class="text-truncate">${sp.tenSP}</h5>
    							<h6 class="mb-3">${sp.gia}VNĐ</h6>
    						</div>
    					</div>
    				</div>
    			</c:forEach>

    		</div>
    	</div>
    <!-- Products End -->
    <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">
        <!-- Nút về trang đầu -->
        <li class="page-item <c:if test='${listSanPham.first}'>disabled</c:if>">
            <a class="page-link" href="?p=0&key=${param.key}">First</a>
        </li>

        <!-- Nút trang trước -->
        <li class="page-item <c:if test='${listSanPham.first}'>disabled</c:if>">
            <a class="page-link" href="?p=${listSanPham.number - 1}&key=${param.key}">Previous</a>
        </li>

        <!-- Hiển thị các số trang -->
        <c:if test="${listSanPham.totalPages > 0}">
            <c:forEach begin="0" end="${listSanPham.totalPages - 1}" var="i">
                <li class="page-item <c:if test='${i == listSanPham.number}'>active</c:if>">
                    <a class="page-link" href="?p=${i}&key=${param.key}">${i + 1}</a>
                </li>
            </c:forEach>
        </c:if>

        <!-- Nút trang sau -->
        <li class="page-item <c:if test='${listSanPham.last}'>disabled</c:if>">
            <a class="page-link" href="?p=${listSanPham.number + 1}&key=${param.key}">Next</a>
        </li>

        <!-- Nút về trang cuối -->
        <li class="page-item <c:if test='${listSanPham.last}'>disabled</c:if>">
            <a class="page-link" href="?p=${listSanPham.totalPages - 1}&key=${param.key}">Last</a>
        </li>
    </ul>
</nav>
    
    <!-- Offer Start -->
    <div class="container-fluid pt-5 pb-3">
        <div class="row px-xl-5">
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 300px;">
                    <img class="img-fluid" src="img/offer-1.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase">Save 20%</h6>
                        <h3 class="text-white mb-3">Special Offer</h3>
                        <a href="" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 300px;">
                    <img class="img-fluid" src="img/offer-2.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase">Save 20%</h6>
                        <h3 class="text-white mb-3">Special Offer</h3>
                        <a href="" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Offer End -->
    
    
   
    
    
<!-- Footer -->
<c:import url="Footer.jsp"></c:import>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>