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
import java.util.List;
import model.Account;
import model.Tour;
import model.Voucher;

/**
 *
 * @author Admin
 */
@WebServlet(name="ManagerVoucher", urlPatterns={"/managervoucher"})
public class ManagerVoucher extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagerVoucher</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerVoucher at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        DAO dao = new DAO();
        request.setAttribute("account", account);
        List<Voucher> voucherList = dao.getVoucherBySupllierID(account.getId());

        request.setAttribute("voucher", voucherList);

        request.getRequestDispatcher("ManagerVoucher.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    // Retrieve form parameters
    String code = request.getParameter("code");
    int discountPercentage = Integer.parseInt(request.getParameter("discountPercentage"));
    boolean status = "1".equals(request.getParameter("status")); // Convert "1" to true, "0" to false
    int supplierId = Integer.parseInt(request.getParameter("supplierId"));

    DAO dao = new DAO();
    boolean isCodeExists = dao.isVoucherCodeExists(code); // Check if the code already exists

    // Validate and insert into the database
    if (!isCodeExists) {
        try {
            // Assuming you have a method to insert a new voucher in DAO
            dao.insertVoucher(code, discountPercentage, status, supplierId);
            request.setAttribute("error", "Thêm Voucher thành công !");
            
        } catch (Exception e) {
            
            request.setAttribute("error", "Lỗi khi thêm voucher. Vui lòng thử lại!");
            
        }
    } else {
        request.setAttribute("error", "Mã code Voucher đã tồn tại trước đó. Vui lòng thử lại !");
 
    }

     HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
    List<Voucher> voucherList = dao.getVoucherBySupllierID(account.getId());

        request.setAttribute("voucher", voucherList);
 
     request.getRequestDispatcher("ManagerVoucher.jsp").forward(request, response);
}



    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
