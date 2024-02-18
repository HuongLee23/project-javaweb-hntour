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
import java.text.DecimalFormat;
import java.util.List;
import model.Tour;

/**
 *
 * @author hello
 */
@WebServlet(name = "SearchAjaxServlet", urlPatterns = {"/searchajax"})
public class SearchAjaxServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");

        String search = request.getParameter("txt");
        DAO d = new DAO();
        List<Tour> list = d.searchByName(search);

        PrintWriter out = response.getWriter();

        for (Tour tour : list) {
            out.println("<div class=\"offers_item rating_4\">");
            out.println("    <div class=\"row\">");
            out.println("        <div class=\"col-lg-1 temp_col\"></div>");
            out.println("        <div class=\"col-lg-3 col-1680-4\">");
            out.println("            <div class=\"offers_image_container\">");
            out.println("                <a class=\"add_to_card\" href=\"additem?id=" + tour.getId() + "&num=1\">");
            out.println("                    <i class=\"icon_card fa-solid fa-cart-plus\" style=\"color: #e2492b\" ></i>");
            out.println("                </a>");
            out.println("                <img  class=\"card-img-top\" src=\"" + tour.getImageMain() + "\">");
            out.println("                <div class=\"offer_name\"><span >" + formatCurrency(tour.getPrice()) + " VNĐ</span></div>");
            out.println("            </div>");
            out.println("        </div>");
            out.println("        <div class=\"col-lg-8\">");
            out.println("            <div class=\"offers_content\">");
            out.println("                <div class=\"offers_price\" style=\"font-size: 25px\">" + tour.getName() + "");
            out.println("                    <div><span>Thời gian dự kiến hết: " + tour.getIntendedTime() + "</span></div>");
            out.println("                </div>");
            out.println("                <p class=\"offers_text\">" + truncateDescription(tour.getDescription()) + "</p>");
            out.println("                <div style=\"background-color: #ee4d2d;\" class=\"button book_button\"><a href=\"#\">Mua ngay<span></span><span></span><span></span></a></div>");
            out.println("                <div class=\"button book_button\"><a href=\"detail?tid=" + tour.getId() + "\">Xem chi tiết</a></div>");
            out.println("            </div>");
            out.println("        </div>");
            out.println("    </div>");
            out.println("</div>");
        }

        out.flush();
    }

    // Format currency using DecimalFormat
    private String formatCurrency(double amount) {
        DecimalFormat formatter = new DecimalFormat("###,### VNĐ");
        return formatter.format(amount);
    }

    // Truncate description if its length exceeds 200 characters
    private String truncateDescription(String description) {
        if (description.length() > 200) {
            return description.substring(0, 200) + "...";
        } else {
            return description;
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
