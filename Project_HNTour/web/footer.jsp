
<%-- 
    Document   : footer
    Created on : Jan 14, 2024, 8:27:38 PM
    Author     : hello
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="footer">
    <div class="container">
        <div class="row">

            <!-- Footer Column -->
            <div class="col-lg-4 footer_column">
                <div class="footer_col">
                    <div style="padding-top: 52px;" class="footer_content footer_about">
                        <div class="logo_container footer_logo">
                            <div class="logo"><a style="font-family: serif;" href="home"><img style="margin: -150px 0px 0px -60px;width: 200px;" src="./assets/img/logo.png" alt=""></a></div>
                        </div>
                        <p class="footer_about_text">Khám phá vẻ đẹp lịch sử và văn hóa của Thủ đô Hà Nội với chúng tôi - HaNoi Tour. Chuyên tổ chức các hành trình du lịch độc đáo, chúng tôi mang đến trải nghiệm tuyệt vời với những điểm đến độc đáo, ẩm thực đặc sắc và hành trình đầy ý nghĩa. Hãy đồng hành cùng chúng tôi để khám phá những góc cảnh tuyệt vời nhất của Hà Nội - nơi mà câu chuyện lịch sử và văn hóa được tái hiện mỗi bước chân của bạn. Đặt ngay để bắt đầu hành trình khám phá!</p>
                    </div>
                </div>
            </div>

            <!-- Footer Column -->
            <div class="col-lg-3 footer_column">
                <div class="footer_col">
                    <div class="footer_title">Bài viết</div>
                    <c:forEach items="${lastedBlog}" var="l">
                        <div class="footer_content footer_blog">

                            <!-- Footer blog item -->
                            <div class="footer_blog_item clearfix">
                                <div class="footer_blog_image"><a href="blogdetail?id=${l.bid}"><img src="${l.image}" alt="blog"></a></div>
                                <div class="footer_blog_content">
                                    <div class="footer_blog_title"><a href="blogdetail?id=${l.bid}"></a>${l.title}</div>
                                    <div class="footer_blog_date">${l.publishDate}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
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
                            <li class="footer_nav_item"><a href="home">home</a></li>
                            <li class="footer_nav_item"><a href="tourlist">Tour</a></li>
                            <li class="footer_nav_item"><a href="aboutUs.jsp">about us</a></li>
                            <li class="footer_nav_item"><a href="blogs.jsp">news</a></li>
                            <li class="footer_nav_item"><a href="contact.jsp">contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>