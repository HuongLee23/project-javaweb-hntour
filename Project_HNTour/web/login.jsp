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
        <link rel="stylesheet" href="./assets/css/login.css">
    </head>

    <body>
        <div class="add">
            <div class="all__screen">

                <div class="login__screen">
                    <div class="login__logo">
                        <a href="./index.jsp">
                            <img src="./assets/img/logo.png" alt="logo">
                        </a>
                    </div>

                    <div class="login__header">
                        <h1>
                            Đăng nhập tài khoản
                        </h1>

                        <h4>
                            Thông tin cá nhân
                        </h4>
                    </div>

                    <div class="login__body">
                        <form action="account" method="post">
                            <div class="login__form">
                                <input class="login__input" value="${cookie.cemail.value}" type="email" pattern="^([A-Za-z0-9_\-\.])+\@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,20}))$" name="email" placeholder=" " required>
                                <label class="login__label" for="email">Email *</label>
                            </div>
                            <div class="login__form">
                                <input id="password" class="login__input" value="${cookie.cpass.value}" type="password" name="pass" placeholder=" " required>
                                <label class="login__label" for="pass">Mật khẩu *</label>
                                <i id="eye-icon" onclick="togglePassVisibility()" class="fa fa-eye"></i>
                            </div>



                            <div class="login__check">
                                <div class="login__remember">
                                    <input type="checkbox" ${cookie.crem.value== 'on' ? 'checked':''} 
                                           name="rem" value="on">Ghi nhớ tài khoản
                                </div>
                            </div>


                            <div class="login__error">
                                ${requestScope.error}
                            </div>
                            <div class="button__form">
                                <input type="submit" class="button__form-submit" value="Đăng nhập" >
                            </div>

                            <div class="transfer__form">
                                <a class="transfer__form-link1" href="./register.jsp">
                                    Đăng ký
                                </a>
                                <span class="transfer__form-separate">
                                </span>
                                <a class="transfer__form-link2" href="index.jsp">
                                    Trở lại
                                </a>
                            </div>
                        </form>

                        <div class="login__forgetpass">
                            <button onclick="showForgotPasswordModal()">Quên mật khẩu?</button>
                        </div>
                    </div>

                    <div class="login__footer">
                    </div>
                </div>
                <img src="./assets/img/background-demo2.png" alt="login">
            </div>
        </div>

        <!--Enter email to send verification code-->
        <div class="modal" id="forgotPasswordModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close-modal" onclick="hideForgotPasswordModal()" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>

                        <img class="login-popup-logo" src="./assets/img/logo.png" alt="TravelVN - Logo" loading="lazy">
                    </div>
                    <div class="modal-body">
                        <h6>Quên mật khẩu?</h6>
                        <form class="reset-password-form" action="sendEmail"  id="auth0ForgotPassword">
                            <div class="reset-password-body">
                                <p class="reset-password-title">Quý khách vui lòng nhập email để yêu cầu đặt lại mật khẩu. Hà Nội Tour sẽ gửi mã xác nhận tới địa chỉ email này.</p>
                                <div class="form-group required">
                                    <input type="number" hidden value="1" name="roleEmail">
                                    <input id="emailForgotPassword" type="text" required="" class="form-control" name="email" aria-describedby="emailHelp" data-missing-error="Vui lòng nhập email." data-pattern-mismatch="Vui lòng nhập email hợp lệ." ata-range-error="Vui lòng nhập ít hơn 50 ký tự." pattern="^([A-Za-z0-9_\-\.])+\@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,20}))$" placeholder="Nhập email của bạn.">
                                    <div class="invalid-feedback" id="emailForgotPasswordFeedback"></div>
                                </div>
                            </div>
                            <div class="send-email-btn">
                                <button type="submit" class="btn btn-primary" >Gửi mã xác minh</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!---------------------------------------------------------------------->                   


        <script>
            function togglePassVisibility() {
                var password = document.getElementById("password");
                var eyeIcon = document.getElementById("eye-icon");
                if (password.type === "password") {
                    password.type = "text";
                    eyeIcon.classList.remove("fa-eye");
                    eyeIcon.classList.add("fa-eye-slash");
                } else {
                    password.type = "password";
                    eyeIcon.classList.remove("fa-eye-slash");
                    eyeIcon.classList.add("fa-eye");
                }

            }


            // Hàm để hiển thị modal quên mật khẩu
            function showForgotPasswordModal() {
                var modal = document.getElementById("forgotPasswordModal");
                modal.style.display = "block";
            }

            // Hàm để ẩn modal quên mật khẩu
            function hideForgotPasswordModal() {
                var modal = document.getElementById("forgotPasswordModal");
                modal.style.display = "none";
            }


        </script>               

    </body>

</html>