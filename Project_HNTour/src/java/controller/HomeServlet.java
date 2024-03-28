
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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Blog;
import model.Cart;
import model.Category;
import model.FeedbackWeb;
import model.Item;
import model.Tour;

/**
 *
 * @author Asus
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

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
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
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
        List<Blog> list_lasted = dao.getBlogLasted(1);

        List<Tour> list = dao.getAllTour();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, list);
        List<Item> listItem = cart.getItems();
        int size;
        if (listItem != null) {
            size = listItem.size();
        } else {
            size = 0;
        }

        try {
            List<Category> listCategory = dao.getListCategory();
            List<Tour> listTop3Tour = dao.listTop3Tour();
            List<Tour> listNew4Tour = dao.listNew4Tour();
            List<Tour> listTrendTour = dao.listTrendTour();
            List<FeedbackWeb> listFeedbacks = dao.getListFeedbackWeb();
            session.setAttribute("sizeCart", size);
            session.setAttribute("listItem", listItem);
            session.setAttribute("lasted", list_lasted);

            request.setAttribute("listFeedbacks", listFeedbacks);
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listTop3Tour", listTop3Tour);
            request.setAttribute("listNew4Tour", listNew4Tour);
            request.setAttribute("listTrendTour", listTrendTour);
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        } catch (ServletException | IOException e) { // Ghi log ngoại lệ để sửa lỗi
            // Ghi log ngoại lệ để sửa lỗi
            request.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
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
