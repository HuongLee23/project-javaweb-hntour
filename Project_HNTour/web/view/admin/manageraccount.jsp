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

        <link rel="stylesheet" href="../../view/css/main.css"/>

        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="background: linear-gradient(to right, #fa9e1b, #8d4fff, #fa9e1b);">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="manageraccount">Start Bootstrap</a>
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
                        <li><a class="dropdown-item" href="../home">Home</a></li>

                        <!--<li><a class="dropdown-item" href="#!">Activity Log</a></li>-->

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
                    <!--                    <ol class="breadcrumb mb-4">
                                            <li class="breadcrumb-item active">Dashboard</li>
                                        </ol>-->
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
                        <div class="col-xl-3 col-md-6">
                            <div class="card bg-warning text-white mb-4">
                                <div class="card-body">Supplier Account</div>
                                <div class="card-footer d-flex align-items-center justify-content-between">
                                    <p>${requestScope.totalsupplier}</p>
                                    <div class="small text-white"><a href="manageraccsupplier?role=2" style="color: white"><i class="fas fa-angle-right"></i></a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card bg-success text-white mb-4">
                                <div class="card-body">Supplier registration</div>
                                <div class="card-footer d-flex align-items-center justify-content-between">
                                    <p>${requestScope.totalRegisterSupplier}</p>
                                    <div class="small text-white"><a href="managerregistersupplier" style="color: white"><i class="fas fa-angle-right"></i></a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card bg-danger text-white mb-4">
                                <div class="card-body">Feedback</div>
                                <div class="card-footer d-flex align-items-center justify-content-between">
                                    <p>${requestScope.totalFeedback}</p>
                                    <div class="small text-white"><a href="managerfeedback" style="color: white"><i class="fas fa-angle-right"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header" onclick="openForm(this)">
                            <span style="cursor: pointer">
                                <i class="fas fa-table me-1"></i>
                                Accounts (<i class="fa-solid fa-plus" style="color: greenyellow;"></i>)
                            </span>
                            <c:if test="${sessionScope.messAddAccount == 'Thêm tài khoản thành công'}">
                                <span style="margin-left: 400px; color:greenyellow;">
                                    ${sessionScope.messAddAccount}
                                </span>
                            </c:if>
                            <c:if test="${sessionScope.messAddAccount != 'Thêm tài khoản thành công'}">
                                <span style="margin-left: 400px; color:red;">
                                    ${sessionScope.messAddAccount}
                                </span>
                            </c:if>

                        </div>

                        <div  class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Password</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.currentPageData}" var="a">
                                        <tr>
                                            <td>${a.username}</td>
                                            <td>${a.password}</td>
                                            <td>${a.email}</td>
                                            <td>${a.address}</td>
                                            <td style="text-align: center; font-size: xx-large;">
                                                <c:if test="${a.role == 2}">
                                                    <i class="fa-solid fa-user-tie" ></i>
                                                </c:if>
                                                <c:if test="${a.role == 3}">
                                                    <i class="fa-solid fa-user" ></i>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${a.status}">
                                                    <i class="fa-solid fa-circle" style="color: greenyellow"></i> Active
                                                </c:if>
                                                <c:if test="${!a.status}">
                                                    <i class="fa-solid fa-circle" style="color: red"></i> Blocked
                                                </c:if>
                                            </td>
                                            <td style="color: #00adef">
                                                <c:if test="${a.status}">
                                                    <div class="button-edit">
                                                        <i class="fa-solid fa-lock"></i> 
                                                        <a id="button-edit-customer" href="lock?id=${a.id}"  style="text-decoration: none; color: red">Block</a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${!a.status}">
                                                    <div class="button-edit">
                                                        <i class="fa-solid fa-lock-open"></i>
                                                        <a id="button-edit-customer" href="unlock?id=${a.id}"style="text-decoration: none">UnBlock</a>
                                                    </div>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <%-- Hiển thị nút phân trang --%>
                            <div>
                                <c:forEach begin="1" end="${requestScope.totalPages}" var="page">
                                    <a href="manageraccount?page=${page}">${page}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </main>



            <!--Phần xử lý tạo tài khoản-->
            <div class="fib-drawer-mask" onclick="closeForm()"></div>
            <div class="fib-add-form">
                <h2 style="left: 4px;" class="fby-section-title">
                    <span>Thêm tài khoản</span>
                    <div class="fby-section-tips"></div>
                </h2>
                <!-- Nội dung của form ở đây -->
                <form action="addaccount" method="post">
                    <label class="form-label" for="emailAddress">Email</label>
                    <input type="email" id="emailAddress" name="email" class="form-control" required/>

                    <label class="form-label" for="name">Họ và tên</label>
                    <input type="text" id="name" name="username" class="form-control" required />

                    <label class="form-label" for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" class="form-control" required/>

                    <label class="form-label" for="role">Quyền truy cập</label>
                    <select id="role" name="role" class="form-control" required>
                        <option value="" disabled selected>Chọn quyền truy cập</option>
                        <option value="1">Admin</option>
                        <option value="2">Supplier</option>
                        <option value="3">Customer</option>
                    </select>

                    <h5 style="color: red">${requestScope.mess}</h5>

                    <input class="btn-submit" type="submit" value="Thêm tài khoản" />
                </form>
            </div>


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

            /* CSS cho form */
            .fib-add-form {
                display: none;
                position: fixed;
                top: 0;
                right: 0;
                width: 50%; /* Chiếm một nửa màn hình */
                height: 100%;
                background-color: #ffffff;
                z-index: 9999;
                transition: transform 0.5s ease;
                padding: 20px; /* Thêm padding để nội dung không sát mép */
                box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1); /* Thêm bóng để tạo chiều sâu */
                border-left: 1px solid #e0e0e0; /* Thêm viền trái */
            }

            .fib-add-form.active {
                display: block;
                transform: translateX(0); /* Hiển thị form từ phải sang */
            }

            .fib-add-form label {
                top: 15px;
                left: 15px;
                color: #888888;
                transition: all 0.3s ease;
                pointer-events: none;
                width: calc(100% - 30px); /* Thêm chiều rộng cho label */
            }

            /* CSS cho input */
            .fib-add-form input {
                width: calc(100% - 30px);
                padding: 8px;
                margin: 0 0 10px; /* Điều chỉnh khoảng cách giữa các input */
                border: none;
                border-bottom: 1px solid #e0e0e0;
                outline: none;
                transition: all 0.3s ease;
            }

            /* CSS cho input khi được focus */
            .fib-add-form input:focus {
                border-bottom: 1px solid #ff5b00; /* Thay đổi màu viền dưới khi focus */
            }

            /* CSS cho label khi input có focus hoặc đã được điền dữ liệu */
            .fib-add-form input:focus + label,
            .fib-add-form input:valid + label {
                top: -10px;
                font-size: 12px;
                color: #ff5b00; /* Thay đổi màu và kích thước của label */
            }

            CSS cho button
            .fib-add-form button {
                background-color: transparent;
                border: none;
                color: #ff5b00;
                font-size: 16px;
                cursor: pointer;
                transition: color 0.3s ease;
                position: absolute;
                bottom: 30px;
                right: 22px;
            }

            .fib-add-form button:hover {
                color: #e04113;
            }

            /* CSS cho button submit */
            .fib-add-form .btn-submit {
                background-color: #ff5b00;
                margin: 45px 0 0 16px;
                color: #ffffff;
                padding: 15px 30px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .fib-add-form .btn-submit:hover {
                background-color: #e04113; /* Thay đổi màu khi di chuột vào */
            }

            /* CSS cho mask */
            .fib-drawer-mask {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 50%; /* Chiếm một nửa màn hình */
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Màu nền mờ */
                z-index: 9998;
                opacity: 0;
                transition: opacity 0.5s ease;
            }

            .fib-drawer-mask.active {
                display: block;
                opacity: 1; /* Hiển thị mask */
            }

            .confirm-btn {
                background-color: #4CAF50; /* Màu nền */
                border: none; /* Không viền */
                color: white; /* Màu chữ */
                padding: 12px 24px; /* Độ lớn */
                text-align: center; /* Căn giữa văn bản */
                text-decoration: none; /* Không gạch chân */
                display: inline-block;
                font-size: 16px; /* Cỡ chữ */
                margin: 4px 2px; /* Khoảng cách với phần tử khác */
                transition-duration: 0.4s; /* Thời gian chuyển đổi hover */
                cursor: pointer; /* Con trỏ chuột */
                border-radius: 8px; /* Bo tròn viền */
            }

            .confirm-btn:hover {
                background-color: #45a049; /* Màu nền khi hover */
            }

        </style>
        <script>


            function openForm(element) {
                // Kiểm tra xem phần tử được nhấn có class là 'card-header' không
                if (element.classList.contains('card-header')) {
                    document.querySelector(".fib-add-form").classList.add("active");
                    document.querySelector(".fib-drawer-mask").classList.add("active");
                }
            }

            function closeForm() {
                document.querySelector(".fib-add-form").classList.remove("active");
                document.querySelector(".fib-drawer-mask").classList.remove("active");
            }



            function searchAccountByAll(param) {
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
