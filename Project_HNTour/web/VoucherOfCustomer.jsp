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
    <title>Manage Vouchers</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }

        h2 {
            color: #333;
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
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
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
            background-color: #f2f2f2;
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
            color: blue;
            cursor: pointer;
        }

        a.delete i:hover {
            color: darkblue;
        }
    </style>
</head>
<body>

    <h3 style="color: red">${sessionScope.tbvoucher}</h3>
    

    <h2>Existing Vouchers</h2>
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
                <td>${c.voucher.code}</td>
                <td>${c.voucher.discount}</td>
                <td style="color: #00adef">
                    <c:choose>
                        <c:when test="${c.voucher.status}">
                            <div class="button-edit">
                                <i class="fa-solid fa-lock"></i>
                                <a id="button-edit-customer" href="statusvoucher?id=${c.voucher.id}"
                                   style="text-decoration: none; color: greenyellow">Hoạt động</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="button-edit">
                                <i class="fa-solid fa-lock-open"></i>
                                <a id="button-edit-customer" href="statusvoucher?id=${c.voucher.id}"
                                   style="text-decoration: none; color: red">Không hoạt động</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${c.account.username}</td>
                <td>
                    <a href="deletevoucher?vid=${c.voucher.id}" class="delete" data-toggle="modal">
                        <i class="material-icons" data-toggle="tooltip" title="Delete" style="color: red">Delete</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <a href="statistic?supplierId=${a.id}" class="delete" data-toggle="modal">
        <i class="material-icons" data-toggle="tooltip" title="Delete" style="color: blue">Trở về</i>
    </a>
</form>
</body>
</html>
