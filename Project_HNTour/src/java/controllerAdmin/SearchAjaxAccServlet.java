/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;

/**
 *
 * @author hello
 */
@WebServlet(name = "SearchAjaxAccServlet", urlPatterns = {"/searchajaxacc"})
public class SearchAjaxAccServlet extends HttpServlet {

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
        String role = request.getParameter("roleAcc");
        int roleAcc = Integer.parseInt(role);
        AdminDAO ad = new AdminDAO();
        List<Account> listAcc = ad.searchAccount(search, roleAcc);

        PrintWriter out = response.getWriter();

        if (roleAcc == 0) {
            out.println("<table id=\"datatablesSimple\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Username</th>");
            out.println("<th>Password</th>");
            out.println("<th>Email</th>");
            out.println("<th>Address</th>");
            out.println("<th>Role</th>");
            out.println("<th>Status</th>");
            out.println("<th></th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (Account a : listAcc) {

                out.println("<tr>");
                out.println("<td>" + a.getUsername() + "</td>");
                out.println("<td>" + a.getPassword() + "</td>");
                out.println("<td>" + a.getEmail() + "</td>");
                out.println("<td>" + a.getAddress() + "</td>");
                out.println("<td style=\"text-align: center; font-size: xx-large;\">");
                if (a.getRole() == 2) {
                    out.println("<i class=\"fa-solid fa-user-tie\" ></i>");
                } else if (a.getRole() == 3) {
                    out.println("<i class=\"fa-solid fa-user\" ></i>");
                }
                out.println("</td>");

                out.println("<td>");
                if (a.isStatus()) {
                    out.println("<i class=\"fa-solid fa-circle\" style=\"color: greenyellow\"></i> Active");
                } else {
                    out.println("<i class=\"fa-solid fa-circle\" style=\"color: red\"></i> Blocked");
                }
                out.println("</td>");

                out.println("<td style=\"color: #00adef\">");
                if (a.isStatus()) {
                    out.println("<div class=\"button-edit\">");
                    out.println("<i class=\"fa-solid fa-lock\"></i>");
                    out.println("<a id=\"button-edit-customer\" href=\"lock?id=" + a.getId() + "\"  style=\"text-decoration: none; color: red\">Block</a>");
                    out.println("</div>");
                } else {
                    out.println("<div class=\"button-edit\">");
                    out.println("<i class=\"fa-solid fa-lock-open\"></i>");
                    out.println("<a id=\"button-edit-customer\" href=\"unlock?id=" + a.getId() + "\"style=\"text-decoration: none\">UnBlock</a>");
                    out.println("</div>");
                }
                out.println("</td>");

                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");

        } else if (roleAcc == 2) {
            out.println("<table id=\"datatablesSimple\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("    <th>Username</th>");
            out.println("    <th>Password</th>");
            out.println("    <th>Email</th>");
            out.println("    <th>Address</th>");
            out.println("    <th style=\"text-align: center\">Profile information</th>");
            out.println("    <th style=\"text-align: center\">Action</th>");
            out.println("</tr>");

            out.println("</thead>");
            out.println("<tbody>");
            for (Account a : listAcc) {
                out.println("<tr>");
                out.println("    <td>" + a.getUsername() + "</td>");
                out.println("    <td>" + a.getPassword() + "</td>");
                out.println("    <td>" + a.getEmail() + "</td>");
                out.println("    <td>" + a.getAddress() + "</td>");
                out.println("    <td style=\"text-align: center;\">");
                out.println("        <a href=\"viewprofilesupplier?idAcc=" + a.getId() + "\">View detail</a>");
                out.println("    </td>");
                out.println("    <td style=\"text-align: center;\">");
                out.println("        <form action=\"manageraccsupplier\" method=\"post\" onsubmit=\"return confirmDelete();\">");
                out.println("            <input type=\"hidden\" name=\"idAcc\" value=\"" + a.getId() + "\"/>");
                out.println("            <input type=\"hidden\" name=\"role\" value=\"" + a.getRole() + "\"/>");
                out.println("            <input style=\"background-color: #da251d;\" class=\"confirm-btn\" type=\"submit\" value=\"Cancel\"/>");
                out.println("        </form>");
                out.println("    </td>");
                out.println("</tr>");

            }
            out.println("</tbody>");
            out.println("</table>");

        } else if (roleAcc == 3) {
            out.println("<table id=\"datatablesSimple\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Username</th>");
            out.println("<th>Password</th>");
            out.println("<th>Email</th>");
            out.println("<th>Address</th>");
            out.println("<th>Phone Number</th>");
            out.println("<th>Action</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (Account a : listAcc) {
                out.println("<tr>");
                out.println("    <td>" + a.getUsername() + "</td>");
                out.println("    <td>" + a.getPassword() + "</td>");
                out.println("    <td>" + a.getEmail() + "</td>");
                out.println("    <td>" + a.getAddress() + "</td>");
                out.println("    <td>" + a.getPhoneNumber() + "</td>");
                out.println("    <td style=\"color: #00adef\">");
                out.println("        <input class=\"confirm-btn\" onclick=\"openForm(this)\" data-id=\"" + a.getId() + "\" data-role=\"" + a.getRole() + "\" data-username=\"" + a.getUsername() + "\" data-password=\"" + a.getPassword() + "\" data-email=\"" + a.getEmail() + "\" data-address=\"" + a.getAddress() + "\" data-phonenumber=\"" + a.getPhoneNumber() + "\" value=\"Update\"/>");
                out.println("    </td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        }

        /* TODO output your page here. You may use following sample code. */
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
