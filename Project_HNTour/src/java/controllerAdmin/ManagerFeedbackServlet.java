/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.AdminDAO;
import dal.DAO;
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
import model.Feedback;
import model.FeedbackWeb;

/**
 *
 * @author hello
 */
@WebServlet(name = "ManagerFeedbackServlet", urlPatterns = {"/managerfeedback"})
public class ManagerFeedbackServlet extends HttpServlet {

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
            out.println("<title>Servlet ManagerFeedbackServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerFeedbackServlet at " + request.getContextPath() + "</h1>");
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
        //Phần show feedback của user

        String pageStr = request.getParameter("page");
        int currentPage = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
        int itemsPerPage = 10;

        // Gọi phương thức để lấy danh sách tài khoản từ cơ sở dữ liệu
        List<FeedbackWeb> listFeedbacks = getAllFeedbacksFromDatabase();
        int totalFeedback = listFeedbacks.size();
        // Tính toán số trang
        int totalPages = (int) Math.ceil((double) listFeedbacks.size() / itemsPerPage);
        // Lấy sublist của danh sách để hiển thị trên trang hiện tại
        List<FeedbackWeb> currentPageData = getCurrentPageData(listFeedbacks, currentPage, itemsPerPage);
        request.setAttribute("currentPageData", currentPageData);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalFeedback", totalFeedback);

        RequestDispatcher dispatcher = request.getRequestDispatcher("../view/admin/managerfeedback.jsp");
        dispatcher.forward(request, response);
    }

    private List<FeedbackWeb> getAllFeedbacksFromDatabase() {
        DAO dao = new DAO();
        List<FeedbackWeb> listFeedbacks = dao.getListFeedbackWeb();
        return listFeedbacks;
    }

    private List<FeedbackWeb> getCurrentPageData(List<FeedbackWeb> listFeedbacks, int currentPage, int itemsPerPage) {
        // Tính vị trí bắt đầu và kết thúc của sublist
        int start = (currentPage - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, listFeedbacks.size());

        // Lấy sublist từ danh sách account
        return listFeedbacks.subList(start, end);
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
        //Phần delete feedback của user
        String id_raw = request.getParameter("id");
        AdminDAO adDao = new AdminDAO();
        HttpSession session = request.getSession();
        try {
            int id = Integer.parseInt(id_raw);
            boolean result = adDao.deleteFeedbackWeb(id);
            if (result) {
                session.setAttribute("msDeleteFeedback", "Xóa feedback thành công");
            } else {
                session.setAttribute("msDeleteFeedback", "Xóa feedback thất bại!");
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        response.sendRedirect("managerfeedback");
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
