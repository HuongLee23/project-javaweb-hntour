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
            <img src="${image}" alt="${c.name}" width="100" />
            <input value="${image}" name="existingImageAlbum" type="text" class="form-control" required>
            <button type="button" onclick="deleteImageInput(${loop.index}, '${image}')">Delete</button>
        </div>
    </c:forEach>

    <!-- Dynamic input for adding more imageAlbum values -->
    <div class="new-image">
        <img src="" alt="" width="100" />
        <input name="additionalImages" type="text" class="form-control" placeholder="New Image URL">
        <button type="button" onclick="deleteNewImageInput(this)">Delete</button>
    </div>
    <button type="button" onclick="addNewImageInput()">+</button>
</div>



<script>
    function addNewImageInput() {
        var newInput = document.createElement('div');
        newInput.className = 'new-image';

        var img = document.createElement('img');
        img.src = '';  // Set a default or leave it empty
        img.alt = '';  // Set a default or leave it empty
        img.width = 100;
        newInput.appendChild(img);

        var input = document.createElement('input');
        input.type = 'text';
        input.name = 'additionalImages';
        input.placeholder = 'New Image URL';
        input.className = 'form-control';
        newInput.appendChild(input);

        var deleteButton = document.createElement('button');
        deleteButton.type = 'button';
        deleteButton.textContent = 'Delete';
        deleteButton.onclick = function() {
            deleteNewImageInput(this);
        };
        newInput.appendChild(deleteButton);

        document.getElementById('imageInputs').appendChild(newInput);
    }

    function deleteNewImageInput(button) {
        var newInput = button.parentNode;
        newInput.parentNode.removeChild(newInput);
    }

   function deleteImageInput(index, imageUrl) {
    // Create a hidden input to mark an existing image for deletion in the backend
    var hiddenInput = document.createElement('input');
    hiddenInput.type = 'hidden';
    hiddenInput.name = 'deletedImages';
    hiddenInput.value = imageUrl;
    document.getElementById('imageInputs').appendChild(hiddenInput);

    // Handle deletion of existing image in the UI after adding hidden input
    var elements = document.getElementsByName('existingImageAlbum');
    if (elements[index]) {
        elements[index].parentNode.remove();
    }
}
</script>






                                <div class="form-group">
                                    <label>IntendedTime</label>
                                    <input value="${tour.intendedTime}" name="time" type="time" class="form-control" required>
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
            <c:choose>
                <c:when test="${c.id eq tour.categoryId}">
                    <option value="${c.id}" selected>${c.name}</option>
                </c:when>
                <c:otherwise>
                    <option value="${c.id}">${c.name}</option>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </select>
</div>
                                
       <div class="schedules">
    <label>Schedules</label>
    
    <table class="table" id="schedulesTable">
        <thead>
            <tr>
                <th>Location</th>
                <th>Date</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.schedules}" var="s">
                <tr>
                    <td><input type="text" name="location" value="${s.location}" readonly /></td>
                    <td><input type="time" name="date" value="${s.date}" readonly /></td>
                    <td><input type="text" name="descriptionSchedules" value="${s.descriptionSchedules}" readonly /></td>
                    <td>
                        <div class="button book_button">
                            <a href="editschedule?sid=${s.id}">Edit<span></span><span></span><span></span></a>
                        </div>
                        <div class="button book_button">
                            <a href="deleteschedule?sid=${s.id}&tourId=${s.tourId}">Delete<span></span><span></span><span></span></a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

     <div class="button add_button" onclick="addNewSchedule()">Add Schedule</div>
    </div>

    <!-- Container for new schedules -->
    <div id="newSchedulesContainer"></div>
<script>
    function addNewSchedule() {
        // Create a new row for the schedule
        var newRow = document.createElement("tr");

        // Add cells for each column
        var locationCell = document.createElement("td");
        var dateCell = document.createElement("td");
        var descriptionCell = document.createElement("td");
        

        // Add input elements to cells
        locationCell.innerHTML = '<input type="text" name="locationnew" />';
        dateCell.innerHTML = '<input type="time" name="datenew" />';
        descriptionCell.innerHTML = '<input type="text" name="descriptionSchedulesnew" />';
       

        // Append cells to the new row
        newRow.appendChild(locationCell);
        newRow.appendChild(dateCell);
        newRow.appendChild(descriptionCell);
      

        // Append the new row to the table body
        document.getElementById("schedulesTable").getElementsByTagName('tbody')[0].appendChild(newRow);
    }
</script>
                            <div class="modal-footer">
                                 <a href="managertourlist" class="btn btn-primary">Back Manager</a>
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