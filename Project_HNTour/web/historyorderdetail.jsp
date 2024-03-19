
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
        <script src="./ckeditor/ckeditor/ckeditor.js"></script>
    </style>
    <style>
        .page-item.active .page-link{
            background-color: #fa9e1b;
            border-color: #fa9e1b;
        }
        .pagination>li>a{
            color: black ;
        }
        .type-feedback{

            margin-left: 90%;
        }

    </style>
    <style type="text/css">

        .card {
            border: none;
            margin-bottom: 24px;
            -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
            box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
        }

        .avatar-xs {
            height: 2.3rem;
            width: 2.3rem;
        }

        .card {
            background: #fff;
            transition: .5s;
            border: 0;
            margin-bottom: 30px;
            border-radius: .55rem;
            position: relative;
            width: 100%;
            box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
        }
        .card .body {
            color: #444;
            padding: 20px;
            font-weight: 400;
        }

        .container .addnewblog{
            margin-top: 45px;
        }

        .container .searchblog{
            width: 0;
        }
        tr , th , td {
            padding: 5px;
        }
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
                    <!--<div class="home_title">Tour detail</div>-->
                </div>
            </div>

            <!-- Intro -->

            <!-- Offers -->

            <div class="listing">

                <!-- Search -->

                <div class="search">
                    <div class="search_inner">

                        <!-- Search Contents -->

                        	
                </div>	
            </div>

            <!-- Single Listing -->

            <div class="container">
                <div class="table-responsive">
                    <div class="card">

                        <div class="card-body row">
                            <table class="table project-table table-centered table-nowrap">
                                <thead>
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col">Ảnh</th>
                                        <th scope="col">Tên Tour</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Tổng đơn giá</th>
                                        <th>...</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.listOrder}" var="od" varStatus="loop1">
                                        <tr>
                                            <th scope="row">${loop1.index+1}</th>
                                            <td style="width: 30%">
                                                <img style="width: 35%" class="d-block img-fluid" src="${od.tour.imageMain}" alt="">
                                            </td>
                                            <td>${od.tour.name}</td>
                                            <td>${od.tour.price}</td>
                                            <td>${od.orderdetail.quantity}</td>
                                            <td>${od.orderdetail.price}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${od.tour.status == true}">
                                                        <a style="background: #fa9e1b " href="detail?tid=${od.tour.id}" class="btn btn-primary">Mua lại</a>
                                                    </c:when>
                                                    <c:when test="${od.tour.status == false}">
                                                        <span>Tour này đã bị ẩn</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>    
                                    </c:forEach>


                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
            </div>		
        </div>
        <!-- Footer -->


        <jsp:include page="footer.jsp"></jsp:include>

    </div>

    <script>
        CKEDITOR.replace('describe');
        function submitForm() {
            document.getElementById("myForm").submit();
        }
    </script>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="styles/bootstrap4/popper.js"></script>
    <script src="styles/bootstrap4/bootstrap.min.js"></script>
    <script src="plugins/greensock/TweenMax.min.js"></script>
    <script src="plugins/greensock/TimelineMax.min.js"></script>
    <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="plugins/greensock/animation.gsap.min.js"></script>
    <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
    <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="plugins/easing/easing.js"></script>
    <script src="plugins/parallax-js-master/parallax.min.js"></script>
    <script src="js/about_custom.js"></script>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="styles/bootstrap4/popper.js"></script>
    <script src="styles/bootstrap4/bootstrap.min.js"></script>
    <script src="plugins/easing/easing.js"></script>
    <script src="plugins/parallax-js-master/parallax.min.js"></script>
    <script src="plugins/colorbox/jquery.colorbox-min.js"></script>
    <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
    <script src="js/single_listing_custom.js"></script>
</body>

</html>







