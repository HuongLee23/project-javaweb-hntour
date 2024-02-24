/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAddToCart;

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
import model.Cart;
import model.Item;
import model.Tour;

/**
 *
 * @author hello
 */
@WebServlet(name = "AddItemServlet", urlPatterns = {"/additem"})
public class AddItemServlet extends HttpServlet {

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
            out.println("<title>Servlet AddItemServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddItemServlet at " + request.getContextPath() + "</h1>");
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

        //Lấy một mảng Cookies để lấy đúng đối tượng có tên là cart
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

        //Lấy id và num củ tour để add vào Cookies
        String num = request.getParameter("num");
        String id = request.getParameter("id");

        if (txt.isEmpty()) {
            txt = id + ":" + num;
        } else {
            txt = txt + "/" + id + ":" + num;
        }

        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(c);

        Cart cart = new Cart(txt, list);
        List<Item> listItem = cart.getItems();
        int size;
        if (listItem != null) {
            size = listItem.size();
        } else {
            size = 0;
        }

        session.setAttribute("sizeCart", size);
        session.setAttribute("listItem", listItem);
        request.getRequestDispatcher("tourlist").forward(request, response);

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
        DAO dao = new DAO();
        HttpSession session = request.getSession();

        //Lấy một mảng Cookies để lấy đúng đối tượng có tên là cart
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

        //Lấy id và num củ tour để add vào Cookies
        String num = request.getParameter("num");
        String id = request.getParameter("id");

        if (txt.isEmpty()) {
            txt = id + ":" + num;
        } else {
            txt = txt + "/" + id + ":" + num;
        }

        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(c);

        Cart cart = new Cart(txt, list);
        List<Item> listItem = cart.getItems();
        int size;
        if (listItem != null) {
            size = listItem.size();
        } else {
            size = 0;
        }

        session.setAttribute("sizeCart", size);
        session.setAttribute("listItem", listItem);
        session.setAttribute("tid", id);
        response.sendRedirect("detail");
//        request.getRequestDispatcher("detail").forward(request, response);
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
