<%-- 
    Document   : upsupplier
    Created on : Jan 17, 2024, 2:11:19 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
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
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="profileaccount"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="home.jsp"><i class="fa fa-fw fa-th mr-1"></i><span>Home</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="changepassword.jsp"><i class="fa fa-fw fa-cog mr-1"></i><span>Change Password</span></a></li>
                            </ul>
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
                                                    <input type="file" id="imageInput" accept=".jpeg, .jpg, .png" name="profileImage" style="display: none;">
                                                    <img id="selectedImage" src="https://th.bing.com/th/id/OIP.g-FcRsj_DrnzN7sIDOrsEwHaHa?rs=1&pid=ImgDetMain" alt="">
                                                    <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                        <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${a.username}</h4>
                                                        <p class="mb-0">${a.email}</p>

                                                    </div>
                                                    <button <button class="btn btn-primary" type="button" onclick="document.getElementById('imageInput').click();" >Cập Nhật Ảnh</button>

                                                </form>
                                            </div>
                                        </div>
                                        <ul class="nav nav-tabs">
                                            <li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
                                            <h3 style="color:red">${requestScope.ms}</h3>
                                        </ul>
                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">

                                                <form class="form" action="profileaccount" method="post">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">

                                                                <input type="hidden" name="id" value="${a.id}">

                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Name</label>
                                                                        <input class="form-control" type="text" name="name">
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Phone Number</label>
                                                                        <input name="phone" class="form-control" type="text">
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>CMND</label>
                                                                        <input name="cmnd" class="form-control" type="text">
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Address</label>
                                                                        <input name="address" class="form-control" type="text" >
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="form-group">
                                                                            <label>Bussiness Code</label>
                                                                            <input name="code" class="form-control" type="text" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="form-group">
                                                                                <label>Certificate</label>
                                                                                <input name="cer" class="form-control" style="width: 90%;" type="text" >
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row">
                                                                <div class="col d-flex justify-content-end">
                                                                    <button class="btn btn-primary" type="submit">Submit</button>
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
                        </div>
                    </div>
                </div>
            </div>

            <script>
                // Lắng nghe sự kiện khi người dùng chọn tệp ảnh
                document.getElementById('imageInput').addEventListener('change', function () {
                    const selectedImage = document.getElementById('selectedImage');
                    const ngoaiFormImage = document.getElementById('ngoaiFormImage');
                    const ngoaiFormImage2 = document.getElementById('ngoaiFormImage2');

                    const fileInput = this;

                    if (fileInput.files && fileInput.files[0]) {
                        const reader = new FileReader();

                        reader.onload = function (e) {
                            selectedImage.src = e.target.result;
                            ngoaiFormImage.src = e.target.result; // Cập nhật thẻ img ngoài form
                            ngoaiFormImage2.src = e.target.result; // Cập nhật thẻ img ngoài form

                        };

                        reader.readAsDataURL(fileInput.files[0]);
                    }
                });

                function redirectToOtherPage() {
                    window.location.href = "upsupplier.jsp";
                }
            </script>
        </div>  
    </body>
</html>