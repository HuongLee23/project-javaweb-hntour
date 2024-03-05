/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.AdminDAO;
import jakarta.servlet.RequestDispatcher;
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
import model.Supplier;

/**
 *
 * @author hello
 */
@WebServlet(name = "ManagerRegisterSupplierServlet", urlPatterns = {"/managerregistersupplier"})
public class ManagerRegisterSupplierServlet extends HttpServlet {

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
            out.println("<title>Servlet ManagerRegisterSupplierServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerRegisterSupplierServlet at " + request.getContextPath() + "</h1>");
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
//        int role = Integer.parseInt(role_raw);
        // Gọi phương thức để lấy danh sách tài khoản từ cơ sở dữ liệu
        List<Supplier> listAccounts = getAllAccountsFromDatabase();

        // Tính toán số trang
        int totalPages = (int) Math.ceil((double) listAccounts.size() / itemsPerPage);
        // Lấy sublist của danh sách để hiển thị trên trang hiện tại
        List<Supplier> currentPageData = getCurrentPageData(listAccounts, currentPage, itemsPerPage);
        int totalRegisterSupplier = listAccounts.size();
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
        request.setAttribute("totalRegisterSupplier", totalRegisterSupplier);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("totalBanned", totalBanned);

        // Chuyển hướng (forward) request và response đến trang JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("../view/admin/managerregistersupplier.jsp");
        dispatcher.forward(request, response);
    }

    private List<Supplier> getAllAccountsFromDatabase() {
        AdminDAO mnacc = new AdminDAO();
        List<Supplier> listAccounts = mnacc.getListRegisterSupplier();
        return listAccounts;
    }

    private List<Supplier> getCurrentPageData(List<Supplier> listAccounts, int currentPage, int itemsPerPage) {
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
        String idAcc_raw = request.getParameter("idAcc");
        String pageStr = request.getParameter("page");
        AdminDAO mnAccount = new AdminDAO();

        try {
            int currentPage = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
            int idAcc = Integer.parseInt(idAcc_raw);
            int itemsPerPage = 10;

            boolean result = mnAccount.confirmRegisterSupplier(idAcc);
            if (result) {
                request.setAttribute("msRegisterSupplier", "Xác nhận chuyển đổi role thành công.");
            } else {
                request.setAttribute("msRegisterSupplier", "Xác nhận chuyển đổi role thất bại!");
            }

            // Gọi phương thức để lấy danh sách tài khoản từ cơ sở dữ liệu
            List<Supplier> listAccounts = getAllAccountsFromDatabase();

            // Tính toán số trang
            int totalPages = (int) Math.ceil((double) listAccounts.size() / itemsPerPage);
            // Lấy sublist của danh sách để hiển thị trên trang hiện tại
            List<Supplier> currentPageData = getCurrentPageData(listAccounts, currentPage, itemsPerPage);
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
            request.setAttribute("totalPrice", totalPrice);
            request.setAttribute("totalBanned", totalBanned);

            // Chuyển hướng (forward) request và response đến trang JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("../view/admin/managerregistersupplier.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
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
