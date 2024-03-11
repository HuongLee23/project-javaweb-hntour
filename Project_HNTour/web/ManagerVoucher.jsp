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
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input, select {
            width: 200px;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>



    <h2>Tạo voucher mới</h2>
    <form action="managervoucher" method="post" >
             <c:set value="${requestScope.account}" var="a"/>
        <label for="code">Mã Code:</label>
        <input type="text" name="code" required>
        <br>
        <label for="discountPercentage">Phần trăm giảm giá:</label>
        <input type="number" name="discountPercentage" required min="1" max="100">
        <br>
        <label for="status">Trạng thái:</label>
        <select name="status" required>
            <option value="1">Hoạt động</option>
            <option value="0">Không hoạt động</option>
        </select>
        <br>
  
        <input type="hidden" name="supplierId" value="${a.id}">
        <br>
        <input type="submit" value="Add Voucher">
    

        <h3 style="color: red">${sessionScope.tbvoucher}</h3>

    <hr>

    <h2>Existing Vouchers</h2>
    <table>
        <tr>
            <th>Mã Code</th>
            <th>Phần trăm giảm giá</th>
            <th>Trạng thái</th>
            <th>Xóa</th>
        </tr>
    <c:forEach items="${requestScope.voucher}" var="c">     
        <tr>
            <td>${c.code}</td>
            <td>${c.discount}</td>
            <td style="color: #00adef">
                                                <c:choose>
    <c:when test="${c.status}">
        <div class="button-edit">
            <i class="fa-solid fa-lock"></i> 
            <a id="button-edit-customer" href="statusvoucher?id=${c.id}" style="text-decoration: none; color: greenyellow">Hoạt động</a>
        </div>
    </c:when>
    <c:otherwise>
        <div class="button-edit">
            <i class="fa-solid fa-lock-open"></i>
            <a id="button-edit-customer" href="statusvoucher?id=${c.id}" style="text-decoration: none; color: red">Không hoạt động</a>
        </div>
    </c:otherwise>
</c:choose>
                                            </td>
                                            <td>
    <a href="deletevoucher?vid=${c.id}" class="delete" data-toggle="modal">
        <i class="material-icons" data-toggle="tooltip" title="Delete" style="color: red">Delete</i>
    </a>
</td>
        </tr>
       </c:forEach>
    </table>
    
    
    <a href="home" class="delete" data-toggle="modal">
        <i class="material-icons" data-toggle="tooltip" title="Delete" style="color: blue">Trở về</i>
    </a>
</form>
</body>
</html>
