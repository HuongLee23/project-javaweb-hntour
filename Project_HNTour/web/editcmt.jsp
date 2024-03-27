
<%-- 
    Document   : EditFeedback
    Created on : Feb 24, 2024, 10:42:36 PM
    Author     : admin
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>

        <script src="./lib/ckeditor/ckeditor.js" >

        </script>

    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Feedback</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editcmt" method="post">
                            <div class="modal-header">						

                                <button  type="button" class="close" data-dismiss="modal" aria-hidden="true"><a href="blogdetail?id=${cmt.idblog}" style="text-decoration: none">&times;</a></button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">

                                    <input style="display:none;" value="${cmt.pid}" name="pid" type="text" class="form-control" >
                                    <input style="display:none;" value="${cmt.accBlog}" name="accBlog" type="text" class="form-control" >
                                    <input style="display:none;" value="${cmt.idblog}" name="idblog" type="text" class="form-control" ><!-- comment -->

                                </div>
                              

                                <div class="form-group">
                                    <label>Comment</label>
                                    <textarea id="describe" name="comment" class="form-control" required>${cmt.comment}</textarea>

                                </div>

                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Edit">
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>

    </body>

</html>