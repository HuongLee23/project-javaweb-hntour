<%-- 
    Document   : ManagerTour
    Created on : Jan 30, 2024, 11:27:43 PM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HaNoiTour</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="./lib/ckeditor/ckeditor.js" >

        </script>
    </head>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>

  <c:set value="${requestScope.account}" var="a"/>

      <div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Quản lý <b>Tour</b></h2>
                </div>
               
                <div class="col-sm-6">
                    <a href="addtour?supplierID=${a.id}" class="btn btn-success">
                        <i class="material-icons">&#xE147;</i> <span>Tạo Tour Mới</span>
                    </a>
                    <a href="#deleteProductModal" class="btn btn-danger" data-toggle="modal">
                        <i class="material-icons">&#xE15C;</i> <span>Xóa</span>
                    </a>
                    <form action="managertourlist" method="post">
                        <div class="search_item">
                            <div>Tìm kiếm Tour</div>
                            <input type="text" name="txt" class="destination search_input" >
                        </div>
                        <button class="button search_button">Tìm kiếm<span></span><span></span><span></span></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>Tên</th>
                            <th>Hình ảnh</th>
                            <th>Thời gian dự kiến</th> 
                            <th>Giá</th>
                            <th>Miêu tả</th>
                      
                            <th>Version</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.tour}" var="c">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox${c.id}" name="options[]" value="${c.id}">
                                        <label for="checkbox${c.id}"></label>
                                    </span>
                                </td>
                                <td>${c.name}</td>
                                <td>
                                    <img src="${c.imageMain}" alt="${c.name}" width="200"/>
                                </td>
                                <td>${c.intendedTime}</td>
                                <td>${c.price}</td>
                                <td>${c.description}</td>
                                
                                <td>${c.version}</td>
                                
                                <td>
                                    <a href="loadtour?tid=${c.id}" class="edit" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                    </a>
                                    <a href="delete?tid=${c.id}" class="delete" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!--                <div class="clearfix">
                                    <div class="hint-text">Showing Product</div>
                                    <ul class="pagination">
                <c:if test="${page>1}">
                <li class="page-item"><a href="managerproduct?index=${page-1}">Previous</a></li>
                </c:if>
                <c:forEach begin="1" end="${endP}" var="i">
                <li class="page-item ${page == i?"active":""}"><a href="managerproduct?index=${i}" class="page-link">${i}</a></li>
                </c:forEach>  
                <c:if test="${page<endP}">
                <li class="page-item"><a href="managerproduct?index=${page+1}" class="page-link">Next</a></li>
                </c:if>
                    </ul>
            </div>-->
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Description</label>
                                <textarea id="describe" name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Amount</label>
                                <input name="amount" type="text" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${requestScope.listC}" var="c">
                                        <option value="${c.cid}">${c.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Brand</label>
                                <select name="brand" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${requestScope.listB}" var="b">
                                        <option value="${b.bid}">${b.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->

        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
        <script>
            CKEDITOR.replace('describe');
        </script>
    </body>
</html>
