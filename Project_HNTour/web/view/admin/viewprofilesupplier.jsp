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
        <link rel="shortcut icon" type="image/png" href="../assets/img/test.png">
        <link rel="stylesheet" type="text/css" href="../view/css/base.css">
    </head>
    <body>
        <div class="fib-add-form">
            <h1>Thông tin hồ sơ</h1>
            <span style="color: red">${sessionScope.msUpdateProfileSupplier}</span>
            <form action="viewprofilesupplier" method="post" enctype="multipart/form-data">
                <!--Phần thông tin của chủ doanh nghiệp-->
                <h2 class="ups-section-title">
                    <span>
                        Điền thông tin người đại diện doanh nghiệp
                    </span>
                    <div class="ups-section-tips">
                    </div>
                </h2>
                <!-- Nội dung của form ở đây -->
                <div class="ups-register-form-infor">
                    <c:set value="${requestScope.supplier}" var="su" />
                    <input type="hidden" id="idAcc" value="${su.idAcc}" name="idAcc" class="form-control"/>

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
                        <input type="email" id="emailAddress" value="${su.email}" name="email" class="form-control" required/>
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="phoneNumber">Số điện thoại</label>
                        <input type="tel" id="phoneNumber" value="${su.phoneNumber}" name="phoneNumber" class="form-control" required/>
                    </div>
                </div>

                <div class="ups-register-form-infor">
                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="frontCMND">Ảnh CMND mặt trước</label>
                        <input type="file" id="frontCMND" name="frontCMND" class="form-control" required/>
                        <img src="${pageContext.request.contextPath}/${su.frontCMND}" style="width: 374px;height: 200px;" alt="alt"/>
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="backCMND">Ảnh CMND mặt sau</label>
                        <input type="file" id="backCMND" name="backCMND" class="form-control" required/>
                        <img src="${pageContext.request.contextPath}/${su.backCMND}" style="width: 374px;height: 200px;" alt="alt"/>
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
                        <input type="text" id="nameCompany" value="${su.nameCompany}" name="nameCompany" class="form-control" required />
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="addressCompany">Địa chỉ doanh nghiệp</label>
                        <input type="text" value="${su.addressCompany}" name="addressCompany" class="form-control" required/>
                    </div>
                </div>

                <div class="ups-register-form-infor">
                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="emailCompany">Email</label>
                        <input type="email" id="emailAddress" value="${su.emailCompany}" name="emailCompany" class="form-control" required/>
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="phoneNumberCompany">Số điện thoại</label>
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
                        <label class="form-label" for="businessCode">Mã số doanh nghiệp</label>
                        <input type="text" id="businessCode" value="${su.businessCode}" name="businessCode" class="form-control" required />
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="businessRegis">Ảnh giấy chứng nhận đăng ký kinh doanh</label>
                        <input type="file" name="businessRegis" class="form-control" required/>
                        <img src="${pageContext.request.contextPath}/${su.businessRegis}" style="width: 374px;height: 200px;" alt="alt"/>

                    </div>
                </div>

                <div class="ups-register-form-infor">
                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="taxCertificate">Ảnh giấy chứng nhận thuế</label>
                        <input type="file" id="taxCertificate" name="taxCertificate" class="form-control" required/>
                        <img src="${pageContext.request.contextPath}/${su.taxCertificate}" style="width: 374px;height: 200px;" alt="alt"/>
                    </div>

                    <div class="ups-register-form-infor-pers">
                        <label class="form-label" for="taxPayment">Ảnh giấy việc xác nhận đóng thuế</label>
                        <input type="file" id="taxPayment" name="taxPayment" class="form-control" required/>
                        <img src="${pageContext.request.contextPath}/${su.taxPayment}" style="width: 374px;height: 200px;" alt="alt"/>
                    </div>
                </div>

                <input class="btn-submit" type="submit" value="Cập nhật" />
                <!--<button type="button" onclick="closeForm()">Hủy bỏ</button>-->
            </form>
        </div>
        <!--</div>-->
    </body>
</html>
