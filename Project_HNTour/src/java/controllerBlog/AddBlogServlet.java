
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerBlog;

import controller.*;
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

import java.text.SimpleDateFormat;
import model.Account;

/**
 *
 * @author admin
 */
@WebServlet(name = "AddBlogServlet", urlPatterns = {"/addblog"})
public class AddBlogServlet extends HttpServlet {

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
            out.println("<title>Servlet AddBlogServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBlogServlet at " + request.getContextPath() + "</h1>");
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
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        request.setAttribute("account", account);
        request.getRequestDispatcher("addblog.jsp").forward(request, response);
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
  try {
    Date currentDate = new Date(System.currentTimeMillis());
    String formattedDate = new SimpleDateFormat("yyyy-MM-dd").format(currentDate);
    request.setAttribute("currentDate", formattedDate);

    String id_raw = request.getParameter("accountId");
    int supplierId = Integer.parseInt(id_raw);

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String image = request.getParameter("image");
    String status_r = request.getParameter("status");
    int status=Integer.parseInt(status_r);

    DAO d = new DAO();
    d.insertBlog(title, content, image, currentDate, supplierId, status); // Truyền currentDate thay vì currentTimestamp

    // Forward the request and response to the addblog.jsp page
    request.getRequestDispatcher("addblog.jsp").forward(request, response);
} catch (Exception e) {
    // Handle exceptions here, such as printing the stack trace or redirecting to an error page
    e.printStackTrace();
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

