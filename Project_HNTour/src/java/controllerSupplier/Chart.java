/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllerSupplier;

import dal.DAO;
import dal.DAODoanhThu;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import model.Account;
import model.MonthTotalInvoice;
import model.Quater;
import model.TotalInvoiceOfCategory;

/**
 *
 * @author Admin
 */
@WebServlet(name="Chart", urlPatterns={"/chart"})
public class Chart extends HttpServlet {
   
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
            out.println("<title>Servlet Chart</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Chart at " + request.getContextPath () + "</h1>");
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
        HttpSession session = request.getSession();
         Account account = (Account) session.getAttribute("account");
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        DAO dao=new DAO();
        DAODoanhThu dt = new DAODoanhThu();
        TotalInvoiceOfCategory totalCate = dao.getTotalInvoiceCate(account.getId());

        //Tính cho biểu đồ hình tròn
        double d1, d2, d3,d4;
        d1 = (totalCate.getTotalCate1() / (totalCate.getTotalCate1()
                + totalCate.getTotalCate2()
                + totalCate.getTotalCate3()
                + totalCate.getTotalCate4())) * 100;
        d2 = (totalCate.getTotalCate2() / (totalCate.getTotalCate1()
                + totalCate.getTotalCate2()
                + totalCate.getTotalCate3()
                + totalCate.getTotalCate4())) * 100;
        d3 = (totalCate.getTotalCate3() / (totalCate.getTotalCate1()
                + totalCate.getTotalCate2()
                + totalCate.getTotalCate3()
                + totalCate.getTotalCate4())) * 100;
        d4 = (totalCate.getTotalCate4() / (totalCate.getTotalCate1()
                + totalCate.getTotalCate2()
                + totalCate.getTotalCate3()
                + totalCate.getTotalCate4())) * 100;
        String totalCate1 = decimalFormat.format(d1);
        String totalCate2 = decimalFormat.format(d2);
        String totalCate3 = decimalFormat.format(d3);
        String totalCate4 = decimalFormat.format(d4);
        request.setAttribute("totalCate1", totalCate1);
        request.setAttribute("totalCate2", totalCate2);
        request.setAttribute("totalCate3", totalCate3);
        request.setAttribute("totalCate4", totalCate4);
        
        
        Quater quater = dt.getTotalInvoiceByQuater(account.getId());
        request.setAttribute("totalQuater", quater);
        //Tính cho biểu đồ hình thanh
//        Quater quater = dt.getTotalInvoiceByQuater();
//        request.setAttribute("totalQuater", quater);

        //Tính cho biểu đồ hình thanh
        MonthTotalInvoice month = dt.getMothTotalInvoice(account.getId());
        request.setAttribute("totalMonth", month);
        request.setAttribute("totalCate", totalCate);
       
        request.getRequestDispatcher("ChartDoanhThu.jsp").forward(request, response);
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
