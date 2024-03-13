<%-- 
    Document   : TangVoucher
    Created on : Mar 13, 2024, 11:03:27 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
    <meta charset="UTF-8">
    <title>Manage Vouchers</title>
    <style>
        body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 20px;
        background-image: url(''); /* Replace 'your-image-url.jpg' with the path to your background image */
        background-size: cover;
        color: #333;
    }

        h2 {
            color: #3498db;
        }

        form {
            margin-bottom: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #2ecc71;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #27ae60;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: #fff;
        }

        .button-edit a {
            text-decoration: none;
            color: inherit;
        }

        .button-edit i {
            margin-right: 5px;
        }

        .delete i {
            color: red;
            cursor: pointer;
        }

        .delete i:hover {
            color: darkred;
        }

        hr {
            margin-top: 20px;
            border: 1px solid #ddd;
        }

        a.delete {
            text-decoration: none;
        }

        a.delete i {
            color: #3498db;
            cursor: pointer;
        }

        a.delete i:hover {
            color: #2980b9;
        }

        .back-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 20px;
        }

        .back-btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<h2>Tặng voucher mới</h2>
<form action="tangvoucher" method="post">
    <c:set value="${requestScope.account}" var="a" />

    <label for="code">Mã Code:</label>
    <input type="text" name="code" required>

    <label for="discountPercentage">Phần trăm giảm giá:</label>
    <input type="number" name="discountPercentage" required min="1" max="100">

    <label for="status">Trạng thái:</label>
    <select name="status" required>
        <option value="1">Hoạt động</option>
        <option value="0">Không hoạt động</option>
    </select>

    <!-- Add a dropdown for selecting the user to whom the voucher will be given -->
    <label for="nguoinhan">Người nhận voucher:</label>
    <select name="nguoinhan">
        <c:forEach items="${requestScope.users}" var="user">
            <option value="${user.account.id}">${user.account.username}</option>
        </c:forEach>
    </select>

    <input type="hidden" name="supplierId" value="${a.id}">

    <input type="submit" value="Add Voucher">
    <h3 style="color: red">${sessionScope.tangvoucher}</h3>
    <hr>

    <a href="statistic?supplierId=${a.id}" class="back-btn">
        <i class="material-icons"></i> Trở về
    </a>
</form>
</body>
</html>
