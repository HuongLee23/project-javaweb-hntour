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
                                    <div class="contact_title text-center">get in touch</div>
                                    <form action="#" id="contact_form" class="contact_form text-center">
                                        <input type="text" id="contact_form_name" class="contact_form_name input_field" placeholder="Name" required="required" data-error="Name is required.">
                                        <input type="text" id="contact_form_email" class="contact_form_email input_field" placeholder="E-mail" required="required" data-error="Email is required.">
                                        <input type="text" id="contact_form_subject" class="contact_form_subject input_field" placeholder="Subject" required="required" data-error="Subject is required.">
                                        <textarea id="contact_form_message" class="text_field contact_form_message" name="message" rows="4" placeholder="Message" required="required" data-error="Please, write us a message."></textarea>
                                        <button type="submit" id="form_submit_button" class="form_submit_button button trans_200">send message<span></span><span></span><span></span></button>
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
                                        <div class="logo"><a href="#"><img src="images/logo.png" alt>travelix</a></div>
                                    </div>
                                    <p class="about_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis vu lputate eros, iaculis consequat nisl. Nunc et suscipit urna. Integer eleme ntum orci eu vehicula iaculis consequat nisl. Nunc et suscipit urna pretium.</p>
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
                                            <div><div class="contact_info_icon"><img src="images/placeholder.svg" alt></div></div>
                                            <div class="contact_info_text">4127 Raoul Wallenber 45b-c Gibraltar</div>
                                        </li>
                                        <li class="contact_info_item d-flex flex-row">
                                            <div><div class="contact_info_icon"><img src="images/phone-call.svg" alt></div></div>
                                            <div class="contact_info_text">2556-808-8613</div>
                                        </li>
                                        <li class="contact_info_item d-flex flex-row">
                                            <div><div class="contact_info_icon"><img src="images/message.svg" alt></div></div>
                                            <div class="contact_info_text"><a href="/cdn-cgi/l/email-protection#e98a86879d888a9d848ca98e84888085c78a8684d6ba9c8b838c8a9dd4a18c858586" target="_top"><span class="__cf_email__" data-cfemail="e98a86879d888a9d848ca98e84888085c78a8684">[email&#160;protected]</span></a></div>
                                        </li>
                                        <li class="contact_info_item d-flex flex-row">
                                            <div><div class="contact_info_icon"><img src="images/planet-earth.svg" alt></div></div>
                                            <div class="contact_info_text"><a href="https://colorlib.com">www.colorlib.com</a></div>
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

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>

        <script src="js/contact_custom.js"></script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"8457770dcdd35ff9","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}' crossorigin="anonymous"></script>
    </body>
</html>
