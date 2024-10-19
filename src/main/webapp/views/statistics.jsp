<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Statistics</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>

    <div class="container mt-5">
        <h2 class="mb-4">Monthly Order Statistics</h2>

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Year</th>
                    <th>Month</th>
                    <th>Total Orders</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="stat" items="${monthlyStats}">
                    <tr>
                        <td>${stat.year}</td>
                        <td>${stat.month}</td>
                        <td>${stat.count}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="/admin" class="btn btn-primary mt-3">Back to Dashboard</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
