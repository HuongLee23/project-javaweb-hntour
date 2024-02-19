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
@WebServlet(name = "ProcessCartServlet", urlPatterns = {"/processcart"})
public class ProcessCartServlet extends HttpServlet {

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
            out.println("<title>Servlet ProcessCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessCartServlet at " + request.getContextPath() + "</h1>");
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
        Cart cart = new Cart(txt, list);

        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        int num, id;

        try {
            id = Integer.parseInt(id_raw);
            num = Integer.parseInt(num_raw);

            if (num == -1 && (cart.getQuantityById(id) >= 1)) {
                Item i = cart.getItemById(id);
                i.setQuantity(i.getQuantity() - 1);
                i.setPrice(i.getQuantity() * i.getTour().getPrice());
                if (i.getQuantity() == 0) {
                    cart.removeItem(id);
                }
            } else if (num == 1) {
                Item i = cart.getItemById(id);
                i.setQuantity(i.getQuantity() + 1);
                i.setPrice(i.getQuantity() * i.getTour().getPrice());

            }

        } catch (NumberFormatException e) {
        }

        List<Item> items = cart.getItems();
        int size;
        if (items != null) {
            size = items.size();
        } else {
            size = 0;
        }
        txt = "";
        if (!items.isEmpty()) {
            txt = items.get(0).getTour().getId() + ":" + items.get(0).getQuantity();
            for (int i = 1; i < items.size(); i++) {
                txt += "/" + items.get(i).getTour().getId() + ":" + items.get(i).getQuantity();
            }
        }

        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(c);

        session.setAttribute("sizeCart", size);
        session.setAttribute("listItem", items);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("showcart.jsp").forward(request, response);

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
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        String id = request.getParameter("id");

        String[] ids = txt.split("/");
        String out = "";

        for (String id1 : ids) {
            String[] s = id1.split(":");
            if (!s[0].equals(id)) {
                if (out.isEmpty()) {
                    out = id1;
                } else {
                    out += "/" + id1;
                }
            }
        }

        if (!out.isEmpty()) {
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(60 * 60 * 24 * 7);
            response.addCookie(c);
        }

        Cart cart = new Cart(out, list);
        List<Item> items = cart.getItems();
        int size;
        if (items != null) {
            size = items.size();
        } else {
            size = 0;
        }
        request.setAttribute("cart", cart);
        session.setAttribute("sizeCart", size);
        session.setAttribute("listItem", items);
        request.getRequestDispatcher("showcart.jsp").forward(request, response);
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
