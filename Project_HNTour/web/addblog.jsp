<%-- 
    Document   : Edit
    Created on : Oct 20, 2023, 2:43:22 AM
    Author     : Admin
--%>

<%-- 
    Document   : Edit
    Created on : Oct 20, 2023, 2:43:22 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HaNoiTour</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <script src="./ckeditor/ckeditor/ckeditor.js" >

        </script>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Tạo <b>Bài Viết</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>

            <c:set value="${requestScope.account}" var="a"/>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <form action="addblog" method="post">

                            <div class="modal-header">						

                                <button  type="button" class="close" data-dismiss="modal" aria-hidden="true"><a href="managerblogs" style="text-decoration: none">&times;</a></button>
                            </div>
                            <div class="modal-body">					

                                <input type="hidden" name="accountId" value="${a.id}">

                                <div class="form-group">
                                    <label>Tiêu Đề</label>
                                    <input name="title" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Nội dung</label>
                                    <textarea id="describe" name="content" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Ảnh bài viết (link url)</label>
                                    <input name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="product_name_fr"></label>  
                                    <div class="col-md-4">
                                        <input name="date" placeholder="Publish Date" class="form-control input-md" required="" readonly type="hidden" value="${currentDate}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="status">Status</label>  
                                    <div class="col-md-4">
                                        <select name="status" class="form-control input-md" required="">
                                            <option value="Public" selected>Public</option>
                                            <option value="Private">Private</option>
                                        </select>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="managerblogs" class="btn btn-primary">Trở lại trang quản lý</a>
                                        <input type="submit" class="btn btn-success" value="Tạo Tour">
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
