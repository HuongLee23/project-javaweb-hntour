<%-- 
    Document   : ChartDoanhThu
    Created on : Mar 14, 2024, 3:30:58 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Charts - SB Admin</title>
        <link href="./assets/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                        </div>
                    </div>
                </nav>
            </div>
            
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Biểu đồ</h1>
                   <section class="mb-4" id="doanhThuThang">
                        <div class="card">
                            <div class="card-header py-3">
                                <h5 class="mb-0 text-center"><strong>Doanh thu theo tháng</strong></h5>
                            </div>
                            <div class="card-body">
                                <canvas id="horizontalBar"></canvas>
                            </div>
                        </div>
                    </section>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar me-1"></i>
                                    Biểu đồ doanh thu thanh
                                </div>
                                <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie me-1"></i>
                                    Biểu đồ doanh thu tròn
                                </div>
                                <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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
    <script >
        //Charts-area-demo
       new Chart(document.getElementById("horizontalBar"), {
    type: "bar",
    data: {
        labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
        datasets: [{
            label: "Doanh thu VNÐ",
            data: [${totalMonth.month1}, ${totalMonth.month2}, ${totalMonth.month3}, ${totalMonth.month4}, ${totalMonth.month5}, ${totalMonth.month6}, ${totalMonth.month7}, ${totalMonth.month8}, ${totalMonth.month9}, ${totalMonth.month10}, ${totalMonth.month11}, ${totalMonth.month12}],
            backgroundColor: [
                // Đổi các màu ở đây, ví dụ:
                 "rgba(255, 0, 0, 0.6)", // Đỏ
                "rgba(0, 255, 0, 0.6)", // Xanh lá cây
                "rgba(0, 0, 255, 0.6)", // Xanh dương
                "rgba(255, 255, 0, 0.6)", // Vàng
                "rgba(255, 165, 0, 0.6)", // Cam
                "rgba(128, 0, 128, 0.6)" // Tím
            ],
            borderColor: [
                // Đổi các màu đường biên ở đây, tương tự như backgroundColor
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            xAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

        //Charts-bar-demo
var ctx = document.getElementById("myBarChart");
var myBarChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Quý I", "Quý II", "Quý III", "Quý IV"],
        datasets: [{
            label: "Revenue",
            backgroundColor: "rgba(2,117,216,1)",
            borderColor: "rgba(2,117,216,1)",
            data: [
                ${totalQuater.quater1},
                ${totalQuater.quater2},
                ${totalQuater.quater3},
                ${totalQuater.quater4}
            ]
        }]
    },
    options: {
        scales: {
            xAxes: [{
                time: {
                    unit: 'quarter'
                },
                gridLines: {
                    display: false
                },
                ticks: {
                    maxTicksLimit: 4
                }
            }],
            yAxes: [{
                ticks: {
                    min: 0,
                    max: 500,
                    maxTicksLimit: 10
                },
                gridLines: {
                    display: true
                }
            }]
        },
        legend: {
            display: false
        }
    }
});


        // Pie Chart Example

        var ctx = document.getElementById("myPieChart");
        var myPieChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ["Tour lịch sử", "Tour văn hóa", "Tour ẩm thực", "Tour nghỉ dưỡng"],
                datasets: [{
                        data: [
        ${requestScope.totalCate1},
        ${requestScope.totalCate2},
        ${requestScope.totalCate3},
                    ${requestScope.totalCate4}],
                        backgroundColor: ['#007bff', '#ffc107', '#28a745'],
                    }],
            },
        });

    </script>
</body>
</html>
