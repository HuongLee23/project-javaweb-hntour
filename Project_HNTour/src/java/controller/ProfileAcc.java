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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProfileAcc", urlPatterns = {"/profileaccount"})
public class ProfileAcc extends HttpServlet {

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
            out.println("<title>Servlet ProfileAcc</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileAcc at " + request.getContextPath() + "</h1>");
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
        DAO accountDAO = new DAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        Account acc2 = accountDAO.getAccountDetail(account.getEmail());
        request.setAttribute("account", acc2);
        request.getRequestDispatcher("profileAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data

        String profileImage = request.getParameter("profileImage");
        String user = request.getParameter("username");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone");

        String id_raw = request.getParameter("id");
        String email = request.getParameter("email");

        DAO accountDAO = new DAO();
        HttpSession session = request.getSession();
        boolean updateSuccess = false;
        String message = null;
        try {
            int id = Integer.parseInt(id_raw);
            updateSuccess = accountDAO.updateProfile(id, email, user, address, profileImage, phoneNumber);

            if (updateSuccess) {
                message = "Cập nhật hồ sơ thành công.";
            } else {
                message = "Có lỗi xảy ra. Vui lòng thực hiện lại.";
            }

        } catch (NumberFormatException e) {

        }

        Account account = (Account) session.getAttribute("account");
        Account acc2 = accountDAO.getAccountDetail(account.getEmail());
        request.setAttribute("account", acc2);

        // Set the message attribute and forward to the JSP
        request.setAttribute("ms", message);
        request.getRequestDispatcher("profileAccount.jsp").forward(request, response);
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
