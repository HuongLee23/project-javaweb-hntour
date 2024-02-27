/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerCheckout;

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
import model.Account;
import model.Cart;
import model.InformationAccount;
import model.Item;
import model.Tour;

/**
 *
 * @author hello
 */
@WebServlet(name = "FillInformationBuyerServlet", urlPatterns = {"/fillinformationbuyer"})
public class FillInformationBuyerServlet extends HttpServlet {

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
            out.println("<title>Servlet FillInformationBuyerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FillInformationBuyerServlet at " + request.getContextPath() + "</h1>");
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
//        DAO dao = new DAO();
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("account");
//        if (account == null) {
//            request.setAttribute("error", "Bạn chưa đăng nhập!");
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        } else {
//            //phần show cart
//            List<Tour> list = dao.getAllTour();
//            Cookie[] arr = request.getCookies();
//            String txt = "";
//            if (arr != null) {
//                for (Cookie o : arr) {
//                    if (o.getName().equals("cart")) {
//                        txt += o.getValue();
//                    }
//                }
//            }
//            String id = request.getParameter("id");
//            String num = request.getParameter("num");
//            try {
//
//                if (txt.isEmpty()) {
//                    txt = id + ":" + num;
//                } else {
//                    txt = txt + "/" + id + ":" + num;
//                }
//
//                Cookie c = new Cookie("cart", txt);
//                c.setMaxAge(60 * 60 * 24 * 7);
//                response.addCookie(c);
//
//                Cart cart = new Cart(txt, list);
//                List<Item> listItem = cart.getItems();
//                int size;
//                if (listItem != null) {
//                    size = listItem.size();
//                } else {
//                    size = 0;
//                }
//
//                List<InformationAccount> listInformationAccount = dao.getListInformationByIdAcc(account.getId());
//
//                session.setAttribute("sizeCart", size);
//                session.setAttribute("listItem", listItem);
//                session.setAttribute("cart", cart);
//                session.setAttribute("idSelectOne", id);
//                request.setAttribute("listInforAcc", listInformationAccount);
//                request.getRequestDispatcher("fillInformationBuyer.jsp").forward(request, response);
//            } catch (NumberFormatException e) {
//                System.out.println(e);
//            }
//        }

        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            request.setAttribute("error", "Bạn chưa đăng nhập!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            //phần show cart
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
            String id = request.getParameter("id");
            String num = request.getParameter("num");
            try {

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

                List<InformationAccount> listInformationAccount = dao.getListInformationByIdAcc(account.getId());

                session.setAttribute("sizeCart", size);
                session.setAttribute("listItem", listItem);
                session.setAttribute("cart", cart);
                session.setAttribute("idSelectOne", id);
                request.setAttribute("listInforAcc", listInformationAccount);
                request.getRequestDispatcher("fillInformationBuyer.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
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

        DAO dao = new DAO();

        //phần show cart
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

        //Phần show Information 
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            request.setAttribute("error", "Bạn chưa đăng nhập!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            List<InformationAccount> listInformationAccount = dao.getListInformationByIdAcc(account.getId());
            session.setAttribute("cart", cart);
            session.setAttribute("idSelectOne", 0);
            request.setAttribute("listInforAcc", listInformationAccount);
            request.getRequestDispatcher("fillInformationBuyer.jsp").forward(request, response);
        }
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
