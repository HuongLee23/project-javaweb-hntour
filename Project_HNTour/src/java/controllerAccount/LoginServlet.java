/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAccount;

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
import model.Account;

/**
 *
 * @author hello
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
//        DAO d = new DAO();
//        HttpSession session = request.getSession();
//
//        // Thông tin for login
//        String email = request.getParameter("email");
//        String pass = request.getParameter("pass");
//        String rem = request.getParameter("rem");
//
//        if (email != null && pass != null) {
//            Account a = d.loginAccount(email, pass);
//            if (a != null) {
//                if (a.isStatus()) {
//                    session.setAttribute("account", a);
//                    Cookie cemail = new Cookie("cemail", email);
//                    Cookie cpass = new Cookie("cpass", pass);
//                    Cookie crem = new Cookie("crem", rem);
//                    if (rem != null) {
//                        cemail.setMaxAge(60 * 60 * 24 * 30);
//                        cpass.setMaxAge(60 * 60 * 24 * 30);
//                        crem.setMaxAge(60 * 60 * 24 * 30);
//                    } else {
//                        cemail.setMaxAge(0);
//                        cpass.setMaxAge(0);
//                        crem.setMaxAge(0);
//                    }
//                    response.addCookie(cemail);
//                    response.addCookie(cpass);
//                    response.addCookie(crem);
//
//                    response.sendRedirect("home");
//                } else {
//                    request.setAttribute("error", "Tài khoản của bạn đã bị khóa! Vui lòng đăng nhập tài khoản khác.");
//                    request.getRequestDispatcher("login.jsp").forward(request, response);
//                }
//            } else {
//                request.setAttribute("error", "Email hoặc mật khẩu không đúng. Vui lòng thử lại.");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//            }
//        } else {
//            request.setAttribute("error", "Email hoặc mật khẩu không đúng. Vui lòng thử lại.");
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        }

        DAO dao = new DAO();
        HttpSession session = request.getSession();

        // Thông tin đăng nhập
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String rem = request.getParameter("rem");

//        //Nếu người đó vào login từ fillInfor mà ko login mà quay lại màn hình khác r đăng nhập thì nó sẽ không chạy trang servlet 
//        session.removeAttribute("typeFill");
//        session.removeAttribute("lastVisitedPage");

        // Thực hiện xác thực đăng nhập
        boolean isAuthenticated = performAuthentication(email, pass, dao);

        if (isAuthenticated) {
            // Lưu thông tin người dùng vào session
            Account account = dao.loginAccount(email, pass);
            session.setAttribute("account", account);

            // Lưu thông tin đăng nhập vào cookie nếu người dùng chọn "ghi nhớ tài khoản"
            saveLoginInfoToCookie(email, pass, rem, response);

            // Redirect người dùng đến trang cuối cùng mà họ đã cố gắng truy cập hoặc trang home nếu không có trang trước đó
            String lastVisitedPage = determineLastVisitedPage(request, response);
            String typeFill = (String) session.getAttribute("typeFill");
            if (lastVisitedPage.equals("fillinformationbuyer")) {

                if (typeFill.equals("get")) {
                    int id = (int) session.getAttribute("idFill");
                    session.setAttribute("idFill", id);
                    session.setAttribute("typeFill", typeFill);
                } else if (typeFill.equals("post")) {
                    session.setAttribute("typeFill", typeFill);
                }

            }

            response.sendRedirect(lastVisitedPage);
        } else {
            // Xử lý trường hợp đăng nhập không thành công
            handleFailedAuthentication(request, response);
        }
    }

    private boolean performAuthentication(String email, String pass, DAO dao) {
        Account account = dao.loginAccount(email, pass);
        return account != null && account.isStatus();
    }

    private void saveLoginInfoToCookie(String email, String pass, String rem, HttpServletResponse response) {
        Cookie cemail = new Cookie("cemail", email);
        Cookie cpass = new Cookie("cpass", pass);
        Cookie crem = new Cookie("crem", rem);

        if (rem != null) {
            cemail.setMaxAge(60 * 60 * 24 * 30); // Cookie tồn tại trong 30 ngày
            cpass.setMaxAge(60 * 60 * 24 * 30);
            crem.setMaxAge(60 * 60 * 24 * 30);
        } else {
            cemail.setMaxAge(0); // Xóa cookie
            cpass.setMaxAge(0);
            crem.setMaxAge(0);
        }

        response.addCookie(cemail);
        response.addCookie(cpass);
        response.addCookie(crem);
    }

    private String determineLastVisitedPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String lastVisitedPage = (String) session.getAttribute("lastVisitedPage");
        return lastVisitedPage != null ? lastVisitedPage : "home";
    }

    private void handleFailedAuthentication(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("error", "Email hoặc mật khẩu không đúng. Vui lòng thử lại.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
