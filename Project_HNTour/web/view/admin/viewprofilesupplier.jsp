<%-- 
    Document   : viewprofilesupplier
    Created on : Mar 1, 2024, 9:55:06 PM
    Author     : hello
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hà Nội Tour</title>
        <link rel="stylesheet" type="text/css" href="../view/css/base.css">
    </head>
    <body>
        <!--Phần xử lý hiện thông tin hồ sơ của supplier-->
        <!--<div class="fib-drawer-mask" onclick="closeForm()"></div>-->
        <!--<div class="fib-add-form">-->
        <div class="fib-add-form">
            <h1>Thông tin hồ sơ</h1>
            <form action="resgistersupplier" method="post">
                <!--Phần thông tin của chủ doanh nghiệp-->
                <h2 class="ups-section-title">
                    <span>
                        Điền thông tin người đại diện doanh nghiệp
                    </span>
                    <div class="ups-section-tips"></div>
                </h2>
                <!-- Nội dung của form ở đây -->
                <div class="ups-register-form-infor">
                    <c:set value="${requestScope.supplier}" var="su" />
                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="fullName">Họ và tên</label>
                        <input type="text" id="fullName" value="${su.fullName}" name="fullName" class="form-control" required />
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="birthdayDate">Ngày sinh</label>
                        <input type="date" value="${su.birthday}" name="birthday" class="form-control" required/>
                    </div>
                </div>

                <div class="ups-register-form-infor">
                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="emailAddress">Email</label>
                        <input type="email" id="emailAddress" name="email" class="form-control" required/>
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="phoneNumber">Số điện thoại</label>
                        <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" required/>
                    </div>
                </div>

                <div class="ups-register-form-infor">
                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="frontCMND">Ảnh CMND mặt trước</label>
                        <input type="text" id="frontCMND" name="frontCMND" class="form-control" required/>
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="backCMND">Ảnh CMND mặt sau</label>
                        <input type="text" id="backCMND" name="backCMND" class="form-control" required/>
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
                        <label class="form-label" for="nameCompany">Tên doanh nghiệp</label>
                        <input type="text" id="nameCompany" name="nameCompany" class="form-control" required />
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="addressCompany">Địa chỉ doanh nghiệp</label>
                        <input type="text" name="addressCompany" class="form-control" required/>
                    </div>
                </div>

                <div class="ups-register-form-infor">
                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="emailCompany">Email</label>
                        <input type="email" id="emailAddress" name="emailCompany" class="form-control" required/>
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="phoneNumberCompany">Số điện thoại</label>
                        <input type="tel" id="phoneNumberCompany" name="phoneNumberCompany" class="form-control" required/>
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
                        <label class="form-label" for="businessCode">Mã số doanh nghiệp</label>
                        <input type="text" id="businessCode" name="businessCode" class="form-control" required />
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="businessRegis">Ảnh giấy chứng nhận đăng ký kinh doanh</label>
                        <input type="text" name="businessRegis" class="form-control" required/>
                    </div>
                </div>

                <div class="ups-register-form-infor">
                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="taxCertificate">Ảnh giấy chứng nhận thuế</label>
                        <input type="text" id="taxCertificate" name="taxCertificate" class="form-control" required/>
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="taxPayment">Ảnh giấy việc xác nhận đóng thuế</label>
                        <input type="text" id="taxPayment" name="taxPayment" class="form-control" required/>
                    </div>
                </div>

                <!--<input class="btn-submit" type="submit" value="Xác nhận" />-->
                <!--<button type="button" onclick="closeForm()">Hủy bỏ</button>-->
            </form>
        </div>
        <!--</div>-->
    </body>
</html>