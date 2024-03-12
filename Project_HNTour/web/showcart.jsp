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




            <c:if test="${sessionScope.sizeCart != 0}">
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



                <!--Show sản phẩm trong giỏ hàng-->
                <div class="checkout blog">
                    <div class="container">
                        <div style="display: block;" class="row">


                            <section class="h-100 h-custom">
                                <div class="container h-100 py-5">
                                    <div class="row d-flex justify-content-center align-items-center h-100">
                                        <div class="col">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" style="width: 56%;;" class="h6">Sản phẩm trong giỏ hàng</th>
                                                            <th scope="col">Giá</th>
                                                            <th scope="col">Số lượng</th>
                                                            <th scope="col">Đơn giá</th>
                                                            <th scope="col">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:set value="${requestScope.cart}" var="o"/>
                                                        <c:forEach items="${o.items}" var="i" varStatus="loop">
                                                            <tr>
                                                                <th scope="row" class="border-bottom-0">
                                                                    <div style="justify-content: space-evenly" class="d-flex align-items-center">
                                                                        <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                                                            <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                                                                <img src="${i.tour.imageMain}"
                                                                                     class="w-100" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="fby-show-product-information col-md-6 col-lg-6 col-xl-6">
                                                                            <h5>${i.tour.name}</h5>
                                                                        </div>
                                                                    </div>
                                                                </th>
                                                                <td class="align-middle border-bottom-0">
                                                                    <p class="mb-0" style="font-weight: 500;"><fmt:formatNumber value="${i.tour.price}" pattern="###,###"/> VNÐ</p>
                                                                </td>
                                                                <td class="align-middle border-bottom-0">
                                                                    <div class="d-flex flex-row">
                                                                        <a href="processcart?num=-1&id=${i.tour.id}">
                                                                            <button class="btn btn-link px-2" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                                                <i class="fas fa-minus"></i>
                                                                            </button>
                                                                        </a>

                                                                        <input id="form1" min="0" name="quantity" value="${i.quantity}" type="number"
                                                                               class="form-control form-control-sm" style="width: 50px;" />

                                                                        <a href="processcart?num=1&id=${i.tour.id}">
                                                                            <button class="btn btn-link px-2" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                                                <i class="fas fa-plus"></i>
                                                                            </button>
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                                <td class="align-middle border-bottom-0">
                                                                    <p class="mb-0" style="font-weight: 500;"><fmt:formatNumber value="${i.price}" pattern="###,###"/> VNÐ</p>
                                                                </td>
                                                                <td class="align-middle border-bottom-0" style="text-align: center;">
                                                                    <form id="myForm${loop.index}" action="processcart" method="post">
                                                                        <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                                                            <div class="d-flex flex-row align-items-center mb-1">
                                                                                <!--<h4 class="mb-1 me-1">$13.99</h4>-->
                                                                                <span class="text-danger"><div class="text-danger mb-1 me-2">
                                                                                        <input type="hidden" name="id" value="${i.tour.id}">
                                                                                        <i class="fa-solid fa-trash-can" style="color: #ff0000; cursor: pointer;" onclick="submitForm(${loop.index})"></i>
                                                                                    </div>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>



                                            <div  class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;width: 500px;margin-left: 30%;">
                                                <div class="card-body p-4">
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

                                                            <form action="fillinformationbuyer" method="post">
                                                                <!--<a href="fillinformationbuyer">-->
                                                                <button style="cursor: pointer;border: none;background-color: #ff5b00;" class="btn btn-primary btn-block btn-lg">
                                                                    <div class="d-flex justify-content-between">
                                                                        <span style="margin-left: 40%;">Đặt ngay</span>
                                                                        <!--<span>$26.48</span>-->
                                                                    </div>
                                                                    <!--</button>-->
                                                                    </a>
                                                            </form>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </section>

                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${sessionScope.sizeCart == 0}">
                <div style="margin: 50px 0 100px 0;text-align: center;" class="checkout blog">
                    <button class="tour-button-book">
                        <a href="tourlist">
                            <span class="">Khám phá ngay</span>
                        </a>
                    </button>
                    <i class="fa-solid fa-arrow-down fa-bounce" style="font-size: xx-large;position: absolute;top: 135px;right: 619px;color: #ee4d2d;"></i>
                    <img style="margin-top: 100px;height: 300px;width: 400px;" src="./assets/img/emptyCart.png" alt="Empty cart"/>
                    <div class="R1_cart">Giỏ hàng của bạn còn trống</div>
                </div>
            </c:if>
            <!-- Footer -->
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
        <script>
            function submitForm(index) {
                document.getElementById("myForm" + index).submit();
            }


            document.addEventListener("DOMContentLoaded", function () {
                // Thêm lắng nghe sự kiện khi bước thay đổi
                document.getElementById("step1").classList.add("klk-step-status-process");
            }
            );

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
