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
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Account;
import model.Category;
import model.Schedules;
import model.Tour;

/**
 *
 * @author Admin
 */
@WebServlet(name="AddTour", urlPatterns={"/addtour"})
public class AddTour extends HttpServlet {
   
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
            out.println("<title>Servlet AddTour</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddTour at " + request.getContextPath () + "</h1>");
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
    DAO dao = new DAO();
    HttpSession session = request.getSession();
    Account account = (Account) session.getAttribute("account");
    
    // Get supplierID from the account or any other source
    int supplierID = account.getId();
    
    // Retrieve the list of tours based on the supplierID
    List<Tour> tourList = dao.getTourBySupllierID(supplierID);

    // Set attributes for the request
    request.setAttribute("tour", tourList);
    request.setAttribute("supplierID", supplierID);

    // Retrieve the list of categories
    List<Category> listC = dao.getListCategory();
    request.setAttribute("listC", listC);

    // Forward to AddTour.jsp
    request.getRequestDispatcher("AddTour.jsp").forward(request, response);
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
    request.setCharacterEncoding("UTF-8");

    // Retrieve form parameters

    String id_raw = request.getParameter("supplierID");
    String name = request.getParameter("name");
    String imageMain = request.getParameter("imageMain");
    String[] existingImageAlbumArray = request.getParameterValues("existingImageAlbum");
    String[] additionalImages = request.getParameterValues("additionalImages");
    String time_raw = request.getParameter("time");
    String price = request.getParameter("price");
    String description = request.getParameter("description");
    String category = request.getParameter("category");
    String rule = request.getParameter("rule");

    // Validate form parameters (add your validation logic here)
    // (e.g., check if required fields are not empty, validate numeric values, etc.)

    // Convert String values to appropriate types
    int cid = Integer.parseInt(category);
    int supplierId = Integer.parseInt(id_raw);

    
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

    // Assuming you have a DAO method to handle the insert operation
    DAO dao = new DAO();

    // Insert tour
    dao.insertTour(name, imageMain, Arrays.asList(imageAlbumString.split("/splitAlbum/")), time, price, description, cid, rule, supplierId);

//String newLocation = request.getParameter("newLocations");
//String newDateRaw = request.getParameter("newDates");
//String newDescription = request.getParameter("newDescriptions");
//
//// Convert the date string to a Time object (assuming it's stored as Time in your database)
//Time newTimeSchedule = Time.valueOf(LocalTime.parse(newDateRaw));
//
//// Call your DAO method to insert the new schedule
//// Assuming dao is an instance of your DAO class with the insertSchedule method
//dao.insertSchedule(newLocation, newTimeSchedule, newDescription);

// Redirect to the tour list page
response.sendRedirect("managertourlist");

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
