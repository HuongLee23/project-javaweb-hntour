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
        <link rel="stylesheet" type="text/css" href="styles/blog_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">
        <link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="blog/bootstrap.min.css" rel="stylesheet">
        <link href="blog/templatemo-xtra-blog.css" rel="stylesheet">
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
    </head>

    <body>

        <div class="super_container">

            <!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>

                <!-- Home -->

               
            <div class="home">
                <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/about_background.jpg"></div>
                <div class="home_content">
                    <div class="home_title">The Blogs</div>
                </div>
            </div>

                <!-- Blog Detail -->
                <div class="container-fluid">
                    <main class="tm-main" style="margin-left: 175px;">
                        <!-- Search form -->
                      
                        <div class="row tm-row">
                            <div class="col-12">
                                <hr class="tm-hr-primary tm-mb-55">
                                <!-- Video player 1422x800 -->
                                <img width="954" height="535" src="${detailblog.image}" controls class="tm-mb-40">
                                    							  
                                    
                                </img>
                            </div>
                        </div>
                        <div class="row tm-row">
                            <div class="col-lg-8 tm-post-col">
                                <div class="tm-post-full">                    
                                    <div class="mb-4">
                                        <h2 class="pt-2 tm-color-primary tm-post-title">${detailblog.title}</h2>
                                        <p class="tm-mb-40">${detailblog.publishDate} posted by ${detailblog.accountName}</p>
                                       
                                        <p>
                                           ${detailblog.content}
                                        </p>
                                        <span class="d-block text-right tm-color-primary">Creative . Design . Business</span>
                                    </div>
                             
                                    <!-- Comments -->
                                    <div>
                                        <h2 class="tm-color-primary tm-post-title">Comments</h2>
                                        <hr class="tm-hr-primary tm-mb-45">
                                       
                                        <c:forEach items="${requestScope.blogcomment}" var="b">
                                        <div class="tm-comment-reply tm-mb-45">
                                            <hr>
                                            <div class="tm-comment">
                                                <figure class="tm-comment-figure">
                                                    <img src="${b.accAvatar}" alt="Image" class="mb-2 rounded-circle img-thumbnail">
                                                    <figcaption class="tm-color-primary text-center">${b.accName}</figcaption>    
                                                </figure>
                                                <p>
                                                    ${b.comment}
                                                </p>
                                            </div>                                
                                            <span class="d-block text-right tm-color-primary">${b.commentDate}</span>
                                        </div>
                                        </c:forEach>
                                        <div>
                                        <form action="post" class="mb-5 tm-comment-form">
                                            <h2 class="tm-color-primary tm-post-title mb-4">Your comment</h2>
                                          
                                            <div class="mb-4">
                                                <textarea class="form-control" name="comment" ></textarea>
                                            </div>
                                            <div class="text-right">
                                                <button class="tm-btn tm-btn-primary tm-btn-small">Submit</button>                        
                                            </div>                                
                                        </form>   
                                            </div>
                                    </div>
                                </div>
                            </div>
                            <aside class=" tm-aside-col">
                                <div class="tm-post-sidebar">
                              
                                    
                                    <hr class="mb-3 tm-hr-primary">
                                    <h2 class="tm-mb-40 tm-post-title tm-color-primary">Related Posts</h2>
                                    <a href="#" class="d-block tm-mb-40">
                                        <figure>
                                            <img src="img/img-02.jpg" alt="Image" class="mb-3 img-fluid">
                                            <figcaption class="tm-color-primary">Duis mollis diam nec ex viverra scelerisque a sit</figcaption>
                                        </figure>
                                    </a>
                                    <a href="#" class="d-block tm-mb-40">
                                        <figure>
                                            <img src="img/img-05.jpg" alt="Image" class="mb-3 img-fluid">
                                            <figcaption class="tm-color-primary">Integer quis lectus eget justo ullamcorper ullamcorper</figcaption>
                                        </figure>
                                    </a>
                                    <a href="#" class="d-block tm-mb-40">
                                        <figure>
                                            <img src="img/img-06.jpg" alt="Image" class="mb-3 img-fluid">
                                            <figcaption class="tm-color-primary">Nam lobortis nunc sed faucibus commodo</figcaption>
                                        </figure>
                                    </a>
                                </div>                    
                            </aside>
                        </div>
                    
                    </main>
                </div>

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
