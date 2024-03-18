<%-- 
    Document   : checkout

    Created on : Jan 30, 2024, 10:31:53 PM
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
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
        <!--        <link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
                <link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">-->
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
                        <img src="./assets/img/checkout.png" alt="alt"/>
                    </div>
                    <div class="home_content">
                        <!--<div class="home_title">The payment</div>-->
                    </div>
                </div>


                <!-- Slider-top-step-bar (khi chưa thanh toán)-->
            <c:if test="${requestScope.messBuy == null}">

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

            </c:if>

            <!-- Slider-top-step-bar (khi đã thanh toán)-->
            <c:if test="${requestScope.messBuy != null}">

                <div class="top-step-bar desktop" id="top-step-bar">
                    <div class="klk-steps klk-steps-horizontal">
                        <div class="klk-step" id="step1">
                            <div class="klk-step-line-track" style="background-color: rgb(224, 224, 224);">
                                <div class="klk-step-line" style="background-color: #08b371;"></div>
                            </div>
                            <div class="klk-step-head">
                                <div style="background-color: #08b371;" class="klk-step-icon">
                                    <i style="color: white;" class="fa-solid fa-check"></i>
                                </div>
                            </div>
                            <div class="klk-step-main">
                                <div class="klk-step-title">Chọn đơn hàng</div>
                            </div>
                        </div>
                        <div class="klk-step" id="step2">
                            <div class="klk-step-line-track" style="background-color: rgb(224, 224, 224);">
                                <div class="klk-step-line" style="background-color: #08b371;"></div>
                            </div>
                            <div class="klk-step-head">
                                <div style="background-color: #08b371;" class="klk-step-icon">
                                    <i style="color: white;" class="fa-solid fa-check"></i>
                                </div>
                            </div>
                            <div class="klk-step-main">
                                <div class="klk-step-title">Điền thông tin</div>
                            </div>
                        </div>
                        <div class="klk-step" id="step3">
                            <div class="klk-step-head">
                                <div style="background-color: #08b371;" class="klk-step-icon">
                                    <i style="color: white;" class="fa-solid fa-check"></i>
                                </div>
                            </div>
                            <div class="klk-step-main">
                                <div class="klk-step-title">Thanh toán</div>
                            </div>
                        </div>
                    </div>
                </div>

            </c:if>


            <!--Khi chưa mua hàng thì nó sẽ hiện màn hình trên(các sản phẩm muốn thanh toán) --> 
            <c:if test="${requestScope.messBuy == null}">
                <!--Show thông tin đơn hàng-->
                <section class="fby-show-product">
                    <div class="container py-5">

                        <h2 class="fby-section-title">
                            <span>
                                Thông tin đơn hàng
                            </span>
                            <div class="fby-section-tips"></div>
                        </h2>

                        <!--Show thông tin của tour muốn mua ngay-->
                        <c:if test="${sessionScope.selectCheckout != 0}">
                            <c:set value="${sessionScope.itemTour}" var="i"/>
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
                                                    <c:if test="${i.idVoucher == 0}">
                                                        <div class="fby-show-product-information-price d-flex flex-row">
                                                            <span><fmt:formatNumber value="${i.price}" pattern="###,###"/> VNÐ</span>
                                                        </div>
                                                    </c:if>


                                                    <c:if test="${i.idVoucher != 0}">
                                                        <div class="fby-show-product-information-price d-flex flex-row">
                                                            <span style="color: #757582; text-decoration: line-through;"><fmt:formatNumber value="${i.price}" pattern="###,###"/> VNÐ</span>
                                                        </div>
                                                        <span></span>
                                                        <div class="fby-show-product-information-price d-flex flex-row">
                                                            <span>Áp mã giảm giá: <fmt:formatNumber value="${i.priceSale}" pattern="###,###"/> VNÐ</span>
                                                        </div>
                                                    </c:if>


                                                    <div class="mt-1 mb-0 text-muted small">
                                                        <span class="text-primary">Số lượng bạn đặt: ${i.quantity} vé</span>
                                                    </div>
                                                    <p class="text-truncate mb-4 mb-md-0">
                                                        ${i.tour.description}
                                                    </p>
                                                </div>
                                                <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                                    <div class="d-flex flex-row align-items-center mb-1">
                                                        <form id="formProccessVoucher" action="proccessvoucher" method="post">
                                                            <select id="proccessVoucher"  class="selectVoucher form-control-lg" name="selectVoucher" required>
                                                                <option value="0" disabled selected hidden>Chọn mã giảm giá</option>
                                                                <c:forEach items="${sessionScope.listVoucher}" var="v">
                                                                    <c:if test="${v.supplierId eq i.tour.supplierId}">
                                                                        <option <c:if test="${v.id eq i.idVoucher}">selected</c:if>  value="${v.id}">${v.code} - ${v.discount}%</option>
                                                                    </c:if> 
                                                                </c:forEach>
                                                            </select>
                                                        </form>
                                                    </div>
                                                </div>

                                            </div>   

                                        </div>   
                                    </div>
                                </div>
                            </div>

                        </c:if>

                        <!--Show thông tin của các tour trong cart-->
                        <c:if test="${sessionScope.selectCheckout == 0}">
                            <c:set value="${sessionScope.cartItem}" var="o"/>
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
                                                        <c:if test="${i.idVoucher == 0}">
                                                            <div class="fby-show-product-information-price d-flex flex-row">
                                                                <span><fmt:formatNumber value="${i.price}" pattern="###,###"/> VNÐ</span>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${i.idVoucher != 0}">
                                                            <div class="fby-show-product-information-price d-flex flex-row">
                                                                <span style="color: #757582; text-decoration: line-through;"><fmt:formatNumber value="${i.price}" pattern="###,###"/> VNÐ</span>
                                                            </div>
                                                            <span></span>
                                                            <div class="fby-show-product-information-price d-flex flex-row">
                                                                <span>Áp mã giảm giá: <fmt:formatNumber value="${i.priceSale}" pattern="###,###"/> VNÐ</span>
                                                            </div>
                                                        </c:if>

                                                        <div class="mt-1 mb-0 text-muted small">
                                                            <span class="text-primary">Số lượng bạn đặt: ${i.quantity} vé</span>
                                                        </div>
                                                        <p class="text-truncate mb-4 mb-md-0">
                                                            ${i.tour.description}
                                                        </p>
                                                    </div>
                                                    <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                                        <div class="d-flex flex-row align-items-center mb-1">
                                                            <form id="formProccessVoucher" action="proccessvoucher" method="post">
                                                                <input type="text" hidden value="${i.tour.id}" name="idTour">
                                                                <select id="proccessVoucher"  class="selectVoucher form-control-lg" name="selectVoucher" required>
                                                                    <option value="0" disabled selected hidden>Chọn mã giảm giá</option>

                                                                    <!--Hiển thị voucher-->
                                                                    <c:forEach items="${sessionScope.listVoucher}" var="v">

                                                                        <!--Câu if này đảm bảo tour này sẽ hiện đúng voucher của cùng nhà cung cấp tạo ra-->
                                                                        <c:if test="${v.supplierId eq i.tour.supplierId}">

                                                                            <c:set var="isUsed" value="false"/>
                                                                            <!-- Kiểm tra xem voucher đã được sử dụng chưa trong foreach-->
                                                                            <c:forEach items="${o.items}" var="it" varStatus="loop">
                                                                                <c:if test="${it.idVoucher eq v.id}">
                                                                                    <c:set var="isUsed" value="true"/>
                                                                                    <!-- Nếu voucher đã được sử dụng, không cần hiển thị nó -->
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            <!-- Nếu voucher chưa được sử dụng, hiển thị nó -->
                                                                            <c:if test="${not isUsed}">
                                                                                <option <c:if test="${v.id eq (i.idVoucher != 0 ? i.idVoucher : 0)}">selected</c:if>  value="${v.id}">${v.code} - ${v.discount}%</option>
                                                                            </c:if>

                                                                        </c:if> 

                                                                    </c:forEach>

                                                                </select>
                                                            </form>
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
            </c:if>

            <!--Khi mua hàng xong thì nó sẽ hiện màn hình trên(màn hình chúc mừng khi mua thành công)--> 
            <c:if test="${requestScope.messBuy != null}">
            </c:if>


            <!--Phần thanh toán sản phẩm-->
            <div class="checkout blog">
                <div class="container">
                    <div class="row">
                        <section class="h-100 h-custom">
                            <div class="container h-100 py-5">
                                <div class="row d-flex justify-content-center align-items-center h-100">
                                    <div class="col">

                                        <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
                                            <div class="card-body p-4">
                                                <!--<form action="checkout" method="post">-->
                                                <div class="row">
                                                    <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
                                                        <div class="d-flex flex-row pb-3">
                                                            <div class="d-flex align-items-center pe-2">
                                                                <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel1v"
                                                                       value="" aria-label="..." checked />
                                                            </div>
                                                            <div class="rounded border w-100 p-3">
                                                                <p class="d-flex align-items-center mb-0">
                                                                    <i class="fab fa-cc-mastercard fa-2x text-dark pe-2"></i>Credit
                                                                    Card
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex flex-row pb-3">
                                                            <div class="d-flex align-items-center pe-2">
                                                                <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel2v"
                                                                       value="" aria-label="..." />
                                                            </div>
                                                            <div class="rounded border w-100 p-3">
                                                                <p class="d-flex align-items-center mb-0">
                                                                    <i class="fab fa-cc-visa fa-2x fa-lg text-dark pe-2"></i>Debit Card
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex flex-row">
                                                            <div class="d-flex align-items-center pe-2">
                                                                <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel3v"
                                                                       value="" aria-label="..." />
                                                            </div>
                                                            <div class="rounded border w-100 p-3">
                                                                <p class="d-flex align-items-center mb-0">
                                                                    <i class="fab fa-cc-paypal fa-2x fa-lg text-dark pe-2"></i>PayPal
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-4 col-xl-6">
                                                        <div class="row">
                                                            <div class="col-12 col-xl-6">
                                                                <div class="form-outline mb-4 mb-xl-5">
                                                                    <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                                                                           placeholder="John Smith" required/>
                                                                    <label class="form-label" for="typeName">Name on card</label>
                                                                </div>

                                                                <div class="form-outline mb-4 mb-xl-5">
                                                                    <input type="text" id="typeExp" class="form-control form-control-lg" placeholder="MM/YY"
                                                                           size="7" id="exp" minlength="7" maxlength="7" required />
                                                                    <label class="form-label" for="typeExp">Expiration</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-12 col-xl-6">
                                                                <div class="form-outline mb-4 mb-xl-5">
                                                                    <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
                                                                           placeholder="1111 2222 3333 4444" minlength="19" maxlength="19" required/>
                                                                    <label class="form-label" for="typeText">Card Number</label>
                                                                </div>

                                                                <div class="form-outline mb-4 mb-xl-5">
                                                                    <input type="password" id="typeText" class="form-control form-control-lg"
                                                                           placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" required/>
                                                                    <label class="form-label" for="typeText">Cvv</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--Show phần thanh toán của tour muốn mua ngay-->
                                                    <c:if test="${sessionScope.selectCheckout != 0}">
                                                        <div style="width: 1200px" class="col-lg-4 col-xl-3">
                                                            <h3 style="color: red;font-size: 23px;">${requestScope.messBuy}</h3>
                                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                                <p class="mb-2">Tổng tiền</p>
                                                                <p class="mb-2"><fmt:formatNumber value="${i.price}" pattern="###,###"/> VNÐ</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                                <p class="mb-0">Tiết kiệm</p>

                                                                <p class="mb-0"><fmt:formatNumber value="${i.priceSale != 0 ? i.price - i.priceSale : 0}" pattern="###,###"/> VNÐ</p>
                                                            </div>

                                                            <hr class="my-4">

                                                            <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                                                <p class="mb-2">Tổng thanh toán</p>

                                                                <p class="mb-2"><fmt:formatNumber value="${i.priceSale != 0 ? i.priceSale : i.price}" pattern="###,###"/> VNÐ</p>
                                                            </div>

                                                            <form id="checkoutForm" action="checkout" method="post">
                                                                <button type="submit" class="btn btn-primary btn-block btn-lg" style=" cursor: pointer;border: none;background-color: #ff5b00;">
                                                                    <span>Thanh toán</span>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </c:if>

                                                    <!--Show phần thanh toán của các tour trong cart-->
                                                    <c:if test="${sessionScope.selectCheckout == 0}">
                                                        <c:set value="${sessionScope.cartItem}" var="i"/>
                                                        <div style="width: 1200px" class="col-lg-4 col-xl-3">
                                                            <h4 style="color: red;font-size: 23px;">${requestScope.messBuy}</h4>
                                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                                <p class="mb-2">Tổng tiền</p>
                                                                <p class="mb-2"><fmt:formatNumber value="${i.getTotalMoney()}" pattern="###,###"/> VNÐ</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                                <p class="mb-0">Tiết kiệm</p>
                                                                <p class="mb-0"><fmt:formatNumber value="${i.getTotalMoneyUseVoucher() != 0 ? i.getTotalMoney() - i.getTotalMoneyUseVoucher() : 0}" pattern="###,###"/> VNÐ</p>
                                                            </div>

                                                            <hr class="my-4">

                                                            <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                                                <p class="mb-2">Tổng thanh toán</p>
                                                                <p class="mb-2"><fmt:formatNumber value="${i.getTotalMoneyUseVoucher() != 0 ?i.getTotalMoneyUseVoucher() :i.getTotalMoney()}" pattern="###,###"/> VNÐ</p>
                                                            </div>

                                                            <form id="checkoutForm" action="checkout" method="post">
                                                                <button type="submit" class="btn btn-primary btn-block btn-lg" style=" cursor: pointer;border: none;background-color: #ff5b00;">
                                                                    <span>Thanh toán</span>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </c:if>


                                                </div>
                                                <!--</form>-->

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

                //Khi thanh toán xong mà ko còn sản phẩm nào mà cố tình thanh toán tiếp
                document.getElementById("checkoutForm").addEventListener("submit", function (event) {
                    // Kiểm tra xem sessionScope.selectCheckout có giá trị là null hay không
                    if (<%= session.getAttribute("selectCheckout") %> === null) {
                        // Ngăn chặn hành động gửi biểu mẫu mặc định
                        event.preventDefault();
                        // Hiển thị thông báo cho người dùng
                        alert("Không có sản phẩm nào để thanh toán.");
                    }
                });

                //Phần xử lý select voucher
                document.querySelectorAll('.selectVoucher').forEach(function (selectElement) {
                    selectElement.onchange = function () {
                        var form = selectElement.closest('form');
                        var tourId = form.querySelector('input[name="idTour"]').value;
                        var selectedVoucherId = selectElement.value;

                        // 1. Xác định supplierId của tour và voucher
                        var tourSupplierId = form.querySelector('input[name="tourSupplierId"]').value;
                        var voucherSupplierId = form.querySelector('option:selected').getAttribute('data-supplier-id');

                        // 2. Kiểm tra các tour khác và cập nhật danh sách voucher
                        document.querySelectorAll('.selectVoucher').forEach(function (otherSelectElement) {
                            var otherTourSupplierId = otherSelectElement.closest('form').querySelector('input[name="tourSupplierId"]').value;
                            var otherVoucherSupplierId = otherSelectElement.querySelector('option:selected').getAttribute('data-supplier-id');
                            var otherVoucherId = otherSelectElement.value;

                            // Nếu supplierId của tour và voucher khớp với tour đã chọn và voucher đã sử dụng, ẩn voucher đó
                            if (otherTourSupplierId === tourSupplierId && otherVoucherSupplierId === voucherSupplierId && otherVoucherId !== selectedVoucherId) {
                                otherSelectElement.querySelector('option[value="' + selectedVoucherId + '"]').disabled = true;
                            }
                        });
                    };
                });


                // Lặp qua tất cả các phần tử select và gán sự kiện onchange cho mỗi select
                document.querySelectorAll('.selectVoucher').forEach(function (selectElement) {
                    selectElement.onchange = function () {
                        // Tìm form cha của selectElement và submit form đó
                        selectElement.closest('form').submit();
                    };
                });


                document.addEventListener("DOMContentLoaded", function () {
                    // Xóa trạng thái của các bước trước
                    document.getElementById("step1").classList.remove("klk-step-status-process");
                    document.getElementById("step2").classList.remove("klk-step-status-process");
                    document.getElementById("step1").classList.add("klk-step-status-finish");
                    document.getElementById("step2").classList.add("klk-step-status-finish");
                    // Kiểm tra nếu messBuy khác null thì thêm trạng thái mới cho bước hiện tại
            <c:if test="${requestScope.messBuy == null}">
                    document.getElementById("step3").classList.add("klk-step-status-process");
            </c:if>
            <c:if test="${requestScope.messBuy != null}">
                    document.getElementById("step3").classList.add("klk-step-status-finish");
            </c:if>
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
        </script>


        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/colorbox/jquery.colorbox-min.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/blog_custom.js"></script>

    </body>
</html>

