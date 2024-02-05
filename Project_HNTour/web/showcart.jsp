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
                        <img src="./assets/img/checkout.png" alt="alt"/>
                    </div>
                    <div class="home_content">
                        <div class="home_title">The payment</div>
                    </div>
                </div>
            <c:if test="${sessionScope.sizeCart != 0}">
                <div class="checkout blog" style=" padding:0px;">
                    <div class="container">
                        <div class="row">


                            <section class="h-100 h-custom">
                                <div class="container h-100 py-5">
                                    <div class="row d-flex justify-content-center align-items-center h-100">
                                        <div class="col">

                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" class="h5">Thanh toán giỏ hàng</th>
                                                            <th scope="col">Voucher</th>
                                                            <th scope="col">Số lượng</th>
                                                            <th scope="col">Giá</th>
                                                            <th scope="col">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:set value="${requestScope.cart}" var="o"/>
                                                        <c:forEach items="${o.items}" var="i" varStatus="loop">
                                                            <tr>
                                                                <th scope="row" class="border-bottom-0">
                                                                    <div class="d-flex align-items-center">
                                                                        <img src="${i.tour.imageMain}" class="img-fluid rounded-3"
                                                                             style="width: 120px;" alt="${i.tour.name}">
                                                                        <div class="flex-column ms-4">
                                                                            <p class="mb-2">${i.tour.name}</p>
                                                                            <!--<p class="mb-0">Yuval Noah Harari</p>-->
                                                                        </div>
                                                                    </div>
                                                                </th>
                                                                <td class="align-middle border-bottom-0">
                                                                    <p class="mb-0" style="font-weight: 500;">Voucher</p>
                                                                </td>
                                                                <td class="align-middle border-bottom-0">
                                                                    <div class="d-flex flex-row">
                                                                        <button class="btn btn-link px-2" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                                            <a href="processcart?num=-1&id=${i.tour.id}">
                                                                                <i class="fas fa-minus"></i>
                                                                            </a>
                                                                        </button>

                                                                        <input id="form1" min="0" name="quantity" value="${i.quantity}" type="number"
                                                                               class="form-control form-control-sm" style="width: 50px;" />

                                                                        <button class="btn btn-link px-2" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                                            <a href="processcart?num=1&id=${i.tour.id}">
                                                                                <i class="fas fa-plus"></i>
                                                                            </a>
                                                                        </button>
                                                                    </div>
                                                                </td>
                                                                <td class="align-middle border-bottom-0">
                                                                    <p class="mb-0" style="font-weight: 500;"><fmt:formatNumber value="${i.price * i.quantity}" pattern="###,###"/> VNÐ</p>
                                                                </td>
                                                                <td class="align-middle border-bottom-0" style="text-align: center;">
                                                                    <form id="myForm${loop.index}" action="processcart" method="post">
                                                                        <input type="hidden" name="id" value="${i.tour.id}">
                                                                        <i class="fa-solid fa-trash-can" style="color: #ff0000; cursor: pointer;" onclick="submitForm(${loop.index})"></i>
                                                                    </form>
                                                                </td>
                                                            </tr>

                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
                                                <div class="card-body p-4">

                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
                                                            <form>
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
                                                            </form>
                                                        </div>
                                                        <div class="col-md-6 col-lg-4 col-xl-6">
                                                            <div class="row">
                                                                <div class="col-12 col-xl-6">
                                                                    <div class="form-outline mb-4 mb-xl-5">
                                                                        <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                                                                               placeholder="John Smith" />
                                                                        <label class="form-label" for="typeName">Name on card</label>
                                                                    </div>

                                                                    <div class="form-outline mb-4 mb-xl-5">
                                                                        <input type="text" id="typeExp" class="form-control form-control-lg" placeholder="MM/YY"
                                                                               size="7" id="exp" minlength="7" maxlength="7" />
                                                                        <label class="form-label" for="typeExp">Expiration</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 col-xl-6">
                                                                    <div class="form-outline mb-4 mb-xl-5">
                                                                        <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
                                                                               placeholder="1111 2222 3333 4444" minlength="19" maxlength="19" />
                                                                        <label class="form-label" for="typeText">Card Number</label>
                                                                    </div>

                                                                    <div class="form-outline mb-4 mb-xl-5">
                                                                        <input type="password" id="typeText" class="form-control form-control-lg"
                                                                               placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                                                                        <label class="form-label" for="typeText">Cvv</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-xl-3">
                                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                                <p class="mb-2">Tổng tiền</p>
                                                                <p class="mb-2"><fmt:formatNumber value="${o.totalMoney}" pattern="###,###"/> VNÐ</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                                <p class="mb-0">Voucher</p>
                                                                <p class="mb-0">$2.99</p>
                                                            </div>

                                                            <hr class="my-4">

                                                            <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                                                <p class="mb-2">Tổng thanh toán</p>
                                                                <p class="mb-2"><fmt:formatNumber value="${o.totalMoney}" pattern="###,###"/> VNÐ</p>
                                                            </div>

                                                            <button type="button" class="btn btn-primary btn-block btn-lg">
                                                                <div class="d-flex justify-content-between">
                                                                    <span>Thanh toán</span>
                                                                    <!--<span>$26.48</span>-->
                                                                </div>
                                                            </button>

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
                <div style="text-align: center;" class="checkout blog">
                    <button class="tour-button-book">
                        <a href="tourlist">
                            <span class="">Khám phá ngay</span>
                        </a>
                    </button>
                    <i class="fa-solid fa-arrow-down fa-bounce" style="font-size: xx-large;position: absolute;top: 135px;right: 619px;color: #ee4d2d;"></i>
                    <img style="height: 300px;width: 400px;" src="./assets/img/emptyCart.png" alt="Empty cart"/>
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
        </script>


        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/colorbox/jquery.colorbox-min.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/blog_custom.js"></script>

    </body>
</html>

