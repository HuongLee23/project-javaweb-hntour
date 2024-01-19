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

                <div style="height: 420px;" class="login__screen login__authenticate">
                    <div class="login__logo">
                        <a href="./index.jsp">
                            <img src="./assets/img/logo.png" alt="logo">
                        </a>
                    </div>

                    <div class="login__header">
                        <h1>
                            Vui lòng nhập mã xác thực
                        </h1>

                        <h4>
                            Xác thực thông tin
                        </h4>
                    </div>

                    <div class="login__body">
                        <form action="sendEmail" method="post">
                            <p style="margin: 10px 50px 10px 50px;" class="reset-password-title">${requestScope.message}</p>
                            <div class="form-group required">
                                <input id="emailForgotPassword" type="text" required="" class="form-control" name="toCode" pattern="[0-9]+" placeholder="Xác thực mã">
                                <div class="invalid-feedback" id="emailForgotPasswordFeedback"></div>
                            </div>


                            <div class="login__error">
                                ${requestScope.error}
                            </div>
                            <div class="send-email-btn">
                                <button type="submit" class="btn btn-primary" >Nhập mã xác minh</button>
                            </div>

                            <div class="transfer__form">
                                <c:if test="${sessionScope.role == 1}" >
                                    <a class="transfer__form-link2" href="login.jsp">
                                        Trở lại
                                    </a>
                                </c:if>

                                <c:if test="${sessionScope.role == 2}" >
                                    <a class="transfer__form-link2" href="register.jsp">
                                        Trở lại
                                    </a>
                                </c:if>

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
        </script>               

    </body>

</html>