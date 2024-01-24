<%-- 
    Document   : tourdetail
    Created on : Jan 15, 2024, 12:00:33 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



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



        <!-- Header -->

        <header class="header">

            <!-- Top Bar -->

            <div class="top_bar">
                <div class="container">
                    <div class="row">
                        <div class="col d-flex flex-row">
                            <div class="phone">+84 928 008 008</div>
                            <div class="user_box ml-auto">


                                <div class="user_box_login user_box_link"><a href="login.jsp">login</a></div>
                                <div class="user_box_register user_box_link"><a href="register.jsp">register</a></div>


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
                                <div class="logo"><a style="font-family: serif;" href="index.jsp"><img style="margin: -139px 0px 0px -60px; width: 250px;" src="./assets/img/logo.png" alt=""></a></div>
                            </div>
                            <div class="main_nav_container ml-auto">
                                <ul class="main_nav_list">
                                    <li class="main_nav_item"><a href="home.jsp">home</a></li>
                                    <li class="main_nav_item"><a href="tour.jsp">Tour</a></li>
                                    <li class="main_nav_item"><a href="aboutUs.jsp">about us</a></li>
                                    <li class="main_nav_item"><a href="offers.html">offers</a></li>
                                    <li class="main_nav_item"><a href="blog.html">news</a></li>
                                    <li class="main_nav_item"><a href="contact.html">contact</a></li>
                                </ul>
                            </div>
                            <div class="content_search ml-lg-0 ml-auto">
                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                     width="17px" height="17px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
                                <g>
                                <g>
                                <g>
                                <path class="mag_glass" fill="#FFFFFF" d="M78.438,216.78c0,57.906,22.55,112.343,63.493,153.287c40.945,40.944,95.383,63.494,153.287,63.494
                                      s112.344-22.55,153.287-63.494C489.451,329.123,512,274.686,512,216.78c0-57.904-22.549-112.342-63.494-153.286
                                      C407.563,22.549,353.124,0,295.219,0c-57.904,0-112.342,22.549-153.287,63.494C100.988,104.438,78.439,158.876,78.438,216.78z
                                      M119.804,216.78c0-96.725,78.69-175.416,175.415-175.416s175.418,78.691,175.418,175.416
                                      c0,96.725-78.691,175.416-175.416,175.416C198.495,392.195,119.804,313.505,119.804,216.78z"/>
                                </g>
                                </g>
                                <g>
                                <g>
                                <path class="mag_glass" fill="#FFFFFF" d="M6.057,505.942c4.038,4.039,9.332,6.058,14.625,6.058s10.587-2.019,14.625-6.058L171.268,369.98
                                      c8.076-8.076,8.076-21.172,0-29.248c-8.076-8.078-21.172-8.078-29.249,0L6.057,476.693
                                      C-2.019,484.77-2.019,497.865,6.057,505.942z"/>
                                </g>
                                </g>
                                </g>
                                </svg>
                            </div>

                            <form id="search_form" class="search_form bez_1">
                                <input type="search" class="search_content_input bez_1">
                            </form>

                            <div class="hamburger">
                                <i class="fa fa-bars trans_200"></i>
                            </div>
                        </div>
                    </div>
                </div>	
            </nav>

        </header>




        <div class="menu trans_500">
            <div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
                <div class="menu_close_container"><div class="menu_close"></div></div>
                <div class="logo menu_logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
                <ul>
                    <li class="menu_item"><a href="index.html">home</a></li>
                    <li class="menu_item"><a href="#">about us</a></li>
                    <li class="menu_item"><a href="offers.html">offers</a></li>
                    <li class="menu_item"><a href="blog.html">news</a></li>
                    <li class="menu_item"><a href="contact.html">contact</a></li>
                </ul>
            </div>
        </div>

        <!-- Home -->

        <div class="home">
            <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/about_background.jpg"></div>
            <div class="home_content">
                <div class="home_title">about us</div>
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
                                        <div class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/suitcase.png" alt=""><span>hotels</span></div>
                                        <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/bus.png" alt="">car rentals</div>
                                        <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/departure.png" alt="">flights</div>
                                        <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/island.png" alt="">trips</div>
                                        <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/cruise.png" alt="">cruises</div>
                                        <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/diving.png" alt="">activities</div>
                                    </div>		
                                </div>

                                <!-- Search Panel -->

                                <div class="search_panel active">
                                    <form action="#" id="search_form_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                        <div class="search_item">
                                            <div>destination</div>
                                            <input type="text" class="destination search_input" required="required">
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
                                        <div class="extras">
                                            <ul class="search_extras clearfix">
                                                <li class="search_extras_item">
                                                    <div class="clearfix">
                                                        <input type="checkbox" id="search_extras_1" class="search_extras_cb">
                                                        <label for="search_extras_1">Pet Friendly</label>
                                                    </div>	
                                                </li>
                                                <li class="search_extras_item">
                                                    <div class="clearfix">
                                                        <input type="checkbox" id="search_extras_2" class="search_extras_cb">
                                                        <label for="search_extras_2">Car Parking</label>
                                                    </div>
                                                </li>
                                                <li class="search_extras_item">
                                                    <div class="clearfix">
                                                        <input type="checkbox" id="search_extras_3" class="search_extras_cb">
                                                        <label for="search_extras_3">Wireless Internet</label>
                                                    </div>
                                                </li>
                                                <li class="search_extras_item">
                                                    <div class="clearfix">
                                                        <input type="checkbox" id="search_extras_4" class="search_extras_cb">
                                                        <label for="search_extras_4">Reservations</label>
                                                    </div>
                                                </li>
                                                <li class="search_extras_item">
                                                    <div class="clearfix">
                                                        <input type="checkbox" id="search_extras_5" class="search_extras_cb">
                                                        <label for="search_extras_5">Private Parking</label>
                                                    </div>
                                                </li>
                                                <li class="search_extras_item">
                                                    <div class="clearfix">
                                                        <input type="checkbox" id="search_extras_6" class="search_extras_cb">
                                                        <label for="search_extras_6">Smoking Area</label>
                                                    </div>
                                                </li>
                                                <li class="search_extras_item">
                                                    <div class="clearfix">
                                                        <input type="checkbox" id="search_extras_7" class="search_extras_cb">
                                                        <label for="search_extras_7">Wheelchair Accessible</label>
                                                    </div>
                                                </li>
                                                <li class="search_extras_item">
                                                    <div class="clearfix">
                                                        <input type="checkbox" id="search_extras_8" class="search_extras_cb">
                                                        <label for="search_extras_8">Pool</label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="more_options">
                                            <div class="more_options_trigger">
                                                <a href="#">load more options</a>
                                            </div>
                                            <ul class="more_options_list clearfix">
                                                <li class="more_options_item">
                                                    <div class="clearfix">
                                                        <input type="checkbox" id="more_options_1" class="search_extras_cb">
                                                        <label for="more_options_1">Pet Friendly</label>
                                                    </div>	
                                                </li>
                                                <li class="more_options_item">
                                                    <div class="clearfix">
                                                        <input type="checkbox" id="more_options_2" class="search_extras_cb">
                                                        <label for="more_options_2">Car Parking</label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <button class="button search_button">search<span></span><span></span><span></span></button>
                                    </form>
                                </div>

                                <!-- Search Panel -->

                                <div class="search_panel">
                                    <form action="#" id="search_form_2" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                        <div class="search_item">
                                            <div>destination</div>
                                            <input type="text" class="destination search_input" required="required">
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
                                            <select name="adults" id="adults_2" class="dropdown_item_select search_input">
                                                <option>01</option>
                                                <option>02</option>
                                                <option>03</option>
                                            </select>
                                        </div>
                                        <div class="search_item">
                                            <div>children</div>
                                            <select name="children" id="children_2" class="dropdown_item_select search_input">
                                                <option>0</option>
                                                <option>02</option>
                                                <option>03</option>
                                            </select>
                                        </div>
                                        <button class="button search_button">search<span></span><span></span><span></span></button>
                                    </form>
                                </div>

                                <!-- Search Panel -->

                                <div class="search_panel">
                                    <form action="#" id="search_form_3" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                        <div class="search_item">
                                            <div>destination</div>
                                            <input type="text" class="destination search_input" required="required">
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
                                            <select name="adults" id="adults_3" class="dropdown_item_select search_input">
                                                <option>01</option>
                                                <option>02</option>
                                                <option>03</option>
                                            </select>
                                        </div>
                                        <div class="search_item">
                                            <div>children</div>
                                            <select name="children" id="children_3" class="dropdown_item_select search_input">
                                                <option>0</option>
                                                <option>02</option>
                                                <option>03</option>
                                            </select>
                                        </div>
                                        <button class="button search_button">search<span></span><span></span><span></span></button>
                                    </form>
                                </div>

                                <!-- Search Panel -->

                                <div class="search_panel">
                                    <form action="#" id="search_form_4" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                        <div class="search_item">
                                            <div>destination</div>
                                            <input type="text" class="destination search_input" required="required">
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
                                            <select name="adults" id="adults_4" class="dropdown_item_select search_input">
                                                <option>01</option>
                                                <option>02</option>
                                                <option>03</option>
                                            </select>
                                        </div>
                                        <div class="search_item">
                                            <div>children</div>
                                            <select name="children" id="children_4" class="dropdown_item_select search_input">
                                                <option>0</option>
                                                <option>02</option>
                                                <option>03</option>
                                            </select>
                                        </div>
                                        <button class="button search_button">search<span></span><span></span><span></span></button>
                                    </form>
                                </div>

                                <!-- Search Panel -->

                                <div class="search_panel">
                                    <form action="#" id="search_form_5" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                        <div class="search_item">
                                            <div>destination</div>
                                            <input type="text" class="destination search_input" required="required">
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
                                            <select name="adults" id="adults_5" class="dropdown_item_select search_input">
                                                <option>01</option>
                                                <option>02</option>
                                                <option>03</option>
                                            </select>
                                        </div>
                                        <div class="search_item">
                                            <div>children</div>
                                            <select name="children" id="children_5" class="dropdown_item_select search_input">
                                                <option>0</option>
                                                <option>02</option>
                                                <option>03</option>
                                            </select>
                                        </div>
                                        <button class="button search_button">search<span></span><span></span><span></span></button>
                                    </form>
                                </div>

                                <!-- Search Panel -->

                                <div class="search_panel">
                                    <form action="#" id="search_form_6" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                        <div class="search_item">
                                            <div>destination</div>
                                            <input type="text" class="destination search_input" required="required">
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
                                            <select name="adults" id="adults_6" class="dropdown_item_select search_input">
                                                <option>01</option>
                                                <option>02</option>
                                                <option>03</option>
                                            </select>
                                        </div>
                                        <div class="search_item">
                                            <div>children</div>
                                            <select name="children" id="children_6" class="dropdown_item_select search_input">
                                                <option>0</option>
                                                <option>02</option>
                                                <option>03</option>
                                            </select>
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
                                            <div class="hotel_map_link">See Location on Map</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Listing Image -->

                                <div class="hotel_image">
                                    <img src="${detail.imgMain}" alt="">
                                    <div class="hotel_review_container d-flex flex-column align-items-center justify-content-center">
                                        <div class="hotel_review">
                                            <div class="hotel_review_content">
                                                <div class="hotel_review_title">very good</div>
                                                <div class="hotel_review_subtitle">1 reviews</div>
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
                                            <div class="owl-item">
                                                <a class="colorbox cboxElement" href="${image.img1}">
                                                    <img  src="${image.img1}" alt="https://unsplash.com/@jbriscoe">
                                                </a>
                                            </div>

                                            <!-- Hotel Gallery Slider Item -->
                                            <div class="owl-item">
                                                <a class="colorbox cboxElement" href="${image.img2}">
                                                    <img  src="${image.img2}" alt="https://unsplash.com/@grovemade">
                                                </a>
                                            </div>

                                            <!-- Hotel Gallery Slider Item -->
                                            <div class="owl-item">
                                                <a class="colorbox cboxElement" href="${image.img3}">
                                                    <img  src="${image.img3}" alt="https://unsplash.com/@fransaraco">
                                                </a>
                                            </div>

                                            <!-- Hotel Gallery Slider Item -->
                                            <div class="owl-item">
                                                <a class="colorbox cboxElement" href="${image.img4}">
                                                    <img  src="${image.img4}" alt="https://unsplash.com/@workweek">
                                                </a>
                                            </div>

                                            <!-- Hotel Gallery Slider Item -->
                                            <div class="owl-item">
                                                <a class="colorbox cboxElement" href="${image.img1}">
                                                    <img  src="${image.img1}" alt="https://unsplash.com/@workweek">
                                                </a>
                                            </div>

                                            <!-- Hotel Gallery Slider Item -->
                                            <div class="owl-item">
                                                <a class="colorbox cboxElement" href="${image.img3}">
                                                    <img  src="${image.img3}" alt="https://unsplash.com/@avidenov">
                                                </a>
                                            </div>

                                            <!-- Hotel Gallery Slider Item -->
                                            <div class="owl-item">
                                                <a class="colorbox cboxElement" href="${image.img1}">
                                                    <img  src="${image.img1}" alt="https://unsplash.com/@pietruszka">
                                                </a>
                                            </div>

                                            <!-- Hotel Gallery Slider Item -->
                                            <div class="owl-item">
                                                <a class="colorbox cboxElement" href="${image.img2}">
                                                    <img src="${image.img2}" alt="https://unsplash.com/@rktkn">
                                                </a>
                                            </div>

                                            <!-- Hotel Gallery Slider Item -->
                                            <div class="owl-item">
                                                <a class="colorbox cboxElement" href="${image.img4}">
                                                    <img  src="${image.img4}" alt="https://unsplash.com/@mindaugas">
                                                </a>
                                            </div>
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
                                            <div class="room_image"><img src="${o.imgMain}" alt="https://unsplash.com/@grovemade"></div>
                                        </div>
                                        <div class="col-lg-7">
                                            <div class="room_content">
                                                <div class="room_title">${o.name}</div>
                                                <div class="room_price">${o.price}VND</div>
                                                <div class="room_text">Time: ${o.intendedTime}</div>
                                            
                                            </div>
                                        </div>
                                        <div class="col-lg-3 text-lg-right">
                                            <div class="room_button">
                                                <div class="button book_button trans_200"><a href="#">book<span></span><span></span><span></span></a></div>
                                                <div class="button book_button"><a href="detail?tid=${o.id}">Detail<span></span><span></span><span></span></a></div>

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
                                                    <div class="review_date">12 November 2017</div>
                                                </div>
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



        <footer class="footer">
            <div class="container">
                <div class="row">

                    <!-- Footer Column -->
                    <div class="col-lg-4 footer_column">
                        <div class="footer_col">
                            <div style="padding-top: 52px;" class="footer_content footer_about">
                                <div class="logo_container footer_logo">
                                    <div class="logo"><a style="font-family: serif;" href="index.jsp"><img style="margin: -185px 0px 0px -60px; width: 250px;" src="./assets/img/logo.png" alt=""></a></div>
                                </div>
                                <p class="footer_about_text">Khám phá vẻ đẹp lịch sử và văn hóa của Thủ đô Hà Nội với chúng tôi - HaNoi Tour. Chuyên tổ chức các hành trình du lịch độc đáo, chúng tôi mang đến trải nghiệm tuyệt vời với những điểm đến độc đáo, ẩm thực đặc sắc và hành trình đầy ý nghĩa. Hãy đồng hành cùng chúng tôi để khám phá những góc cảnh tuyệt vời nhất của Hà Nội - nơi mà câu chuyện lịch sử và văn hóa được tái hiện mỗi bước chân của bạn. Đặt ngay để bắt đầu hành trình khám phá!</p>
                            </div>
                        </div>
                    </div>

                    <!-- Footer Column -->
                    <div class="col-lg-3 footer_column">
                        <div class="footer_col">
                            <div class="footer_title">blog posts</div>
                            <div class="footer_content footer_blog">

                                <!-- Footer blog item -->
                                <div class="footer_blog_item clearfix">
                                    <div class="footer_blog_image"><img src="images/footer_blog_1.jpg" alt="https://unsplash.com/@avidenov"></div>
                                    <div class="footer_blog_content">
                                        <div class="footer_blog_title"><a href="blog.html">Travel with us this year</a></div>
                                        <div class="footer_blog_date">Nov 29, 2017</div>
                                    </div>
                                </div>

                                <!-- Footer blog item -->
                                <div class="footer_blog_item clearfix">
                                    <div class="footer_blog_image"><img src="images/footer_blog_2.jpg" alt="https://unsplash.com/@deannaritchie"></div>
                                    <div class="footer_blog_content">
                                        <div class="footer_blog_title"><a href="blog.html">New destinations for you</a></div>
                                        <div class="footer_blog_date">Nov 29, 2017</div>
                                    </div>
                                </div>

                                <!-- Footer blog item -->
                                <div class="footer_blog_item clearfix">
                                    <div class="footer_blog_image"><img src="images/footer_blog_3.jpg" alt="https://unsplash.com/@bergeryap87"></div>
                                    <div class="footer_blog_content">
                                        <div class="footer_blog_title"><a href="blog.html">Travel with us this year</a></div>
                                        <div class="footer_blog_date">Nov 29, 2017</div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Footer Column -->
                    <div class="col-lg-3 footer_column">
                        <div class="footer_col">
                            <div class="footer_title">tags</div>
                            <div class="footer_content footer_tags">
                                <ul class="tags_list clearfix">
                                    <li class="tag_item"><a href="#">design</a></li>
                                    <li class="tag_item"><a href="#">fashion</a></li>
                                    <li class="tag_item"><a href="#">music</a></li>
                                    <li class="tag_item"><a href="#">video</a></li>
                                    <li class="tag_item"><a href="#">party</a></li>
                                    <li class="tag_item"><a href="#">photography</a></li>
                                    <li class="tag_item"><a href="#">adventure</a></li>
                                    <li class="tag_item"><a href="#">travel</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Footer Column -->
                    <div class="col-lg-2 footer_column">
                        <div class="footer_col">
                            <div class="footer_title">contact info</div>
                            <div class="footer_content footer_contact">
                                <ul class="contact_info_list">
                                    <li class="contact_info_item d-flex flex-row">
                                        <div><div class="contact_info_icon"><img src="images/placeholder.svg" alt=""></div></div>
                                        <div class="contact_info_text">Khu Công Nghệ Cao Hòa Lạc, Km29 Đại lộ Thăng Long, Thạch Hoà, Thạch Thất, Hà Nội</div>
                                    </li>
                                    <li class="contact_info_item d-flex flex-row">
                                        <div><div class="contact_info_icon"><img src="images/phone-call.svg" alt=""></div></div>
                                        <div class="contact_info_text">0928 008 008</div>
                                    </li>
                                    <li class="contact_info_item d-flex flex-row">
                                        <div><div class="contact_info_icon"><img src="images/message.svg" alt=""></div></div>
                                        <div class="contact_info_text"><a href="mailto:contactme@gmail.com?Subject=Hello" target="_top">vntraveltouring@gmail.com</a></div>
                                    </li>
                                    <li class="contact_info_item d-flex flex-row">
                                        <div><div class="contact_info_icon"><img src="images/planet-earth.svg" alt=""></div></div>
                                        <div class="contact_info_text"><a href="https://gitlab.com/projectfirst2/projectteam3.git">https://gitlab.com/projectfirst2/projectteam3</a></div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </footer>

        <!-- Copyright -->

        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 order-lg-1 order-2  ">
                        <div class="copyright_content d-flex flex-row align-items-center">
                            <div><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This HaNoi Tour is on Gitlab <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://gitlab.com/projectfirst2/projectteam3" target="_blank">Team 3</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
                        </div>
                    </div>
                    <div class="col-lg-9 order-lg-2 order-1">
                        <div class="footer_nav_container d-flex flex-row align-items-center justify-content-lg-end">
                            <div class="footer_nav">
                                <ul class="footer_nav_list">
                                    <li class="footer_nav_item"><a href="index.jsp">home</a></li>
                                    <li class="footer_nav_item"><a href="aboutUs.jsp">about us</a></li>
                                    <li class="footer_nav_item"><a href="offers.html">offers</a></li>
                                    <li class="footer_nav_item"><a href="blog.html">news</a></li>
                                    <li class="footer_nav_item"><a href="contact.html">contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
