<%-- 
    Document   : confirmOrder
    Created on : Mar 22, 2024, 10:56:20 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="shortcut icon" type="image/png" href="./assets/img/test.png">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/2ab805f98d.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">




        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="statistic?supplierId=${sessionScope.account.id}">Quản lý</a>
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
                            <a class="nav-link" href="statistic?supplierId=${sessionScope.account.id}">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt" style="color: #ffffff;"></i></div>
                                Trang Chủ
                            </a>

                            <a class="nav-link" href="listcustomerdamua">

                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area " style="color: #ffffff;"></i></div>
                                Danh Sách Khách Hàng
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

                            <a class="nav-link" href="confirmorder">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt" style="color: #ffffff;"></i></div>

                                Xử lý đơn hàng
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách khách hàng mua

                            </div>
                            <div class="card-body" style="text-align: center">
                                <h3 style="color: red">${sessionScope.msRegisterSupplier}</h3>
                                <div class="row">
                                    <div class="col-md-6">
                                        <!--        <form action="confirmorder" method="post">
                                                    <div class="mb-3">
                                                        <label for="startDate" class="form-label">Từ ngày:</label>
                                                        <input type="date" class="form-control" id="startDate" name="startDate">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="endDate" class="form-label">Đến ngày:</label>
                                                        <input type="date" class="form-control" id="endDate" name="endDate">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Lọc</button>
                                                </form>-->
                                    </div>
                                </div>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>Tên Tour</th>
                                            <th>Giá</th>
                                            <th>Tên khách hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Địa chỉ</th>
                                            <th>Số lượng</th>
                                            <th>Ngày mua</th>
                                            <th>Ngày đi</th>
                                            <th>Trạng thái</th>
                                            <th>Xác nhận</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.confirmod}" var="o">
                                            <tr>
                                                <td>${o.tour.name}</td>
                                                <td><fmt:formatNumber value="${o.tour.price}" pattern="###,###"/> VND</td>
                                                <td>${o.account.username}</td>
                                                <td>${o.account.phoneNumber}</td>
                                                <td>${o.account.address}</td>
                                                <td>${o.orderdetail.quantity}</td>
                                                <td>${o.order.date}</td>
                                                <td>${o.orderdetail.dateDeparture}</td>
                                                <c:if test="${o.orderdetail.status == 'Đang xử lý'}">
                                                    <td style="color: #0d6efd">${o.orderdetail.status}</td>
                                                </c:if>
                                                <c:if test="${o.orderdetail.status == 'Hủy đơn hàng'}">
                                                    <td style="color: red">${o.orderdetail.status}</td>
                                                </c:if>
                                                <c:if test="${o.orderdetail.status == 'Xác nhận đơn hàng'}">
                                                    <td style="color: #198754">${o.orderdetail.status}</td>
                                                </c:if>
                                                <td>
                                                    <c:if test="${o.orderdetail.status == 'Đang xử lý'}">
                                                        <form id="acceptForm" action="sendconfirmod">
                                                            <input type="hidden" name="action" value="accept"> <!-- Trường ẩn để xác định hành động là chấp nhận -->
                                                            <input type="hidden" name="tourId" value="${o.tour.id}"/>
                                                            <input type="hidden" name="orderId" value="${o.order.id}"/>
                                                            <input type="hidden" name="ngaydi" value="${o.orderdetail.dateDeparture}"/>
                                                            <input type="hidden" name="nametour" value="${o.tour.name}"/>
                                                            <input type="hidden" name="email" value="${o.account.email}"/>
                                                            <input class="confirm-btn" type="button" value="Chấp nhận" onclick="confirmAction('accept', this)"/>
                                                        </form>
                                                        <br/>
                                                        <form id="rejectForm" action="sendconfirmod">
                                                            <input type="hidden" name="action" value="reject"> <!-- Trường ẩn để xác định hành động là chấp nhận -->
                                                            <input type="hidden" name="tourId" value="${o.tour.id}"/>
                                                            <input type="hidden" name="orderId" value="${o.order.id}"/>
                                                            <input type="hidden" name="ngaydi" value="${o.orderdetail.dateDeparture}"/>
                                                            <input type="hidden" name="nametour" value="${o.tour.name}"/>
                                                            <input type="hidden" name="email" value="${o.account.email}"/>
                                                            <input class="confirm-btn" type="button" value="Từ chối" onclick="confirmAction('reject', this)"/>
                                                        </form>

                                                        <script>
                                                            function confirmAction(action, button) {
                                                                var message;
                                                                var form = button.closest('form'); // Tìm form gần nhất chứa nút được nhấp vào

                                                                if (action === 'accept') {
                                                                    message = "Bạn có chắc chắn muốn chấp nhận đơn hàng này?";
                                                                } else if (action === 'reject') {
                                                                    message = "Bạn có chắc chắn muốn từ chối đơn hàng này?";
                                                                }

                                                                if (confirm(message)) {
                                                                    if (form) {
                                                                        form.submit(); // Nếu form tồn tại, gửi nó đi
                                                                    }
                                                                }
                                                            }
                                                        </script>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>





                            </div>

                        </div>
                    </div>

                </main>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>
</html>
