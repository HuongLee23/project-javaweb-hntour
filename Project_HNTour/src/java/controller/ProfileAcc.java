/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
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
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import model.Account;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)   	// 100 MB
@WebServlet(name = "ProfileAcc", urlPatterns = {"/profileaccount"})
public class ProfileAcc extends HttpServlet {
private static final long serialVersionUID = 205242440643911308L;

    /**
     * Directory where uploaded files will be saved, its relative to the web
     * application directory.
     */
    private static final String UPLOAD_DIR = "avatar";
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
            out.println("<title>Servlet ProfileAcc</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileAcc at " + request.getContextPath() + "</h1>");
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
    try {
        DAO accountDAO = new DAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        // Update profile information in the session
        Account updatedAccount = accountDAO.getAccountDetail(account.getEmail());

        // Update session attribute with the latest data from the database
        account.setUsername(updatedAccount.getUsername());
        account.setAddress(updatedAccount.getAddress());
        account.setAvatar(updatedAccount.getAvatar());
        account.setPhoneNumber(updatedAccount.getPhoneNumber());

        // Forward the request to the profileAccount.jsp page
        request.setAttribute("account", account);
        request.getRequestDispatcher("profileAccount.jsp").forward(request, response);

    } catch (Exception e) {
        // Handle or log the exception
        e.printStackTrace(); // Log the exception, or use a logging framework
        response.sendRedirect("error.jsp"); // Redirect to an error page
    }
}

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, SecurityException {
    try {
        // Your file upload code goes here (if needed)
        // gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // creates the save directory if it does not exist
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        String fileName = null;
        // Get the part associated with the file input field
        Part filePart = request.getPart("fileName");

        // Check if a file is selected
        if (filePart != null && filePart.getSize() > 0) {
            // Write the uploaded file to the server
            try (InputStream input = filePart.getInputStream();
                 OutputStream output = new FileOutputStream(uploadFilePath + File.separator + getFileName(filePart))) {

                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = input.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }

                fileName = "avatar/" + getFileName(filePart);
            }
        }

        // Retrieve form parameters
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone");
        int userId = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");

        DAO accountDAO = new DAO();
        HttpSession session = request.getSession();

        // Retrieve existing avatar filename from the session
        String existingAvatar = ((Account) session.getAttribute("account")).getAvatar();

        // Update profile in the database
        boolean updateSuccess = accountDAO.updateProfile(userId, email, username, address,
                (fileName != null) ? fileName : existingAvatar, phoneNumber);

        if (updateSuccess) {
            // Update session attribute directly without querying the database again
            Account account = (Account) session.getAttribute("account");
            account.setUsername(username);
            account.setAddress(address);
            account.setAvatar((fileName != null) ? fileName : existingAvatar);
            account.setPhoneNumber(phoneNumber);

            // Forward the request with updated session attribute
            request.setAttribute("ms", "Cập nhật hồ sơ thành công.");
            request.setAttribute("account", account); // Add updated account to request attribute
        } else {
            request.setAttribute("ms", "Có lỗi xảy ra. Vui lòng thực hiện lại.");
        }

        request.getRequestDispatcher("profileAccount.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace(); // Log the exception stack trace
        response.sendRedirect("error.jsp?message=" + e.getMessage()); // Redirect to error.jsp with a message parameter
    }
}


    
private String getFileName(jakarta.servlet.http.Part part) {
    String contentDisp = part.getHeader("content-disposition");
    String[] tokens = contentDisp.split(";");
    
    for (String token : tokens) {
        if (token.trim().startsWith("filename")) {
            // Extract the file name from the "filename" parameter
            return token.substring(token.indexOf("=") + 2, token.length() - 1)
                         .replace("\\", "/");  // Handle Windows file path separator
        }
    }
    return "";
}


    //        Part part = (Part) request.getPart("profileImage");
//        String realPath = request.getServletContext().getRealPath("/images");
//
//        // Create the directory if it doesn't exist
//        if (!Files.exists(Paths.get(realPath))) {
//            Files.createDirectory(Paths.get(realPath));
//        }
//
//        // Save the file to the specified location
//        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//        Files.copy(part.getInputStream(), Paths.get(realPath, filename), StandardCopyOption.REPLACE_EXISTING);
//
//        String profileImage = "images/" + filename; // Adjust the path as needed
    
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
