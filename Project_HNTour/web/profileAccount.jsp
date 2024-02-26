<%-- 
    Document   : profileacc
    Created on : Jan 15, 2024, 10:34:04 PM
    Author     : Admin
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta name="description" content="Ha Noi Tour">
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css'>
        <link rel="stylesheet" href="./assets/css/profileaccount.css"/>
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
        <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hà Nội Tour</title>
        <style>
            body{
                margin-top:20px;
                background:#f8f8f8
            }
        </style>
    </head>
    <body>
        <c:set value="${requestScope.account}" var="a"/>
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">

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

                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="e-profile">
                                        <div class="row">
                                            <div class="profile__right-pic" id="imageForm">
                                                <form action="profileaccount" method="post" enctype="multipart/form-data">
                                                    <c:if test="${a.avatar != null}">
                                                        <img id="selectedImage" src="${a.avatar}" alt="">
                                                    </c:if>
                                                    <c:if test="${a.avatar == null}">
                                                        <img id="selectedImage" src="https://th.bing.com/th/id/OIP.g-FcRsj_DrnzN7sIDOrsEwHaHa?rs=1&pid=ImgDetMain" alt="">
                                                    </c:if>
                                                    <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                        <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${a.username}</h4>
                                                        <p class="mb-0">${a.email}</p>

                                                    </div>
                                                    <button class="btn btn-primary" type="button" onclick="document.getElementById('imageInput').click();" >Cập Nhật Ảnh</button>

                                                </form>
                                            </div>
                                        </div>
                                        <script>
                                            function handleImageChange(input) {
                                                const selectedImage = document.getElementById('selectedImage');

                                                const ngoaiFormImage = document.getElementById('ngoaiFormImage');
                                                const ngoaiFormImage2 = document.getElementById('ngoaiFormImage2');

                                                if (input.files && input.files[0]) {
                                                    const reader = new FileReader();

                                                    reader.onload = function (e) {
                                                        selectedImage.src = e.target.result;

                                                        ngoaiFormImage.src = e.target.result;
                                                        ngoaiFormImage2.src = e.target.result;
                                                    };

                                                    reader.readAsDataURL(input.files[0]);
                                                }
                                            }
                                        </script>

                                        <ul class="nav nav-tabs">
                                            <li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
                                            <h3 style="color:red">${requestScope.ms}</h3>
                                        </ul>
                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">

                                                <form class="form" action="profileaccount" method="post" enctype="multipart/form-data">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <input type="file" id="imageInput" accept=".jpeg, .jpg, .png" name="fileName" style="display: none;" onchange="handleImageChange(this);">

                                                                <input type="hidden" name="id" value="${a.id}">

                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Email</label>
                                                                        <input class="form-control" type="email" name="email" value="${a.email}" readonly>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group"> 
                                                                        <label>Tên người dùng</label>
                                                                        <input name="username" class="form-control" type="text" value="${a.username}">
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Địa chỉ</label>
                                                                        <input name="address" class="form-control" type="text" value="${a.address}">
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>SĐT</label>
                                                                        <input name="phone" class="form-control" type="number" value="${a.phoneNumber}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
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

                        <div class="col-12 col-md-3 mb-3">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="px-xl-3">
                                        <button class="btn btn-block btn-secondary">
                                            <i class="fa fa-sign-out"></i>
                                            <span><a href="logout">Logout</a></span>

                                        </button>

                                    </div>

                                </div>
                                <div class="card-body">
                                    <div class="px-xl-3">
                                        <button class="btn btn-block btn-primary" onclick="redirectToOtherPage()">
                                            <i class="fa fa-sign-out"></i>
                                            <span>Supplier</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>



                function redirectToOtherPage() {
                    window.location.href = "upsupplier.jsp";
                }
            </script>
        </div>  
    </body>
</html>

