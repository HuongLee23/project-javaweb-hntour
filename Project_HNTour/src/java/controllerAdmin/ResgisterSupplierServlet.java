/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import model.Account;

/**
 *
 * @author hello
 */
@WebServlet(name = "ResgisterSupplierServlet", urlPatterns = {"/resgistersupplier"})
public class ResgisterSupplierServlet extends HttpServlet {

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
            out.println("<title>Servlet ResgisterSupplierServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResgisterSupplierServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        AdminDAO admindao = new AdminDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String fullName = request.getParameter("fullName");
        String birthday_raw = request.getParameter("birthday");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String frontCMND = request.getParameter("frontCMND");
        String backCMND = request.getParameter("backCMND");

        String nameCompany = request.getParameter("nameCompany");
        String addressCompany = request.getParameter("addressCompany");
        String emailCompany = request.getParameter("emailCompany");
        String phoneNumberCompany = request.getParameter("phoneNumberCompany");

        String businessCode = request.getParameter("businessCode");
        String businessRegis = request.getParameter("businessRegis");
        String taxCertificate = request.getParameter("taxCertificate");
        String taxPayment = request.getParameter("taxPayment");

        Date birthday;
        if (account == null) {
            response.sendRedirect("login.jsp");
        } else {
            birthday = Date.valueOf(birthday_raw);
            boolean result = admindao.registerSupplier(
                    account.getId(), fullName, birthday,
                    email, phoneNumber, frontCMND, backCMND, nameCompany,
                    addressCompany, emailCompany, phoneNumberCompany,
                    businessCode, businessRegis, taxCertificate, taxPayment
            );

            if (result) {
                request.setAttribute("ms", "Gửi đơn đăng ký thành công");
            } else {
                request.setAttribute("ms", "Gửi đơn đăng ký thất bại!");
            }
            request.getRequestDispatcher("upsupplier.jsp").forward(request, response);
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
