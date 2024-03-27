
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerCheckout;

import dal.CheckoutDAO;
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
import model.Item;
import model.Tour;
import model.Voucher;

/**
 *
 * @author hello
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

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
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        CheckoutDAO checkoutDao = new CheckoutDAO();
        Account account = (Account) session.getAttribute("account");

        String selectCheckout_raw = request.getParameter("selectCheckout");
        String idInfor_raw = request.getParameter("idInfor");

        int selectCheckout, idInfor;
        try {
            //nhận dữ liệu được gửi từ fillInformation.jsp(nếu có)
            selectCheckout = selectCheckout_raw != null ? Integer.parseInt(selectCheckout_raw) : (int) session.getAttribute("selectCheckout");
            idInfor = idInfor_raw != null ? Integer.parseInt(idInfor_raw) : (int) session.getAttribute("idInfor");
            List<Voucher> listVoucher = checkoutDao.listVoucherByIdAcc(account.getId());

            if (selectCheckout != 0) {
                //Gửi itemTour lên checkout.
                Tour tour = (Tour) session.getAttribute("tourFill");
                Item itemTour = new Item(tour, 1, tour.getPrice());
                session.setAttribute("itemTour", itemTour);
            } else {
                //Gửi danh sách itemTour của giỏ hàng lên checkout.jsp
                Cart cartItem = (Cart) session.getAttribute("cartFill");
                session.setAttribute("cartItem", cartItem);
            }

            session.setAttribute("listVoucher", listVoucher);
            session.setAttribute("selectCheckout", selectCheckout);
            session.setAttribute("idInfor", idInfor);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } catch (NumberFormatException e) {
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
//        HttpSession session = request.getSession();
//        PrintWriter out = response.getWriter();
//        String selectDate = request.getParameter("selectedDate");
//        Cart cartItem = (Cart) session.getAttribute("cartFill");
//        Cart arragesItem = arrangeDates(cartItem, selectDate);
//
//        for (Item item : arragesItem.getItems()) {
//            out.print("date of tour" + item.getTour().getName() + ": " + item.getDateDeparture());
//        }

        HttpSession session = request.getSession();
        CheckoutDAO checkoutDao = new CheckoutDAO();

        int idInfor = (int) session.getAttribute("idInfor");
        int selectCheckout = (int) session.getAttribute("selectCheckout");
        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect("login.jsp");
        } else {

            if (selectCheckout != 0) {
                String selectDate = request.getParameter("selectedDate");

                Item itemTour = (Item) session.getAttribute("itemTour");
                itemTour.setDateDeparture(selectDate);
                boolean result = checkoutDao.addOrderForBuyNow(itemTour, account, idInfor);
                if (result) {
                    session.removeAttribute("listVoucher");
                    session.removeAttribute("itemTour");
                    session.removeAttribute("selectCheckout");
                    session.removeAttribute("idInfor");
                    request.setAttribute("messBuy", "Mua hàng thành công");
                } else {
                    request.setAttribute("messBuy", "Mua hàng thất bại");
                }

            } else {
                String dateTours = request.getParameter("selectedDate");
                Cart cartItem = (Cart) session.getAttribute("cartFill");
                Cart arragesItem = arrangeDates(cartItem, dateTours);
                boolean result = checkoutDao.addOrderForCart(arragesItem, account, idInfor);
                if (result) {
                    Cookie c = new Cookie("cart", "");
                    c.setMaxAge(0);
                    response.addCookie(c);

                    session.setAttribute("sizeCart", 0);
                    //Cart ở cookies
                    session.removeAttribute("cart");
                    //Cart ở thanh toán trang fillinformationAcc
                    session.removeAttribute("cartFill");
                    //Cart ở thanh toán trang checkout
                    session.removeAttribute("cartItem");

                    session.removeAttribute("selectCheckout");
                    request.setAttribute("messBuy", "Mua hàng thành công");
                } else {
                    request.setAttribute("messBuy", "Mua hàng thất bại");
                }
            }
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    private Cart arrangeDates(Cart cart, String dateTours) {
        if (dateTours != null && dateTours.length() != 0) {
            String[] arrangeDate = dateTours.split(",");
            int index = 0;
            for (Item item : cart.getItems()) {
                String dateItem = arrangeDate[index];
                item.setDateDeparture(dateItem);
                index++; // Di chuyển đến ngày tiếp theo trong mảng arrangeDate
            }
        }
        return cart;
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

