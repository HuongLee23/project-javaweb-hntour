/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerSupplier;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.TopProduct;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListCustomerDamua", urlPatterns = {"/listcustomerdamua"})
public class ListCustomerDamua extends HttpServlet {

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
            out.println("<title>Servlet ListCustomerDamua</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListCustomerDamua at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        // Check if the account is valid
        if (account != null) {
            DAO dao = new DAO();
            List<TopProduct> listInvoice = dao.listInvoice(account.getId());

            // Set the listInvoice attribute in the request
            request.setAttribute("listInvoice", listInvoice);

            // Forward the request to the "DanhSachKhachHangDamua.jsp" page
            request.getRequestDispatcher("DanhSachKhachHangDamua.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String startDateMua_raw = request.getParameter("startDate");
        String endDateMua_raw = request.getParameter("endDate");

        DAO od = new DAO();

        try {
            List<TopProduct> orders = new ArrayList<>();

            // Xử lý tìm kiếm ngày mua
            if (startDateMua_raw != null && endDateMua_raw != null) {
                LocalDate startDateMua = LocalDate.parse(startDateMua_raw);
                LocalDate endDateMua = LocalDate.parse(endDateMua_raw);
                List<TopProduct> ordersMua = od.listInvoiceByDate(account.getId(), startDateMua, endDateMua);
                orders.addAll(ordersMua);
            }
            request.setAttribute("listInvoice", orders);
        } catch (DateTimeParseException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("DanhSachKhachHangDamua.jsp").forward(request, response);
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
