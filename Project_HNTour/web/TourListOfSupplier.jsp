
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css" href="./styles/offers_styles.css">
        <link rel="stylesheet" type="text/css" href="./styles/offers_responsive.css">
        <link rel="stylesheet" href="./assets/css/tour.css"/>
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">-->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </head>
    <body>
        <div class="super_container">
            <!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>



                <div class="home">
                    <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/about_background.jpg"></div>
                    <div class="home_content">
                        <!--<div class="home_title">our Tour</div>-->
                    </div>
                </div>

                <div class="offers">

                    <div class="search">
                        <div class="search_inner">

                            <div class="container fill_height no-padding">
                                <div class="row fill_height no-margin">
                                    <div class="col fill_height no-padding">

                                        <div class="search_tabs_container">
                                            <div class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                            <c:forEach items="${listCategory}" var="c">
                                                <a class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start" href="searchcategory?cid=${c.id}">
                                                    <!--<div class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start">-->
                                                    <c:if test="${c.id == 1}"><div class="icon-history"><i style="font-size: x-large; position: absolute; top: -14px;font-weight: 900; left: -40px;" class="fa-solid fa-landmark"></i></div></c:if>
                                                    <c:if test="${c.id == 2}"><div class="icon-culture"><i style="font-size: x-large; position: absolute; top: -14px;font-weight: 900; left: -40px;" class="fa-solid fa-flag"></i></div></c:if>
                                                    <c:if test="${c.id == 3}"><div class="icon-food"><i style="font-size: x-large; position: absolute; top: -14px;font-weight: 900; left: -40px;" class="fa-solid fa-utensils"></i></div></c:if>
                                                    <c:if test="${c.id == 4}"><div class="icon-vacation"><i style="font-size: x-large; position: absolute; top: -14px;font-weight: 900; left: -40px;" class="fa-solid fa-tower-observation"></i></div></c:if>
                                                    <span>${c.getName()}</span>
                                                    <!--</div>-->
                                                </a>
                                            </c:forEach>    
                                        </div>
                                    </div>
                                    <!-- Search Panel -->

                                    <div class="search_panel active">
                                        <form action="searchname" id="search_form_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                            <div class="search_item">
                                                <div>destination</div>
                                                <input oninput="searchByAll(this)" type="text" name="txt" class="destination search_input" required="required">
                                            </div>
                                            <div class="search_item">
                                                <div>check in</div>
                                                <input type="text" class="check_in search_input" placeholder="YYYY-MM-DD">
                                            </div>
                                            <div class="search_item">
                                                <div>check out</div>
                                                <input type="text" class="check_out search_input" placeholder="YYYY-MM-DD">
                                            </div>
                                            <div class="search_item">
                                                <div>adults</div>
                                                <select name="adults" id="adults_1" class="dropdown_item_select search_input">
                                                    <option>01</option>
                                                    <option>02</option>
                                                    <option>03</option>
                                                </select>
                                            </div>
                                            <div class="search_item">
                                                <div>children</div>
                                                <select name="children" id="children_1" class="dropdown_item_select search_input">
                                                    <option>0</option>
                                                    <option>02</option>
                                                    <option>03</option>
                                                </select>
                                            </div>
                                            <div class="more_options">
                                                <div class="more_options_trigger">
                                                    <a href="#">load more options</a>
                                                </div>
                                                <ul class="more_options_list clearfix">
                                                    <li class="more_options_item">
                                                        <div class="clearfix">
                                                            <input type="checkbox" id="more_options_1" class="search_extras_cb">
                                                            <label for="more_options_1">Price Under 500</label>
                                                        </div>
                                                    </li>
                                                    <li class="more_options_item">
                                                        <div class="clearfix">
                                                            <input type="checkbox" id="more_options_2" class="search_extras_cb">
                                                            <label for="more_options_2">Price Between 500 and 1000</label>
                                                        </div>
                                                    </li>
                                                    <li class="more_options_item">
                                                        <div class="clearfix">
                                                            <input type="checkbox" id="more_options_3" class="search_extras_cb">
                                                            <label for="more_options_3">Price Above 1000</label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <button class="button search_button">tìm kiếm<span></span><span></span><span></span></button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--<<<<<<< HEAD-->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-1 temp_col">
                        </div>
                        <div class="col-lg-11">
                            <div class="offers_sorting_container">
                                <ul class="">
                                    <li class="offers_sorting">
                                        Sắp xếp theo
                                        <select name="sortBy" class="sort_btn">
                                            <option id="" >Hà Nội Tour Giới Thiệu</option>
                                            <option value="ascPrice">Giá (Thấp đến cao)</option>
                                            <option value="descPrice">Giá (Cao đến thấp)</option>
                                            <option value="descRating">Đánh giá cao nhất</option>
                                            <option value="ascName">Tên (A-Z)</option>
                                            <option value="descName">Tên (Z-A)</option>
                                            <option value="">Bán chạy nhất</option>

                                        </select>
                                        <script>
                                            document.querySelector('select[name="sortBy"]').addEventListener('change', function () {
                                                var selectedValue = this.value;
                                                // Perform any additional logic if needed
                                                window.location.href = "sort?sortBy=" + selectedValue;
                                            });
                                        </script>
                                    </li>

                                </ul> 
                            </div>
                        </div>
                    </div>



                    <!-- start -->  


                    <div id="offers_tour" class="col-lg-12">
                        <div class="offers_grid">
                            <c:forEach items="${requestScope.tour}" var="c">  

                                <div class="offers_item rating_4">
                                    <div class="row">
                                        <div class="col-lg-1 temp_col"></div>
                                        <div class="col-lg-3 col-1680-4">
                                            <div class="offers_image_container">
                                                <a class="add_to_card" href="additem?id=${c.id}&num=1">
                                                    <i class="icon_card fa-solid fa-cart-plus" style="color: #e2492b" ></i>
                                                </a>
                                                <img  class="card-img-top" src="${c.imageMain}">
                                                <div class="offer_name"><span ><fmt:formatNumber value="${c.price}" pattern="###,###"/>VNÐ</span></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="offers_content">
                                                <div class="offers_price" style="font-size: 25px">${c.name}
                                                    <div><span>Thời gian dự kiến hết: ${c.intendedTime}</span></div>
                                                </div>
                                                <p class="offers_text">
                                                    <c:choose>
                                                        <c:when test="${fn:length(c.description) > 200}">
                                                            ${fn:substring(c.description, 0, 200)}...
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${c.description}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <div style="background-color: #ee4d2d;" class="button book_button"><a href="fillinformationbuyer?id=${c.id}">Mua ngay<span></span><span></span><span></span></a></div>
                                                <div class="button book_button"><a href="detail?tid=${c.id}">Xem chi tiết</a></div>

                                                <div class="offer_reviews">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>


        <script>
            function searchByAll(param) {
                var searchAll = param.value;
                $.ajax({
                    url: "/VNTravel/searchajax",
                    type: "get",
                    data: {
                        txt: searchAll
                    },
                    success: function (data) {
                        var row = document.getElementById("offers_tour");
                        row.innerHTML = data;
                    },
                    error: function (xhr, status, error) {
                        console.log("An error occurred:", error);
                    }
                }); // Add closing bracket here
            }

        </script>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/offers_custom.js"></script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"845750592bc9408f","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}' crossorigin="anonymous"></script>
    </body>
</html>
