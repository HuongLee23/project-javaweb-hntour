/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author hello
 */
@WebServlet(name = "AccountServlet", urlPatterns = {"/account"})
public class AccountServlet extends HttpServlet {

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
            out.println("<title>Servlet AccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        DAO d = new DAO();
        HttpSession session = request.getSession();

        // Thông tin for login
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String rem = request.getParameter("rem");

        // Thông tin for register(lỗi khi tôi đang ký xong khi sửa đường link từ home.jsp ở trang home thành login.jsp thì nó lại chạy về account mà account lại vừa là đăng ký vừa là login lên nó vẫn còn cái session của đăng lên bị lỗi tưởng là đăng ký hai lần)
        String registerEmail = (String) session.getAttribute("registerEmail");
        String registerUser = (String) session.getAttribute("registerUser");
        String registerPass = (String) session.getAttribute("registerPass");
        String registerRepass = (String) session.getAttribute("registerRepass");

        int role = 3;

        if (registerEmail != null && registerUser != null && registerPass != null && registerRepass != null) {
            if (registerPass.equals(registerRepass)) {
                boolean result = d.registerAccount(registerEmail, registerUser, registerPass, role);
                if (result) {
                    Account a = d.loginAccount(registerEmail, registerPass);
                    session.setAttribute("account", a);
                    response.sendRedirect("home.jsp");
                } else {
                    request.setAttribute("error", "Tài khoản đăng ký không hợp lệ. Vui lòng thử lại.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Mật khẩu không khớp. Vui lòng thử lại.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } else if (email != null && pass != null) {
            Account a = d.loginAccount(email, pass);
            if (a != null) {
                session.setAttribute("account", a);

                Cookie cemail = new Cookie("cemail", email);
                Cookie cpass = new Cookie("cpass", pass);
                Cookie crem = new Cookie("crem", rem);
                if (rem != null) {
                    cemail.setMaxAge(60 * 60 * 24 * 30);
                    cpass.setMaxAge(60 * 60 * 24 * 30);
                    crem.setMaxAge(60 * 60 * 24 * 30);
                } else {
                    cemail.setMaxAge(0);
                    cpass.setMaxAge(0);
                    crem.setMaxAge(0);
                }
                response.addCookie(cemail);
                response.addCookie(cpass);
                response.addCookie(crem);

//                response.sendRedirect("home");
                response.sendRedirect("home.jsp");
            } else {
                request.setAttribute("error", "Email hoặc mật khẩu không đúng. Vui lòng thử lại.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
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
