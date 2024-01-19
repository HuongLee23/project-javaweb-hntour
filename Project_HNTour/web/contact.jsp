<%-- 
    Document   : contact
    Created on : Jan 15, 2024, 12:08:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Contact</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
</head>
<body>
<div class="super_container">

<header class="header">

<div class="top_bar">
<div class="container">
<div class="row">
<div class="col d-flex flex-row">
<div class="phone">+45 345 3324 56789</div>
<div class="social">
<ul class="social_list">
<li class="social_list_item"><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
<li class="social_list_item"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
<li class="social_list_item"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
<li class="social_list_item"><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
<li class="social_list_item"><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
<li class="social_list_item"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
</ul>
</div>
<div class="user_box ml-auto">
<div class="user_box_login user_box_link"><a href="#">login</a></div>
<div class="user_box_register user_box_link"><a href="#">register</a></div>
</div>
</div>
</div>
</div>
</div>

<nav class="main_nav">
<div class="container">
<div class="row">
<div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
<div class="logo_container">
<div class="logo"><a href="#"><img src="images/logo.png" alt>travelix</a></div>
</div>
<div class="main_nav_container ml-auto">
<ul class="main_nav_list">
<li class="main_nav_item"><a href="index.html">home</a></li>
<li class="main_nav_item"><a href="about.html">about us</a></li>
<li class="main_nav_item"><a href="offers.html">offers</a></li>
<li class="main_nav_item"><a href="blog.html">news</a></li>
<li class="main_nav_item"><a href="#">contact</a></li>
</ul>
</div>
<div class="content_search ml-lg-0 ml-auto">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="17px" height="17px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
<g>
<g>
<g>
<path class="mag_glass" fill="#FFFFFF" d="M78.438,216.78c0,57.906,22.55,112.343,63.493,153.287c40.945,40.944,95.383,63.494,153.287,63.494
											s112.344-22.55,153.287-63.494C489.451,329.123,512,274.686,512,216.78c0-57.904-22.549-112.342-63.494-153.286
											C407.563,22.549,353.124,0,295.219,0c-57.904,0-112.342,22.549-153.287,63.494C100.988,104.438,78.439,158.876,78.438,216.78z
											M119.804,216.78c0-96.725,78.69-175.416,175.415-175.416s175.418,78.691,175.418,175.416
											c0,96.725-78.691,175.416-175.416,175.416C198.495,392.195,119.804,313.505,119.804,216.78z" />
</g>
</g>
<g>
<g>
<path class="mag_glass" fill="#FFFFFF" d="M6.057,505.942c4.038,4.039,9.332,6.058,14.625,6.058s10.587-2.019,14.625-6.058L171.268,369.98
											c8.076-8.076,8.076-21.172,0-29.248c-8.076-8.078-21.172-8.078-29.249,0L6.057,476.693
											C-2.019,484.77-2.019,497.865,6.057,505.942z" />
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
<div class="logo menu_logo"><a href="#"><img src="images/logo.png" alt></a></div>
<ul>
<li class="menu_item"><a href="index.html">home</a></li>
<li class="menu_item"><a href="about.html">about us</a></li>
<li class="menu_item"><a href="offers.html">offers</a></li>
<li class="menu_item"><a href="blog.html">news</a></li>
<li class="menu_item"><a href="#">contact</a></li>
</ul>
</div>
</div>

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

<footer class="footer">
<div class="container">
<div class="row">

<div class="col-lg-3 footer_column">
<div class="footer_col">
<div class="footer_content footer_about">
<div class="logo_container footer_logo">
<div class="logo"><a href="#"><img src="images/logo.png" alt>travelix</a></div>
</div>
<p class="footer_about_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis vu lputate eros, iaculis consequat nisl. Nunc et suscipit urna. Integer eleme ntum orci eu vehicula pretium.</p>
<ul class="footer_social_list">
<li class="footer_social_item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
<li class="footer_social_item"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
<li class="footer_social_item"><a href="#"><i class="fa fa-twitter"></i></a></li>
<li class="footer_social_item"><a href="#"><i class="fa fa-dribbble"></i></a></li>
<li class="footer_social_item"><a href="#"><i class="fa fa-behance"></i></a></li>
</ul>
</div>
</div>
</div>

<div class="col-lg-3 footer_column">
<div class="footer_col">
<div class="footer_title">blog posts</div>
<div class="footer_content footer_blog">

<div class="footer_blog_item clearfix">
<div class="footer_blog_image"><img src="images/footer_blog_1.jpg" alt="https://unsplash.com/@avidenov"></div>
<div class="footer_blog_content">
<div class="footer_blog_title"><a href="blog.html">Travel with us this year</a></div>
<div class="footer_blog_date">Nov 29, 2017</div>
</div>
</div>

<div class="footer_blog_item clearfix">
<div class="footer_blog_image"><img src="images/footer_blog_2.jpg" alt="https://unsplash.com/@deannaritchie"></div>
<div class="footer_blog_content">
<div class="footer_blog_title"><a href="blog.html">New destinations for you</a></div>
<div class="footer_blog_date">Nov 29, 2017</div>
</div>
</div>

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

<div class="col-lg-3 footer_column">
<div class="footer_col">
<div class="footer_title">contact info</div>
<div class="footer_content footer_contact">
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
<div class="contact_info_text"><a href="/cdn-cgi/l/email-protection#73101c1d071210071e1633141e121a1f5d101c1e4c200611191610074e3b161f1f1c" target="_top"><span class="__cf_email__" data-cfemail="bdded2d3c9dcdec9d0d8fddad0dcd4d193ded2d0">[email&#160;protected]</span></a></div>
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
    
</footer>

<div class="copyright">
<div class="container">
<div class="row">
<div class="col-lg-3 order-lg-1 order-2  ">
<div class="copyright_content d-flex flex-row align-items-center">
<div>
Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
</div>
</div>
</div>
<div class="col-lg-9 order-lg-2 order-1">
<div class="footer_nav_container d-flex flex-row align-items-center justify-content-lg-end">
<div class="footer_nav">
<ul class="footer_nav_list">
<li class="footer_nav_item"><a href="index.html">home</a></li>
<li class="footer_nav_item"><a href="about.html">about us</a></li>
<li class="footer_nav_item"><a href="offers.html">offers</a></li>
<li class="footer_nav_item"><a href="blog.html">news</a></li>
<li class="footer_nav_item"><a href="#">contact</a></li>
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
<script src="plugins/parallax-js-master/parallax.min.js"></script>

<script src="js/contact_custom.js"></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"8457770dcdd35ff9","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}' crossorigin="anonymous"></script>
</body>
</html>
