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
import java.util.List;
import model.Tour;

/**
 *
 * @author admin
 */
@WebServlet(name="SortByServlet", urlPatterns={"/sort"})
public class SortByNameServlet extends HttpServlet {
   
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
            out.println("<title>Servlet SortByNameServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortByNameServlet at " + request.getContextPath () + "</h1>");
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
        String sort = request.getParameter("sortBy");
       
        
        if (sort!= null ) {
            DAO d = new DAO();
            List<Tour> list = null;
            String type;
            String typeSort;
            
            
            if (sort.equals("ascPrice")) {
                typeSort = "ASC";
                type="price";
                list = d.getTourBySort(typeSort, type);
            }else if (sort.equals("descPrice")) {
                typeSort = "DESC";
                type="price";
                list = d.getTourBySort(typeSort, type);
            }
            else if (sort.equals("ascName")) {
                typeSort = "ASC";
                type="name";
                list = d.getTourBySort(typeSort, type);
            }else if (sort.equals("descName")) {
                typeSort = "DESC";
                type="name";
                list = d.getTourBySort(typeSort, type);
            }
           
            else if (sort.equals("descRating")) {
                typeSort = "DESC";
                type="rating";
                list = d.getTourBySort(typeSort, type);
            }
            
            request.setAttribute("tour", list);
            
           
            request.getRequestDispatcher("tour.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("tour.jsp").forward(request, response);
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
