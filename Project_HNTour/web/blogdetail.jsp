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
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> 
        <link href="blog/bootstrap.min.css" rel="stylesheet">
        <link href="blog/templatemo-xtra-blog.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
    </head>
    <style>
        .from-edit-delete{
          color: #383b43;
        }
    </style>
    <body>

        <div class="super_container">

            <!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>

                <!-- Home -->


                <div class="home">
                    <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/about_background.jpg"></div>
                    <div class="home_content">
                        <div class="home_title">The Blog</div>
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
                                                <div>
                                                    <p style="margin-top: 35px;">
                                                        ${b.comment}
                                                    </p>
                                                    <div class="d-flex justify-content-between" style="margin-left: 410px;">
                                                        <c:if test="${sessionScope.account != null && sessionScope.account.id == b.accBlog}">
                                                            <a href="#" onclick="editcmt(${b.pid})" class="from-edit-delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                            <form action="deletecmt" method="get" class="ml-auto">
                                                                <input type="hidden" name="cid" value="${b.pid}">
                                                                <input type="hidden" name="id" value="${b.idblog}">
                                                                <a href="deletecmt?cid=${b.pid}&id=${b.idblog}" class="from-edit-delete"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                                            </form>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <script>
                                                    function editcmt(cmtId) {
                                                        window.location.href = "loadcmt?cid=" + cmtId;
                                                    }
                                                </script>

                                            </div>                                
                                            <span class="d-block text-right tm-color-primary">${b.commentDate}</span>
                                        </div>
                                    </c:forEach>
                                    <div>
                                        <c:set value="${sessionScope.account}" var="a" />
                                        <c:if test="${not empty a and not empty a.id and a.role == 3}">
                                            <c:if test="${numberFB < 2}">
                                                <form action="addcmt" method="post" class="mb-5 tm-comment-form">
                                                    <h2 class="tm-color-primary tm-post-title mb-4">Your comment</h2>
                                                    <div class="mb-4">
                                                        <input type="hidden" class="form-control" name="accountId" value="${a.id}" ></input>
                                                    </div>
                                                    <div class="mb-4">
                                                        <input type="hidden" class="form-control" name="commentDate" value="${currentDate}" ></input>
                                                    </div>
                                                    <div class="mb-4">
                                                        <input type="hidden" class="form-control" name="idblog" value="${detailblog.bid}"  ></input>
                                                    </div>
                                                    <div class="mb-4">
                                                        <textarea class="form-control" name="comment" ></textarea>
                                                    </div>
                                                    <div class="text-right">
                                                        <button class="tm-btn tm-btn-primary tm-btn-small">Submit</button>                        
                                                    </div>                                
                                                </form> 
                                            </c:if>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <aside class=" tm-aside-col">
                            <div class="tm-post-sidebar">


                                <div class="sidebar_latest_posts">
                                    <div class="sidebar_title">Latest Posts</div>
                                    <div class="latest_posts_container">
                                        <c:forEach items="${lasted}" var="l">
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
