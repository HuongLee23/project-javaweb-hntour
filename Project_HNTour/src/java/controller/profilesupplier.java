/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "profilesupplier", urlPatterns = {"/profilesupplier"})
public class profilesupplier extends HttpServlet {

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
            out.println("<title>Servlet profilesupplier</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profilesupplier at " + request.getContextPath() + "</h1>");
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
        AccountDAO accountDAO = new AccountDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        Account acc2 = accountDAO.getAccountDetail(account.getEmail());
        request.setAttribute("account", acc2);
        request.getRequestDispatcher("ProfileSupplier.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SecurityException {
        try {
//        Part part = (Part) request.getPart("profileImage");
//        String realPath = request.getServletContext().getRealPath("/images");
//
//        // Create the directory if it doesn't exist
//        if (!Files.exists(Paths.get(realPath))) {
//            Files.createDirectory(Paths.get(realPath));
//        }
//
//        // Save the file to the specified location
//        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//        Files.copy(part.getInputStream(), Paths.get(realPath, filename), StandardCopyOption.REPLACE_EXISTING);
//
//        String profileImage = "images/" + filename; // Adjust the path as needed

            // Retrieve other form parameters
            String profileImage = request.getParameter("profileImage");
            String username = request.getParameter("username");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phone");
            int userId = Integer.parseInt(request.getParameter("id"));
            String email = request.getParameter("email");

            AccountDAO accountDAO = new AccountDAO();
            HttpSession session = request.getSession();
            boolean updateSuccess = accountDAO.updateProfile(userId, email, username, address, profileImage, phoneNumber);

            String message = (updateSuccess) ? "Cập nhật hồ sơ thành công." : "Có lỗi xảy ra. Vui lòng thực hiện lại.";

            // Update session attribute and forward the request
            Account account = (Account) session.getAttribute("account");
            Account acc2 = accountDAO.getAccountDetail(account.getEmail());
            request.setAttribute("account", acc2);
            request.setAttribute("ms", message);
            request.getRequestDispatcher("ProfileSupplier.jsp").forward(request, response);

        } catch (Exception e) {
            // Handle or log the exception
            e.printStackTrace(); // Log the exception, or use a logging framework
            response.sendRedirect("error.jsp"); // Redirect to an error page
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
