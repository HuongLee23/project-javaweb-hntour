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
                            <h2>Tạo <b>Tour</b></h2>
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

                        <form action="addtour" method="post">

                            <div class="modal-header">						
                                <h4 class="modal-title">Tạo tour mới</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					

                                <input type="hidden" name="supplierID" value="${a.id}">

                                <div class="form-group">
                                    <label>Tên</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Ảnh chính</label>

                                    <input name="imageMain" type="text" class="form-control" required>
                                </div>

                                <div id="imageInputs">
                                    <label>Album Ảnh</label>
                                    <br>
                                    <!-- Display existing imageAlbum values -->


                                    <!-- Dynamic input for adding more imageAlbum values -->
                                    <div class="new-image">
                                        <img src="" alt="" width="100" />
                                        <input name="additionalImages" type="text" class="form-control" placeholder="New Image URL">
                                        <button type="button" onclick="deleteNewImageInput(this)">Xóa</button>
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
                                        deleteButton.onclick = function () {
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
                                    <label>Tổng thời gian Tour</label>
                                    <input name="time" type="time" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Giá</label>
                                    <input  name="price" type="text" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Miêu tả</label>
                                    <textarea id="describe" name="description" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Quy Định</label>
                                    <input name="rule" type="text" class="form-control" required>
                                </div>



                                <div class="form-group">
                                    <label>Thể loại</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${requestScope.listC}" var="c">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="schedules">
                                    <label>Lịch trình</label>

                                    <table class="table" id="schedulesTable">
                                        <thead>
                                            <tr>
                                                <th>Địa điểm</th>
                                                <th>Thời gian</th>
                                                <th>Miêu tả</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.schedules}" var="s">
                                                <tr>
                                                    <td><input type="text" name="location" value="${s.location}" readonly /></td>
                                                    <td><input type="time" name="date" value="${s.date}" readonly /></td>
                                                    <td><input type="text" name="descriptionSchedules" value="${s.descriptionSchedules}" readonly /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                    <div style="cursor: pointer" class="button add_button" onclick="addNewSchedule()">Thêm lịch trình cho Tour</div>
                                </div>

                                <!-- Container for new schedules -->
                                <div id="newSchedulesContainer"></div>

                                <script>
                                    var scheduleCounter = 0;

                                    function addNewSchedule() {
                                        // Create a new row for the schedule
                                        var newRow = document.createElement("tr");

                                        // Add cells for each column
                                        var locationCell = document.createElement("td");
                                        var dateCell = document.createElement("td");
                                        var descriptionCell = document.createElement("td");

                                        // Increment the counter for unique names
                                        scheduleCounter++;

                                        // Add input elements to cells with unique names
                                        locationCell.innerHTML = '<input type="text" name="locationnew_' + scheduleCounter + '" />';
                                        dateCell.innerHTML = '<input type="time" name="datenew_' + scheduleCounter + '" />';
                                        descriptionCell.innerHTML = '<input type="text" name="descriptionSchedulesnew_' + scheduleCounter + '" />';

                                        // Append cells to the new row
                                        newRow.appendChild(locationCell);
                                        newRow.appendChild(dateCell);
                                        newRow.appendChild(descriptionCell);

                                        // Append the new row to the table body
                                        var tbody = document.getElementById("schedulesTable").getElementsByTagName('tbody')[0];
                                        tbody.appendChild(newRow);
                                    }
                                </script>



                                <div class="modal-footer">
                                    <a href="managertourlist" class="btn btn-primary">Trở lại trang quản lý</a>
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