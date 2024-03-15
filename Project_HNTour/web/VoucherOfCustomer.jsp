<%-- 
    Document   : ManagerVoucher
    Created on : Mar 5, 2024, 9:31:42 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
    <meta charset="UTF-8">
    <title>Quản lý Voucher</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }

        h2 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 8px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 4px;
            color: #fff;
        }

        .active {
            background-color: greenyellow;
        }

        .inactive {
            background-color: red;
        }

        .button-link {
            text-decoration: none;
            color: inherit;
        }

        .material-icons {
            vertical-align: middle;
        }

        .delete-icon {
            color: red;
        }

        .delete-icon:hover {
            color: darkred;
        }

        .back-icon {
            color: blue;
        }

        .back-icon:hover {
            color: darkblue;
        }
    </style>
</head>
<body>

<h3 style="color: red">${sessionScope.tbvoucher}</h3>

<h2>Voucher hiện có</h2>
<table>
    <tr>
        <th>Mã Code</th>
        <th>Phần trăm giảm giá</th>
        <th>Trạng thái</th>
        <th>Tour của Supplier được áp dụng</th>
        <th>Xóa</th>
    </tr>
    <c:forEach items="${requestScope.voucher}" var="c">
        <tr>
            <td>${c.code}</td>
            <td>${c.discount}</td>
            <td>
                <span class="status ${c.status ? 'active' : 'inactive'}">
                    ${c.status ? 'Hoạt động' : 'Không hoạt động'}
                </span>
            </td>
            <td>
    <a href="tourlistsupplier?sid=${c.supplierId}" class="button-link" style="color: blue;">
        <span class="material-icons"></span> Áp dụng cho các Tour
    </a>
</td>
            <td>
                <a href="deletevouchercustomer?vid=${c.id}" class="button-link delete-icon">
                    <span class="material-icons"></span> Xóa
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

<a href="home" class="button-link back-icon">
    <span class="material-icons"></span> Trở về
</a>

</body>
</html>
