/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import controller.*;
import dal.AdminDAO;
import dal.DAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Account;
import model.FeedbackWeb;
import model.Supplier;

/**
 *
 * @author Admin
 */
public class ManagerAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet ManagerAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerAccountServlet at " + request.getContextPath() + "</h1>");
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
        String pageStr = request.getParameter("page");
        int currentPage = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
        int itemsPerPage = 10;
        AdminDAO mnAccount = new AdminDAO();

        // Gọi phương thức để lấy danh sách tài khoản từ cơ sở dữ liệu
        int roleAll = 0;
        List<Account> listAccounts = getAllAccountsFromDatabase(roleAll);
        // Tính toán số trang
        int totalPages = (int) Math.ceil((double) listAccounts.size() / itemsPerPage);
        // Lấy sublist của danh sách để hiển thị trên trang hiện tại
        List<Account> currentPageData = getCurrentPageData(listAccounts, currentPage, itemsPerPage);
        int totalAccountCustomer = mnAccount.countAccountCustomer();
        int totalAccountSupplier = mnAccount.countAccountSupplier();
        String totalPrice = mnAccount.totalPrice();
        int totalBanned = mnAccount.totalAccountBanned();

        // Gán danh sách tài khoản vào request để truy cập từ trang JSP
        request.setAttribute("currentPageData", currentPageData);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalcustomer", totalAccountCustomer);
        request.setAttribute("totalsupplier", totalAccountSupplier);
        List<Supplier> listResgisterSupplier = mnAccount.getListRegisterSupplier();
        int totalRegisterSupplier = listResgisterSupplier.size();
        DAO dao = new DAO();
        List<FeedbackWeb> listFeedbacks = dao.getListFeedbackWeb();
        int totalFeedback = listFeedbacks.size();
        request.setAttribute("totalRegisterSupplier", totalRegisterSupplier);
        request.setAttribute("totalFeedback", totalFeedback);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("totalBanned", totalBanned);

        // Chuyển hướng (forward) request và response đến trang JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("../view/admin/manageraccount.jsp");
        dispatcher.forward(request, response);
    }

    private List<Account> getAllAccountsFromDatabase(int roleAll) {
        AdminDAO mnacc = new AdminDAO();
        List<Account> listAccounts = mnacc.getListAccount(roleAll);
        return listAccounts;
    }

    private List<Account> getCurrentPageData(List<Account> listAccounts, int currentPage, int itemsPerPage) {
        // Tính vị trí bắt đầu và kết thúc của sublist
        int start = (currentPage - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, listAccounts.size());

        // Lấy sublist từ danh sách account
        return listAccounts.subList(start, end);
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
