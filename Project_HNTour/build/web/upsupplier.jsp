
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
        <!--<link rel="stylesheet" type="text/css" href="./assets/css/main.css">-->
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
                                <li class="nav-item"><a class="nav-link px-2 active" href="profileaccount"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Thông tin</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="home"><i class="fa fa-fw fa-th mr-1"></i><span>Trang chủ</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="changepassword.jsp"><i class="fa fa-fw fa-cog mr-1"></i><span>Đổi mật khẩu</span></a></li>
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
                                                <div  class="ups-register-form">


                                                    <form action="resgistersupplier" method="post" enctype="multipart/form-data">

                                                        <!--Phần thông tin của chủ doanh nghiệp-->
                                                        <c:set value="${requestScope.supplier}" var="su" />
                                                        <h2 class="ups-section-title">
                                                            <span>
                                                                Điền thông tin người đại diện doanh nghiệp
                                                            </span>
                                                            <div class="ups-section-tips"></div>
                                                        </h2>
                                                        <!-- Nội dung của form ở đây -->

                                                        <div class="ups-register-form-infor">
                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="fullName">Họ và tên *</label>
                                                                <input type="text" id="fullName" value="${su.fullName}" name="fullName" class="form-control" required />
                                                            </div>

                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="birthdayDate">Ngày sinh *</label>
                                                                <input type="date" value="${su.birthday}" name="birthday" class="form-control" required/>
                                                            </div>
                                                        </div>

                                                        <div class="ups-register-form-infor">
                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="emailAddress">Email *</label>
                                                                <input type="email" id="emailAddress" value="${su.email}" name="email" class="form-control" required/>
                                                            </div>

                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="phoneNumber">Số điện thoại *</label>
                                                                <input type="tel" id="phoneNumber" value="${su.phoneNumber}" name="phoneNumber" class="form-control" required/>
                                                            </div>
                                                        </div>

                                                        <div class="ups-register-form-infor">
                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="frontCMND">Ảnh CMND mặt trước *</label>
                                                                <input type="file" id="frontCMND" name="frontCMND" class="form-control" required/>
                                                                <c:if test="${su != null}">
                                                                    <img src="${su.frontCMND}" style="width: 374px;height: 200px;" alt="alt"/>
                                                                </c:if>
                                                            </div>

                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="backCMND">Ảnh CMND mặt sau *</label>
                                                                <input type="file" id="backCMND" name="backCMND" class="form-control" required/>
                                                                <c:if test="${su != null}">
                                                                    <img src="${su.backCMND}" style="width: 374px;height: 200px;" alt="alt"/>
                                                                </c:if>
                                                            </div>
                                                        </div>

                                                        <!--Phần thông tin doanh nghiệp-->
                                                        <h2 class="ups-section-title">
                                                            <span>
                                                                Điền thông tin doanh nghiệp
                                                            </span>
                                                            <div class="ups-section-tips"></div>
                                                        </h2>
                                                        <div class="ups-register-form-infor">
                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="nameCompany">Tên doanh nghiệp *</label>
                                                                <input type="text" id="nameCompany" value="${su.nameCompany}" name="nameCompany" class="form-control" required />
                                                            </div>

                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="addressCompany">Địa chỉ doanh nghiệp *</label>
                                                                <input type="text" value="${su.addressCompany}" name="addressCompany" class="form-control" required/>
                                                            </div>
                                                        </div>

                                                        <div class="ups-register-form-infor">
                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="emailCompany">Email *</label>
                                                                <input type="email" id="emailAddress" value="${su.emailCompany}" name="emailCompany" class="form-control" required/>
                                                            </div>

                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="phoneNumberCompany">Số điện thoại *</label>
                                                                <input type="tel" id="phoneNumberCompany" value="${su.phoneNumberCompany}" name="phoneNumberCompany" class="form-control" required/>
                                                            </div>
                                                        </div>


                                                        <!--Phần thông tin giấy tờ pháp lý-->
                                                        <h2 class="ups-section-title">
                                                            <span>
                                                                Điền thông tin giấy tờ pháp lý
                                                            </span>
                                                            <div class="ups-section-tips"></div>
                                                        </h2>
                                                        <div class="ups-register-form-infor">
                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="businessCode">Mã số doanh nghiệp *</label>
                                                                <input type="text" id="businessCode" value="${su.businessCode}" name="businessCode" class="form-control" required />
                                                            </div>

                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="businessRegis">Ảnh giấy chứng nhận đăng ký kinh doanh *</label>
                                                                <input type="file" name="businessRegis" class="form-control" required/>
                                                                <c:if test="${su != null}">
                                                                    <img src="${su.businessRegis}" style="width: 374px;height: 200px;" alt="alt"/>
                                                                </c:if>
                                                            </div>
                                                        </div>

                                                        <div class="ups-register-form-infor">
                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="taxCertificate">Ảnh giấy chứng nhận thuế *</label>
                                                                <input type="file" id="taxCertificate" name="taxCertificate" class="form-control" required/>
                                                                <c:if test="${su != null}">
                                                                    <img src="${su.taxCertificate}" style="width: 374px;height: 200px;" alt="alt"/>
                                                                </c:if>
                                                            </div>

                                                            <div class="ups-register-form-infor-pers">
                                                                <label class="form-label" for="taxPayment">Ảnh giấy việc xác nhận đóng thuế *</label>
                                                                <input type="file" id="taxPayment" name="taxPayment" class="form-control" required/>
                                                                <c:if test="${su != null}">
                                                                    <img src="${su.taxPayment}" style="width: 374px;height: 200px;" alt="alt"/>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <c:if test="${su == null}">
                                                            <input class="btn-submit" type="submit" value="Đăng ký" />
                                                        </c:if>
                                                        <!--<button type="button" onclick="closeForm()">Hủy bỏ</button>-->
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