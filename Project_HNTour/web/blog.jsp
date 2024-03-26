<%-- 
    Document   : blogs
    Created on : Jan 15, 2024, 11:05:16 AM
    Author     : hello
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
        <link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">

        <link rel="stylesheet" type="text/css" href="styles/blog_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">
    </head>

    <body>

        <div class="super_container">

            <!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>

                <!-- Home -->

                <div class="home">
                    <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/blog_background.jpg"></div>
                    <div class="home_content">
                        <div class="home_title">the blog</div>
                    </div>
                </div>

                <!-- Blog -->

                <div class="blog">
                    <div class="container">
                        <div class="row">

                            <!-- Blog Content -->

                            <div class="col-lg-8">

                                <div class="blog_post_container" id="offers_blog">
                                <c:forEach items="${blog}" var="blog" >

                                    <!-- Blog Post -->
                                    <div class="blog_post">
                                        <div class="blog_post_image">
                                            <img src="${blog.image}" alt="alt"/>
                                            <div class="blog_post_date d-flex flex-column align-items-center justify-content-center">
                                                <div class="blog_post_day">01</div>
                                                <div class="blog_post_month">Dec, 2017</div>
                                            </div>
                                        </div>
                                        <div class="blog_post_meta">
                                            <ul>
                                                <li class="blog_post_meta_item"><a href="">${blog.accountName}</a></li>
                                                <li class="blog_post_meta_item"><a href="">3 Comments</a></li>
                                            </ul>
                                        </div>
                                        <div class="blog_post_title"><a href="blogdetail?id=${blog.bid}">${blog.title}</a></div>
                                        <div class="blog_post_text">

                                        </div>
                                        <div class="blog_post_link"><a href="blogdetail?id=${blog.bid}">Tìm hiểu thêm</a></div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- Blog Post -->

                            <div class="blog_navigation"> 
                                <ul>
                                    <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                        <li style="padding: 0px" class="blog_dot active ${loop.index == currentPage ? 'active' : ''}"> 
                                            <a class="page-link" href="blog?page=${loop.index}">${loop.index}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>

                        </div>

                        <!-- Blog Sidebar -->

                        <div class="col-lg-4 sidebar_col">

                            <!-- Sidebar Search -->
                            <div class="sidebar_search">
                                <!--<form action="searchblog">-->
                                    <input oninput="searchBlog(this)" type="text" name="txt" class="sidebar_search_input" placeholder="Nhập bài viết" required="required">
                                    <button id="sidebar_search_button" type="submit" class="sidebar_search_button trans_300" value="Submit">
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
                                    </button>

                                <!--</form>-->
                            </div>

                            <!-- Sidebar Archives -->
                            <!--                            <div class="sidebar_archives">
                                                            <div class="sidebar_title">Archives</div>
                                                            <div class="sidebar_list">
                                                                <ul>
                                                                    <li><a href="#">March 2017</a></li>
                                                                    <li><a href="#">April 2017</a></li>
                                                                    <li><a href="#">May 2017</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>-->

                            <!-- Sidebar Archives -->


                            <!-- Sidebar Latest Posts -->

                            <div class="sidebar_latest_posts">
                                <div class="sidebar_title">Bài viết mới nhất</div>
                                <div class="latest_posts_container">
                                    <c:forEach items="${requestScope.lasted}" var="l">
                                        <ul>
                                            <!-- Latest Post -->
                                            <li class="latest_post clearfix">
                                                <div class="latest_post_image">
                                                    <a href="blogdetail?id=${l.bid}"><img style="height: 55px;width: 85px;" src="${l.image}" alt=""></a>
                                                </div>
                                                <div class="latest_post_content">
                                                    <div class="latest_post_title trans_200"><a href="blogdetail?id=${l.bid}">${l.title}</a></div>
                                                    <div class="latest_post_meta">
                                                        <div class="latest_post_author trans_200"><a href="blogdetail?id=${l.bid}">${l.accountName}</a></div>
                                                        <div class="latest_post_date trans_200"><a href="blogdetail?id=${l.bid}">${l.publishDate}</a></div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </c:forEach>
                                </div>
                            </div>



                        </div>
                    </div>
                </div>
            </div>
            <script>
                function searchBlog(param) {
                    var searchAll = param.value;
                    $.ajax({
                        url: "/VNTravel/searchblog",
                        type: "get",
                        data: {
                            txt: searchAll
                        },
                        success: function (data) {
                            var row = document.getElementById("offers_blog");
                            row.innerHTML = data;
                        },
                        error: function (error) {
                            console.log("An error occurred:", error);
                        }
                    }); // Add closing bracket here
                }

            </script>
            <!-- Footer -->
            <jsp:include page="footer.jsp"></jsp:include>

        </div>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/colorbox/jquery.colorbox-min.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/blog_custom.js"></script>

    </body>

</html>
