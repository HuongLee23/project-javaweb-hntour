/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
        String toEmail = request.getParameter("loginEmail");

        SendEmail send = new SendEmail();
        Random random = new Random();
        HttpSession session = request.getSession();

        int randomNumber = 100000 + random.nextInt(900000);
        String toCode = String.valueOf(randomNumber);

//        Cookie ageEmail = new Cookie("ageEmail", toEmail);
//        Cookie ageCode = new Cookie("ageCode", toCode);
        if (toEmail != null) {
            send.sendMailForCusBuy(toEmail, randomNumber);
//            ageEmail.setMaxAge(60);
//            ageCode.setMaxAge(60);
        }
//        response.addCookie(ageEmail);
//        response.addCookie(ageCode);

//        request.setAttribute("ageEmail", ageEmail);
        session.setAttribute("toEmail", toEmail);
        session.setAttribute("toCode", toCode);
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
//        request.setCharacterEncoding("UTF-8");
//        String toEmail = request.getParameter("loginEmail");
//
//        SendEmail send = new SendEmail();
//        Random random = new Random();
//        HttpSession session = request.getSession();
//
//        int randomNumber = 100000 + random.nextInt(900000);
//        String toCode = String.valueOf(randomNumber);
//
//        Cookie ageEmail = new Cookie("ageEmail", toEmail);
//        Cookie ageCode = new Cookie("ageCode", toCode);
//        if (toEmail != null) {
//            send.sendMailForCusBuy(toEmail, randomNumber);
//            ageEmail.setMaxAge(60);
//            ageCode.setMaxAge(60);
//        }
//        response.addCookie(ageEmail);
//        response.addCookie(ageCode);
//
//        request.setAttribute("ageEmail", ageEmail);
//        session.setAttribute("ageCode", ageCode);
//        request.getRequestDispatcher("login.jsp").forward(request, response);

        String codeEmail_raw = request.getParameter("codeEmail");
        HttpSession session = request.getSession();
        String ageCode_raw = (String) session.getAttribute("toCode");
        String ageEmail = (String) session.getAttribute("toEmail");

        try {
            int codeEmail = Integer.parseInt(codeEmail_raw.trim());
            int ageCode = Integer.parseInt(ageCode_raw.trim());
            if (codeEmail == ageCode) {
                session.setAttribute("ageEmail", ageEmail);
                response.sendRedirect("changepassword.jsp");
            } else {
                session.setAttribute("ageEmail", ageEmail);
                response.sendRedirect("login.jsp");
            }
        } catch (NumberFormatException e) {
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
