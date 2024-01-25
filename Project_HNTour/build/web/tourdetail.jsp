
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
        <meta name="description" content="Travelix Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">

        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/about_styles.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/single_listing_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/single_listing_responsive.css">

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
                    <div class="home_title">Tour detail</div>
                </div>
            </div>

            <!-- Intro -->

            <!-- Offers -->

            <div class="listing">

                <!-- Search -->

                <div class="search">
                    <div class="search_inner">

                        <!-- Search Contents -->

                        <div class="container fill_height no-padding">
                            <div class="row fill_height no-margin">
                                <div class="col fill_height no-padding">

                                    <!-- Search Tabs -->

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
                                            <input type="text" name="txt" class="destination search_input" required="required">
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
                                        <button class="button search_button">search<span></span><span></span><span></span></button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>	
                </div>	
            </div>

            <!-- Single Listing -->

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="single_listing">

                            <!-- Hotel Info -->

                            <div class="hotel_info">

                                <!-- Title -->
                                <div class="hotel_title_container d-flex flex-lg-row flex-column">
                                    <div class="hotel_title_content">
                                        <h1 class="hotel_title">${detail.name}</h1>
                                        <div class="rating_r rating_r_4 hotel_rating">
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                        </div>
                                        <div class="hotel_location"></div>
                                    </div>
                                    <div class="hotel_title_button ml-lg-auto text-lg-right">
                                        <div class="button book_button trans_200"><a href="#">book<span></span><span></span><span></span></a></div>
                                        <div class="hotel_map_link_container">
                                            <div class="hotel_map_link"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Listing Image -->

                                <div class="hotel_image">
                                    <img src="${detail.imageMain}" alt="">
                                    <div class="hotel_review_container d-flex flex-column align-items-center justify-content-center">
                                        <div class="hotel_review">
                                            <div class="hotel_review_content">
                                                <div class="hotel_review_title"></div>
                                                <div class="hotel_review_subtitle"></div>
                                            </div>
                                            <c:forEach items="${requestScope.feedback}" var="b"> 
                                                <div class="hotel_review_rating text-center">${b.rating}</div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                                <!-- Hotel Gallery -->

                                <div class="hotel_gallery">
                                    <div class="hotel_slider_container">
                                        <div class="owl-carousel owl-theme hotel_slider">
                                            <!-- Hotel Gallery Slider Item -->
                                            <c:set value="${requestScope.detail}" var="d"/>
                                            <c:forEach items="${d.imageAlbum}" var="image">
                                                <div class="owl-item">
                                                    <a  class="colorbox cboxElement" href="${image}">
                                                        <img src="${image}" alt="https://unsplash.com/@jbriscoe">
                                                    </a>
                                                </div>
                                            </c:forEach>
                                            <!-- Hotel Gallery Slider Item -->
                                        </div>

                                        <!-- Hotel Slider Nav - Prev -->
                                        <div class="hotel_slider_nav hotel_slider_prev">
                                            <svg version="1.1" id="Layer_6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                            <defs>
                                            <linearGradient id='hotel_grad_prev'>
                                            <stop offset='0%' stop-color='#fa9e1b'/>
                                            <stop offset='100%' stop-color='#8d4fff'/>
                                            </linearGradient>
                                            </defs>
                                            <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
                                                  M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
                                                  C22.545,2,26,5.541,26,9.909V23.091z"/>
                                            <polygon class="nav_arrow" fill="#F3F6F9" points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
                                                     11.042,18.219 "/>
                                            </svg>
                                        </div>

                                        <!-- Hotel Slider Nav - Next -->
                                        <div class="hotel_slider_nav hotel_slider_next">
                                            <svg version="1.1" id="Layer_7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                            <defs>
                                            <linearGradient id='hotel_grad_next'>
                                            <stop offset='0%' stop-color='#fa9e1b'/>
                                            <stop offset='100%' stop-color='#8d4fff'/>
                                            </linearGradient>
                                            </defs>
                                            <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
                                                  M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
                                                  C22.545,2,26,5.541,26,9.909V23.091z"/>
                                            <polygon class="nav_arrow" fill="#F3F6F9" points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
                                                     17.046,15.554 "/>
                                            </svg>
                                        </div>

                                    </div>
                                </div>

                                <!-- Hotel Info Text -->

                                <div class="hotel_info_text">
                                    <p>${detail.description}</p>
                                </div>

                                <!-- Hotel Info Tags -->

                                <div class="hotel_info_tags">
                                    <ul class="hotel_icons_list">
                                        <li class="hotel_icons_item"><img src="images/post.png" alt=""></li>
                                        <li class="hotel_icons_item"><img src="images/compass.png" alt=""></li>
                                        <li class="hotel_icons_item"><img src="images/bicycle.png" alt=""></li>
                                        <li class="hotel_icons_item"><img src="images/sailboat.png" alt=""></li>
                                    </ul>
                                </div>

                            </div>

                            <!-- Rooms -->
                            <c:forEach items="${requestScope.relate}" var="o"> 
                                <div class="rooms">

                                    <!-- Room -->
                                    <div class="room">

                                        <!-- Room -->
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <div class="room_image"><img src="${o.imageMain}" alt="https://unsplash.com/@grovemade"></div>
                                            </div>
                                            <div class="col-lg-7">
                                                <div class="room_content">
                                                    <div class="room_title">${o.name}</div>
                                                    <div class="room_price"><fmt:formatNumber value="${o.price}" pattern="###,###"/>VNÐ</div>
                                                    <div class="room_text">Time: ${o.intendedTime}</div>

                                                </div>
                                            </div>
                                            <div class="col-lg-3 text-lg-right">
                                                <div class="room_button">
                                                    <div class="button book_button trans_200"><a href="#">book<span></span><span></span><span></span></a></div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>



                                </div>
                            </c:forEach>
                            <!-- Reviews -->

                            <div class="reviews">
                                <div class="reviews_title">reviews</div>
                                <div class="reviews_container">
                                    <c:forEach items="${requestScope.feedback}" var="b"> 
                                        <!-- Review -->
                                        <div class="review">
                                            <div class="row">
                                                <div class="col-lg-1">
                                                    <div class="review_image">
                                                        <img src="" alt="Image by Andrew Robles">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-lg-11">
                                                <div class="review_content">
                                                    <div class="review_title_container">
                                                        <div class="review_title"></div>
                                                        <div class="review_rating">${b.rating}</div>
                                                    </div>
                                                    <div class="review_text">
                                                        <p>${b.comment}</p>
                                                    </div>
                                                    <div class="review_name">${b.accName}</div>
                                                    <div class="review_date"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <!-- Location on Map -->

                            <div class="location_on_map">
                                <div class="location_on_map_title">location on map</div>

                                <!-- Google Map -->

                                <div class="travelix_map">
                                    <div id="google_map" class="google_map">
                                        <div class="map_container">
                                            <div id="map"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>		
        </div>
        <!-- Footer -->

        <jsp:include page="footer.jsp"></jsp:include>

    </div>

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
