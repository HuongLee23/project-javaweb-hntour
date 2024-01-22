<%-- 
    Document   : index
    Created on : Jan 6, 2024, 8:39:21 PM
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
        <meta name="description" content="Travelix Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/main.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <script src="https://kit.fontawesome.com/2ab805f98d.js" crossorigin="anonymous"></script>
    </head>

    <body>

        <div class="super_container">

            <!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>


                <div class="menu trans_500">
                    <div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
                        <div class="menu_close_container"><div class="menu_close"></div></div>
                        <div class="logo menu_logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
                        <ul>
                            <li class="menu_item"><a href="home.jsp">home</a></li>
                            <li class="menu_item"><a href="about.html">about us</a></li>
                            <li class="menu_item"><a href="tour.jsp">Tour</a></li>
                            <li class="menu_item"><a href="blog.html">news</a></li>
                            <li class="menu_item"><a href="contact.html">contact</a></li>
                        </ul>
                    </div>
                </div>

                <!-- Home -->

                <div class="home">

                    <!-- Home Slider -->

                    <div class="home_slider_container">

                        <div class="owl-carousel owl-theme home_slider">
                            <!-- Slider Item -->
                            <div class="owl-item home_slider_item">
                                <!-- Image by https://unsplash.com/@anikindimitry -->
                                <div class="home_slider_background" style="background-image:url(./assets/img/homePage1.png)" onclick="changeImages()"></div>

                                <div class="home_slider_content text-center">
                                    <div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
                                        <h1></h1>
                                        <h1>Khám Phá <br>Hà Nội</h1>
                                        <div class="button home_slider_button"><div class="button_bcg"></div><a href="#">explore now<span></span><span></span><span></span></a></div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Home Slider Nav - Prev -->
                        <div class="home_slider_nav home_slider_prev">
                            <svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                 width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                            <defs>
                            <linearGradient id='home_grad_prev'>
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

                        <!-- Home Slider Nav - Next -->
                        <div class="home_slider_nav home_slider_next">
                            <svg version="1.1" id="Layer_3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                 width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                            <defs>
                            <linearGradient id='home_grad_next'>
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

                <!-- Search -->

                <div class="search">


                    <!-- Search Contents -->

                    <div class="container fill_height">
                        <div class="row fill_height">
                            <div class="col fill_height">

                                <!-- Search Tabs -->

                                <div class="search_tabs_container">
                                    <div class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                    <c:forEach items="${listCategory}" var="c">
                                        <div class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start">
                                            <c:if test="${c.id == 1}"><div class="icon-history"><i style="font-size: x-large; position: absolute; top: -14px;font-weight: 900; left: -40px;" class="fa-solid fa-landmark"></i></div></c:if>
                                            <c:if test="${c.id == 2}"><div class="icon-culture"><i style="font-size: x-large; position: absolute; top: -14px;font-weight: 900; left: -40px;" class="fa-solid fa-flag"></i></div></c:if>
                                            <c:if test="${c.id == 3}"><div class="icon-food"><i style="font-size: x-large; position: absolute; top: -14px;font-weight: 900; left: -40px;" class="fa-solid fa-utensils"></i></div></c:if>
                                            <c:if test="${c.id == 4}"><div class="icon-vacation"><i style="font-size: x-large; position: absolute; top: -14px;font-weight: 900; left: -40px;" class="fa-solid fa-tower-observation"></i></div></c:if>
                                            <span>${c.getName()}</span>
                                        </div>
                                    </c:forEach>
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
                        </div>
                    </div>
                </div>		
            </div>

            <!-- Intro -->

            <div class="intro">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <h2 class="intro_title text-center">We have the best tours</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="intro_text text-center">
                                <p>Khám phá Hà Nội với những chuyến đi được đánh giá cao nhất, chúng tôi tự hào mang đến cho bạn những trải nghiệm du lịch tuyệt vời nhất trong thành phố nghìn năm tuổi này. Các tour của chúng tôi không chỉ là hành trình thông thường, mà là những cuộc phiêu lưu độc đáo, được khách hàng đánh giá cao về chất lượng và đa dạng.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row intro_items">

                        <!-- Intro Item -->
                        <c:forEach items="${listTop3Tour}" var="c">
                            <div class="col-lg-4 intro_col">
                                <div class="intro_item">
                                    <div class="intro_item_overlay"></div>
                                    <div class="intro_item_background" style="background-image:url(${c.getImgMain()})"></div>
                                    <div class="intro_item_content d-flex flex-column align-items-center justify-content-center">
                                        <div class="button intro_button"><div class="button_bcg"></div><a href="tourdetail.jsp">see more<span></span><span></span><span></span></a></div>
                                        <div class="intro_center text-center">
                                            <h2 style="color: white">${c.name}</h2>
                                            <div class="intro_price" style="font-size: 25px "><fmt:formatNumber value="${c.price}" pattern="###,###"/>VNÐ</div>
                                            <div class="rating rating_4 ">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>

            <!-- CTA -->

            <div class="cta">
                <div class="cta_background" style="background-image:url(images/cta.jpg)"></div>

                <div class="container">
                    <div class="row">
                        <div class="col">

                            <!-- CTA Slider -->

                            <div class="cta_slider_container">
                                <div class="owl-carousel owl-theme cta_slider">

                                    <!-- CTA Slider Item -->
                                    <div class="owl-item cta_item text-center">
                                        <div class="cta_title">The proposal</div>
                                        <!--                                            <div class="rating_r rating_r_4">
                                                                                        <i></i>
                                                                                        <i></i>
                                                                                        <i></i>
                                                                                        <i></i>
                                                                                        <i></i>
                                                                                    </div>-->
                                        <p class="cta_text">Chào mừng bạn đến với Hà Nội Tour - nơi tận hưởng hành trình khám phá văn hóa và lịch sử tuyệt vời. Hà Nội, thành phố lâu dài và truyền thống, đang chờ đón bạn với những con phố phấn khích, những di tích lịch sử độc đáo và ẩm thực ngon lành. Hãy cùng chúng tôi bắt đầu cuộc phiêu lưu, nơi mỗi góc phố là một câu chuyện, và mỗi bữa ăn là một trải nghiệm đậm chất Việt. Đặt vali và hãy để chúng tôi làm hướng dẫn cho chuyến hành trình đáng nhớ của bạn tại Hà Nội!</p>
                                        <div class="button cta_button"><div class="button_bcg"></div><a href="#">book now<span></span><span></span><span></span></a></div>
                                    </div>

                                    <!-- CTA Slider Item -->
                                    <div class="owl-item cta_item text-center">
                                        <div class="cta_title">maldives deluxe package</div>
                                        <div class="rating_r rating_r_4">
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                        </div>
                                        <p class="cta_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec. Proin bibendum, augue faucibus tincidunt ultrices, tortor augue gravida lectus, et efficitur enim justo vel ligula.</p>
                                        <div class="button cta_button"><div class="button_bcg"></div><a href="#">book now<span></span><span></span><span></span></a></div>
                                    </div>

                                    <!-- CTA Slider Item -->
                                    <div class="owl-item cta_item text-center">
                                        <div class="cta_title">maldives deluxe package</div>
                                        <div class="rating_r rating_r_4">
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                        </div>
                                        <p class="cta_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec. Proin bibendum, augue faucibus tincidunt ultrices, tortor augue gravida lectus, et efficitur enim justo vel ligula.</p>
                                        <div class="button cta_button"><div class="button_bcg"></div><a href="#">book now<span></span><span></span><span></span></a></div>
                                    </div>

                                </div>

                                <!-- CTA Slider Nav - Prev -->
                                <div class="cta_slider_nav cta_slider_prev">
                                    <svg version="1.1" id="Layer_4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                    <defs>
                                    <linearGradient id='cta_grad_prev'>
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

                                <!-- CTA Slider Nav - Next -->
                                <div class="cta_slider_nav cta_slider_next">
                                    <svg version="1.1" id="Layer_5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                    <defs>
                                    <linearGradient id='cta_grad_next'>
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
                    </div>
                </div>

            </div>

            <!-- Offers -->

            <div class="offers">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <h2 class="section_title">The newest tours</h2>
                        </div>
                    </div>
                    <div class="row offers_items">
                        <c:forEach items="${listNew4Tour}" var="c">

                            <!-- Offers Item -->
                            <div class="col-lg-6 offers_col">
                                <div class="offers_item">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="offers_image_container">
                                                <div class="offers_image_background" style="background-image:url(${c.getImgMain()})"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="offers_content">
                                                <div class="offers_price">${c.name}</div>
                                                <div class="rating_r rating_r_4 offers_rating">
                                                    <i></i>
                                                    <i></i>
                                                    <i></i>
                                                    <i></i>
                                                    <i></i>
                                                </div>
                                                <p class="offers_text" style="color: #ff6600"><fmt:formatNumber value="${c.price}" pattern="###,###"/>VNÐ</p>
                                                <div class="offers_icons">
                                                    <ul class="offers_icons_list">
                                                        <li class="offers_icons_item"><img src="images/post.png" alt=""></li>
                                                        <li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
                                                    </ul>
                                                </div>
                                                <div class="offers_link"><a href="offers.html">read more</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- Testimonials -->

            <div class="testimonials">
                <div class="test_border"></div>
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <h2 class="section_title">what our clients say about us</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">

                            <!-- Testimonials Slider -->

                            <div class="test_slider_container">
                                <div class="owl-carousel owl-theme test_slider">
                                    <%--<c:forEach items="listFeedbackTour" var="c">--%>
                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="${c.image}" alt="https://unsplash.com/@anniegray"></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">May 24, 2017</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best holliday ever "</div>
                                                    <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--</c:forEach>--%>


                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_2.jpg" alt="https://unsplash.com/@tschax"></div>
                                            <div class="test_icon"><img src="images/island_t.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">May 24, 2017</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best holliday ever "</div>
                                                    <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_3.jpg" alt="https://unsplash.com/@seefromthesky"></div>
                                            <div class="test_icon"><img src="images/kayak.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">May 24, 2017</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best holliday ever "</div>
                                                    <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_2.jpg" alt=""></div>
                                            <div class="test_icon"><img src="images/island_t.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">May 24, 2017</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best holliday ever "</div>
                                                    <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_1.jpg" alt=""></div>
                                            <div class="test_icon"><img src="images/backpack.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">May 24, 2017</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best holliday ever "</div>
                                                    <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_3.jpg" alt=""></div>
                                            <div class="test_icon"><img src="images/kayak.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">May 24, 2017</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best holliday ever "</div>
                                                    <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- Testimonials Slider Nav - Prev -->
                                <div class="test_slider_nav test_slider_prev">
                                    <svg version="1.1" id="Layer_6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                    <defs>
                                    <linearGradient id='test_grad_prev'>
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

                                <!-- Testimonials Slider Nav - Next -->
                                <div class="test_slider_nav test_slider_next">
                                    <svg version="1.1" id="Layer_7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                    <defs>
                                    <linearGradient id='test_grad_next'>
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
                    </div>

                </div>
            </div>

            <div class="trending">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <h2 class="section_title">trending now</h2>
                        </div>
                    </div>
                    <div class="row trending_container">
                        <%--<c:forEach items="listTrendTour" var="c">--%>
                            <!-- Trending Item -->
                            <div class="col-lg-3 col-sm-6">
                                <div class="trending_item clearfix">
                                    <div class="trending_image"><img src="images/trend_1.png" alt="https://unsplash.com/@fransaraco"></div>
                                    <div class="trending_content">
                                        <div class="trending_title"><a href="#">${c.getName()}</a></div>
                                        <div class="trending_price">From $182</div>
                                        <div class="trending_location">madrid, spain</div>
                                    </div>
                                </div>
                            </div>
                        <%--</c:forEach>--%>

                        <!--                         Trending Item 
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="trending_item clearfix">
                                                        <div class="trending_image"><img src="images/trend_2.png" alt="https://unsplash.com/@grovemade"></div>
                                                        <div class="trending_content">
                                                            <div class="trending_title"><a href="#">mars hotel</a></div>
                                                            <div class="trending_price">From $182</div>
                                                            <div class="trending_location">madrid, spain</div>
                                                        </div>
                                                    </div>
                                                </div>
                        
                                                 Trending Item 
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="trending_item clearfix">
                                                        <div class="trending_image"><img src="images/trend_3.png" alt="https://unsplash.com/@jbriscoe"></div>
                                                        <div class="trending_content">
                                                            <div class="trending_title"><a href="#">queen hotel</a></div>
                                                            <div class="trending_price">From $182</div>
                                                            <div class="trending_location">madrid, spain</div>
                                                        </div>
                                                    </div>
                                                </div>
                        
                                                 Trending Item 
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="trending_item clearfix">
                                                        <div class="trending_image"><img src="images/trend_4.png" alt="https://unsplash.com/@oowgnuj"></div>
                                                        <div class="trending_content">
                                                            <div class="trending_title"><a href="#">mars hotel</a></div>
                                                            <div class="trending_price">From $182</div>
                                                            <div class="trending_location">madrid, spain</div>
                                                        </div>
                                                    </div>
                                                </div>
                        
                                                 Trending Item 
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="trending_item clearfix">
                                                        <div class="trending_image"><img src="images/trend_5.png" alt="https://unsplash.com/@mindaugas"></div>
                                                        <div class="trending_content">
                                                            <div class="trending_title"><a href="#">grand hotel</a></div>
                                                            <div class="trending_price">From $182</div>
                                                            <div class="trending_location">madrid, spain</div>
                                                        </div>
                                                    </div>
                                                </div>
                        
                                                 Trending Item 
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="trending_item clearfix">
                                                        <div class="trending_image"><img src="images/trend_6.png" alt="https://unsplash.com/@itsnwa"></div>
                                                        <div class="trending_content">
                                                            <div class="trending_title"><a href="#">mars hotel</a></div>
                                                            <div class="trending_price">From $182</div>
                                                            <div class="trending_location">madrid, spain</div>
                                                        </div>
                                                    </div>
                                                </div>
                        
                                                 Trending Item 
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="trending_item clearfix">
                                                        <div class="trending_image"><img src="images/trend_7.png" alt="https://unsplash.com/@rktkn"></div>
                                                        <div class="trending_content">
                                                            <div class="trending_title"><a href="#">queen hotel</a></div>
                                                            <div class="trending_price">From $182</div>
                                                            <div class="trending_location">madrid, spain</div>
                                                        </div>
                                                    </div>
                                                </div>
                        
                                                 Trending Item 
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="trending_item clearfix">
                                                        <div class="trending_image"><img src="images/trend_8.png" alt="https://unsplash.com/@thoughtcatalog"></div>
                                                        <div class="trending_content">
                                                            <div class="trending_title"><a href="#">mars hotel</a></div>
                                                            <div class="trending_price">From $182</div>
                                                            <div class="trending_location">madrid, spain</div>
                                                        </div>
                                                    </div>
                                                </div>-->

                    </div>
                </div>
            </div>

            <div class="contact">
                <div class="contact_background" style="background-image:url(images/contact.png);top: -50px;"></div>

                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="contact_image">

                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="contact_form_container">
                                <div class="contact_title">get in touch</div>
                                <form action="#" id="contact_form" class="contact_form">
                                    <input type="text" id="contact_form_name" class="contact_form_name input_field" placeholder="Name" required="required" data-error="Name is required.">
                                    <input type="text" id="contact_form_email" class="contact_form_email input_field" placeholder="E-mail" required="required" data-error="Email is required.">
                                    <input type="text" id="contact_form_subject" class="contact_form_subject input_field" placeholder="Subject" required="required" data-error="Subject is required.">
                                    <textarea id="contact_form_message" class="text_field contact_form_message" name="message" rows="4" placeholder="Message" required="required" data-error="Please, write us a message."></textarea>
                                    <button type="submit" id="form_submit_button" class="form_submit_button button">send message<span></span><span></span><span></span></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <jsp:include page="footer.jsp"></jsp:include>
        </div>

        <script>
//            ----- Tự động chuyển ảnh với thao tác để chuyển ảnh ở homePage -----
            var sliderBackground = document.querySelector('.home_slider_background');
            var imageUrls = [
                './assets/img/homePage1.png',
                './assets/img/homePage2.png',
                './assets/img/homePage3.png'
            ];
            var currentImageIndex = 0;
            var autoSlideInterval;
            var autoSlideEnabled = true;

            function changeImage() {
                currentImageIndex = (currentImageIndex + 1) % imageUrls.length;
                sliderBackground.style.backgroundImage = 'url(' + imageUrls[currentImageIndex] + ')';
            }

            function startAutoSlide() {
                autoSlideInterval = setInterval(changeImage, 4000);
            }

            function stopAutoSlide() {
                clearInterval(autoSlideInterval);
            }

            // Bắt sự kiện khi người dùng nhấn nút "Next"
            document.querySelector('.home_slider_next').addEventListener('click', function () {
                stopAutoSlide();
                changeImage();
                startAutoSlide();
            });

            // Bắt sự kiện khi người dùng nhấn nút "Prev"
            document.querySelector('.home_slider_prev').addEventListener('click', function () {
                stopAutoSlide();
                currentImageIndex = (currentImageIndex - 1 + imageUrls.length) % imageUrls.length; // Chuyển về hình trước đó
                sliderBackground.style.backgroundImage = 'url(' + imageUrls[currentImageIndex] + ')';
                startAutoSlide();
            });
            startAutoSlide();
//            -----------------------------------------------------------------------


        </script>


        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/custom.js"></script>

    </body>

</html>