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
        <link rel="shortcut icon" type="image/png" href="../assets/img/test.png">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/styles.css"/>
        <link rel="stylesheet" href="../view/css/main.css"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="background: linear-gradient(to right, #fa9e1b, #8d4fff, #fa9e1b);">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="manageraccount">Start Bootstrap</a>
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" oninput="searchAccountOfCustomer(this)" data-role="3" name="txt" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="../home">Home</a></li>
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
                            <div class="card bg-primary text-white mb-4">
                                <div class="card-body">Customer Account</div>
                                <div class="card-footer d-flex align-items-center justify-content-between">
                                    <p>${requestScope.totalcustomer}</p>
                                    <div class="small text-white"><a href="manageracccustomer?role=3" style="color: white"><i class="fas fa-angle-right"></i></a></div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Accounts
                            <span style="margin-left: 400px; color: red">${sessionScope.msUpdateCustomer}</span>
                        </div>
                        <div  class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Password</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th>Phone number</th>
                                        <th style="text-align: center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.currentPageData}" var="a">
                                        <tr>
                                            <td>${a.username}</td>
                                            <td>${a.password}</td>
                                            <td>${a.email}</td>
                                            <td>${a.address}</td>
                                            <td>${a.phoneNumber}</td>
                                            <td style="color: #00adef">
                                                <!--<form action="managerregistersupplier" method="post">-->
                                                <input class="confirm-btn" onclick="openForm(this)" data-id="${a.id}" data-role="${a.role}" data-username="${a.username}" data-email="${a.email}" data-address="${a.address}" data-phonenumber="${a.phoneNumber}" value="Update"/>

                                                <!--</form>-->
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <%-- Hiển thị nút phân trang --%>
                            <div>
                                <c:forEach begin="1" end="${requestScope.totalPages}" var="page">
                                    <a href="manageracccustomer?page=${page}">${page}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </main>


            <!--Phần xử lý tạo cập nhật thông tin tài khoản-->
            <div class="fib-drawer-mask" onclick="closeForm()"></div>
            <!--<div class="fib-add-form">-->
            <div class="fib-add-form">
                <h2 style="left: 4px;" class="fby-section-title">
                    <span>
                        Cập nhật thông tin khách hàng
                    </span>
                    <div class="fby-section-tips"></div>
                </h2>
                <!-- Nội dung của form ở đây -->
                <form action="manageracccustomer" method="post">

                    <input type="hidden" id="id" name="id" >
                    <input type="hidden" id="role" name="role" >

                    <label class="form-label" for="name">Họ và tên</label>
                    <input type="text" id="name" name="username" class="form-control" required />

                    <!--                    <input type="text" id="password" name="password" class="form-control" required/>
                                        <label class="form-label" for="password">Mật khẩu</label>-->

                    <label class="form-label" for="emailAddress">Email</label>
                    <input type="email" id="emailAddress" name="email" class="form-control" required/>

                    <label class="form-label" for="phoneNumber">Số điện thoại</label>
                    <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" required/>

                    <label class="form-label" for="address">Địa chỉ</label>
                    <input type="text" id="address" name="address" class="form-control" required/>

                    <h5 style="color: red">${requestScope.mess}</h5>

                    <input class="btn-submit" type="submit" value="Cập nhật thông tin" />
                    <!--<button type="button" onclick="closeForm()">Hủy bỏ</button>-->
                </form>
            </div>
            <!--</div>-->

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
            function searchAccountOfCustomer(param) {
                var searchAll = param.value;
                var role = param.getAttribute("data-role");
                $.ajax({
                    url: "/VNTravel/admin/searchajaxacc",
                    type: "get",
                    data: {
                        txt: searchAll,
                        roleAcc: role
                    },
                    success: function (data) {
                        var row = document.getElementById("datatablesSimple");
                        row.innerHTML = data;
                    },
                    error: function (xhr, status, error) {
                        console.log("An error occurred:", error);
                    }
                }); // Add closing bracket here
            }

            function openForm(btn) {
                document.querySelector(".fib-add-form").classList.add("active");
                document.querySelector(".fib-drawer-mask").classList.add("active");

                // Lấy dữ liệu từ thuộc tính data của nút "Update"
                var id = btn.getAttribute("data-id");
                var role = btn.getAttribute("data-role");
                var username = btn.getAttribute("data-username");
//                var password = btn.getAttribute("data-password");
                var email = btn.getAttribute("data-email");
                var address = btn.getAttribute("data-address");
                var phoneNumber = btn.getAttribute("data-phonenumber");

                // Cập nhật giá trị của các trường input trong form
                document.getElementById("id").value = id;
                document.getElementById("role").value = role;
                document.getElementById("name").value = username;
//                document.getElementById("password").value = password;
                document.getElementById("emailAddress").value = email;
                document.getElementById("phoneNumber").value = phoneNumber;
                document.getElementById("address").value = address;
            }

            function closeForm() {
                document.querySelector(".fib-add-form").classList.remove("active");
                document.querySelector(".fib-drawer-mask").classList.remove("active");
            }


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