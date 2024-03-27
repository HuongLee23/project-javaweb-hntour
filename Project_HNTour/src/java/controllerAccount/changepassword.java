/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAccount;

import controller.*;
import dal.AccountDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import ulti.PasswordEncryption;

/**
 *
 * @author hello
 */
@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/changepassword"})
public class changepassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String oldPass = request.getParameter("pass");
        String newPass = request.getParameter("newpass");
        String newPass2 = request.getParameter("newpass2");

        AccountDAO accountDAO = new AccountDAO();

        Account a = accountDAO.loginAccount(email, oldPass);

        if (a == null) {
            String errorMessage = "Mật khẩu cũ không đúng!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
        } else if (!newPass.equals(newPass2)) {
            String errorMessage = "Mật khẩu mới không khớp!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
        } else {
            // Update the password in the database
            accountDAO.changePassword(email, oldPass, newPass);

            // Update the password in the account object
//            a.setPassword(newPass);
            
            // Update the session with the modified account
            HttpSession session = request.getSession();
            session.setAttribute("account", a);

            String successMessage = "Thay đổi mật khẩu thành công!";
            request.setAttribute("error", successMessage);
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
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
