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

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <span class="breadcrumb-item active">Contact</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Contact Start -->
<div class="container mt-1">
    <div class="row">
        <div class="col-md-3 d-flex justify-content-center align-items-center">
            <div class="info-panel bg-light p-4 border rounded-3 w-100 h-100 d-flex flex-column justify-content-center align-items-center">
                <div class="profile-img d-flex justify-content-center align-items-center" style="width: 120px; height: 120px; background-color: #f0f0f0; border-radius: 50%;">
                    <i class="fas fa-user" style="font-size: 70px;"></i> <!-- Icon người dùng -->
                </div>
                <h4 class="mt-3 text-center">ID: ${account.tenTaiKhoan}</h4>
            </div>
        </div>

        <!-- Panel bên phải chứa các thông tin khác -->
        <div class="col-md-9">
            <div class="info-panel bg-light p-4 border rounded-3 h-100">
                <h4>Thông tin tài khoản</h4>
                <div class="row mb-1">
                    <div class="col-md-3">
                        <label class="fw-bold">Email:</label>
                    </div>
                    <div class="col-md-9">
                        <p>${account.email}</p>
                    </div>
                </div>

                <div class="row mb-1">
                    <div class="col-md-3">
                        <label class="fw-bold">Điện thoại:</label>
                    </div>
                    <div class="col-md-9">
                        <p>${account.dienThoai}</p>
                    </div>
                </div>

                <div class="row mb-1">
                    <div class="col-md-3">
                        <label class="fw-bold">Địa chỉ:</label>
                    </div>
                    <div class="col-md-9">
                        <p>${account.diaChi}</p>
                    </div>
                </div>

                <div class="row mb-1">
                    <div class="col-md-3">
                        <label class="fw-bold">Vai trò:</label>
                    </div>
                    <div class="col-md-9">
                        <p>${account.vaiTro ? 'Admin' : 'User'}</p>
                    </div>
                </div>

                <!-- Nút chỉnh sửa thông tin, mở modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editAccountModal">Chỉnh sửa</button>
            </div>
        </div>
    </div>
</div>
<!-- Contact End -->

<!-- Modal for Editing Account Info -->
<div class="modal fade" id="editAccountModal" tabindex="-1" role="dialog" aria-labelledby="editAccountModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editAccountModalLabel">Chỉnh sửa tài khoản</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Form for editing account -->
               <form action="${pageContext.request.contextPath}/updateAccount" method="post">
                   <!-- Tên tài khoản (chỉ xem) -->
                   <div class="form-group">
                       <label for="tenTaiKhoan">Tên tài khoản:</label>
                       <input type="text" class="form-control" id="tenTaiKhoan" name="tenTaiKhoan" value="${account.tenTaiKhoan}" readonly />
                   </div>

                   <!-- Mật khẩu (ẩn) -->


                   <!-- Vai trò (chỉ xem) -->
                   <div class="form-group">
                       <label for="vaiTro">Vai trò:</label>
                       <select class="form-control" id="vaiTro" name="vaiTro" readonly>
                           <option value="true" ${account.vaiTro ? 'selected' : ''}>Admin</option>
                           <option value="false" ${!account.vaiTro ? 'selected' : ''}>User</option>
                       </select>
                   </div>

                   <!-- Điện thoại -->
                   <div class="form-group">
                       <label for="dienThoai">Điện thoại:</label>
                       <input type="text" class="form-control" id="dienThoai" name="dienThoai" value="${account.dienThoai}" required />
                   </div>

                   <!-- Email -->
                   <div class="form-group">
                       <label for="email">Email:</label>
                       <input type="email" class="form-control" id="email" name="email" value="${account.email}" required />
                   </div>

                   <!-- Địa chỉ -->
                   <div class="form-group">
                       <label for="diaChi">Địa chỉ:</label>
                       <input type="text" class="form-control" id="diaChi" name="diaChi" value="${account.diaChi}" required />
                   </div>

                   <!-- Submit button -->
                   <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
               </form>


            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<c:import url="Footer.jsp"></c:import>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

</body>
</html>