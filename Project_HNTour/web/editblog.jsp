<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Blog</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="./ckeditor/ckeditor/ckeditor.js"></script>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Blog</b></h2>
                        </div>
                        <div class="col-sm-6"></div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editblog" method="post">
                            <div class="modal-header">						

                                <button  type="button" class="close" data-dismiss="modal" aria-hidden="true"><a href="managerblogs" style="text-decoration: none">&times;</a></button>
                            </div>

                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${blog.bid}" name="bid" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input value="${blog.title}" name="title" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Content</label>
                                    <textarea id="describe" name="content" class="form-control" required>${blog.content}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <img src="${blog.image}" alt="" width="200"/>
                                    <input value="${blog.image}" name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Publish Date</label>
                                    <input value="${blog.publishDate}" name="publishDate" type="date" class="form-control" required disabled >
                                </div>

                                <div class="form-group">
                                    <label>Status</label>
                                    <select name="status" class="form-control" required="">
                                        <c:choose>
                                            <c:when test="${blog.status == 1}">
                                                <option value="1">Công Khai</option>
                                                <option value="0">Ẩn</option>
                                            </c:when>
                                          
                                           
                                        </c:choose>
                                    </select>
                                </div>

                                <div class="modal-footer">
                                    <a href="managerblogs" class="btn btn-primary">Chuyển về Mânger Blogs</a>
                                    <input type="submit" class="btn btn-success" value="Chỉnh sửa">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/manager.js" type="text/javascript"></script>
        <script>
            CKEDITOR.replace('describe');
        </script>
    </body>
</html>
