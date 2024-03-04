/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import controllerAdmin.*;
import dal.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import model.Account;
import model.Supplier;

/**
 *
 * @author hello
 */
@WebServlet(name = "ResgisterSupplierServlet", urlPatterns = {"/resgistersupplier"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 100, // 50 MB
        maxRequestSize = 1024 * 1024 * 200)   	// 100 MB

public class ResgisterSupplierServlet extends HttpServlet {

    private static final long serialVersionUID = 205242440643911308L;

    /**
     * Directory where uploaded files will be saved, its relative to the web
     * application directory.
     */
    private static final String UPLOAD_DIR = "profile";

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
            out.println("<title>Servlet ResgisterSupplierServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResgisterSupplierServlet at " + request.getContextPath() + "</h1>");
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
        AdminDAO admindao = new AdminDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        Supplier supplier = admindao.getInforSupplierByID(account.getId());
        request.setAttribute("supplier", supplier);
        request.getRequestDispatcher("upsupplier.jsp").forward(request, response);
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
        // gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded files
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // creates the save directory if it does not exist
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        AdminDAO admindao = new AdminDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String fullName = request.getParameter("fullName");
        String birthday_raw = request.getParameter("birthday");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
//        String frontCMND = request.getParameter("frontCMND");
//        String backCMND = request.getParameter("backCMND");

        String nameCompany = request.getParameter("nameCompany");
        String addressCompany = request.getParameter("addressCompany");
        String emailCompany = request.getParameter("emailCompany");
        String phoneNumberCompany = request.getParameter("phoneNumberCompany");

        String businessCode = request.getParameter("businessCode");
//        String businessRegis = request.getParameter("businessRegis");
//        String taxCertificate = request.getParameter("taxCertificate");
//        String taxPayment = request.getParameter("taxPayment");

        String frontCMND = null;
        String backCMND = null;
        String businessRegis = null;
        String taxCertificate = null;
        String taxPayment = null;
        // Process all parts from the request and write them to the server
        for (Part part : request.getParts()) {
            String partName = part.getName();
            switch (partName) {
                case "frontCMND":
                    frontCMND = getFileName(part);
                    part.write(uploadFilePath + File.separator + frontCMND);
                    break;
                case "backCMND":
                    backCMND = getFileName(part);
                    part.write(uploadFilePath + File.separator + backCMND);
                    break;
                case "businessRegis":
                    businessRegis = getFileName(part);
                    part.write(uploadFilePath + File.separator + businessRegis);
                    break;
                case "taxCertificate":
                    taxCertificate = getFileName(part);
                    part.write(uploadFilePath + File.separator + taxCertificate);
                    break;
                case "taxPayment":
                    taxPayment = getFileName(part);
                    part.write(uploadFilePath + File.separator + taxPayment);
                    break;
                default:
                    break;
            }
        }
        frontCMND = "profile/" + frontCMND;
        backCMND = "profile/" + backCMND;
        businessRegis = "profile/" + businessRegis;
        taxCertificate = "profile/" + taxCertificate;
        taxPayment = "profile/" + taxPayment;

        Date birthday;
        if (account == null) {
            response.sendRedirect("login.jsp");
        } else {
            birthday = Date.valueOf(birthday_raw);
            boolean result = admindao.registerSupplier(
                    account.getId(), fullName, birthday,
                    email, phoneNumber, frontCMND, backCMND, nameCompany,
                    addressCompany, emailCompany, phoneNumberCompany,
                    businessCode, businessRegis, taxCertificate, taxPayment
            );

            if (result) {
                Supplier supplier = admindao.getInforSupplierByID(account.getId());
                request.setAttribute("ms", "Gửi đơn đăng ký thành công");
                request.setAttribute("supplier", supplier);
            } else {
                request.setAttribute("ms", "Gửi đơn đăng ký thất bại!");
            }
            request.getRequestDispatcher("upsupplier.jsp").forward(request, response);
        }

    }

    /**
     * Utility method to get file name from HTTP header content-disposition
     */
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
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
