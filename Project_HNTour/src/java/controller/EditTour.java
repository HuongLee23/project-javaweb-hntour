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
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Schedules;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditTour", urlPatterns = {"/edittour"})
public class EditTour extends HttpServlet {

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
            out.println("<title>Servlet EditTour</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditTour at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");

        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String imageMain = request.getParameter("imageMain");
        String[] existingImageAlbumArray = request.getParameterValues("existingImageAlbum");
        String[] additionalImages = request.getParameterValues("additionalImages");
        String time_raw = request.getParameter("time");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String rule = request.getParameter("rule");

        // Assuming you have a DAO method to handle the edit operation
        DAO dao = new DAO();

        int cid = Integer.parseInt(category);
        int id = Integer.parseInt(id_raw);

        Time time = Time.valueOf(LocalTime.parse(time_raw));

        // Retrieve additional images from the request
        List<String> allImages = new ArrayList<>();

        // Add existing images to the list
        if (existingImageAlbumArray != null) {
            allImages.addAll(Arrays.asList(existingImageAlbumArray));
        }

        // Add additional images to the list
        if (additionalImages != null) {
            allImages.addAll(Arrays.asList(additionalImages));
        }

        // Join all images using the "/splitAlbum/" delimiter
        String imageAlbumString = String.join("/splitAlbum/", allImages);

        // Edit tour
        dao.editTour(id, name, imageMain, Arrays.asList(imageAlbumString.split("/splitAlbum/")), time, price, description, cid, rule);

        int scheduleCounter = 1; // Start with the initial counter value

        while (true) {
            String locationParam = request.getParameter("locationnew_" + scheduleCounter);
            String dateParam = request.getParameter("datenew_" + scheduleCounter);
            String descriptionParam = request.getParameter("descriptionSchedulesnew_" + scheduleCounter);

            // Break the loop if the parameters for the current schedule do not exist
            if (locationParam == null || dateParam == null || descriptionParam == null) {
                break;
            }

            // Check if dateParam is not null before attempting to parse it
            Time date = Time.valueOf(LocalTime.parse(dateParam));

            // Assuming you have a DAO method to handle the insert operation
            dao.insertSchedule(id, locationParam, date, descriptionParam);

            // Increment the counter for the next set of parameters
            scheduleCounter++;
        }

// Assuming response is an instance of HttpServletResponse
        response.sendRedirect("loadtour?tid=" + id);

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
