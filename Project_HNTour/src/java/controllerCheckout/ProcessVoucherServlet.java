
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerCheckout;

import dal.CheckoutDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;
import model.Tour;
import model.Voucher;

/**
 *
 * @author hello
 */
@WebServlet(name = "ProcessVoucherServlet", urlPatterns = {"/proccessvoucher"})
public class ProcessVoucherServlet extends HttpServlet {

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
            out.println("<title>Servlet ProcessVoucherServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessVoucherServlet at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        CheckoutDAO checkoutDao = new CheckoutDAO();
        Account account = (Account) session.getAttribute("account");

        String idVoucher_raw = request.getParameter("selectVoucher");
        List<Voucher> listVoucher = checkoutDao.listVoucherByIdAcc(account.getId());
        int idVoucher = Integer.parseInt(idVoucher_raw);
        Voucher voucher = null;
        for (Voucher v : listVoucher) {
            if (v.getId() == idVoucher) {
                voucher = v;
            }
        }

        if (voucher != null) {
            int selectCheckout = (int) session.getAttribute("selectCheckout");
            if (selectCheckout != 0) {
                Item itemTour = (Item) session.getAttribute("itemTour");
                double priceSale = calculateVoucher(itemTour, voucher);
                Item itemTourCheckout = new Item(
                        itemTour.getTour(), itemTour.getQuantity(),
                        itemTour.getPrice(), idVoucher, voucher.getDiscount(), priceSale
                );
                session.setAttribute("itemTour", itemTourCheckout);
            } else {
                String id_tour = request.getParameter("idTour");
                int idTour = Integer.parseInt(id_tour);
                Cart cartItem = (Cart) session.getAttribute("cartItem");
                Cart cartItemCheckout = getItemForCartByIdTour(cartItem, idTour, voucher);
                session.setAttribute("cartItem", cartItemCheckout);
            }
        }
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    private Cart getItemForCartByIdTour(Cart cart, int idTour, Voucher v) {
        for (Item i : cart.getItems()) {
            if (i.getTour().getId() == idTour) {
                double priceSale = calculateVoucher(i, v);
                i.setIdVoucher(v.getId());
                i.setDiscount(v.getDiscount());
                i.setPriceSale(priceSale);
                break;
            }
        }
        return cart;
    }

    private double calculateVoucher(Item item, Voucher v) {
        double result = (item.getPrice() - ((item.getPrice()
                * v.getDiscount()) / 100));
        return result;
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

