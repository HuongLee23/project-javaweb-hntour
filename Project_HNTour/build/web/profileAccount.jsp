<%-- 
    Document   : profileacc
    Created on : Jan 15, 2024, 10:34:04 PM
    Author     : Admin
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hà Nội Tour</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/profileaccount.css"/>
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
        <style>
            body {
                margin-top: 20px;
                background: #f8f8f8;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .container {
                max-width: 1200px;
                margin: 0 auto;
            }
            .card {
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .profile__right-pic img {
                border-radius: 50%;
                max-width: 150px;
                border: 4px solid #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .profile__right-pic .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                transition: background-color 0.3s;
            }
            .profile__right-pic .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }
        </style>
    </head>
    <body>

        <c:set value="${requestScope.account}" var="a"/>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 mb-3">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <c:choose>
                                <c:when test="${a.role == 2}">
                                    <jsp:include page="role2.jsp" />
                                </c:when>
                                <c:when test="${a.role == 3}">
                                    <jsp:include page="role3.jsp" />
                                </c:when>
                                <c:otherwise>
                                    <jsp:include page="rolekhac.jsp" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="e-profile">
                                <div class="row">
                                    <div class="col-md-3 profile__right-pic">
                                        <form action="profileaccount" method="post" enctype="multipart/form-data">
                                            <c:choose>
                                                <c:when test="${a.avatar != null}">
                                                    <img id="selectedImage" src="${a.avatar}" alt="">
                                                </c:when>
                                                <c:otherwise>
                                                    <img id="selectedImage" src="https://th.bing.com/th/id/OIP.g-FcRsj_DrnzN7sIDOrsEwHaHa?rs=1&pid=ImgDetMain" alt="">
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${a.username}</h4>
                                                <p class="mb-0">${a.email}</p>
                                            </div>
                                            <button class="btn btn-primary btn-block" type="button" onclick="document.getElementById('imageInput').click();">Cập Nhật Ảnh</button>
                                        </form>
                                    </div>
                                    <div class="col-md-9">
                                        <ul class="nav nav-tabs">
                                            <li class="nav-item">
                                                <a href="" class="active nav-link">Settings</a>
                                                <h3 style="color:red">${requestScope.ms}</h3>
                                            </li>
                                        </ul>
                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">
                                                <form class="form" action="profileaccount" method="post" enctype="multipart/form-data">
                                                    <input type="file" id="imageInput" accept=".jpeg, .jpg, .png" name="fileName" style="display: none;" onchange="handleImageChange(this);">
                                                    <input type="hidden" name="id" value="${a.id}">
                                                    <div class="form-group row">
                                                        <label class="col-md-2 col-form-label">Email</label>
                                                        <div class="col-md-10">
                                                            <input class="form-control" type="email" name="email" value="${a.email}" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-md-2 col-form-label">Tên người dùng</label>
                                                        <div class="col-md-10">
                                                            <input name="username" class="form-control" type="text" value="${a.username}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-md-2 col-form-label">Địa chỉ</label>
                                                        <div class="col-md-10">
                                                            <input name="address" class="form-control" type="text" value="${a.address}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-md-2 col-form-label">SĐT</label>
                                                        <div class="col-md-10">
                                                            <input name="phone" class="form-control" type="number" value="${a.phoneNumber}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col d-flex justify-content-end">
                                                            <button class="btn btn-primary" type="submit">Lưu</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <button class="btn btn-block btn-secondary">
                                <i class="fa fa-sign-out"></i>
                                <a href="logout" style="color: #fff; text-decoration: none;">Logout</a>
                            </button>
                            <button class="btn btn-block btn-primary mt-2" onclick="redirectToOtherPage()">
                                <i class="fa fa-sign-out"></i>
                                <span>Supplier</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function handleImageChange(input) {
                const selectedImage = document.getElementById('selectedImage');
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        selectedImage.src = e.target.result;
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function redirectToOtherPage() {
                window.location.href = "upsupplier.jsp";
            }
        </script>

    </body>
</html>
