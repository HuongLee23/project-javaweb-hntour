<%-- 
    Document   : contact
    Created on : Jan 15, 2024, 12:08:20 AM
    Author     : Admin
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
        <link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
    </head>
    <body>
        <div class="super_container">

            <!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>


                <div class="home">
                    <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/contact_background.jpg"></div>
                    <div class="home_content">
                        <div class="home_title">contact</div>
                    </div>
                </div>

                <div class="contact_form_section">
                    <div class="container">
                        <div class="row">
                            <div class="col">

                                <div class="contact_form_container">
                                    <div class="contact_title">Nhận xét về Hà Nội Tour</div>
                                    <form action="sendfeedbackweb" method="post" id="contact_form" class="contact_form">
                                        <input type="text" id="contact_form_subject" class="contact_form_subject input_field" name="subject" placeholder="Chủ đề" required="required" data-error="Subject is required." maxlength="50">
                                        <textarea id="contact_form_message" class="text_field contact_form_message" name="message" rows="4" placeholder="Nội dung" required="required" data-error="Please, write us a message." maxlength="150"></textarea>
                                        <button type="submit" id="form_submit_button" class="form_submit_button button">Gửi ngay<span></span><span></span><span></span></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="about">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5">

                                <div class="about_image">
                                    <img src="images/man.png" alt>
                                </div>
                            </div>
                            <div class="col-lg-4">

                                <div class="about_content">
                                    <div class="logo_container about_logo">
                                        <div class="logo"><a href="#"><img style="
                                                                           position: absolute;
                                                                           width: 300px;
                                                                           top: -225px;
                                                                           left: -65px;" src="./assets/img/logo.png"></a>
                                        </div>
                                    </div>
                                    <p class="about_text">Khám phá vẻ đẹp lịch sử và văn hóa của Thủ đô Hà Nội với chúng tôi - HaNoi Tour. Chuyên tổ chức các hành trình du lịch độc đáo, chúng tôi mang đến trải nghiệm tuyệt vời với những điểm đến độc đáo, ẩm thực đặc sắc và hành trình đầy ý nghĩa. Hãy đồng hành cùng chúng tôi để khám phá những góc cảnh tuyệt vời nhất của Hà Nội - nơi mà câu chuyện lịch sử và văn hóa được tái hiện mỗi bước chân của bạn. Đặt ngay để bắt đầu hành trình khám phá!</p>
                                    <ul class="about_social_list">
                                        <li class="about_social_item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                        <li class="about_social_item"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                        <li class="about_social_item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li class="about_social_item"><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                        <li class="about_social_item"><a href="#"><i class="fa fa-behance"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3">

                                <div class="about_info">
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

                <div class="travelix_map">
                    <div id="google_map" class="google_map">
                        <div class="map_container">
                            <div id="map" style="width: 100%;">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d20288.23188568547!2d105.53574529598265!3d21.002022986083333!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zTmfGsCBz4bu1dCBI4buNYyBGUFQ!5e0!3m2!1svi!2s!4v1704881585816!5m2!1svi!2s" width="100%" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
            <jsp:include page="footer.jsp"></jsp:include>

        </div>
        <script>
            // Phần kiểm tra đầu vào phản hồi về web
            document.getElementById('contact_form_subject').addEventListener('input', function () {
                if (this.value.length > 50) {
                    this.value = this.value.slice(0, 50);
                }
            });

            document.getElementById('contact_form_message').addEventListener('input', function () {
                if (this.value.length > 150) {
                    this.value = this.value.slice(0, 150);
                }
            });
        </script>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>

        <script src="js/contact_custom.js"></script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"8457770dcdd35ff9","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}' crossorigin="anonymous"></script>
    </body>
</html>