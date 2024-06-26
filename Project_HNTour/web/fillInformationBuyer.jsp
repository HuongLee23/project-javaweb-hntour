
<%-- 
    Document   : showcart
    Created on : Feb 2, 2024, 9:36:41 AM
    Author     : hello
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hà Nội Tour</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Ha Noi Tour">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/blog_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/main.css">



    </head>
    <body>


        <div class="super_container">

            <!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>

                <!-- Home -->

                <div class="home">
                    <div class="home_image home_background parallax-window" data-parallax="scroll" data-image-src="">                    
                        <img style="height: 500px;" src="./assets/img/cart.png" alt="alt"/>
                    </div>
                    <div class="home_content">
                        <!--                        <div class="home_title">The payment</div>-->
                    </div>
                </div>

                <!-- Slider-top-step-bar -->
                <div class="top-step-bar desktop" id="top-step-bar">
                    <div class="klk-steps klk-steps-horizontal">
                        <div class="klk-step" id="step1">
                            <div class="klk-step-line-track" style="background-color: rgb(224, 224, 224);">
                                <div class="klk-step-line" style=""></div>
                            </div>
                            <div class="klk-step-head">
                                <div class="klk-step-icon">
                                    <i style="color: white;" class="fa-solid fa-check"></i>
                                </div>
                            </div>
                            <div class="klk-step-main">
                                <div class="klk-step-title">Chọn đơn hàng</div>
                            </div>
                        </div>
                        <div class="klk-step" id="step2">
                            <div class="klk-step-line-track" style="background-color: rgb(224, 224, 224);">
                                <div class="klk-step-line" style=""></div>
                            </div>
                            <div class="klk-step-head">
                                <div class="klk-step-icon">
                                    <i style="color: white;" class="fa-solid fa-check"></i>
                                </div>
                            </div>
                            <div class="klk-step-main">
                                <div class="klk-step-title">Điền thông tin</div>
                            </div>
                        </div>
                        <div class="klk-step" id="step3">
                            <!--                            <div class="klk-step-line-track" style="background-color: rgb(224, 224, 224);">
                                                            <div class="klk-step-line" style=""></div>
                                                        </div>-->
                            <div class="klk-step-head">
                                <div class="klk-step-icon">
                                    <i style="color: white;" class="fa-solid fa-check"></i>
                                </div>
                            </div>
                            <div class="klk-step-main">
                                <div class="klk-step-title">Thanh toán</div>
                            </div>
                        </div>
                    </div>
                </div>


                <!--Show thông tin đơn hàng-->
                <section class="fby-show-product" >
                    <div class="container py-5">

                        <h2 class="fby-section-title">
                            <span>
                                Thông tin đơn hàng
                            </span>
                            <div class="fby-section-tips"></div>
                        </h2>

                        <!--Show thông tin của tour muốn mua ngay-->
                    <c:if test="${sessionScope.idSelectOne != 0}">
                        <c:set value="${sessionScope.tourFill}" var="i"/>
                        <div class="row justify-content-center mb-3">
                            <div class="col-md-12 col-xl-10">
                                <div class="card shadow-0 border rounded-3">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                                <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                                    <img src="${i.imageMain}"
                                                         class="w-100" />
                                                    <a href="#!">
                                                        <div class="hover-overlay">
                                                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="fby-show-product-information col-md-6 col-lg-6 col-xl-6">
                                                <h5>${i.name}</h5>
                                                <div class="fby-show-product-information-price d-flex flex-row">
                                                    <span><fmt:formatNumber value="${i.price}" pattern="###,###"/> VNÐ</span>
                                                </div>
                                                <div class="mt-1 mb-0 text-muted small">
                                                    <span></span>          
                                                    <span class="text-primary">Số lượng bạn đặt: 1 vé</span>
                                                </div>
                                                <p class="text-truncate mb-4 mb-md-0">
                                                    ${i.description}
                                                </p>
                                            </div>
                                            <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                                <div class="d-flex flex-row align-items-center mb-1">
                                                    <!--<h4 class="mb-1 me-1">$13.99</h4>-->
                                                    <span class="text-danger"><div class="text-danger mb-1 me-2">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!--Show thông tin của các tour trong cart-->
                    <c:if test="${sessionScope.idSelectOne == 0}">
                        <c:set value="${sessionScope.cartFill}" var="o"/>
                        <c:forEach items="${o.items}" var="i" varStatus="loop">
                            <div class="row justify-content-center mb-3">
                                <div class="col-md-12 col-xl-10">
                                    <div class="card shadow-0 border rounded-3">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                                    <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                                        <img src="${i.tour.imageMain}"
                                                             class="w-100" />
                                                        <a href="#!">
                                                            <div class="hover-overlay">
                                                                <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="fby-show-product-information col-md-6 col-lg-6 col-xl-6">
                                                    <h5>${i.tour.name}</h5>
                                                    <div class="fby-show-product-information-price d-flex flex-row">
                                                        <span><fmt:formatNumber value="${i.price}" pattern="###,###"/> VNÐ</span>
                                                    </div>
                                                    <div class="mt-1 mb-0 text-muted small">
                                                        <span></span>
                                                        <span class="text-primary">Số lượng bạn đặt: ${i.quantity} vé</span>
                                                    </div>
                                                    <p class="text-truncate mb-4 mb-md-0">
                                                        ${i.tour.description}
                                                    </p>
                                                </div>
                                                <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                                    <div class="d-flex flex-row align-items-center mb-1">
                                                        <!--<h4 class="mb-1 me-1">$13.99</h4>-->
                                                        <span class="text-danger"><div class="text-danger mb-1 me-2">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>



                </div>
            </section>


            <div class="checkout blog">
                <div class="container">
                    <div style="left: -188px;justify-content: space-evenly;" class="row">

                        <section style="width: 600px;left: -120px;" class="vh-100 gradient-custom">
                            <div class="container py-5 h-100">
                                <div class="row justify-content-center align-items-center h-100">
                                    <div class="col-12 col-lg-9 col-xl-7">
                                        <div class="card shadow-2-strong card-registration" style="
                                             height: 434px;
                                             left: -60px;
                                             width: 699px;
                                             border-radius: 15px;">
                                            <div style="top: -25px;" class="card-body p-4 p-md-5">
                                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">
                                                    <h2 style="top: -50px;left: 4px;" class="fby-section-title">
                                                        <span>
                                                            Thông tin khách hàng
                                                        </span>
                                                        <div class="fby-section-tips"></div>
                                                    </h2>

                                                </h3>

                                                <!--Phần xử lý select option về thông tin tài khoản-->
                                                <div style="display: flex">
                                                    <c:set value="${requestScope.listInforAcc}" var="listInf"/>
                                                    <form id="formProccessSelect" action="proccessselect" method="post">
                                                        <div style="top: -20px;">
                                                            <select id="proccessSelect" class="select form-control-lg" name="valueSelect" required>
                                                                <option value="0" disabled selected hidden>Chọn thông tin liên lạc</option>
                                                                <c:forEach items="${listInf}" var="i">
                                                                    <option <c:if test="${i.id eq requestScope.infoAcc.id}">selected</c:if> value="${i.id}">${i.username}</option>
                                                                </c:forEach>
                                                            </select>

                                                            <!--<label class="form-label select-label">Choose option</label>-->
                                                        </div>
                                                    </form>

                                                    <div class="fib-add" onclick="openForm()">
                                                        <i class="fa-solid fa-plus" style="color: #ff5b00;"></i>
                                                        <span>
                                                            Thêm
                                                        </span>
                                                    </div>

                                                </div>

                                                <!--Phần xử lý sửa về thông tin tài khoản-->
                                                <c:if test="${not empty listInf}">
                                                    <form id="updateForm" action="updateinformationacc" method="post" onsubmit="return validateForm()">
                                                        <c:set value="${requestScope.infoAcc}" var="infoAcc"/>
                                                        <input id="idAccount" type="text" hidden value="${sessionScope.account.id}" name="idAccount">
                                                        <input id="idInfor" type="text" hidden value="${infoAcc.id}" name="idInfor">
                                                        <div class="row">
                                                            <div class="col-md-6 mb-4">
                                                                <div class="form-outline">
                                                                    <input type="text" id="name" name="username" value="${infoAcc.username}" class="form-control form-control-lg" required />
                                                                    <label class="form-label" for="name">Họ và tên</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 mb-4 d-flex align-items-center">
                                                                <div class="form-outline">
                                                                    <input type="date" value="${infoAcc.birthday}" name="birthday" class="form-control" required/>
                                                                    <label class="form-label" for="birthdayDate">Ngày sinh</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6 mb-4 pb-2">
                                                                <div class="form-outline">
                                                                    <input type="email" id="emailAddress" value="${infoAcc.email}" name="email" class="form-control form-control-lg" required/>
                                                                    <label class="form-label" for="emailAddress">Email</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 mb-4 pb-2">
                                                                <div class="form-outline">
                                                                    <input type="tel" id="phoneNumber" value="${infoAcc.phoneNumber}" name="phoneNumber" class="form-control form-control-lg" required/>
                                                                    <label class="form-label" for="phoneNumber">Số điện thoại</label>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <h5 style="color: red">${requestScope.mess}</h5>

                                                        <div style="
                                                             left: 444px;
                                                             position: absolute;" class="mt-4 pt-2">
                                                            <input style="cursor: pointer ;margin-top: -90px;" class="btn btn-primary btn-lg" type="submit" value="Cập nhật thông tin" />
                                                        </div>

                                                    </form>
                                                </c:if>


                                                <!--Phần xử lý thêm thông tin tài khoản-->
                                                <c:if test="${empty listInf}">

                                                    <form action="insertinformation" method="post">
                                                        <input type="text" hidden value="${sessionScope.account.id}" name="idAccount">
                                                        <div class="row">
                                                            <div class="col-md-6 mb-4">
                                                                <div class="form-outline">
                                                                    <input type="text" id="name" name="username" class="form-control form-control-lg" required />
                                                                    <label class="form-label" for="name">Họ và tên</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 mb-4 d-flex align-items-center">
                                                                <div class="form-outline">
                                                                    <input type="date"  name="birthday" class="form-control" required/>
                                                                    <label class="form-label" for="birthdayDate">Ngày sinh</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6 mb-4 pb-2">
                                                                <div class="form-outline">
                                                                    <input type="email" id="emailAddress" name="email" class="form-control form-control-lg" required/>
                                                                    <label class="form-label" for="emailAddress">Email</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 mb-4 pb-2">
                                                                <div class="form-outline">
                                                                    <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control form-control-lg" required
                                                                           <label class="form-label" for="phoneNumber">Số điện thoại</label>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <h5 style="color: red">${requestScope.mess}</h5>

                                                        <div style="
                                                             left: 444px;
                                                             position: absolute;" class="mt-4 pt-2">
                                                            <input style="cursor: pointer ;margin-top: -90px;" class="btn btn-primary btn-lg" type="submit" value="Thêm thông tin" />
                                                        </div>


                                                    </form>
                                                </c:if>




                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!--Phần xử lý tạo thêm thông tin tài khoản-->
                        <div class="fib-drawer-mask" onclick="closeForm()"></div>
                        <!--<div class="fib-add-form">-->
                        <div class="fib-add-form">
                            <h2 style="left: 4px;" class="fby-section-title">
                                <span>
                                    Thêm thông tin khách hàng
                                </span>
                                <div class="fby-section-tips"></div>
                            </h2>
                            <!-- Nội dung của form ở đây -->
                            <form action="insertinformation">
                                <input type="text" hidden value="${sessionScope.account.id}" name="idAccount">

                                <input type="text" id="name" name="username" class="form-control" required />
                                <label class="form-label" for="name">Họ và tên</label>

                                <input type="date" name="birthday" class="form-control" required/>
                                <label class="form-label" for="birthdayDate">Ngày sinh</label>

                                <input type="email" id="emailAddress" name="email" class="form-control" required/>
                                <label class="form-label" for="emailAddress">Email</label>

                                <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" required/>
                                <label class="form-label" for="phoneNumber">Số điện thoại</label>

                                <h5 style="color: red">${requestScope.mess}</h5>

                                <input class="btn-submit" type="submit" value="Thêm thông tin" />
                                <button type="button" onclick="closeForm()">Hủy bỏ</button>
                            </form>
                        </div>
                        <!--</div>-->


                        <!--Phần xử lý thanh toán-->
                        <section style="width: 0px;left: -150px;" class="h-100 h-custom">
                            <div class="container h-100 py-5">
                                <div class="row d-flex justify-content-center align-items-center h-100">
                                    <div class="col">
                                        <div  class="card shadow-2-strong mb-5 mb-lg-0" style="
                                              left: 50px;
                                              border-radius: 16px;
                                              width: 500px;
                                              margin-left: 40%;">
                                            <div class="card-body p-4">

                                                <!--Show thông tin thanh toán của một tour mua ngay-->
                                                <c:if test="${sessionScope.idSelectOne != 0}">
                                                    <c:set value="${sessionScope.tourFill}" var="i"/>
                                                    <div style="display: block" class="row">
                                                        <div style="max-width: 100%;" class="col-12 col-xl-6">
                                                            <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                                                <p class="mb-2">Tổng thanh toán</p>
                                                                <p class="mb-2"><fmt:formatNumber value="${i.price}" pattern="###,###"/> VNÐ</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                                <p class="mb-0">Số lượng</p>
                                                                <p class="mb-0">1 (Tour)</p>
                                                            </div>

                                                            <hr class="my-4">

                                                            <form action="checkout">
                                                                <c:set value="${requestScope.infoAcc}" var="infoAcc"/>
                                                                <!--<input type="text" hidden value="${sessionScope.account.id}" name="idAccount">-->
                                                                <input type="text" hidden value="${infoAcc.id}" name="idInfor">


                                                                <input type="hidden" name="selectCheckout" value="${i.id}">
                                                                <button onclick="buyNow(event)" style=" cursor: pointer;border: none;background-color: #ff5b00;" class="btn btn-primary btn-block btn-lg">
                                                                    <div class="d-flex justify-content-between">
                                                                        <span style="margin-left: 40%;">Mua ngay</span>
                                                                        <!--<span>$26.48</span>-->
                                                                    </div>
                                                                </button>
                                                            </form>
                                                        </div>  
                                                    </div>

                                                </c:if>

                                                <!--Show thông tin thanh toán của các tour trong cart-->
                                                <c:if test="${sessionScope.idSelectOne == 0}">
                                                    <c:set value="${sessionScope.cartFill}" var="o"/>
                                                    <div style="display: block" class="row">
                                                        <div style="max-width: 100%;" class="col-12 col-xl-6">
                                                            <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                                                <p class="mb-2">Tổng thanh toán</p>
                                                                <p class="mb-2"><fmt:formatNumber value="${o.totalMoney}" pattern="###,###"/> VNÐ</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                                <p class="mb-0">Số lượng</p>
                                                                <p class="mb-0">${sessionScope.sizeCart} (Tour)</p>
                                                            </div>

                                                            <hr class="my-4">

                                                            <form action="checkout">
                                                                <c:set value="${requestScope.infoAcc}" var="infoAcc"/>
                                                                <!--<input type="text" hidden value="${sessionScope.account.id}" name="idAccount">-->
                                                                <input type="text" hidden value="${infoAcc.id}" name="idInfor">

                                                                <input type="hidden" name="selectCheckout" value="0">
                                                                <button onclick="buyNow(event)" style=" cursor: pointer;border: none;background-color: #ff5b00;" class="btn btn-primary btn-block btn-lg">
                                                                    <div class="d-flex justify-content-between">
                                                                        <span style="margin-left: 40%;">Mua ngay</span>
                                                                        <!--<span>$26.48</span>-->
                                                                    </div>
                                                                </button>
                                                            </form>
                                                        </div>  
                                                    </div>
                                                </c:if>



                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>




                    </div>
                </div>
            </div>
            <!-- Footer -->
            <jsp:include page="footer.jsp"></jsp:include>
        </div>

        <script>
            function validateForm() {
                var selectBox = document.getElementById("proccessSelect");
                var selectedValue = selectBox.options[selectBox.selectedIndex].value;
                if (selectedValue === "0") {
                    alert("Vui lòng chọn một thông tin tài khoản để cập nhật.");
                    return false;
                }
                return true;
            }


            function buyNow(event) {
                // Lấy giá trị đã chọn từ select box
                var selectedValue = document.getElementById("proccessSelect").value;

                // Kiểm tra xem một tùy chọn đã được chọn hay chưa
                if (selectedValue === "0") {
                    alert("Vui lòng chọn thông tin liên lạc trước khi mua hàng.");
                    event.preventDefault();
                    return;
                }

                // Gán các giá trị đã chọn vào các trường trong form
//                var infoAcc = document.getElementById("formProccessSelect").querySelector('[value="' + selectedValue + '"]');
//                document.getElementById("idInfor").value = infoAcc.dataset.idInfor;
//                document.getElementById("idAccount").value = infoAcc.dataset.idAccount;
//                document.getElementById("name").value = infoAcc.dataset.username;
//                document.getElementById("birthdayDate").value = infoAcc.dataset.birthday;
//                document.getElementById("emailAddress").value = infoAcc.dataset.email;
//                document.getElementById("phoneNumber").value = infoAcc.dataset.phoneNumber;

                // Tiến hành mua hàng hoặc các hành động khác
                // ở đây có thể là gửi form thanh toán
            }


            function openForm() {
                document.querySelector(".fib-add-form").classList.add("active");
                document.querySelector(".fib-drawer-mask").classList.add("active");
            }

            function closeForm() {
                document.querySelector(".fib-add-form").classList.remove("active");
                document.querySelector(".fib-drawer-mask").classList.remove("active");
            }




            document.addEventListener("DOMContentLoaded", function () {
                // Xóa trạng thái của bước trước
                document.getElementById("step1").classList.remove("klk-step-status-process");
                document.getElementById("step1").classList.add("klk-step-status-finish");
                // Thêm trạng thái mới cho bước hiện tại
                document.getElementById("step2").classList.add("klk-step-status-process");
            });

            document.addEventListener("DOMContentLoaded", function () {
                // Lấy danh sách tất cả các bước
                var steps = document.querySelectorAll('.klk-step');

                // Lặp qua từng bước để xác định bước hiện tại
                steps.forEach(function (step) {
                    if (step.classList.contains('klk-step-status-process')) {
                        // Tìm biểu tượng của bước hiện tại và thay đổi nó thành dấu ba chấm
                        var icon = step.querySelector('.klk-step-icon i');
                        if (icon) {
                            icon.classList.remove('fa-check'); // Xóa biểu tượng check
                            icon.classList.add('fa-ellipsis'); // Thêm biểu tượng ba chấm
                        }
                    }
                });
            });



            document.getElementById('proccessSelect').onchange = function () {
                document.getElementById('formProccessSelect').submit();
            };


        </script>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/colorbox/jquery.colorbox-min.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/blog_custom.js"></script>


    </body>
</html>

