/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import controller.*;
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

/**
 *
 * @author hello
 */
//<<<<<<<< HEAD:Project_HNTour/src/java/controller/changepassword.java
//@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/changepassword"})
//public class changepassword extends HttpServlet {
//========
@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/forgotpassword"})
public class ForgotPasswordServlet extends HttpServlet {
//>>>>>>>> 26f35089ca04ac2ffd07d30b16125c6d35ef410f:Project_HNTour/src/java/controller/ForgotPasswordServlet.java

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
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
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
    String pass = request.getParameter("pass");
    String newpass = request.getParameter("newpass");

    DAO d = new DAO();
    Account a = d.loginAccount(email,pass);

    if (a == null || !a.getPassword().equals(pass)) {
        String ms = "Old password is incorrect!";
        request.setAttribute("error", ms);
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
    } else {
        
        a.setPassword(newpass);
        d.changePassword(email,pass,newpass);

        HttpSession session = request.getSession();
        session.setAttribute("account", a);

        String ms = "Changed password successfully!";
        request.setAttribute("error", ms);
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);

        if (newpass.equals(pass)) {
            request.setAttribute("sendEmail", email);
            request.setAttribute("oldPassword", pass);
            request.setAttribute("error", "Trùng mật khẩu cũ. Vui lòng thử lại.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        } else {
         
            boolean result = d.changePassword(email, pass, newpass);
            if (result) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error", "Email hoặc mật khẩu không hợp lệ. Vui lòng thử lại.");
                request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            }
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
