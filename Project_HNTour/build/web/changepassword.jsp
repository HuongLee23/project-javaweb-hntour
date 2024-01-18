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

                <div class="login__screen" style="height: 717px">
                    <div  class="login__logo">
                        <a href="./index.jsp">
                            <img src="./assets/img/logo.png" alt="logo">
                        </a>
                    </div>

                    <div class="login__header">
                        <h1>
                            Đổi mật khẩu
                        </h1>

                        <h4>
                            Thông tin cá nhân
                        </h4>
                    </div>

                    <div class="login__body">
                        <form action="changepassword" method="post">
                            <div class="login__form">
                                <input class="login__input" type="email" pattern="^([A-Za-z0-9_\-\.])+\@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,20}))$" name="email" value="${requestScope.sendEmail}" placeholder=" " required>
                                <label class="login__label" for="email">Email *</label>
                            </div>
                            <input type="hidden" name="pass" value="${requestScope.oldPassword}">
                            <!--                            <div class="login__form">
                                                            <input id="password1" class="login__input" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}$" type="password" name="pass"  placeholder=" " required>
                                                            <label class="login__label" for="pass">Nhập mật khẩu cũ *</label>
                                                            <i id="eye-icon1" onclick="togglePassVisibility1()" class="fa fa-eye"></i>
                                                        </div>-->
                            <div class="login__form">
                                <input id="password2" class="login__input" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}$" type="password" name="newpass" placeholder=" " required>
                                <label class="login__label" for="newpass">Nhập mật khẩu mới *</label>
                                <i id="eye-icon2" onclick="togglePassVisibility2()" class="fa fa-eye"></i>
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

                            <div class="button__form">
                                <input type="submit" value="Đổi mật khẩu">
                            </div>

                            <div class="transfer__form">
                                <a class="transfer__form-link2" href="index.jsp">
                                    Trở lại
                                </a>
                            </div>
                        </form>
                    </div>

                    <div class="login__footer">
                    </div>
                </div>

                <img src="./assets/img/background-demo1.png" alt="login">
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