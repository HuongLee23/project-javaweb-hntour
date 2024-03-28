/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerSupplier;

import dal.DAOConfirmOrder;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.TopProduct;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ConfirmOrder", urlPatterns = {"/confirmorder"})
public class ConfirmOrder extends HttpServlet {

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

            out.println("<title>Servlet ConfirmOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmOrder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        List<TopProduct> orders = new ArrayList<>();
        DAOConfirmOrder od = new DAOConfirmOrder();
        orders = od.getListOrderPending(account.getId());
        request.setAttribute("confirmod", orders);
        request.getRequestDispatcher("confirmOrder.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        // Lấy các tham số startDate, endDate, startDateDi và endDateDi từ request
        String startDateMua_raw = request.getParameter("startDateMua");
        String endDateMua_raw = request.getParameter("endDateMua");
        String startDateDi_raw = request.getParameter("startDateDi");
        String endDateDi_raw = request.getParameter("endDateDi");

        DAOConfirmOrder od = new DAOConfirmOrder();

        try {
            List<TopProduct> orders = new ArrayList<>();

            // Xử lý tìm kiếm ngày mua
            if (startDateMua_raw != null && endDateMua_raw != null) {
                LocalDate startDateMua = LocalDate.parse(startDateMua_raw);
                LocalDate endDateMua = LocalDate.parse(endDateMua_raw);
                List<TopProduct> ordersMua = od.searchOrdersByDateRange(account.getId(), startDateMua, endDateMua);
                orders.addAll(ordersMua);
            }

            // Xử lý tìm kiếm ngày đi
            if (startDateDi_raw != null && endDateDi_raw != null) {
                LocalDate startDateDi = LocalDate.parse(startDateDi_raw);
                LocalDate endDateDi = LocalDate.parse(endDateDi_raw);
                List<TopProduct> ordersDi = od.searchOrdersByDateDi(account.getId(), startDateDi, endDateDi);
                orders.addAll(ordersDi);
            }

            // Đặt danh sách đơn hàng vào thuộc tính của request để sử dụng trong JSP
            request.setAttribute("confirmod", orders);
        } catch (DateTimeParseException e) {
            // Xử lý lỗi khi chuyển đổi ngày thất bại hoặc lỗi SQL (nếu cần)
            System.out.println(e);
        } catch (SQLException ex) {
            Logger.getLogger(ConfirmOrder.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Chuyển hướng người dùng đến trang confirmOrder.jsp
        request.getRequestDispatcher("confirmOrder.jsp").forward(request, response);
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
