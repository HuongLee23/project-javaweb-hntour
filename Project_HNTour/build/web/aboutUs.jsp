
<%-- 
    Document   : aboutUs
    Created on : Jan 14, 2024, 8:33:53 PM
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
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/about_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/about_responsive.css">
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
                                    <div class="intro_title">Khám Phá Hà Nội - Thủ Đô Nghìn Năm Văn Hiến</div>
                                    <p class="intro_text" style="text-align: justify;">Khám phá vẻ đẹp lịch sử và văn hóa của Thủ đô Hà Nội với chúng tôi - HaNoi Tour. Chuyên tổ chức các hành trình du lịch độc đáo, chúng tôi mang đến trải nghiệm tuyệt vời với những điểm đến độc đáo, ẩm thực đặc sắc và hành trình đầy ý nghĩa. Hãy đồng hành cùng chúng tôi để khám phá những góc cảnh tuyệt vời nhất của Hà Nội - nơi mà câu chuyện lịch sử và văn hóa được tái hiện mỗi bước chân của bạn. Đặt ngay để bắt đầu hành trình khám phá!</p>
                                    <div class="button intro_button"><div class="button_bcg"></div><a href="tourlist">khám phá ngay<span></span><span></span><span></span></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Stats -->

                <div class="stats">
                    <div class="container">
                        <div class="row">
                            <div class="col text-center">
                                <div class="section_title">Hà Nội Tour</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-10 offset-lg-1 text-center">
                                <p class="stats_text">Hà Nội Tour là trang web uy tín, mang trong mình một sứ mệnh đặc biệt.Truyền tải và giới thiệu với tất cả mọi người những chuyến di tích lịch sử ở Hà Nội. </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="stats_years">
                                    <div class="stats_years_last">2016</div>
                                    <div class="stats_years_new float-right">2017</div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="stats_contents">

                                    <!-- Stats Item -->
                                    <div class="stats_item d-flex flex-md-row flex-column clearfix">
                                        <div class="stats_last order-md-1 order-3">
                                            <div class="stats_last_icon d-flex flex-column align-items-center justify-content-end">
                                                <img src="images/stats_1.png" alt="">
                                            </div>
                                            <div class="stats_last_content">
                                                <div class="stats_number">1642</div>
                                                <div class="stats_type">Clients</div>
                                            </div>
                                        </div>
                                        <div class="stats_bar order-md-2 order-2" data-x="1642" data-y="3527" data-color="#31124b">
                                            <div class="stats_bar_perc">
                                                <div>
                                                    <div class="stats_bar_value"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="stats_new order-md-3 order-1 text-right">
                                            <div class="stats_new_icon d-flex flex-column align-items-center justify-content-end">
                                                <img src="images/stats_1.png" alt="">
                                            </div>
                                            <div class="stats_new_content">
                                                <div class="stats_number">3527</div>
                                                <div class="stats_type">Clients</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Stats Item -->
                                    <div class="stats_item d-flex flex-md-row flex-column clearfix">
                                        <div class="stats_last order-md-1 order-3">
                                            <div class="stats_last_icon d-flex flex-column align-items-center justify-content-end">
                                                <img src="images/stats_2.png" alt="">
                                            </div>
                                            <div class="stats_last_content">
                                                <div class="stats_number">768</div>
                                                <div class="stats_type">Returning Clients</div>
                                            </div>
                                        </div>
                                        <div class="stats_bar order-md-2 order-2" data-x="768" data-y="145" data-color="#a95ce4">
                                            <div class="stats_bar_perc">
                                                <div>
                                                    <div class="stats_bar_value"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="stats_new order-md-3 order-1 text-right">
                                            <div class="stats_new_icon d-flex flex-column align-items-center justify-content-end">
                                                <img src="images/stats_2.png" alt="">
                                            </div>
                                            <div class="stats_new_content">
                                                <div class="stats_number">145</div>
                                                <div class="stats_type">Returning Clients</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Stats Item -->
                                    <div class="stats_item d-flex flex-md-row flex-column clearfix">
                                        <div class="stats_last order-md-1 order-3">
                                            <div class="stats_last_icon d-flex flex-column align-items-center justify-content-end">
                                                <img src="images/stats_3.png" alt="">
                                            </div>
                                            <div class="stats_last_content">
                                                <div class="stats_number">11546</div>
                                                <div class="stats_type">Reach</div>
                                            </div>
                                        </div>
                                        <div class="stats_bar order-md-2 order-2" data-x="11546" data-y="9321" data-color="#fa6f1b">
                                            <div class="stats_bar_perc">
                                                <div>
                                                    <div class="stats_bar_value"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="stats_new order-md-3 order-1 text-right">
                                            <div class="stats_new_icon d-flex flex-column align-items-center justify-content-end">
                                                <img src="images/stats_3.png" alt="">
                                            </div>
                                            <div class="stats_new_content">
                                                <div class="stats_number">9321</div>
                                                <div class="stats_type">Reach</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Stats Item -->
                                    <div class="stats_item d-flex flex-md-row flex-column clearfix">
                                        <div class="stats_last order-md-1 order-3">
                                            <div class="stats_last_icon d-flex flex-column align-items-center justify-content-end">
                                                <img src="images/stats_4.png" alt="">
                                            </div>
                                            <div class="stats_last_content">
                                                <div class="stats_number">3729</div>
                                                <div class="stats_type">Items</div>
                                            </div>
                                        </div>
                                        <div class="stats_bar order-md-2 order-2" data-x="3729" data-y="17429" data-color="#fa9e1b">
                                            <div class="stats_bar_perc">
                                                <div>
                                                    <div class="stats_bar_value"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="stats_new order-md-3 order-1 text-right">
                                            <div class="stats_new_icon d-flex flex-column align-items-center justify-content-end">
                                                <img src="images/stats_4.png" alt="">
                                            </div>
                                            <div class="stats_new_content">
                                                <div class="stats_number">17429</div>
                                                <div class="stats_type">More Items</div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Add -->

                <!--<<<<<<< HEAD
                                <div class="add">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <div class="add_container">
                                                    <div class="add_background" style="background-image:url(images/add.jpg)"></div>
                                                    <div class="add_content">
                                                        <div class="button add_button"><div class="button_bcg"></div><a href="#">explore now<span></span><span></span><span></span></a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                =======
                >>>>>>> Namcthe171385-->

                <!-- Milestones -->

                <div class="milestones">
                    <div class="container">
                        <div class="row">

                            <!-- Milestone -->
                            <div class="col-lg-3 milestone_col">
                                <div class="milestone text-center">
                                    <div class="milestone_icon"><img src="images/milestone_1.png" alt=""></div>
                                    <div class="milestone_counter" data-end-value="255">0</div>
                                    <div class="milestone_text">Clients</div>
                                </div>
                            </div>

                            <!-- Milestone -->
                            <div class="col-lg-3 milestone_col">
                                <div class="milestone text-center">
                                    <div class="milestone_icon"><img src="images/milestone_2.png" alt=""></div>
                                    <div class="milestone_counter" data-end-value="1176">0</div>
                                    <div class="milestone_text">Projects</div>
                                </div>
                            </div>

                            <!-- Milestone -->
                            <div class="col-lg-3 milestone_col">
                                <div class="milestone text-center">
                                    <div class="milestone_icon"><img src="images/milestone_3.png" alt=""></div>
                                    <div class="milestone_counter" data-end-value="39">0</div>
                                    <div class="milestone_text"></div>
                                </div>
                            </div>

                            <!-- Milestone -->
                            <div class="col-lg-3 milestone_col">
                                <div class="milestone text-center">
                                    <div class="milestone_icon"><img src="images/milestone_4.png" alt=""></div>
                                    <div class="milestone_counter" data-end-value="127">0</div>
                                    <div class="milestone_text">Coffees</div>
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

    </body>

</html>

