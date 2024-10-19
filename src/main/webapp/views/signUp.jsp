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
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

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

    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="#">Home</a>
                    <span class="breadcrumb-item active">Đăng ký</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Contact Start -->
    <div class="container mt-1">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h4>Đăng ký tài khoản</h4>
                    </div>
                    <div class="card-body">
                        <!-- Form đăng ký -->
                        <form action="${pageContext.request.contextPath}/register1" method="post">
                            <!-- Tên tài khoản -->
                            <div class="form-group">
                                <label for="tenTaiKhoan">Tên tài khoản:</label>
                                <input type="text" class="form-control" id="tenTaiKhoan" name="tenTaiKhoan" required />
                            </div>

                            <!-- Mật khẩu -->
                            <div class="form-group">
                                <label for="matKhau">Mật khẩu:</label>
                                <input type="password" class="form-control" id="matKhau" name="matKhau" required />
                            </div>

                            <!-- Email -->
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" required />
                            </div>

                            <!-- Điện thoại -->
                            <div class="form-group">
                                <label for="dienThoai">Điện thoại:</label>
                                <input type="text" class="form-control" id="dienThoai" name="dienThoai" required />
                            </div>

                            <!-- Vai trò (luôn là User, vaiTro = false) -->
                            <div class="form-group mb-4">
                                <label for="vaiTro">Vai Trò:</label>
                                <select class="form-control" id="vaiTro" name="vaiTro">
                                    <option value="false">User</option> <!-- Chỉ có lựa chọn "User" -->
                                </select>
                            </div>

                            <!-- Nút đăng ký -->
                            <button type="submit" class="btn btn-primary btn-block">Đăng ký</button>
                        </form>

                        <!-- Hiển thị thông báo lỗi nếu có -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger mt-3">
                                ${errorMessage}
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->

<!-- Footer -->
<c:import url="Footer.jsp"></c:import>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>
</html>
