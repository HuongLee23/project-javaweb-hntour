/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerTour;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.List;
import model.Account;
import model.Category;
import model.Feedback;
import model.ImageAlbum;
import model.Schedules;
import model.Tour;

/**
 *
 * @author admin
 */
@WebServlet(name = "TourDetailServlet", urlPatterns = {"/detail"})
public class TourDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet TourDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TourDetailServlet at " + request.getContextPath() + "</h1>");
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

        String id_raw = request.getParameter("tid");

        int id;
        String id_relate = null;
        if (id_raw == null) {
            id_raw = (String) session.getAttribute("tid");
            id_relate = id_raw;
        } else {
            id_relate = request.getParameter("tid");
        }

        id = Integer.parseInt(id_raw);
        Tour p = dao.getDetail(id);
        request.setAttribute("detail", p);

        int id_rel = Integer.parseInt(id_relate);
        List<Tour> tour_relate = dao.getRelateTour(p.getCategoryId(), id_rel);
        request.setAttribute("relate", tour_relate);
//// phan trangg
        List<Feedback> list_Feedback1 = dao.getFeedbackDetailTour(id);
        int page = 1;
        int recordsPerPage = 3; // Số lượng phản hồi trên mỗi trang

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        int startIndex = (page - 1) * recordsPerPage;
        int endIndex = Math.min(startIndex + recordsPerPage, list_Feedback1.size());

        List<Feedback> pagedFeedback = list_Feedback1.subList(startIndex, endIndex);
        int totalPages = (int) Math.ceil((double) list_Feedback1.size() / recordsPerPage);

        request.setAttribute("pagedFeedback", pagedFeedback);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);

// Tiếp tục với phần logic khác...
        List<Feedback> list_Feedback = dao.getFeedbackDetailTour(id);
        List<Category> listCategory = dao.getListCategory();
        List<Schedules> list_Schedules = dao.getSchedukesById(id);
        Account account = (Account) session.getAttribute("account");
        double averageRating = 0;
        if (list_Feedback != null && !list_Feedback.isEmpty()) {
            int totalRating = 0;
            for (Feedback feedback : list_Feedback) {
                totalRating += feedback.getRating();
            }
            averageRating = (double) totalRating / list_Feedback.size();

            DecimalFormat decimalFormat = new DecimalFormat("#.#");
            String formattedRating = decimalFormat.format(averageRating);
            averageRating = Double.parseDouble(formattedRating.replace(',', '.'));
        }
        int totalFeedback = list_Feedback.size();
        String overallRating = convertToOverallRating(averageRating);
        request.setAttribute("overallRating", overallRating); // Phần tổng quan

        request.setAttribute("totalFeedback", totalFeedback);
        request.setAttribute("account", account);
        request.setAttribute("schedules", list_Schedules);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("feedback", list_Feedback);
        request.setAttribute("averageRating", averageRating);

        request.getRequestDispatcher("tourdetail.jsp").forward(request, response);
    }

    private String convertToOverallRating(double averageRating) {
        if (averageRating >= 0 && averageRating < 3) {
            return "Bad";
        } else if (averageRating >= 3 && averageRating < 4) {
            return "Fair";
        } else {
            return "Very Good";
        }
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
