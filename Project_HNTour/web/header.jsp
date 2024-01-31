<%-- 
    Document   : header
    Created on : Jan 14, 2024, 8:23:43 PM
    Author     : hello
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Header -->
<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
<script src="https://kit.fontawesome.com/2ab805f98d.js" crossorigin="anonymous"></script>


<header class="header">

    <!-- Top Bar -->

    <div class="top_bar">
        <div class="container">
            <div class="row">
                <div class="col d-flex flex-row">
                    <div class="phone">+84 928 008 008</div>
                    <div class="user_box ml-auto">
                        <c:set value="${sessionScope.account}" var="a"/>
                        <c:if test="${a == null}">
                            <div class="user_box_login user_box_link"><a href="account">login</a></div>
                            <div class="user_box_register user_box_link"><a href="register.jsp">register</a></div>
                        </c:if>
                        <c:if test="${a != null}">
                            <c:if test="${a.role == 1}">
                                <a href="admin/manageraccount"><i class="fa-solid fa-user" style="color: #ffffff;"></i></a>
                                </c:if>
                                <c:if test="${a.role == 2}">
                                <a href="profilesupplier"><i class="fa-solid fa-user" style="color: #ffffff;"></i></a>
                                </c:if>
                                <c:if test="${a.role == 3}">
                                <a href="profileaccount"><i class="fa-solid fa-user" style="color: #ffffff;"></i></a>
                                </c:if>
                            <!--</li>-->
                        </c:if>
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
                        <div class="logo"><a style="font-family: serif;" href="home.jsp"><img style="margin: -139px 0px 0px -60px; width: 250px;" src="./assets/img/logo.png" alt=""></a></div>
                    </div>
                    <div class="main_nav_container ml-auto">
                        <ul class="main_nav_list">
                            <li class="main_nav_item"><a href="home">home</a></li>
                            <li class="main_nav_item"><a href="tourlist">Tour</a></li>
                            <li class="main_nav_item"><a href="aboutUs.jsp">about us</a></li>
                            <li class="main_nav_item"><a href="blogs.jsp">news</a></li>
                            <li class="main_nav_item"><a href="contact.jsp">contact</a></li>

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

