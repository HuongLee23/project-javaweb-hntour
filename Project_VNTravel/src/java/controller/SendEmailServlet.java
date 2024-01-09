/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import dal.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;

/**
 *
 * @author hello
 */
@WebServlet(name = "SendEmailServlet", urlPatterns = {"/sendEmail"})
public class SendEmailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendEmailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendEmailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String role_raw = request.getParameter("loginEmail").trim();
        String sendEmail = request.getParameter("sendEmail").trim();

        SendEmail send = new SendEmail();
        Random random = new Random();
        HttpSession session = request.getSession();
        DAO d = new DAO();

        boolean checkExistAccount = d.checkAccountExistByEmail(sendEmail);

        if (checkExistAccount) {
            try {
                int role = Integer.parseInt(role_raw);
                int randomNumber = 100000 + random.nextInt(900000);
                String fromCode = String.valueOf(randomNumber);

                if (sendEmail != null) {
                    send.sendMailForCusBuy(sendEmail, randomNumber);
                }

                session.setAttribute("sendEmail", sendEmail);
                session.setAttribute("fromCode", fromCode);
                session.setAttribute("role", role);
                String message;
                if (role == 1) {
                    message = "Quý khách vui lòng nhập mã xác thực để yêu cầu đặt lại mật khẩu. TravelVN sẽ xác nhận mã đã gửi tới email.";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("authenticateEmail.jsp").forward(request, response);
                } else {
                    message = "Quý khách vui lòng nhập mã xác thực để yêu cầu tạo tài khoản. TravelVN sẽ xác nhận mã đã gửi tới email.";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("authenticateEmail.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Mã xác thực không hợp lệ!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Tài khoản này chưa được đăng ký!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String toCode_raw = request.getParameter("toCode").trim();

        HttpSession session = request.getSession();
        String fromCode_raw = (String) session.getAttribute("fromCode");
        String sendEmail = (String) session.getAttribute("sendEmail");
        int role = (int) session.getAttribute("role");

        DAO d = new DAO();

        try {
            int toCode = Integer.parseInt(toCode_raw);
            int fromCode = Integer.parseInt(fromCode_raw.trim());
            if (toCode == fromCode) {
                if (role == 1) {

                    // Xác nhận mã thành công để chuyển sang trang thay đổi mật khẩu
                    String oldPassword = d.retrieveOldPasswordByEmail(sendEmail);

                    request.setAttribute("oldPassword", oldPassword);
                    request.setAttribute("sendEmail", sendEmail);
                    request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                } else {

                    // Xác nhận mã thành công để tạo tài khoản
                    request.setAttribute("sendEmail", sendEmail);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {

                //Mã không khớp thì gửi lỗi về bắt nhập lại
                request.setAttribute("error", "Mã xác thực không khớp!");
                request.getRequestDispatcher("authenticateEmail.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {

            //Mã không hợp lệ thì gửi lỗi về bắt nhập lại
            request.setAttribute("error", "Mã xác thực không hợp lệ!");
            request.getRequestDispatcher("authenticateEmail.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
