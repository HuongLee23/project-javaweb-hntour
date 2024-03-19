<%--
    Document   : header
    Created on : Jan 14, 2024, 8:23:43 PM
    Author     : hello
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Header -->

<script src="https://kit.fontawesome.com/2ab805f98d.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./assets/css/main.css"/>

<header class="header">

    <!-- Top Bar -->
    <div class="top_bar">
        <div class="container">
            <div class="row">
                <div class="col d-flex flex-row">
                    <div class="phone">+84 928 008 008</div>
                    <div class="user_box ml-auto d-flex align-items-center">
                        <c:set value="${sessionScope.account}" var="a"/>
                        <c:if test="${a == null}">
                            <div class="user_box_login user_box_link"><a href="login.jsp">Đăng nhập</a></div>
                            <div class="user_box_register user_box_link"><a href="register.jsp">Đăng ký</a></div>
                        </c:if>
                        <c:if test="${a != null}">
                            <c:if test="${a.role == 1}">
                                <a href="admin/manageraccount"><i class="fa-solid fa-user" style="color: #ffffff;"></i></a>
                                </c:if>
                                <c:if test="${a.role == 2}">
                                <a href="statistic?supplierId=${a.id}"><i class="fa-solid fa-user" style="color: #ffffff;"></i></a>
                                </c:if>
                                <c:if test="${a.role == 3}">
                                <a href="profileaccount"><i class="fa-solid fa-user" style="color: #ffffff;"></i></a>
                                </c:if>
                            <!-- Thêm thông báo sau đây -->
                            <div class="notification_icon ml-4">
                                <a href="vouchercustomer" id="notification_button" class="d-flex align-items-center">
                                    <i class="fa-solid fa-ticket" style="color: #ffffff; font-size: 20px;"></i>
                                </a>
                            </div>


                        </c:if>
                    </div>
                </div>
            </div>
        </div>      
    </div>


    <!-- Main Navigation -->

    <nav class="main_nav">
        <div class="container">
            <div class="row">
                <div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
                    <div class="logo_container">
                        <div class="logo"><a style="font-family: serif;" href="home"><img style="margin: -139px 0px 0px -60px; width: 250px;" src="./assets/img/logo.png" alt=""></a></div>
                    </div>
                    <div class="main_nav_container ml-auto">
                        <ul class="main_nav_list">
                            <li class="main_nav_item"><a href="home">Trang chủ</a></li>
                            <li class="main_nav_item"><a href="tourlist">Khám phá</a></li>
                            <li class="main_nav_item"><a href="aboutUs.jsp">Về Hà Nội Tour</a></li>
                            <li class="main_nav_item"><a href="blog">Diễn đàn</a></li>
                            <li class="main_nav_item"><a href="contact.jsp">Liên hệ</a></li>

                        </ul>
                    </div>

                    <!--Add to Cart Tour -->

                    <div class="content_search ml-lg-0 ml-auto">
                        <li class="header__navbar-item header__navbar-item--show-notify">
                            <a class="header__navbar-item-link" href="showcart">
                                <i class=" fa-solid fa-cart-shopping"></i>
                                <c:if test="${sessionScope.sizeCart != 0}">
                                    <div class="shopee-cart-number-badge" aria-hidden="true">${sessionScope.sizeCart}</div>
                                </c:if>

                            </a>

                            <!-- Notification that the cart contains products -->
                            <c:if test="${sessionScope.sizeCart != 0}">
                                <div class="header__notify">
                                    <div class="header__notify-wrapper">
                                        <header class="header__notify-header">
                                            <h3>Tour mới thêm</h3>
                                        </header>
                                        <ul class="header__notify-list">
                                            <c:forEach items="${sessionScope.listItem}" var="item">
                                                <li class="header__notify-item header__notify-item--viewed">
                                                    <a href="detail?tid=${item.tour.id}" class="header__notify-link">
                                                        <img src="${item.tour.imageMain}"
                                                             alt="${item.tour.name}" class="header__notify-img">
                                                        <div class="header__notify-info">
                                                            <span class="header__notify-name">${item.tour.name}</span>
                                                            <span class="header__notify-description" style="color: #ee4d2d;"><fmt:formatNumber value="${item.tour.price}" pattern="###,###"/>VNÐ</span>
                                                        </div>
                                                    </a>
                                                </li>

                                            </c:forEach>
                                        </ul>
                                        <footer class="header__notify-footer">
                                            <a href="showcart" class="header__notify-footer-btn">
                                                Xem tất cả
                                            </a>
                                        </footer>
                                    </div>
                                </div>
                            </c:if>

                            <!--Notification that the shopping cart is empty-->
                            <c:if test="${sessionScope.sizeCart == 0}">
                                <div style="text-align: center;top: 30px;width: 350px;height: 150px;" class="header__notify">
                                    <img style="width: 150px;height: 100px;" src="./assets/img/emptyCart.png" alt="Empty cart"/>
                                </div>
                            </c:if>


                        </li>
                    </div>

                </div>
            </div>
        </div>	
    </nav>

</header>
