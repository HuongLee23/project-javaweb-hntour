

<%-- 
    Document   : tourdetail
    Created on : Jan 15, 2024, 12:00:33 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hà Nội Tour</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Ha Noi Tour">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/about_styles.css">
        <link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/single_listing_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/single_listing_responsive.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/main.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/detail.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="./assets/libs/bootstrap-icons.css" rel="stylesheet" />
        <link href="./assets/libs/father.css" rel="stylesheet" />
        <link href="./assets/libs/font.css" rel="stylesheet" />
        <link href="./assets/libs/simple.css" rel="stylesheet" />
        <link href="./assets/libs/theme.css" rel="stylesheet" />
    </style>


</head>


<body>

    <div class="super_container">

        <!-- Header -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header -->
            <!-- Home -->

            <div class="home">
                <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/about_background.jpg"></div>
                <div class="home_content">
                    <div class="home_title" style="color: black">Lịch sử mua hàng</div>
                </div>
            </div>



            <section class="container-fluid p-4">
                <div class="row ">
                    <div class="col-lg-12 col-md-12 col-12">
                        <!-- Page header -->
                        <div class="border-bottom pb-3 mb-3 ">
                            <div class="mb-2 mb-lg-0">
                                <!--<h1 class="mb-0 h2 fw-bold">Lịch sử mua hàng</h1>-->

                            </div>
                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="row-cols-6">
                    <div class="col-xxl-10 col-10">
                        <!-- card -->
                        <div class="card">
                            <!-- card body-->
                            <div class="card-body">
                                <div class="mb-6">
                                    <h4 class="mb-0">Đơn hàng của tôi</h4>
                                    <p> Hãy kiểm tra trạng thái của các đơn đặt hàng gần đây, quản lý trả lại và khám phá các sản phẩm tương tự.</p>
                                </div>
                                <div class="mb-8">
                                    <!-- text -->
                                <c:forEach items="${requestScope.listOrder}" var="ho">

                                    <c:if test="${not empty prevSupplierId && ho.supplier.idAcc ne prevSupplierId}">

                                    </div>
                                </c:if>


                                <c:if test="${empty prevSupplierId || ho.supplier.idAcc ne prevSupplierId}">

                                    <div class="border-bottom mb-3 pb-3 d-lg-flex align-items-center justify-content-between">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <h5 class="mb-0"><a href="supplier?sid=${ho.tour.supplierId}"> ${ho.supplier.nameCompany}</a></h5>
                                            <span class="ms-2">ID Đơn hàng: ${ho.order.id}</span>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <!-- link -->

                                        </div>
                                    </div>

                                    <c:set var="prevSupplierId" value="${ho.supplier.idAcc}" />
                                </c:if>


                                <div class="row justify-content-between align-items-center" style="margin-bottom: 10px;">
                                    <div class="col-lg-8 col-12">
                                        <div class="d-md-flex">
                                            <div>
                                                <!-- img -->
                                                <img style="width: 16rem; height: 12rem;" src="${ho.tour.imageMain}" alt="hiii" class="img-4by3-xl rounded">
                                            </div>
                                            <div class="ms-md-4 mt-2 mt-lg-0">
                                                <!-- heading -->
                                                <h5 class="mb-1">${ho.tour.name}</h5>
                                                <!-- text -->
                                                <c:if test="${ho.orderdetail.voucherId != 0}">
                                                    <span>Giá bán: <span style="color: #757582 !important; text-decoration: line-through !important; " class="text-dark"><fmt:formatNumber value="${ho.tour.price}" pattern="###,###"/>VNÐ</span><br>
                                                        <span style="color: #f0552d !important;">Áp mã giảm giá: <span style="color: #f0552d !important;" class="text-dark"><fmt:formatNumber value="${ho.orderdetail.price}" pattern="###,###"/>VNÐ</span></span><br>
                                                        </c:if>
                                                        <c:if test="${ho.orderdetail.voucherId == 0}">
                                                            <span>Giá mua: <span class="text-dark"><fmt:formatNumber value="${ho.orderdetail.price}" pattern="###,###"/>VNÐ</span></span> <br>
                                                        </c:if>


                                                        Số lượng: <span class="text-dark">${ho.orderdetail.quantity}</span></span><br>
                                                    Ngày mua: <span class="text-dark">${ho.order.date}</span></span><br>
                                                Ngày đi: <span class="text-dark">${ho.orderdetail.dateDeparture}</span></span><br>
                                                <!-- text -->
                                                <%--<c:if test="${ho.orderdetail.voucherId != 0}">--%>
                                                <div class="mt-3">
                                                    <c:if test="${ho.orderdetail.status == 'Đang xử lý'}">
                                                        <h5> Trạng thái: <span class="text-dark" style="color: #0d6efd !important">${ho.orderdetail.status}</span></h5>
                                                        </c:if>
                                                        <c:if test="${ho.orderdetail.status == 'Hủy đơn hàng'}">
                                                        <h5> Trạng thái: <span class="text-dark" style="color: red !important">${ho.orderdetail.status}</span></h5>
                                                        </c:if>
                                                        <c:if test="${ho.orderdetail.status == 'Xác nhận đơn hàng'}">
                                                        <h5> Trạng thái: <span class="text-dark" style="color: #198754 !important">${ho.orderdetail.status}</span></h5>
                                                        </c:if>

                                                </div>
                                                <%--</c:if>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- button -->
                                    <div class="col-lg-3 col-12 d-grid">
                                        <a href="detail?tid=${ho.tour.id}" class="btn btn-primary mb-2">Mua lại</a>
                                        <a href="supplier?sid=${ho.tour.supplierId}" class="btn btn-secondary"> Xem shop</a>
                                    </div>
                                </div>
                            </c:forEach>

                            <hr class="my-3">
                        </div>
                    </div>
                </div>
            </div>
    </div>



</section>
<!-- Single Listing -->



<!-- Footer -->


<jsp:include page="footer.jsp"></jsp:include>


<script>
    CKEDITOR.replace('describe');
    function submitForm() {
        document.getElementById("myForm").submit();
    }
</script>


</body>

</html>








