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
        <script src="./lib/ckeditor/ckeditor.js" >

        </script>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
          <form action="editschedule" method="post">
                                
                               <div class="schedules">
    <label>Schedules</label>
  
        <table class="table">
            <thead>
                <tr>
                    <th>Location</th>
                    <th>Date</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.schedules}" var="s">
                    <tr>
                      <td style="display:none;"><input type="hidden" name="sid" value="${s.id}" /></td>
                       <td style="display:none;"><input type="hidden" name="tourId" value="${s.tourId}" /></td>
                        <td><input type="text" name="location" value="${s.location}" /></td>
                        <td><input type="time" name="date" value="${s.date}" /></td>
                      <td><textarea name="descriptionSchedules">${s.descriptionSchedules}</textarea></td>
                        <td>
                           
                          
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    
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
