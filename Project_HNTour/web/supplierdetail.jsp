<%-- 
    Document   : aboutUs
    Created on : Jan 14, 2024, 8:33:53 PM
    Author     : hello
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hà Nội Tour</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Ha Noi Tour">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/about_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/about_responsive.css">
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">

        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/main.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <script src="https://kit.fontawesome.com/2ab805f98d.js" crossorigin="anonymous"></script>

    </head>

    <body>

        <div class="super_container">

            <!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>


                <!-- Home -->

                <div class="home">
                    <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/about_background.jpg"></div>
                    <div class="home_content">
                        <div class="home_title">about us</div>
                    </div>
                </div>

                <!-- Intro -->

                <div class="intro">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="intro_image">
                                    <img style=" height: 460px;
                                         width: 725px;margin-right: 55px;" src="https://statics.vinwonders.com/du-lich-ha-noi-4-ngay-3-dem-1_1681407076.jpg" alt=""></div>
                            </div>
                            <div class="col-lg-5">
                                <div class="intro_content">
                                    <div class="intro_title">Khám Phá Hà Nội - Thủ Đô Nghìn Năm Văn Hiến- Cùng ${sup.nameCompany}</div>
                                <p class="intro_text" style="text-align: justify;">Khám phá vẻ đẹp lịch sử và văn hóa của Thủ đô Hà Nội với chúng tôi - HaNoi Tour. Chuyên tổ chức các hành trình du lịch độc đáo, chúng tôi mang đến trải nghiệm tuyệt vời với những điểm đến độc đáo, ẩm thực đặc sắc và hành trình đầy ý nghĩa. Hãy đồng hành cùng chúng tôi để khám phá những góc cảnh tuyệt vời nhất của Hà Nội - nơi mà câu chuyện lịch sử và văn hóa được tái hiện mỗi bước chân của bạn. Đặt ngay để bắt đầu hành trình khám phá!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Stats -->



            <!-- Add -->
            <div class="offers">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <h2 class="section_title">Các tour du lịch</h2>
                        </div>
                    </div>
                    <div class="row offers_items">
                        <c:forEach items="${tour}" var="c">

                            <!-- Offers Item -->
                            <div class="col-lg-6 offers_col">
                                <div class="offers_item">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="offers_image_container">
                                                <div class="offers_image_background" style="background-image:url(${c.imageMain})"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="offers_content">
                                                <div class="offers_price">${c.name}</div>
                                                <div class="rating_r rating_r_4 offers_rating">

                                                </div>

                                                <p class="offers_text" style="color: #ff6600"><fmt:formatNumber value="${c.price}" pattern="###,###"/>VNÐ</p>
                                                <div class="offers_icons">
                                                    <ul class="offers_icons_list">
                                                        <li class="offers_icons_item"><img src="images/post.png" alt=""></li>
                                                        <li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
                                                    </ul>
                                                </div>
                                                <div class="offers_link"><a href="detail?tid=${c.id}">xem chi tiết</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="testimonials">
                <div class="test_border"></div>
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <h2 class="section_title">Những feedback của những khách hàng dành cho chúng tôi</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" style="margin-top: -200px;">

                            <!-- Testimonials Slider -->

                            <div class="test_slider_container">
                                <div class="owl-carousel owl-theme test_slider">

                                    <!-- Testimonial Item -->
                                    <c:forEach items="${requestScope.feedback}"
                                               var="b">
                                        <div class="owl-item">
                                            <div class="test_item" style="height: 550px;">


                                                <div class="test_content_container">
                                                    <div class="test_content">
                                                        <div class="test_item_info">
                                                            <div class="test_name">${b.accName}</div>
                                                            <div class="test_">${b.rating}</div>
                                                        </div>
                                                        <div class="test_quote_title">${b.nameTour}</div>
                                                        <p class="test_quote_text">${b.comment}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- Testimonial Item -->




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
            <!-- Milestones -->

            <div class="milestones">
                <div class="container">
                    <div class="row">

                        <!-- Milestone -->
                        <div class="col-lg-3 milestone_col">
                            <div class="milestone text-center">
                                <div class="milestone_icon"><img src="images/milestone_1.png" alt=""></div>
                                <div class="milestone_counter" data-end-value="${requestScope.countTour}">0</div>
                                <div class="milestone_text">Số Tours</div>
                            </div>
                        </div>

                        <!-- Milestone -->
                        <div class="col-lg-3 milestone_col">
                            <div class="milestone text-center">
                                <div class="milestone_icon"><img src="images/milestone_2.png" alt=""></div>
                                <div class="milestone_counter" data-end-value="${countFeedback}">0</div>
                                <div class="milestone_text">Số lượng đánh giá</div>
                            </div>
                        </div>

                        <!-- Milestone -->
                        <div class="col-lg-3 milestone_col">
                            <div class="milestone text-center">
                                <div class="milestone_icon"><img src="images/milestone_3.png" alt=""></div>
                                <div class="milestone_counter" data-end-value="${countBlog}">0</div>
                                <div class="milestone_text">Số bài viết </div>
                            </div>
                        </div>

                        <!-- Milestone -->
                        <div class="col-lg-3 milestone_col">
                            <div class="milestone text-center">
                                <div class="milestone_icon"><img src="images/milestone_4.png" alt=""></div>
                                <div class="milestone_counter" data-end-value="${countOrder}">0</div>
                                <div class="milestone_text">Lượt mua</div>
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

    </body>

</html>
