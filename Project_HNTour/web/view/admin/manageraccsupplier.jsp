<%-- 
    Document   : manageraccount
    Created on : Jan 19, 2024, 5:02:08 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Hà Nội Tour</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/styles.css"/>
        <link rel="stylesheet" href="../css/main.css"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="background: linear-gradient(to right, #fa9e1b, #8d4fff, #fa9e1b);">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="manageraccount">Start Bootstrap</a>
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="../home">Home</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="../logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div style="margin-top: 80px" id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Dashboard</h1>
                    <div class="row">

                        <div class="col-xl-3 col-md-6">
                            <div class="card bg-warning text-white mb-4">
                                <div class="card-body">Supplier Account</div>
                                <div class="card-footer d-flex align-items-center justify-content-between">
                                    <p>${requestScope.totalsupplier}</p>
                                    <div class="small text-white"><a href="manageraccsupplier?role=2" style="color: white"><i class="fas fa-angle-right"></i></a></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-area me-1"></i>
                                    Area Chart Example
                                </div>
                                <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar me-1"></i>
                                    Bar Chart Example
                                </div>
                                <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Accounts
                        </div>
                        <div  class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Password</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th style="text-align: center">Profile information</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <c:forEach items="${requestScope.currentPageData}" var="a">
                                            <td>${a.username}</td>
                                            <td>${a.password}</td>
                                            <td>${a.email}</td>
                                            <td>${a.address}</td>
                                            <td>
                                                <a href="viewprofilesupplier?idAcc=${a.id}">View detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <%-- Hiển thị nút phân trang --%>
                            <div>
                                <c:forEach begin="1" end="${requestScope.totalPages}" var="page">
                                    <a href="manageraccsupplier?page=${page}">${page}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2023</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>



        </div>
        <style>
            #banAccount {
                display: none;
                position: fixed;
                top: 50% ;
                left: 50% ;
                transform: translate( - 50% , - 50%);
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ccc;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                z-index: 1000;
            }
        </style>
        <script>
            function banAccount() {
                // Hiển thị hộp thoại xác nhận
                var userConfirmed = confirm('Are you sure lock this account?');
                // Kiểm tra xem người dùng đã đồng ý hay không
                if (userConfirmed) {
                    // Thực hiện hành động nếu người dùng đồng ý
                    alert('The account is locked');
                    // Thêm logic xử lý khi người dùng đồng ý ở đây
                } else {
                    // Xử lý khi người dùng không đồng ý hoặc đóng hộp thoại
                    alert('Canceled');
                    // Thêm logic xử lý khi người dùng không đồng ý ở đây
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
