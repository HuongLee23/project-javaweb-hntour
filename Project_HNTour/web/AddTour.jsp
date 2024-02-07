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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <script src="./lib/ckeditor/ckeditor.js" >

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
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edittour" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${tour.id}" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${tour.name}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>ImageMain</label>
                                    <img src="${tour.imageMain}" alt="${c.name}" width="200"/>
                                    <input value="${tour.imageMain}" name="imageMain" type="text" class="form-control" required>
                                </div>

                                <div id="imageInputs">
                                    <label>ImageAlbum</label>
                                    <br>
                                    <!-- Display existing imageAlbum values -->
                                    <c:forEach var="image" items="${tour.imageAlbum}" varStatus="loop">
                                        <div class="existing-image">
                                            <img src="${image}" alt="${c.name}" width="100" onclick="deleteImageInput('${image}')"/>
                                            <input value="${image}" name="imageAlbum" type="text" class="form-control" required>
                                            <button type="button" onclick="deleteImageInput('${image}')">Delete</button>
                                        </div>
                                    </c:forEach>

                                    <!-- Dynamic input for adding more imageAlbum values -->
                                    <button type="button" onclick="addImageInput()">+</button>
                                </div>

                                <script>
                                    function addImageInput() {
                                        var imageInputs = document.getElementById('imageInputs');
                                        var newInput = document.createElement('div');
                                        newInput.className = 'existing-image';

                                        var img = document.createElement('img');
                                        img.src = '';  // Set a default or leave it empty
                                        img.alt = '';  // Set a default or leave it empty
                                        img.width = 100;
                                        img.onclick = function () {
                                            deleteImageInput('', newInput);
                                        };
                                        newInput.appendChild(img);

                                        var input = document.createElement('input');
                                        input.type = 'text';
                                        input.name = 'imageAlbum';
                                        input.placeholder = 'Image URL';
                                        input.className = 'form-control';
                                        newInput.appendChild(input);

                                        var deleteButton = document.createElement('button');
                                        deleteButton.type = 'button';
                                        deleteButton.textContent = 'Delete';
                                        deleteButton.onclick = function () {
                                            deleteImageInput('', newInput);
                                        };
                                        newInput.appendChild(deleteButton);

                                        imageInputs.appendChild(newInput);
                                    }

                                    function deleteImageInput(imageUrl, element) {
                                        var imageInputs = document.getElementById('imageInputs');

                                        if (imageUrl !== '') {
                                            // Handle deletion in the List<String> imageAlbum
                                            var imageAlbumInput = element.querySelector('input[name="imageAlbum"]');
                                            var currentImageAlbum = imageAlbumInput.value;
                                            var updatedImageAlbum = currentImageAlbum.split('/splitAlbum/').filter(function (image) {
                                                return image !== imageUrl;
                                            }).join('/splitAlbum/');

                                            imageAlbumInput.value = updatedImageAlbum;
                                        }

                                        // Handle deletion in the UI
                                        imageInputs.removeChild(element);
                                    }
                                </script>






                                <div class="form-group">
                                    <label>IntendedTime</label>
                                    <input value="${tour.intendedTime}" name="time" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${tour.price}" name="price" type="text" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea id="describe" name="description" class="form-control" required>${tour.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Rule</label>
                                    <input value="${tour.rule}" name="rule" type="text" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${requestScope.listC}" var="c">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>




                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
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