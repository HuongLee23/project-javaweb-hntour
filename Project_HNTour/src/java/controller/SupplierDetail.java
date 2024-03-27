/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.List;
import model.Account;
import model.Category;

import model.Feedback;
import model.Schedules;

import model.Supplier;
import model.Tour;

/**
 *
 * @author admin
 */
@WebServlet(name = "SupplierDetail", urlPatterns = {"/supplier"})
public class SupplierDetail extends HttpServlet {

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
            out.println("<title>Servlet SupplierDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SupplierDetail at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("sid"));
        DAO dao = new DAO();
        List<Tour> list = dao.getTourBySupllierID(id);
        request.setAttribute("tour", list);

        // Lấy danh sách feedback và tính giá trị trung bình của rating
        List<Feedback> listFeedback = dao.getFeedbackSupplier(id);
        double averageRating = calculateAverageRating(listFeedback);

        // Truyền giá trị trung bình của rating và danh sách feedback đến JSP
        request.setAttribute("averageRating", averageRating);
        request.setAttribute("feedback", listFeedback);

        int countTour = dao.countTourSupplier(id);
        int countFeedback = dao.countFeedbackSupplier(id);
        int countBlog = dao.countBlogSupplier(id);
        int countOrder = dao.countOrderSupplier(id);
        Supplier sup = dao.getSupplierByID(id);

        request.setAttribute("sup", sup);
        request.setAttribute("countBlog", countBlog);
        request.setAttribute("countFeedback", countFeedback);
        request.setAttribute("countTour", countTour);
        request.setAttribute("countOrder", countOrder);

        request.getRequestDispatcher("supplierdetail.jsp").forward(request, response);
    }

// Phương thức tính toán giá trị trung bình của rating từ danh sách feedback
    private double calculateAverageRating(List<Feedback> feedbackList) {
        if (feedbackList == null || feedbackList.isEmpty()) {
            return 0.0; // Trả về 0 nếu danh sách feedback trống
        }

        int totalRating = 0;
        for (Feedback feedback : feedbackList) {
            totalRating += feedback.getRating();
        }
        return (double) totalRating / feedbackList.size();
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
        processRequest(request, response);
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
