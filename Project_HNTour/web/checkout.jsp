<%-- 
    Document   : checkout
    Created on : Jan 30, 2024, 10:31:53 PM
    Author     : hello
--%>

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
                        <div class="home_title">The payment</div>
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


                <div class="checkout blog">
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
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row" class="border-bottom-0">
                                                                <div class="d-flex align-items-center">
                                                                    <img src="https://i.imgur.com/Oj1iQUX.webp" class="img-fluid rounded-3"
                                                                         style="width: 120px;" alt="Book">
                                                                    <div class="flex-column ms-4">
                                                                        <p class="mb-2">Homo Deus: A Brief History of Tomorrow</p>
                                                                        <p class="mb-0">Yuval Noah Harari</p>
                                                                    </div>
                                                                </div>
                                                            </th>
                                                            <td class="align-middle border-bottom-0">
                                                                <p class="mb-0" style="font-weight: 500;">Paperback</p>
                                                            </td>
                                                            <td class="align-middle border-bottom-0">
                                                                <div class="d-flex flex-row">
                                                                    <button class="btn btn-link px-2"
                                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                                        <i class="fas fa-minus"></i>
                                                                    </button>

                                                                    <input id="form1" min="0" name="quantity" value="1" type="number"
                                                                           class="form-control form-control-sm" style="width: 50px;" />

                                                                    <button class="btn btn-link px-2"
                                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                                        <i class="fas fa-plus"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                            <td class="align-middle border-bottom-0">
                                                                <p class="mb-0" style="font-weight: 500;">$13.50</p>
                                                            </td>
                                                        </tr>
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
                                                                <p class="mb-2">$23.49</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                                <p class="mb-0">Voucher</p>
                                                                <p class="mb-0">$2.99</p>
                                                            </div>

                                                            <hr class="my-4">

                                                            <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                                                <p class="mb-2">Tổng thanh toán</p>
                                                                <p class="mb-2">$26.48</p>
                                                            </div>

                                                            <button type="button" class="btn btn-primary btn-block btn-lg">
                                                                <div class="d-flex justify-content-between">
                                                                    <span>Thanh toán</span>
                                                                    <span>$26.48</span>
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


                <!-- Footer -->
            <jsp:include page="footer.jsp"></jsp:include>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Xóa trạng thái của các bước trước
                document.getElementById("step1").classList.remove("klk-step-status-process");
                document.getElementById("step2").classList.remove("klk-step-status-process");
                document.getElementById("step1").classList.add("klk-step-status-finish");
                document.getElementById("step2").classList.add("klk-step-status-finish");
                // Thêm trạng thái mới cho bước hiện tại
                document.getElementById("step3").classList.add("klk-step-status-process");
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
