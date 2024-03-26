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
import java.util.List;
import model.Account;
import model.TopProduct;

/**
 *
 * @author Admin
 */

@WebServlet(name="ConfirmOrder", urlPatterns={"/confirmorder"})
public class ConfirmOrder extends HttpServlet {
   
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

            out.println("<title>Servlet ConfirmOrder</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmOrder at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
         DAOConfirmOrder dc = new DAOConfirmOrder();
        List<TopProduct> listOd = dc.getListOrderPending(account.getId());
        request.setAttribute("confirmod", listOd);
        request.getRequestDispatcher("confirmOrder.jsp").forward(request, response);
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
protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    HttpSession session = request.getSession();
    Account account = (Account) session.getAttribute("account");
    String action = request.getParameter("action"); // Lấy giá trị của trường ẩn "action"
    String idtour_raw = request.getParameter("tourId");
    String orderId_raw = request.getParameter("orderId");
    DAOConfirmOrder od = new DAOConfirmOrder();
    
    try {
        int idtour = Integer.parseInt(idtour_raw);
        int idorder = Integer.parseInt(orderId_raw);
        if ("accept".equals(action)) { // Nếu hành động là chấp nhận
            boolean result = od.confirmSupplier(idorder, idtour);
            if (result) {
                session.setAttribute("msRegisterSupplier", "Xác nhận đơn hàng thành công");
            } else {
                session.setAttribute("msRegisterSupplier", "Xác nhận đơn hàng thất bại");
            }
        } else if ("reject".equals(action)) { // Nếu hành động là từ chối
            boolean result = od.cancelSupplier(idorder, idtour);
            if (result) {
                session.setAttribute("msRegisterSupplier", "Từ chối đơn hàng");
            } else {
                session.setAttribute("msRegisterSupplier", "Từ chối đơn hàng thất bại");
            }
        } 
        
       
    } catch (NumberFormatException e) {
        System.out.println(e);
    }
   response.sendRedirect("confirmorder");
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
