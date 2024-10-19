<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Shop Website</title>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400&display=swap"
            rel="stylesheet">

    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css"
          rel="stylesheet">

    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
</head>

<body>
<c:import url="Header.jsp"></c:import>

<div class="container-fluid mb-3">
    <div class="row px-xl-5">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header">
                    <h4>Thông Tin Cá Nhân</h4>
                    <p class="text-center">${message}</p>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong>Họ Tên: </strong> ${taiKhoan.tenTaiKhoan}
                        </li>
                        <li class="list-group-item">
                            <strong>Vai Trò: </strong> ${taiKhoan.vaiTro ? 'Admin' : 'User'}
                        </li>
                        <li class="list-group-item">
                            <strong>Email: </strong> ${taiKhoan.email}
                        </li>
                        <li class="list-group-item">
                            <strong>Số Điện Thoại: </strong> ${taiKhoan.dienThoai}
                        </li>
                        <li class="list-group-item">
                            <strong>Địa Chỉ: </strong> ${taiKhoan.diaChi}
                        </li>
                    </ul>
                </div>
                <div class="card-footer text-end">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal">Chỉnh Sửa Thông Tin</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Bootstrap -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Chỉnh Sửa Thông Tin</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editForm" method="POST" action="${pageContext.request.contextPath}/personal-information">
                    <div class="mb-3">
                        <label for="name" class="form-label">Họ Tên</label>
                        <input type="text" class="form-control" id="name" name="name"  value="${taiKhoan.tenTaiKhoan}">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${taiKhoan.email}">
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Số Điện Thoại</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${taiKhoan.dienThoai}">
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Địa Chỉ</label>
                        <input type="text" class="form-control" id="address" name="address" value="${taiKhoan.diaChi}">
                    </div>
                    <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="Footer.jsp"></c:import>

<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

<!-- Libraries JS -->
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>

</body>
</html>
