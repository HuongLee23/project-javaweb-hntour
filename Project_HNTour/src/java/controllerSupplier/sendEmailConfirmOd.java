/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllerSupplier;

import dal.DAO;
import dal.DAOConfirmOrder;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

import ulti.sendEmailConfirm;
import ulti.sendEmailReject;

/**
 *
 * @author Admin
 */

@WebServlet(name="sendEmailConfirmOd", urlPatterns={"/sendconfirmod"})
public class sendEmailConfirmOd extends HttpServlet {
   
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

            out.println("<title>Servlet sendEmailConfirmOd</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sendEmailConfirmOd at " + request.getContextPath () + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

    Account account = (Account) session.getAttribute("account");
    String action = request.getParameter("action"); // Lấy giá trị của trường ẩn "action"
    String idtour_raw = request.getParameter("tourId");
    String orderId_raw = request.getParameter("orderId");
    String email = request.getParameter("email");
 
   String nametour = request.getParameter("nametour");
    DAOConfirmOrder od = new DAOConfirmOrder();

        sendEmailConfirm send = new sendEmailConfirm();
       sendEmailReject send1 = new sendEmailReject();
      String date = request.getParameter("ngaydi");
java.util.Date ngayDiUtilDate = null;

try {
    // Chuyển đổi chuỗi ngày thành đối tượng java.util.Date
    ngayDiUtilDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
} catch (ParseException e) {
    e.printStackTrace();
}

// Tạo đối tượng java.sql.Date từ java.util.Date
java.sql.Date ngayDiSqlDate = new java.sql.Date(ngayDiUtilDate.getTime());
        DAO d = new DAO();
String message, messageEmail;
        try {
        int idtour = Integer.parseInt(idtour_raw);
        int idorder = Integer.parseInt(orderId_raw);
        if ("accept".equals(action)) { // Nếu hành động là chấp nhận
            boolean result = od.confirmSupplier(idorder, idtour);
            if (result) {
                session.setAttribute("msRegisterSupplier", "Chấp nhận đơn hàng thành công");
                messageEmail = "Chúc mừng bạn đã đặt Tour '"+ nametour +"' thành công.";
            
                String sendEmail = email;
               
                send.sendMailConfirm(sendEmail,nametour,ngayDiSqlDate,messageEmail);
                message = "Quý khách vui lòng nhập mã xác thực để yêu cầu đặt lại mật khẩu. Hà Nội Tour sẽ xác nhận mã đã gửi tới email.";
                session.setAttribute("sendEmail", sendEmail);
                request.setAttribute("message", message);
                response.sendRedirect("confirmorder");
            }
            } else if ("reject".equals(action)) { 
            boolean result = od.cancelSupplier(idorder, idtour);
            if (result) {
                 messageEmail = "Tour '"+ nametour +"' đã không được chấp nhận.";
            
                String sendEmail = email;
               
                send1.sendMailReject(sendEmail,nametour,ngayDiSqlDate,messageEmail);
                message = "Quý khách vui lòng nhập mã xác thực để yêu cầu đặt lại mật khẩu. Hà Nội Tour sẽ xác nhận mã đã gửi tới email.";
                session.setAttribute("sendEmail", sendEmail);
                request.setAttribute("message", message);
               
                session.setAttribute("msRegisterSupplier", "Từ chối đơn hàng");
                 response.sendRedirect("confirmorder");
            } else {
                session.setAttribute("msRegisterSupplier", "Từ chối đơn hàng thất bại");
            }
            
        }
    } catch (NumberFormatException e) {
        // Xử lý ngoại lệ khi không thể chuyển đổi sang số
        e.printStackTrace();
    }
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
        processRequest(request, response);
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
