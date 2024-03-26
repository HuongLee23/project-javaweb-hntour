<%-- 
    Document   : DanhSachKhachHangDamua
    Created on : Mar 24, 2024, 2:50:38 AM
    Author     : Admin
--%>

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
            <a class="navbar-brand ps-3" href="index.html">HaNoiTour</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
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
                            <a class="nav-link" href="home">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Trang Chủ
                            </a>

                            <a class="nav-link" href="managertourlist">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Quản lý Tour
                            </a>

                            <a class="nav-link" href="managervoucher">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area "></i></div>
                                Voucher
                            </a>

                            <a class="nav-link" href="chart">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area "></i></div>
                                Biểu đồ thống kê
                            </a>

                            <a class="nav-link" href="confirmorder">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Xử lý đơn hàng
                            </a>
                        </div>
                    </div>
                </nav>
            </div>

            <c:set value="${sessionScope.account}" var="a"/>

            <div id="layoutSidenav_content">
                <main>

                    <div class="card mb-12">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Danh sách khách hàng mua
                            <div style="color: greenyellow">${requestScope.mess}</div>
                        </div>
                        <div class="card-body" style="text-align: center">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>

                                        <th>Tên sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Tên khách hàng</th>
                                        <th>Số điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th>Ngày mua</th>
                                        <th>Voucher</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listInvoice}" var="o">
                                        <tr>

                                            <td>${o.tour.name}</td>
                                            <td><fmt:formatNumber value="${o.tour.price}" pattern="###,###"/> VND</td>
                                            <td>${o.account.username}</td>
                                            <td>${o.account.phoneNumber}</td>
                                            <td>${o.account.address}</td>
                                            <td>${o.order.date}</td>
                                            <td>
                                                <i onclick="window.location.href = 'tangvoucher?aid=${o.account.id}'" class="fa-solid fa-gift fa-shake" style="color: #00ad4b;"></i>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>


                            <div class="clearfix">
                                <div class="hint-text">Showing Product</div>
                                <div>
                                    <form action="inexcel" method="get">
                                        <button type="submit" class="btn btn-success">
                                            Xuất excel
                                        </button>
                                    </form>


                                </div>

                            </div>

                        </div>
                    </div>
                </main>
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


