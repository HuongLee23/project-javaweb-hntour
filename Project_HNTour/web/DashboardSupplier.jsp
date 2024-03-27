<%-- 
    Document   : DashboardSupplier
    Created on : Mar 4, 2024, 10:28:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : role3
    Created on : Feb 5, 2024, 10:45:51 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
        <meta name="author" content="" />
        <title>HaNoiTour</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/2ab805f98d.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="statistic?supplierId=${sessionScope.account.id}">Quản lý</a>
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" oninput="searchAccountByAll(this)" data-role="0" name="txt" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">

                        <li><a class="dropdown-item" href="home">Home</a></li>
                        <li><hr class="dropdown-divider" /></li>

                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="statistic?supplierId=${sessionScope.account.id}">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt" style="color: #ffffff;"></i></div>
                                Trang Chủ
                            </a>

                            <a class="nav-link" href="listcustomerdamua">

                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area " style="color: #ffffff;"></i></div>
                                Danh Sách Khách Hàng
                            </a>

                            <a class="nav-link" href="confirmorder">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-file-invoice" style="color: #ffffff;"></i></div>
                                Xử lý đơn hàng
                            </a>

                            <a class="nav-link" href="managertourlist">
                                <div class="sb-nav-link-icon"><i class="fas fa-table" style="color: #ffffff;"></i></div>
                                Quản lý Tour
                            </a>
                            <a class="nav-link" href="managerblogs">
                                <div class="sb-nav-link-icon"><i class="fa-brands fa-blogger" style="color: #ffffff;"></i></div>
                                Quản lý Blog
                            </a>

                            <a class="nav-link" href="managervoucher">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-ticket" style="color: #ffffff;"></i></div>
                                Voucher
                            </a>

                            <a class="nav-link" href="chart">

                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area " style="color: #ffffff;"></i></div>
                                Biểu đồ thống kê
                            </a>

                        </div>
                    </div>
                </nav>
            </div>

            <c:set value="${requestScope.account}" var="a"/>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">

                        <h1 class="mt-4">Tổng Doanh Thu: <fmt:formatNumber value="${totalCate.totalCate1 + totalCate.totalCate2 + totalCate.totalCate3 + totalCate.totalCate4}" pattern="###,###"/> VND</h1>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Tour Lịch Sử</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a style="text-decoration: none;" class="small text-white stretched-link" href="#">
                                            Doanh thu: <fmt:formatNumber value="${totalCate.totalCate1}" pattern="###,###"/> VND
                                        </a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Tour Văn Hóa</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a style="text-decoration: none;" class="small text-white stretched-link" href="#">Doanh thu: <fmt:formatNumber value="${totalCate.totalCate2}" pattern="###,###"/> VND</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Tour Ẩm Thực</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a style="text-decoration: none;" class="small text-white stretched-link" href="#">Doanh thu: <fmt:formatNumber value="${totalCate.totalCate3}" pattern="###,###"/> VND</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-info text-white mb-4">
                                    <div class="card-body">Tour Nghỉ Dưỡng</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a style="text-decoration: none;" class="small text-white stretched-link" href="#">
                                            Doanh thu: <fmt:formatNumber value="${totalCate.totalCate4}" pattern="###,###"/> VND
                                        </a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-xl-4">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Top 10 sản phẩm bán chạy nhất
                                    </div>
                                    <div class="card-body">
                                        <table style="text-align: center" class="table table-striped table-hover">
                                            <thead>
                                                <tr>

                                                    <th>Tên Tour</th>

                                                    <th>Số lượt đã bán</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${requestScope.listTopPro}" var="listTP">
                                                    <tr>

                                                        <td>${listTP.tour.name}</td>

                                                        <td>${listTP.totalquantity}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Top 10 khách hàng mua nhiều nhất
                                    </div>
                                    <div class="card-body">
                                        <table style="text-align: center" class="table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Email khách hàng</th>
                                                    <th>Tên khách hàng</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Voucher</th> 
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${requestScope.listTopAcc}" var="listTA">
                                                    <tr>
                                                        <td>
                                                            <script>

                                                                var email = "${listTA.account.email}";
                                                                document.write(email.length <= 15 ? email : email.substr(0, 15) + '...');

                                                            </script>
                                                        </td>
                                                        <td>${listTA.account.username}</td>
                                                        <td>${listTA.account.phoneNumber}</td>
                                                        <td>${listTA.account.address}</td>
                                                        <td>
                                                            <i onclick="window.location.href = 'tangvoucher?aid=${listTA.account.id}'" class="fa-solid fa-gift fa-shake" style="color: #00ad4b;"></i>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
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
                                <a href="#">HaNoiTour</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>

                            </div>
                            <ul style="display: flex;" class="pagination">

                                <c:if test="${page>1}">
                                    <li class="page-item"><a href="admin?index=${page-1}">Previous</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${endP}" var="i">
                                    <li class="page-item ${page == i?"active":""}"><a href="admin?index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>  
                                    <c:if test="${page<endP}">
                                    <li class="page-item"><a href="admin?index=${page+1}" class="page-link">Next</a></li>
                                    </c:if>
                            </ul>
                        </div>

                    </div>
            </div>
        </div>


        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                    <div>
                        <a href="#">HaNoiTour</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>

