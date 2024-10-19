<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Statistics</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h1 class="text-center">Monthly Order Statistics for Current Year</h1>

    <table class="table table-bordered mt-4">
        <thead class="thead-dark">
            <tr>
                <th>Month</th>
                <th>Total Orders</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="month" begin="1" end="12">
                <c:set var="found" value="false" />
                <c:forEach var="entry" items="${orderCounts}">
                    <c:if test="${entry[0] == month}">
                        <tr>
                            <td>${entry[0]}</td> <!-- Tháng (1-12) -->
                            <td>${entry[1] != null ? entry[1] : 0}</td> <!-- Tổng số đơn hàng -->
                        </tr>
                        <c:set var="found" value="true" />
                    </c:if>
                </c:forEach>
                <c:if test="${!found}">
                    <tr>
                        <td>${month}</td>
                        <td>0</td> <!-- Nếu không có đơn hàng cho tháng đó -->
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
