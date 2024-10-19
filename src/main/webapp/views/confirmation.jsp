<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác nhận thanh toán</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container d-flex flex-column justify-content-center align-items-center vh-100">
        <div class="card shadow-lg p-5 text-center" style="max-width: 500px;">
            <h1 class="text-success mb-4">Cảm ơn bạn đã mua hàng!</h1>
            <p class="lead">Đơn hàng của bạn đã được xử lý thành công.</p>
            
            <form action="/" method="get" class="mt-4">
                <button type="submit" class="btn btn-primary btn-lg">Quay về trang chủ</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
