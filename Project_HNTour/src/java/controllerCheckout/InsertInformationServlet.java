/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerCheckout;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import model.Account;
import model.InformationAccount;

/**
 *
 * @author hello
 */
@WebServlet(name = "InsertInformationServlet", urlPatterns = {"/insertinformation"})
public class InsertInformationServlet extends HttpServlet {

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
            out.println("<title>Servlet InsertInformationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertInformationServlet at " + request.getContextPath() + "</h1>");
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
        DAO dao = new DAO();
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String birthday_raw = request.getParameter("birthday");
        String phoneNumber = request.getParameter("phoneNumber");
        Date birthday;
        Account account = (Account) session.getAttribute("account");
        try {
            birthday = Date.valueOf(birthday_raw);
            boolean result = dao.insertInformationAccount(email, username, phoneNumber, birthday, account.getId());
            List<InformationAccount> listInformationAccount = dao.getListInformationByIdAcc(account.getId());
            InformationAccount infoAcc = dao.getInformationAccountById(account.getId());

            if (result) {
                request.setAttribute("infoAcc", infoAcc);
                request.setAttribute("listInforAcc", listInformationAccount);
                request.setAttribute("mess", "Thêm thông tin thành công");
            } else {
                request.setAttribute("mess", "Thêm thông tin không thành công!");
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        request.getRequestDispatcher("fillBuyerInformation.jsp").forward(request, response);
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
