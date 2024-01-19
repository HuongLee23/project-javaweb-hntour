<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hà Nội Tour</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <script src="https://kit.fontawesome.com/2ab805f98d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./assets/css/register.css">
    </head>

    <body>
        <div class="add">
            <div class="all__screen">

                <div class="login__screen">
                    <div class="login__logo">
                        <a href="./home.jsp">
                            <img src="./assets/img/logo.png" alt="logo">
                        </a>
                    </div>

                    <div class="login__header">
                        <h1>
                            Đăng ký tài khoản
                        </h1>

                        <h4>
                            Thông tin cá nhân
                        </h4>
                    </div>

                    <div class="login__body">
                        <form action="sendEmail" method="get">
                            <div class="login__form">
                                <input class="login__input" type="email" pattern="^([A-Za-z0-9_\-\.])+\@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,20}))$" name="email" placeholder=" " required>
                                <label class="login__label" for="email">Email *</label>
                            </div>
                            <div class="login__form">
                                <input class="login__input" type="text" name="user" placeholder=" " required>
                                <label class="login__label" for="user">Họ và tên *</label>
                            </div>
                            <div class="login__form">
                                <input id="password1" class="login__input" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}$" type="password" name="pass" placeholder=" " required>
                                <label class="login__label" for="pass">Mật khẩu *</label>
                                <i id="eye-icon1" onclick="togglePassVisibility1()" class="fa fa-eye"></i>

                            </div>
                            <div class="login__form">
                                <input id="password2" class="login__input" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}$" type="password" name="repass" placeholder=" " required>
                                <label class="login__label" for="repass">Nhập lại mật khẩu *</label>
                                <i id="eye-icon2" onclick="togglePassVisibility2()" class="fa fa-eye"></i>
                            </div>

                            <div>
                                <input type="number" hidden value="2" name="roleEmail">
                            </div>


                            <div class="login__error">
                                ${requestScope.error}
                            </div>

                            <div class="request__form">
                                Mật khẩu bao gồm
                                <ul>
                                    <li><i class="fa-solid fa-check" style="color: #c3c6d1;"></i><span>Ít nhất 8 ký tự</span></li>
                                    <li><i class="fa-solid fa-check" style="color: #c3c6d1;"></i><span>Chữ hoa & chữ thường</span></li>
                                    <li><i class="fa-solid fa-check" style="color: #c3c6d1;"></i><span>Ít nhất 1 số</span></li>
                                </ul>
                            </div>

                            <div class="policy__form">
                                <p>
                                    Bằng việc bấm nút Đăng ký bên dưới, 
                                    tôi xác nhận đã đọc, hiểu và đồng ý với
                                    các <a href="https://shop.vinfastauto.com/vn_vi/dieu-khoan-phap-ly.html">Điều kiện và Điều khoản</a>
                                    của Hà Nội Tour.
                                </p>
                            </div>

                            <div class="agree__form">
                                <input type="checkbox" required>
                                <!--<span>Đăng ký nhận thông tin chương trình khuyến mãi, dịch vụ từ VinFast</span>-->
                                <span>Tôi đồng ý với điều khoản trên *</span>

                            </div>


                            <div class="button__form">
                                <input type="submit" value="Đăng ký">
                            </div>


                            <div class="transfer__form">
                                <a class="transfer__form-link1" href="./login.jsp">
                                    Đăng nhập
                                </a>
                                <span class="transfer__form-separate">
                                </span>
                                <a class="transfer__form-link2" href="home.jsp">
                                    Trở lại
                                </a>
                            </div>
                        </form>
                    </div>

                    <div class="login__footer">
                    </div>
                </div>

                <img src="./assets/img/background-demo2.png" alt="login">
            </div>
        </div>


        <script>
            function togglePassVisibility1() {
                var password1 = document.getElementById("password1");
                var eyeIcon1 = document.getElementById("eye-icon1");
                if (password1.type === "password") {
                    password1.type = "text";
                    eyeIcon1.classList.remove("fa-eye");
                    eyeIcon1.classList.add("fa-eye-slash");
                } else {
                    password1.type = "password";
                    eyeIcon1.classList.remove("fa-eye-slash");
                    eyeIcon1.classList.add("fa-eye");
                }

            }

            function togglePassVisibility2() {
                var password2 = document.getElementById("password2");
                var eyeIcon2 = document.getElementById("eye-icon2");
                if (password2.type === "password") {
                    password2.type = "text";
                    eyeIcon2.classList.remove("fa-eye");
                    eyeIcon2.classList.add("fa-eye-slash");
                } else {
                    password2.type = "password";
                    eyeIcon2.classList.remove("fa-eye-slash");
                    eyeIcon2.classList.add("fa-eye");
                }

            }

        </script> 
    </body>

</html>