
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
import java.util.List;
import model.Blog;
import model.Tour;

/**
 *
 * @author admin
 */
@WebServlet(name = "SearchBlogServlet", urlPatterns = {"/searchblog"})
public class SearchBlogServlet extends HttpServlet {

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
        DAO dao = new DAO();
        List<Blog> searchBlog = dao.searchBlogByName(search);

        PrintWriter out = response.getWriter();
        for (Blog blog : searchBlog) {
            out.println("<div class=\"blog_post\">");
            out.println("    <div class=\"blog_post_image\">");
            out.println("        <img src=\"" + blog.getImage() + "\" alt=\"alt\"/>");
            out.println("        <div class=\"blog_post_date d-flex flex-column align-items-center justify-content-center\">");
            out.println("            <div class=\"blog_post_day\">01</div>");
            out.println("            <div class=\"blog_post_month\">Dec, 2017</div>");
            out.println("        </div>");
            out.println("    </div>");
            out.println("    <div class=\"blog_post_meta\">");
            out.println("        <ul>");
            out.println("            <li class=\"blog_post_meta_item\"><a href=\"\">" + blog.getAccountName() + "</a></li>");
            out.println("            <li class=\"blog_post_meta_item\"><a href=\"\">3 Comments</a></li>");
            out.println("        </ul>");
            out.println("    </div>");
            out.println("    <div class=\"blog_post_title\"><a href=\"blogdetail?id=" + blog.getBid() + "\">" + blog.getTitle() + "</a></div>");
            out.println("    <div class=\"blog_post_text\">");
            out.println("");
            out.println("    </div>");
            out.println("    <div class=\"blog_post_link\"><a href=\"blogdetail?id=" + blog.getBid() + "\">Tìm hiểu thêm</a></div>");
            out.println("</div>");

        }
        out.flush();
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

