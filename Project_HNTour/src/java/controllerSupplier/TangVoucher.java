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
import java.util.List;
import model.Account;
import model.AccountVoucher;
import model.TopProduct;

/**
 *
 * @author Admin
 */
@WebServlet(name="TangVoucher", urlPatterns={"/tangvoucher"})
public class TangVoucher extends HttpServlet {
   
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
            out.println("<title>Servlet TangVoucher</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TangVoucher at " + request.getContextPath () + "</h1>");
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
          String aid_raw = request.getParameter("aid");
          int aid=Integer.parseInt(aid_raw);
        DAO dao = new DAO();
        request.setAttribute("account", account);
         List<AccountVoucher> voucherofaccount = dao.voucherOfAccount(account.getId());
        request.setAttribute("voucher", voucherofaccount);

         List<TopProduct> listAccVoucher = dao.AccountIdVoucher(account.getId(),aid);
    request.setAttribute("users", listAccVoucher);
       
        request.getRequestDispatcher("TangVoucher.jsp").forward(request, response);
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
    HttpSession session = request.getSession();
   
    // Retrieve form parameters
    String code = request.getParameter("code");
    int discountPercentage = Integer.parseInt(request.getParameter("discountPercentage"));
    boolean status = "1".equals(request.getParameter("status")); // Convert "1" to true, "0" to false
    int supplierId = Integer.parseInt(request.getParameter("supplierId"));
    
    DAO dao = new DAO();
    boolean isCodeExists = dao.isVoucherCodeExists(code,supplierId); // Check if the code already exists

    String nguoinhan_raw = request.getParameter("nguoinhan");
// Check if nguoinhan_raw is empty or null
    int nguoinhan = (nguoinhan_raw != null && !nguoinhan_raw.isEmpty()) ? Integer.parseInt(nguoinhan_raw) : 0;
try {
  


    // Validate and insert into the database
    if (!isCodeExists) {
        // Assuming you have a method to insert a new voucher in DAO
        dao.insertVoucher(code, discountPercentage, status, supplierId, nguoinhan);
        session.setAttribute("tangvoucher", "Tặng Voucher thành công!");
    } else {
        session.setAttribute("tangvoucher", "Mã code Voucher đã tồn tại trước đó. Vui lòng thử lại!");
    }
} catch (NumberFormatException e) {
    // Handle the case where nguoinhan_raw is not a valid integer
    session.setAttribute("tangvoucher", "Lỗi khi xử lý người nhận. Vui lòng chọn lại!");
}

   
        Account account = (Account) session.getAttribute("account");
       
        request.setAttribute("account", account);
         List<AccountVoucher> voucherofaccount = dao.voucherOfAccount(account.getId());
        request.setAttribute("voucher", voucherofaccount);

         List<TopProduct> listAccVoucher = dao.listAccountsVoucher(account.getId());
    request.setAttribute("users", listAccVoucher);

// Redirect to the manager voucher page
 response.sendRedirect("tangvoucher?aid=" + nguoinhan);

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
