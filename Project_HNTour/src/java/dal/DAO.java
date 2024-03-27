/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Account;
import model.AccountVoucher;
import model.FeedbackWeb;
import model.Blog;
import model.BlogComment;
import model.Category;
import model.Feedback;
import model.HistoryOrder;
import model.InformationAccount;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.Schedules;
import model.TopProduct;
import model.TotalInvoiceOfCategory;
import model.Supplier;
import model.Tour;
import model.Voucher;

/**
 *
 * @author hello
 */
public class DAO extends DBContext {

    /*
        Create a new account
     */
    public boolean registerAccount(
            String email, String username, String password, int role
    ) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([email]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[role])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, username);
            st.setString(3, password);
            st.setInt(4, role);
            int result = st.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }


    /*
        Log in to account
     */
    public Account loginAccount(String email, String password) {
        String sql = "SELECT [id], [email], [username], [password], [role], [address], [avatar], [phoneNumber], [status] FROM [HaNoiTour].[dbo].[Account] WHERE [email] = ? AND [password] = ?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            st.setString(2, password);

            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Account a = new Account(
                            rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getInt("role"),
                            rs.getString("address"),
                            rs.getString("avatar"),
                            rs.getString("phoneNumber"),
                            rs.getBoolean("status")
                    );
                    return a;
                }
            }
        } catch (SQLException e) {
            // Log or rethrow the exception
            System.out.println(e);
        }
        return null;
    }

    /*
        Check account exist by email
     */
    public boolean checkAccountExistByEmail(String email) {
        String sql = "select * from Account where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    //Retrieve old password after authentication is completed
    public String retrieveOldPasswordByEmail(String email) {
        String sql = "select [password] from Account where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String oldPassword = rs.getString("password");
                return oldPassword;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean changePassword(String email, String pass, String newPass) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [password] = ?\n"
                + " WHERE [email] = ? and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPass);
            st.setString(2, email);
            st.setString(3, pass);
            int result = st.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateProfile(
            int id,
            String email,
            String username,
            String address,
            String avatar,
            String phoneNumber) {

        String sql = "UPDATE [dbo].[Account] "
                + "SET [email] = ?,"
                + " [username] = ?,"
                + " [address] = ?, "
                + " [avatar] = ?, "
                + "[phoneNumber] = ? "
                + "WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, username);
            st.setString(3, address);
            st.setString(4, avatar);
            st.setString(5, phoneNumber);

            // Corrected order of parameters
            st.setInt(6, id);

            int result = st.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public Account getAccountDetail(String email) {

        String sql = "SELECT * FROM Account WHERE email = ?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new Account(
                            rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getInt("role"),
                            rs.getString("address"),
                            rs.getString("avatar"),
                            rs.getString("phoneNumber"),
                            rs.getBoolean("status")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Tour> getAllTour() {
        List<Tour> list = new ArrayList<>();

        String sql = "SELECT TOP (1000) "
                + "T.[id], "
                + "T.[name],"
                + " T.[imageMain],"
                + " T.[imageAlbum],"
                + " T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[supplierId], "
                + "T.[status] "
                + "FROM [HaNoiTour].[dbo].[Tour] T where status=1";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                String imageAlbumString = rs.getString("imageAlbum");

                // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                Tour tour = new Tour(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")
                );

                list.add(tour);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

// getdetailtour
    public Tour getDetail(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Tour tour = null; // Declare a Tour variable to store the result

        String sql = "SELECT TOP (1000) "
                + "T.[id], "
                + "T.[name],"
                + " T.[imageMain],"
                + " T.[imageAlbum],"
                + " T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[supplierId], "
                + "T.[status] "
                + "FROM [HaNoiTour].[dbo].[Tour] T where T.[id]= ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            if (rs.next()) {

                String imageAlbumString = rs.getString("imageAlbum");
                // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                // Create a new Tour object with the retrieved values
                tour = new Tour(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")
                );
            }
        } catch (SQLException e) {
        }
        return tour;
    }

    public List<Tour> searchByName(String txtSearch) {
        List<Tour> list = new ArrayList<>();
        String sql = "SELECT "
                + "T.[id], "
                + "T.[name],"
                + " T.[imageMain],"
                + " T.[imageAlbum],"
                + " T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[supplierId], "
                + "T.[status] "
                + "     FROM [dbo].[Tour] T"
                + "     WHERE T.[name] like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imageAlbumString = rs.getString("imageAlbum");
                // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                list.add(new Tour(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")
                // Add missing commas and complete the constructor parameters as needed
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Tour> getRelateTour(int cid, int tid) {
        List<Tour> list = new ArrayList<>();

        String sql = "SELECT TOP (2) \n"
                + "T.[id], "
                + "T.[name],"
                + " T.[imageMain],"
                + " T.[imageAlbum],"
                + " T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[supplierId], "
                + "T.[status] "
                + "                FROM [HaNoiTour].[dbo].[Tour] T \n"
                + "   where T.[categoryId] = ? and T.[id]  not in (?)\n"
                + "                order by newid()";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cid);
            st.setInt(2, tid);

            try ( ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    String imageAlbumString = rs.getString("imageAlbum");
                    // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
                    List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                    Tour tour = new Tour(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("imageMain"),
                            imageAlbumList,
                            rs.getTime("intendedTime"),
                            rs.getDouble("price"),
                            rs.getString("description"),
                            rs.getInt("categoryId"),
                            rs.getInt("version"),
                            rs.getString("rule"),
                            rs.getInt("supplierId"),
                            rs.getBoolean("status")
                    );
                    list.add(tour);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Feedback> getFeedbackDetailTour(int tourId) {
        List<Feedback> list = new ArrayList<>();

        String sql = "  SELECT F.[id], F.[accId], A.[username] AS [accountUsername], \n"
                + "            F.[tourId], F.[versionId], F.[comment], F.[rating] , A.[avatar] as [avatarAc]\n"
                + "              FROM [Feedback] F \n"
                + "              JOIN [Tour] T ON F.[tourId] = T.[id] \n"
                + "               JOIN [Account] A ON F.[accId] = A.[id] \n"
                + "               WHERE T.[id] = ?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, tourId);

            try ( ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Feedback feedback = new Feedback();
                    feedback.setId(rs.getInt("id"));
                    feedback.setAccId(rs.getInt("accId"));
                    feedback.setAccName(rs.getString("accountUsername"));
                    feedback.setTourId(rs.getInt("tourId"));
                    feedback.setVersionId(rs.getInt("versionId"));
                    feedback.setComment(rs.getString("comment"));
                    feedback.setRating(rs.getInt("rating"));
                    feedback.setAvatarAc(rs.getString("avatarAc"));
                    list.add(feedback);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Category> getListCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "Select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Tour> listTop3Tour() {
        List<Tour> list = new ArrayList<>();
        String sql = "SELECT top(3)"
                + "T.[id], "
                + "T.[name],"
                + " T.[imageMain],"
                + " T.[imageAlbum],"
                + " T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[supplierId], "
                + "T.[status] "
                + "     FROM [dbo].[Tour] T "
                + "     JOIN [dbo].[Feedback] F"
                + "     ON T.id = F.tourId"
                + "     ORDER BY F.[rating] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imageAlbumString = rs.getString("imageAlbum");
                // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                list.add(new Tour(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Tour> listNew4Tour() {
        List<Tour> list = new ArrayList<>();
        String sql = "SELECT top(4) "
                + "T.[id], "
                + "T.[name],"
                + " T.[imageMain],"
                + " T.[imageAlbum],"
                + " T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[supplierId], "
                + "T.[status] "
                + "     FROM [dbo].[Tour] T "
                + "     ORDER BY T.id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imageAlbumString = rs.getString("imageAlbum");
                // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                list.add(new Tour(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Tour> listTrendTour() {
        List<Tour> list = new ArrayList<>();
        String sql = "SELECT top(8) "
                + "T.[id], "
                + "T.[name],"
                + " T.[imageMain],"
                + " T.[imageAlbum],"
                + " T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[supplierId], "
                + "T.[status]"
                + "     FROM [dbo].[Tour] T"
                + "     ORDER BY T.price ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imageAlbumString = rs.getString("imageAlbum");
                // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                list.add(new Tour(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Tour> getTourBySort(String typeSort, String type) {
        List<Tour> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) "
                + "T.[id], "
                + "T.[name],"
                + "T.[imageMain],"
                + "T.[imageAlbum],"
                + "T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[supplierId], "
                + "T.[status]"
                + " FROM [Tour] T ";

        if (type.equals("name")) {
            sql += "ORDER BY T.[name]";
        } else if (type.equals("price")) {
            sql += "ORDER BY T.[price]";
        } else if (type.equals("rating")) {
            sql += "JOIN [Feedback] F ON T.[id] = F.[tourId] ORDER BY F.[rating]";

        }

        if (typeSort.equals("ASC")) {
            sql += " ASC";
        } else if (typeSort.equals("DESC")) {
            sql += " DESC";
        }

        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                String imageAlbumString = rs.getString("imageAlbum");
                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                Tour tour = new Tour(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")
                );

                list.add(tour);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print stack trace for debugging
        } finally {
            // Close the ResultSet, PreparedStatement, and Connection
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public List<Tour> searchByCategory(String categoryId) {
        List<Tour> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) "
                + "T.[id], "
                + "T.[name],"
                + " T.[imageMain],"
                + " T.[imageAlbum],"
                + " T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[supplierId], "
                + "T.[status]"
                + "FROM [HaNoiTour].[dbo].[Tour] T "
                + "WHERE T.[categoryId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, categoryId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imageAlbumString = rs.getString("imageAlbum");

                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                Tour tour = new Tour(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")
                );
                list.add(tour);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //lay tour cua supplier do
    public List<Tour> getTourBySupllierID(int supplierId) {
        List<Tour> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) "
                + "T.[id], "
                + "T.[name],"
                + " T.[imageMain],"
                + " T.[imageAlbum],"
                + " T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[supplierId], "
                + "T.[status]"
                + "FROM [HaNoiTour].[dbo].[Tour] T "
                + "WHERE T.[supplierId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imageAlbumString = rs.getString("imageAlbum");

                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                Tour tour = new Tour(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")
                );
                list.add(tour);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Tour getTourByID(int id) {
        String sql = "select * from Tour\n"
                + "                where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imageAlbumString = rs.getString("imageAlbum");

                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));
                return new Tour(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")
                );
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void editTour(int id, String name, String imageMain, List<String> imageAlbum, Time intendedTime, String price,
            String description, int categoryId, String rule) {
        String sql = "UPDATE [dbo].[Tour]\n"
                + "   SET [name] = ?,\n"
                + "      [imageMain] = ?,\n"
                + "      [imageAlbum] = ?,\n"
                + "      [intendedTime] = ?,\n"
                + "      [price] = ?,\n"
                + "      [description] = ?,\n"
                + "      [categoryId] = ?,\n"
                + "      [rule] = ?\n"
                + " WHERE id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            // Assuming imageAlbum is a List of Strings
            String imageAlbumString = String.join("/splitAlbum/", imageAlbum);
            st.setString(1, name);
            st.setString(2, imageMain);
            st.setString(3, imageAlbumString);
            st.setTime(4, intendedTime);
            st.setString(5, price);
            st.setString(6, description);
            st.setInt(7, categoryId);
            st.setString(8, rule);
            st.setInt(9, id);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
        }
    }

    public List<Schedules> getSchedukesById(int Sid) {
        List<Schedules> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) S.[tourId]\n"
                + "                   ,S.[versionId]\n"
                + "                     ,S.[location]\n"
                + "                    ,S.[date]\n"
                + "                     ,S.[description] as [descriptionSchedules]\n"
                + "					 ,S.id\n"
                + "                 FROM [Schedule] S\n"
                + "                 JOIN [Tour] T ON S.[tourId]= T.[id]\n"
                + "                Where T.[id]=? ORDER BY [id];";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Sid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Schedules schedules = new Schedules();
                schedules.setId(rs.getInt("id"));
                schedules.setTourId(rs.getInt("tourId"));
                schedules.setVersionId(rs.getInt("versionId"));
                schedules.setLocation(rs.getString("location"));
                schedules.setDate(rs.getTime("date"));
                schedules.setDescriptionSchedules(rs.getString("descriptionSchedules"));
                list.add(schedules);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addFeedback(int accId, int tourId, int versionId, String comment, int rating) {
        String sql = "INSERT INTO Feedback (accId, tourId, versionId, comment, rating) VALUES (?, ?, ?, ?, ?)";

        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, accId);
            statement.setInt(2, tourId);
            statement.setInt(3, versionId);
            statement.setString(4, comment);
            statement.setInt(5, rating);
            statement.executeUpdate();

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Feedback getFeedbackByID(int id) {
        String sql = "SELECT F.[id], F.[accId], A.[username] AS [accName], \n"
                + "                           F.[tourId], F.[versionId], F.[comment], F.[rating] , A.[avatar] as [avatarAc]\n"
                + "                             FROM [Feedback] F \n"
                + "                            \n"
                + "                              JOIN [Account] A ON F.[accId] = A.[id] \n"
                + "                              WHERE F.[id]=?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                return new Feedback(
                        rs.getInt("id"),
                        rs.getInt("accId"),
                        rs.getInt("tourId"),
                        rs.getInt("versionId"),
                        rs.getString("comment"),
                        rs.getInt("rating"),
                        rs.getString("accName"),
                        rs.getString("avatarAc"),
                        rs.getString("nameTour")
                );
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<InformationAccount> getListInformationByIdAcc(int accountId) {
        List<InformationAccount> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[email]\n"
                + "      ,[username]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthday]\n"
                + "      ,[accountId]\n"
                + "  FROM [dbo].[InformationAccounts] where accountId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InformationAccount in = new InformationAccount();
                in.setId(rs.getInt("id"));
                in.setEmail(rs.getString("email"));
                in.setUsername(rs.getString("username"));
                in.setPhoneNumber(rs.getString("phoneNumber"));
                in.setBirthday(rs.getDate("birthday"));
                in.setAccountId(rs.getInt("accountId"));
                list.add(in);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean updateInformationAccount(
            int id, String email,
            String username, String phoneNumber,
            Date birthday
    ) {
        String sql = "UPDATE [dbo].[InformationAccounts]\n"
                + "   SET [email] = ?\n"
                + "      ,[username] = ?\n"
                + "      ,[phoneNumber] = ?\n"
                + "      ,[birthday] = ?\n"
                + " WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, username);
            st.setString(3, phoneNumber);
            st.setDate(4, birthday);
            st.setInt(5, id);
            int result = st.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public InformationAccount getInformationAccountById(int accountId) {
        String sql = "SELECT TOP (1) [id]\n"
                + "      ,[email]\n"
                + "      ,[username]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthday]\n"
                + "      ,[accountId]\n"
                + "  FROM [HaNoiTour].[dbo].[InformationAccounts] \n"
                + "  where accountId = ?\n"
                + "  Order By [id] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                InformationAccount in = new InformationAccount(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("username"),
                        rs.getString("phoneNumber"),
                        rs.getDate("birthday"),
                        accountId);
                return in;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean insertInformationAccount(
            String email,
            String username, String phoneNumber,
            Date birthday, int accountId
    ) {
        String sql = "INSERT INTO [dbo].[InformationAccounts]\n"
                + "           ([email]\n"
                + "           ,[username]\n"
                + "           ,[phoneNumber]\n"
                + "           ,[birthday]\n"
                + "           ,[accountId])\n"
                + "     VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, username);
            st.setString(3, phoneNumber);
            st.setDate(4, birthday);
            st.setInt(5, accountId);
            int result = st.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    //lay schedule theo ID    
    public List<Schedules> getSchedukesById1(int sid) {
        List<Schedules> list = new ArrayList<>();
        String sql = "SELECT [tourId], [versionId], [location], [date], [description], [id] "
                + "FROM [HaNoiTour].[dbo].[Schedule] WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Schedules schedules = new Schedules();
                schedules.setTourId(rs.getInt("tourId"));
                schedules.setVersionId(rs.getInt("versionId"));
                schedules.setLocation(rs.getString("location"));
                schedules.setDate(rs.getTime("date"));
                schedules.setDescriptionSchedules(rs.getString("description"));
                schedules.setId(rs.getInt("id"));
                list.add(schedules);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //son
    public void editTourSchedules(int id, String location, Time date, String descriptionSchedules) {
        String sql = "UPDATE [dbo].[Schedule]\n"
                + "SET [location] = ?,\n"
                + "    [date] = ?,\n"
                + "    [description] = ?\n"
                + "WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, location);
            st.setTime(2, date);
            st.setString(3, descriptionSchedules);
            st.setInt(4, id);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
        }
    }

    //son
    public void insertSchedule(int tourId, String location, Time date, String descriptionSchedules) {
        String sql = "INSERT INTO [dbo].[Schedule] ([tourId],[versionId],[location], [date], [description]) VALUES (?,?, ?, ?, ?)";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            // Set values for the parameters
            st.setInt(1, tourId);
            st.setInt(2, 1);
            st.setString(3, location);
            st.setTime(4, date);
            st.setString(5, descriptionSchedules);

            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            // Log or print the exception for debugging purposes
            e.printStackTrace();
        }
    }

    //add tour
    public void insertTourWithSchedule(String name, String imageMain, List<String> imageAlbum, Time intendedTime,
            String price, String description, int categoryId, String rule, int supplierId, boolean status,
            List<Schedules> schedules) {

        String tourSql = "INSERT INTO [dbo].[Tour]\n"
                + "([name]\n"
                + ",[imageMain]\n"
                + ",[imageAlbum]\n"
                + ",[intendedTime]\n"
                + ",[price]\n"
                + ",[description]\n"
                + ",[categoryId]\n"
                + ",[version]\n"
                + ",[rule]\n"
                + ",[supplierId]\n"
                + ",[status])\n"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?)";

        String scheduleSql = "INSERT INTO [dbo].[Schedule] ([tourId],[versionId],[location], [date], [description]) VALUES (?,?,?,?,?)";

        try {

            try ( PreparedStatement tourStatement = connection.prepareStatement(tourSql, Statement.RETURN_GENERATED_KEYS);  PreparedStatement scheduleStatement = connection.prepareStatement(scheduleSql)) {

                String imageAlbumString = String.join("/splitAlbum/", imageAlbum);

                // Insert Tour
                tourStatement.setString(1, name);
                tourStatement.setString(2, imageMain);
                tourStatement.setString(3, imageAlbumString);
                tourStatement.setTime(4, intendedTime);
                tourStatement.setString(5, price);
                tourStatement.setString(6, description);
                tourStatement.setInt(7, categoryId);
                tourStatement.setInt(8, 1);
                tourStatement.setString(9, rule);
                tourStatement.setInt(10, supplierId);
                tourStatement.setBoolean(11, status);

                tourStatement.executeUpdate();

                // Retrieve the generated tourId
                try ( ResultSet generatedKeys = tourStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int tourId = generatedKeys.getInt(1);

                        // Insert Schedules
                        for (Schedules schedule : schedules) {
                            scheduleStatement.setInt(1, tourId);
                            scheduleStatement.setInt(2, 1);
                            scheduleStatement.setString(3, schedule.getLocation());
                            scheduleStatement.setTime(4, schedule.getDate());
                            scheduleStatement.setString(5, schedule.getDescriptionSchedules());

                            scheduleStatement.executeUpdate();
                        }
                    }
                }

            }

        } catch (SQLException e) {
            // Log or print the exception for debugging purposes
            e.printStackTrace();
        }
    }

    //xóa tour
    public void deleteTour(String id) {
        String deleteTourSql = "DELETE FROM Tour WHERE id = ?";
        String deleteScheduleSql = "DELETE FROM Schedule WHERE tourId = ?";

        try {

            try ( PreparedStatement deleteTourStatement = connection.prepareStatement(deleteTourSql);  PreparedStatement deleteScheduleStatement = connection.prepareStatement(deleteScheduleSql)) {

                // Set the tourId parameter for both statements
                deleteTourStatement.setString(1, id);
                deleteScheduleStatement.setString(1, id);

                // Execute the delete statements
                deleteScheduleStatement.executeUpdate();
                deleteTourStatement.executeUpdate();
            }

        } catch (SQLException e) {
            // Log or print the exception for debugging purposes
            e.printStackTrace();
        }
    }

    //xóa schedule
    public void deleteSchedule(String sid) {
        String sql = "DELETE FROM Schedule WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, sid);

            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public List<Tour> searchByNameSupplier(String txtSearch, int supplierId) {

        List<Tour> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    T.[id], \n"
                + "    T.[name],\n"
                + "    T.[imageMain],\n"
                + "    T.[imageAlbum],\n"
                + "    T.[intendedTime], \n"
                + "    T.[price], \n"
                + "    T.[description], \n"
                + "    T.[categoryId],\n"
                + "    T.[version], \n"
                + "    T.[rule], \n"
                + "    T.[supplierId], \n"
                + "    T.[status] \n"
                + "FROM \n"
                + "    [dbo].[Tour] T\n"
                + "WHERE \n"
                + "    T.[name] LIKE ? AND\n"
                + "    T.[supplierId] = ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setInt(2, supplierId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imageAlbumString = rs.getString("imageAlbum");
                // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                list.add(new Tour(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")
                // Add missing commas and complete the constructor parameters as needed
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void updateFeedback(int id, int accId, int tourId, String comment, int rating) {
        String sql = " UPDATE Feedback\n"
                + "SET \n"
                + "    accId = ?,\n"
                + "    tourId = ?,\n"
                + "    comment = ?,\n"
                + "    rating = ?\n"
                + "WHERE\n"
                + "    id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, accId);
            ps.setInt(2, tourId);
            ps.setString(3, comment);
            ps.setInt(4, rating);
            ps.setInt(5, id);
            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void deleteFeedback(String id) {
        String sql = "delete from feedback where id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);

            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void insertFeedbackWeb(Account acc, String subject, String message
    ) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String sql = "INSERT INTO [dbo].[FeedbackWeb]\n"
                + "           ([accId]\n"
                + "           ,[date]\n"
                + "           ,[subject]\n"
                + "           ,[message])\n"
                + "     VALUES\n"
                + "           ( ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, acc.getId());
            ps.setString(2, date);
            ps.setString(3, subject);
            ps.setString(4, message);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Blog> getBlog(int status) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT TOP (1000)\n"
                + "    B.[id],\n"
                + "    B.[title],\n"
                + "    B.[content],\n"
                + "    B.[image],\n"
                + "    B.[publishDate],\n"
                + "    B.[accountId],B.[status],"
                + "    A.[username] as [accountName]\n"
                + "FROM [HaNoiTour].[dbo].[Blog] B JOIN [dbo].[Account] A ON B.[accountId]=A.[id] where B.[status]=?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blogs = new Blog();
                blogs.setBid(rs.getInt("id"));
                blogs.setTitle(rs.getString("title"));
                blogs.setContent(rs.getString("content"));
                blogs.setImage(rs.getString("image"));
                blogs.setPublishDate(rs.getDate("publishDate"));
                blogs.setAccountId(rs.getInt("accountId"));
                blogs.setStatus(rs.getInt("status"));
                blogs.setAccountName(rs.getString("accountName"));
                list.add(blogs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> getBlogSupplier(int status, int accid) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT TOP (1000)\n"
                + "    B.[id],\n"
                + "    B.[title],\n"
                + "    B.[content],\n"
                + "    B.[image],\n"
                + "    B.[publishDate],\n"
                + "    B.[accountId],B.[status],"
                + "    A.[username] as [accountName]\n"
                + "FROM [HaNoiTour].[dbo].[Blog] B JOIN [dbo].[Account] A ON B.[accountId]=A.[id] where B.[status]=? and A.[id]=?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, accid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blogs = new Blog();
                blogs.setBid(rs.getInt("id"));
                blogs.setTitle(rs.getString("title"));
                blogs.setContent(rs.getString("content"));
                blogs.setImage(rs.getString("image"));
                blogs.setPublishDate(rs.getDate("publishDate"));
                blogs.setAccountId(rs.getInt("accountId"));
                blogs.setStatus(rs.getInt("status"));
                blogs.setAccountName(rs.getString("accountName"));
                list.add(blogs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Blog getDetailBlog(int idB) {
        String sql = "SELECT TOP (1000)\n"
                + "    B.[id],\n"
                + "    B.[title],\n"
                + "    B.[content],\n"
                + "    B.[image],\n"
                + "    B.[publishDate],\n"
                + "    B.[accountId], B.[status],"
                + "    A.[username] as [accountName]\n"
                + "FROM [HaNoiTour].[dbo].[Blog] B JOIN [dbo].[Account] A ON B.[accountId]=A.[id] WHERE B.[id]=?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, idB);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new Blog(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("content"),
                            rs.getString("image"),
                            rs.getDate("publishDate"),
                            rs.getInt("accountId"),
                            rs.getString("accountName"),
                            rs.getInt("status")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<BlogComment> getBlogComment(int bid) {
        List<BlogComment> list = new ArrayList<>();
        String sql = "SELECT B.[id]\n"
                + "      ,B.[blogId]\n"
                + "      ,B.[accountId]\n"
                + "      ,B.[comment]\n"
                + "      ,B.[commentDate]\n"
                + "	  ,A.[username] as [accName]\n"
                + "	  ,A.[avatar] as [accAvatar]\n"
                + "  FROM [dbo].[BlogComment] B JOIN [Account] A\n"
                + "  ON B.[accountId]= A.[id] where B.[blogId]=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BlogComment blogcm = new BlogComment();
                blogcm.setPid(rs.getInt("id"));
                blogcm.setIdblog(rs.getInt("blogId"));
                blogcm.setAccBlog(rs.getInt("accountId"));
                blogcm.setComment(rs.getString("comment"));
                blogcm.setCommentDate(rs.getDate("commentDate"));
                blogcm.setAccName(rs.getString("accName"));
                blogcm.setAccAvatar(rs.getString("accAvatar"));
                list.add(blogcm);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> getBlogBySellId(int idsell) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT TOP (1000)\n"
                + "                  B.[id],\n"
                + "                 B.[title],\n"
                + "              B.[content],\n"
                + "                B.[image],\n"
                + "                   B.[publishDate],\n"
                + "                   B.[accountId],B.[status]\n"
                + "               FROM [HaNoiTour].[dbo].[Blog] B WHERE B.[accountId]=? ;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idsell);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blogs = new Blog();
                blogs.setBid(rs.getInt("id"));
                blogs.setTitle(rs.getString("title"));
                blogs.setContent(rs.getString("content"));
                blogs.setImage(rs.getString("image"));
                blogs.setPublishDate(rs.getDate("publishDate"));
                blogs.setStatus(rs.getInt("status"));
                blogs.setAccountId(rs.getInt("accountId"));

                list.add(blogs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> getBlogLasted(int status) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT TOP (3)\n"
                + "    B.[id],\n"
                + "    B.[title],\n"
                + "    B.[content],\n"
                + "    B.[image],\n"
                + "    B.[publishDate],\n"
                + "    B.[accountId],B.[status],\n"
                + "    A.[username] AS [accountName]\n"
                + "FROM [HaNoiTour].[dbo].[Blog] B\n"
                + "JOIN [HaNoiTour].[dbo].[Account] A ON B.[accountId] = A.[id]\n"
                + "where B.[status]= ?\n"
                + "ORDER BY ABS(DATEDIFF(SECOND, GETDATE(), B.[publishDate])) ASC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blogs = new Blog();
                blogs.setBid(rs.getInt("id"));
                blogs.setTitle(rs.getString("title"));
                blogs.setContent(rs.getString("content"));
                blogs.setImage(rs.getString("image"));
                blogs.setPublishDate(rs.getDate("publishDate"));
                blogs.setAccountId(rs.getInt("accountId"));
                blogs.setStatus(rs.getInt("status"));
                blogs.setAccountName(rs.getString("accountName"));
                list.add(blogs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateBlog(String title, String content, String image, int status, int bid) {
        String sql = "UPDATE [dbo].[Blog]\n"
                + "   SET [title] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE  [id] =?;";
        try {
            PreparedStatement rs = connection.prepareStatement(sql);

            rs.setString(1, title);
            rs.setString(2, content);
            rs.setString(3, image);

            rs.setInt(4, status);
            rs.setInt(5, bid);
            rs.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void deleteBlog(String id) {
        String sql = "delete from blog where id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);

            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void insertBlog(String title, String content, String image, Date publishDate, int accountId, int status) {
        String sql = "INSERT INTO [dbo].[Blog] "
                + "([title], [content], [image], [publishDate], [accountId], [status]) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement rs = connection.prepareStatement(sql)) {
            rs.setString(1, title);
            rs.setString(2, content);
            rs.setString(3, image);
            rs.setDate(4, publishDate);
            rs.setInt(5, accountId);
            rs.setInt(6, status);

            rs.executeUpdate();
        } catch (SQLException e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
        }
    }

    public Order getOrderByID(int orderId) {
        Order order = null;
        String sql = "SELECT * FROM [HaNoiTour].[dbo].[Order] WHERE id = ?;";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                order = new Order();
                order.setId(rs.getInt("id"));
                order.setAccountId(rs.getInt("accId"));

                order.setDate(rs.getString("date"));
                order.setTotalPrice(rs.getDouble("totalPrice"));

            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }

        return order;
    }

    public OrderDetail getOrderDetailByID(int orderId, int tourId) {
        OrderDetail orderDetail = null;
        String sql = "SELECT * FROM [HaNoiTour].[dbo].[OrderDetail] WHERE orderId = ? and tourId=?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId);
            st.setInt(2, tourId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                // Assuming your OrderDetail class has a constructor to initialize its properties
                orderDetail = new OrderDetail(
                        rs.getInt("orderId"),
                        rs.getInt("tourId"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getInt("versionId"),
                        rs.getInt("voucherId"),
                        rs.getString("dateDeparture"),
                        rs.getString("status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }

        return orderDetail;
    }

    public boolean checkUserOrder(int accId, int tourId) {
        boolean userHasPurchased = false;
        String sql = "SELECT TOP (1000)\n"
                + "      OD.[tourId]\n"
                + "	   ,O.[accId]\n"
                + "  FROM [HaNoiTour].[dbo].[OrderDetail] OD \n"
                + "    JOIN [Order] O ON OD.[orderId] = O.[id] WHERE O.[accId]= ? and OD.[tourId]=?;";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accId);
            ps.setInt(2, tourId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userHasPurchased = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userHasPurchased;
    }

    public int countUserFeedback(int accountId, int tourId) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS num_feedback FROM Feedback WHERE accId = ? and tourId= ?;";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ps.setInt(2, tourId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("num_feedback");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public List<Blog> searchBlogByName(String txtSearch) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT TOP (1000)\n"
                + "    B.[id],\n"
                + "    B.[title],\n"
                + "    B.[content],\n"
                + "    B.[image],\n"
                + "    B.[publishDate],\n"
                + "    B.[accountId],B.[status],"
                + "    A.[username] as [accountName]\n"
                + "FROM [HaNoiTour].[dbo].[Blog] B JOIN [dbo].[Account] A ON B.[accountId]=A.[id] where B.[title] like ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(
                        new Blog(
                                rs.getInt("id"),
                                rs.getString("title"),
                                rs.getString("content"),
                                rs.getString("image"),
                                rs.getDate("publishDate"),
                                rs.getInt("accountId"),
                                rs.getString("accountName"),
                                rs.getInt("status")
                        // Add missing commas and complete the constructor parameters as needed
                        ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void addBlogCommen(int accBlog, int idblog, String comment, Date commentDate) {
        String sql = "INSERT INTO BlogComment (accountId,blogId, comment,commentDate) VALUES (?, ?,?, ?)";

        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, accBlog);
            statement.setInt(2, idblog);
            statement.setString(3, comment);
            statement.setDate(4, commentDate);
            statement.executeUpdate();

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int countUserCMT(int accBlog, int idblog) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS num_feedback FROM BlogComment WHERE accountId = ? and blogId= ?;";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accBlog);
            ps.setInt(2, idblog);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("num_feedback");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public void updatecmt(int pid, int accBlog, int idblog, String comment) {
        String sql = " UPDATE [BlogComment]\n"
                + "SET \n"
                + "    [accountId] = ?,\n"
                + "    [blogId] = ?,\n"
                + "    [comment] = ?\n"
                + "WHERE\n"
                + "    [id] = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, accBlog);
            ps.setInt(2, idblog);
            ps.setString(3, comment);

            ps.setInt(4, pid);
            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public BlogComment getCommentByID(int id) {
        String sql = "SELECT B.[id]\n"
                + "      ,B.[blogId]\n"
                + "      ,B.[accountId]\n"
                + "      ,B.[comment]\n"
                + "      ,B.[commentDate]\n"
                + "	  ,A.[username] as [accName]\n"
                + "	  ,A.[avatar] as [accAvatar]\n"
                + "  FROM [dbo].[BlogComment] B JOIN [Account] A\n"
                + "  ON B.[accountId]= A.[id] where B.[id]=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new BlogComment(
                        rs.getInt("id"),
                        rs.getInt("blogId"), // Thay đổi từ accId thành blogId
                        rs.getInt("accountId"),
                        rs.getString("comment"),
                        rs.getDate("commentDate"),
                        rs.getString("accName"),
                        rs.getString("accAvatar")); // Thay đổi từ avatarAc thành accAvatar
            }
        } catch (SQLException e) {
            // Xử lý lỗi
            e.printStackTrace();
        }
        return null;
    }

    public void deleteCmt(String id) {
        String sql = "delete from BlogComment where id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);

            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void hideBlog(int bid, int status) {
        String sql = "UPDATE Blog SET status = ? WHERE bid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            // Chuyển chuỗi id thành một số nguyên trước khi đặt giá trị cho tham số trong câu lệnh SQL

            ps.setInt(1, status);
            ps.setInt(2, bid);
            ps.executeUpdate();
        } catch (SQLException e) {
        } catch (NumberFormatException e) {
        }
    }

    public OrderDetail getOrderDetailByID(int orderId) {
        OrderDetail order = null;
        String sql = "SELECT * FROM [HaNoiTour].[dbo].[OrderDetail] WHERE orderId = ?;";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                order = new OrderDetail();
                order.setOrderId(rs.getInt("orderId"));
                order.setTourId(rs.getInt("tourId"));

                order.setQuantity(rs.getInt("quantity"));
                order.setPrice(rs.getDouble("price"));
                order.setVersionId(rs.getInt("versionId"));
                order.setVoucherId(rs.getInt("voucherId"));

            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }

        return order;
    }

//    public List<HistoryOrder> getHistoryOrder(int idAcc) {
//        List<HistoryOrder> list = new ArrayList<>();
//        String sql = "SELECT TOP (1000) OD.[orderId], OD.[tourId], OD.[quantity], OD.[price], \n"
//                + "               OD.[versionId], T.[name], T.[imageMain], O.[accId], O.[date], T.[status], \n"
//                + "               O.[id] AS InvoiceNumber, T.[id] AS TourId \n"
//                + "               FROM [HaNoiTour].[dbo].[OrderDetail] OD \n"
//                + "               JOIN [Tour] T ON OD.[tourId] = T.[id] \n"
//                + "               JOIN [Order] O ON OD.[orderId] = O.[id] \n"
//                + "               WHERE O.[accId] = ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, idAcc);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                HistoryOrder historyOrder = new HistoryOrder();
//                DAO dao = new DAO();
//
//                Order order = dao.getOrderByID(rs.getInt("InvoiceNumber"));
//                OrderDetail od = dao.getOrderDetailByID(rs.getInt("orderId"));
//                historyOrder.setOrderdetail(od);
//                Tour tour = dao.getTourByID(rs.getInt("TourId"));
//                historyOrder.setOrder(order);
//                historyOrder.setTour(tour);
//
//                list.add(historyOrder);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
    public Account getAccountByID(int id) {
        String sql = "SELECT * FROM Account WHERE id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new Account(
                            rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getInt("role"),
                            rs.getString("address"),
                            rs.getString("avatar"),
                            rs.getString("phoneNumber"),
                            rs.getBoolean("status")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Lấy list feedback của customer về Web
    public List<FeedbackWeb> getListFeedbackWeb() {
        List<FeedbackWeb> list = new ArrayList<>();
        DAO dao = new DAO();
        String sql = "SELECT [id]\n"
                + "      ,[accId]\n"
                + "      ,[date]\n"
                + "      ,[subject]\n"
                + "      ,[message]\n"
                + "  FROM [dbo].[FeedbackWeb]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account acc = dao.getAccountByID(rs.getInt("accId"));
                list.add(new FeedbackWeb(
                        rs.getInt("id"),
                        acc, rs.getString("date"),
                        rs.getString("subject"),
                        rs.getString("message")));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void incrementTourVersion(int tourId) {

        // Update the tour version
        String sql = "UPDATE Tour SET version = version + 1 WHERE id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, tourId);

            // Execute the update
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately (log or throw)
        }
    }

    public void insertVoucher(String code, int discount, boolean status, int supplierId, String idAcc_raw) {
        String sql;
        try {
            if (idAcc_raw != null && !idAcc_raw.isEmpty()) {
                int idAcc = Integer.parseInt(idAcc_raw);
                sql = "INSERT INTO [dbo].[Voucher]\n"
                        + "   ([code]\n"
                        + "   ,[discountPercentage]\n"
                        + "   ,[status]\n"
                        + "   ,[supplierId]\n"
                        + "   ,[idAcc])\n"
                        + "VALUES (?, ?, ?, ?, ?)";

                try ( PreparedStatement st = connection.prepareStatement(sql)) {
                    // Set values for the parameters
                    st.setString(1, code);
                    st.setInt(2, discount);
                    st.setBoolean(3, status);
                    st.setInt(4, supplierId);
                    st.setInt(5, idAcc);

                    // Execute the update
                    st.executeUpdate();

                }
            } else {
                sql = "INSERT INTO [dbo].[Voucher]\n"
                        + "   ([code]\n"
                        + "   ,[discountPercentage]\n"
                        + "   ,[status]\n"
                        + "   ,[supplierId])\n"
                        + "VALUES (?, ?, ?, ?)";

                try ( PreparedStatement st = connection.prepareStatement(sql)) {
                    // Set values for the parameters
                    st.setString(1, code);
                    st.setInt(2, discount);
                    st.setBoolean(3, status);
                    st.setInt(4, supplierId);

                    // Execute the update
                    st.executeUpdate();

                }
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
        }

    }

    public void updateVoucher(int voucherId, int discountPercentage, boolean status, int accountId) {
        try {
            String sql = "UPDATE Voucher SET discountPercentage = ?, status = ?, idAcc = ? WHERE id = ?";

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setInt(1, discountPercentage);
            statement.setBoolean(2, status);
            statement.setInt(3, accountId);
            statement.setInt(4, voucherId);

            // Thực thi câu lệnh SQL
            statement.executeUpdate();

            // Đóng kết nối và tài nguyên
            statement.close();
            // Đóng kết nối

        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ
        }
    }

    public void banVoucher(int id) {
        String sql = "Update Voucher\n"
                + "Set [status] = '0'\n"
                + "Where id = ?;";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public void unbanVoucher(int id) {
        String sql = "Update Voucher\n"
                + "Set [status] = '1'\n"
                + "Where id = ?;";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public Voucher getVoucherByID(int id) {
        String sql = "select * from Voucher\n"
                + "                where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                return new Voucher(
                        rs.getInt("id"),
                        rs.getString("code"),
                        rs.getInt("discountPercentage"),
                        rs.getBoolean("status"),
                        rs.getInt("supplierId"),
                        rs.getInt("idAcc")
                );
            }
        } catch (SQLException e) {
        }
        return null;
    }

    //lay cac thong tin cua voucher ma idAcc do dang co
    public List<Voucher> getVouchersByAccountId(int accountId) {
        List<Voucher> vouchers = new ArrayList<>();
        try {

            String sql = "SELECT id, code, discountPercentage, status, supplierId, idAcc "
                    + "FROM Voucher "
                    + "WHERE idAcc = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);

            // Thực thi câu lệnh SQL và lấy kết quả
            ResultSet resultSet = statement.executeQuery();

            // Lặp qua các dòng kết quả và thêm voucher vào danh sách
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String code = resultSet.getString("code");
                int discountPercentage = resultSet.getInt("discountPercentage");
                boolean status = resultSet.getBoolean("status");
                int supplierId = resultSet.getInt("supplierId");
                int idAcc = resultSet.getInt("idAcc");

                // Tạo một đối tượng voucher từ dữ liệu kết quả và thêm vào danh sách
                Voucher voucher = new Voucher(id, code, discountPercentage, status, supplierId, idAcc);
                vouchers.add(voucher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ
        }
        return vouchers;
    }

    public void deleteVoucher(String vid) {
        String sql = "DELETE FROM Voucher WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, vid);

            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public boolean getVoucherStatus(int voucherId) {
        boolean status = false; // Default to false if not found or other logic

        // Your SQL query to retrieve the status from the database
        String sql = "SELECT status FROM Voucher WHERE id = ?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, voucherId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                status = rs.getBoolean("status");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    public boolean isVoucherCodeExists(String voucherCode, int supplierId) {
        boolean exists = false;

        String sql = "SELECT COUNT(distinct V.code)\n"
                + "FROM Voucher V\n"
                + "INNER JOIN Tour T ON V.supplierId = T.supplierId\n"
                + "WHERE V.code = ? AND V.supplierId = ?;";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, voucherCode);
            st.setInt(2, supplierId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                exists = count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi tùy theo yêu cầu
        }

        return exists;
    }

    public boolean getTourStatus(int TourId) {
        boolean status = false; // Default to false if not found or other logic

        // Your SQL query to retrieve the status from the database
        String sql = "SELECT status FROM Tour WHERE id = ?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, TourId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                status = rs.getBoolean("status");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    public void banTour(int id) {
        String sql = "Update Tour\n"
                + "Set [status] = '0'\n"
                + "Where id = ?;";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public void unbanTour(int id) {
        String sql = "Update Tour\n"
                + "Set [status] = '1'\n"
                + "Where id = ?;";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public List<OrderDetail> getCustomerForSupplier(int supplierId) {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "SELECT "
                + "OD.[orderId], "
                + "OD.[tourId], "
                + "OD.[quantity], "
                + "OD.[price], "
                + "OD.[versionId], "
                + "O.[date], "
                + "O.[totalPrice], "
                + "T.[name] AS TourName "
                + "FROM "
                + "[HaNoiTour].[dbo].[OrderDetail] OD "
                + "JOIN "
                + "[HaNoiTour].[dbo].[Order] O ON OD.[orderId] = O.[id] "
                + "JOIN "
                + "[HaNoiTour].[dbo].[Tour] T ON OD.[tourId] = T.[id] "
                + "WHERE "
                + "T.[supplierId] = ? "
                + "ORDER BY "
                + "O.[date] DESC;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId); // Set the supplierId parameter

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public TotalInvoiceOfCategory getTotalInvoiceCate(int supplierId) {
        String sql = "SELECT\n"
                + "    SUM(CASE WHEN p.categoryId = 1 THEN i.quantity * i.price ELSE 0 END) AS totalCate1,\n"
                + "    SUM(CASE WHEN p.categoryId = 2 THEN i.quantity * i.price ELSE 0 END) AS totalCate2,\n"
                + "    SUM(CASE WHEN p.categoryId = 3 THEN i.quantity * i.price ELSE 0 END) AS totalCate3,\n"
                + "    SUM(CASE WHEN p.categoryId = 4 THEN i.quantity * i.price ELSE 0 END) AS totalCate4\n"
                + "FROM\n"
                + "    [HaNoiTour].[dbo].[OrderDetail] i\n"
                + "JOIN\n"
                + "    [HaNoiTour].[dbo].[Tour] p ON i.tourId = p.id\n"
                + "WHERE\n"
                + "    p.categoryId IN (1, 2, 3, 4) AND\n"
                + "    p.supplierId = ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                TotalInvoiceOfCategory t = new TotalInvoiceOfCategory(
                        rs.getDouble("totalCate1"),
                        rs.getDouble("totalCate2"),
                        rs.getDouble("totalCate3"),
                        rs.getDouble("totalCate4")
                );
                return t;
            }
        } catch (SQLException e) {
            // Handle exception
            e.printStackTrace();
        }
        return null;
    }

    public List<TopProduct> listTopProduct(int supplierId) {
        List<TopProduct> list = new ArrayList();
        String sql = "SELECT TOP 3\n"
                + "        t.id AS TourId,\n"
                + "        t.name AS TourName,\n"
                + "        t.price,\n"
                + "        SUM(od.quantity) AS TotalQuantity\n"
                + "    FROM\n"
                + "        [HaNoiTour].[dbo].[Tour] t\n"
                + "    INNER JOIN\n"
                + "        [HaNoiTour].[dbo].[OrderDetail] od ON t.id = od.tourId\n"
                + "    INNER JOIN\n"
                + "        [HaNoiTour].[dbo].[Order] o ON od.orderId = o.id\n"
                + "    WHERE\n"
                + "        t.supplierId = ?\n"
                + "    GROUP BY\n"
                + "        t.id, t.name, t.price\n"
                + "    ORDER BY\n"
                + "        TotalQuantity DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            ResultSet rs = st.executeQuery();
            DAO d = new DAO();
            while (rs.next()) {
                TopProduct tp = new TopProduct();
                Tour p = d.getTourByID(rs.getInt("TourId"));
                tp.setTotalquantity(rs.getInt("TotalQuantity"));
                tp.setTour(p);

                list.add(tp);

            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
        return list;
    }

    public List<TopProduct> listTopAccounts(int supplierId) {
        List<TopProduct> list = new ArrayList<>();
        String sql = "SELECT TOP 3\n"
                + "    O.[accId] AS AccountId,\n"
                + "    A.[username] AS Username,\n"
                + "    A.[email] AS Email,\n"
                + "\n"
                + "    COUNT(OD.[orderId]) AS PurchaseCount\n"
                + "FROM\n"
                + "    [HaNoiTour].[dbo].[Order] O\n"
                + "JOIN\n"
                + "    [HaNoiTour].[dbo].[OrderDetail] OD ON O.[id] = OD.[orderId]\n"
                + "JOIN\n"
                + "    [HaNoiTour].[dbo].[Account] A ON O.[accId] = A.[id]\n"
                + "JOIN\n"
                + "    [HaNoiTour].[dbo].[Tour] T ON OD.[tourId] = T.[id]  \n"
                + "WHERE\n"
                + "    T.[supplierId] = ?\n"
                + "GROUP BY\n"
                + "    O.[accId], A.[username], A.[email]\n"
                + "ORDER BY\n"
                + "    PurchaseCount DESC;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            ResultSet rs = st.executeQuery();
            DAO d = new DAO();
            while (rs.next()) {
                TopProduct tp = new TopProduct();
                Account a = d.getAccountByID(rs.getInt("AccountId"));
                tp.setAccount(a);
                list.add(tp);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
        return list;
    }

    public List<TopProduct> listInvoice(int supplierId) {
        List<TopProduct> list = new ArrayList<>();
        String sql = " SELECT \n"
                + "    [Order].id AS InvoiceNumber,\n"
                + "    Tour.id AS TourId,\n"
                + "    Tour.name AS TourName,\n"
                + "    Tour.price AS TourPrice,\n"
                + "    Account.id AS AccountId,\n"
                + "    Account.username AS CustomerName,\n"
                + "    Account.phoneNumber AS CustomerPhone,\n"
                + "    Account.address AS CustomerAddress,\n"
                + "    [Order].date AS PurchaseDate\n"
                + "FROM \n"
                + "    [HaNoiTour].[dbo].[Tour] AS Tour\n"
                + "JOIN \n"
                + "    [HaNoiTour].[dbo].[OrderDetail] AS OrderDetail ON Tour.id = OrderDetail.tourId\n"
                + "JOIN \n"
                + "    [HaNoiTour].[dbo].[Order] AS [Order] ON OrderDetail.orderId = [Order].id\n"
                + "JOIN \n"
                + "    [HaNoiTour].[dbo].[Account] AS Account ON [Order].accId = Account.id \n"
                + "WHERE \n"
                + "    supplierId = ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            ResultSet rs = st.executeQuery();
            DAO d = new DAO();
            while (rs.next()) {
                TopProduct tp = new TopProduct();
                Order order = d.getOrderByID(rs.getInt("InvoiceNumber"));
                Tour tour = d.getTourByID(rs.getInt("TourId"));
                Account account = d.getAccountByID(rs.getInt("AccountId"));
                tp.setOrder(order);
                tp.setTour(tour);
                tp.setAccount(account);
                list.add(tp);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
        return list;
    }

//list ra các account de nhan voucher
    public List<TopProduct> listAccountsVoucher(int supplierId) {
        List<TopProduct> list = new ArrayList<>();
        String sql = "SELECT distinct A.id AS AccountId, A.[username] AS AccountUsername "
                + "FROM [HaNoiTour].[dbo].[Account] A "
                + "INNER JOIN [HaNoiTour].[dbo].[Order] O ON A.[id] = O.[accId] "
                + "INNER JOIN [HaNoiTour].[dbo].[OrderDetail] OD ON O.[id] = OD.[orderId] "
                + "INNER JOIN [HaNoiTour].[dbo].[Tour] T ON OD.[tourId] = T.[id] "
                + "WHERE T.[supplierId] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            ResultSet rs = st.executeQuery();
            DAO d = new DAO();
            while (rs.next()) {
                TopProduct tp = new TopProduct();
                Account a = d.getAccountByID(rs.getInt("AccountId"));
                tp.setAccount(a);
                list.add(tp);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
        return list;
    }

    //list ra các voucher
    public List<AccountVoucher> voucherOfAccount(int supplierId) {
        List<AccountVoucher> list = new ArrayList<>();
        String sql = "SELECT A.id AS AccountId, A.[username] AS AccountUsername, O.id AS VoucherId\n"
                + "FROM [HaNoiTour].[dbo].[Account] A\n"
                + "INNER JOIN [HaNoiTour].[dbo].[Voucher] O ON A.[id] = O.[idAcc]\n"
                + "WHERE O.supplierId = ?\n"
                + "\n"
                + "UNION\n"
                + "\n"
                + "SELECT NULL AS AccountId, NULL AS AccountUsername, O.id AS VoucherId\n"
                + "FROM [HaNoiTour].[dbo].[Voucher] O\n"
                + "WHERE O.idAcc IS NULL AND O.supplierId = ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            st.setInt(2, supplierId);
            ResultSet rs = st.executeQuery();
            DAO d = new DAO();
            while (rs.next()) {
                AccountVoucher tp = new AccountVoucher();
                Account a = d.getAccountByID(rs.getInt("AccountId"));
                Voucher vc = d.getVoucherByID(rs.getInt("VoucherId"));
                tp.setAccount(a);
                tp.setVoucher(vc);
                list.add(tp);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
        return list;
    }

    //hien ra cac ma code chua co idAcc
    public List<AccountVoucher> voucherNoIdAcc(int supplierId) {
        List<AccountVoucher> list = new ArrayList<>();
        String sql = "SELECT NULL AS AccountId, NULL AS AccountUsername, O.id AS VoucherId\n"
                + "FROM [HaNoiTour].[dbo].[Voucher] O\n"
                + "WHERE O.idAcc IS NULL AND O.supplierId = ? and O.status=1;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            ResultSet rs = st.executeQuery();
            DAO d = new DAO();
            while (rs.next()) {
                AccountVoucher tp = new AccountVoucher();
                // Không cần truy cập vào cột AccountId vì đã là NULL
                Voucher vc = d.getVoucherByID(rs.getInt("VoucherId"));
                tp.setVoucher(vc);
                list.add(tp);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ một cách thích hợp
        }
        return list;
    }

    public List<TopProduct> AccountIdVoucher(int supplierId, int accountId) {
        List<TopProduct> list = new ArrayList<>();
        String sql = "SELECT A.id AS AccountId, A.[username] AS AccountUsername\n"
                + "FROM [HaNoiTour].[dbo].[Account] A\n"
                + "INNER JOIN [HaNoiTour].[dbo].[Order] O ON A.[id] = O.[accId]\n"
                + "INNER JOIN [HaNoiTour].[dbo].[OrderDetail] OD ON O.[id] = OD.[orderId]\n"
                + "INNER JOIN [HaNoiTour].[dbo].[Tour] T ON OD.[tourId] = T.[id]\n"
                + "WHERE T.[supplierId] = ? and A.id=?\n"
                + "GROUP BY A.id, A.[username]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            st.setInt(2, accountId);  // Corrected parameter index
            ResultSet rs = st.executeQuery();
            DAO d = new DAO();
            while (rs.next()) {
                TopProduct tp = new TopProduct();
                Account a = d.getAccountByID(rs.getInt("AccountId"));
                tp.setAccount(a);
                list.add(tp);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
        return list;
    }

    public List<Tour> showTourBySupplier(int supplierId) {
        List<Tour> list = new ArrayList<>();

        String sql = "SELECT TOP (1000) \n"
                + "                T.[id], \n"
                + "                T.[name],\n"
                + "                 T.[imageMain],\n"
                + "                 T.[imageAlbum],\n"
                + "                 T.[intendedTime], \n"
                + "                T.[price], \n"
                + "                T.[description], \n"
                + "                T.[categoryId], \n"
                + "                T.[version], \n"
                + "                T.[rule], \n"
                + "                T.[supplierId], \n"
                + "                T.[status] \n"
                + "                FROM [HaNoiTour].[dbo].[Tour] T where status=1 and supplierId=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                String imageAlbumString = rs.getString("imageAlbum");

                // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));

                Tour tour = new Tour(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("imageMain"),
                        imageAlbumList,
                        rs.getTime("intendedTime"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status")
                );

                list.add(tour);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<HistoryOrder> getHistoryOrder(int idAcc) {
        List<HistoryOrder> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    T.supplierId as [orderId], \n"
                + "	O.[id] AS InvoiceNumber, \n"
                + "	T.[id] AS TourId,\n"
                + "    S.[accId] as SupplierId ,\n"
                + "	C.[id] as CategoryId,\n"
                + "\n"
                + "    COUNT(*) AS TotalOrders,\n"
                + "    STRING_AGG(T.name, ', ') AS OrderedTours\n"
                + "FROM\n"
                + "    OrderDetail OD  JOIN  Tour T ON OD.tourId = T.id\n"
                + "           JOIN [Order] O ON OD.orderId = O.id JOIN  Supplier S ON T.supplierId = S.accId  JOIN Category C ON C.[id]=T.[categoryId]\n"
                + "WHERE\n"
                + "    O.accId = ?\n"
                + "GROUP BY\n"
                + "    T.supplierId, S.[accId], O.[id],T.[id],C.[id]\n"
                + "ORDER BY\n"
                + "    T.supplierId;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idAcc);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                HistoryOrder historyOrder = new HistoryOrder();
                DAO dao = new DAO();

                Order order = dao.getOrderByID(rs.getInt("InvoiceNumber"));
                OrderDetail od = dao.getOrderDetailByID(rs.getInt("orderId"));
                Supplier sup = dao.getSupplierByID(rs.getInt("SupplierId"));
                Category category = dao.getCategoryById(rs.getInt("CategoryId"));
                Tour tour = dao.getTourByID(rs.getInt("TourId"));
                historyOrder.setOrder(order);
                historyOrder.setTour(tour);
                historyOrder.setOrderdetail(od);
                historyOrder.setSupplier(sup);
                historyOrder.setCategory(category);
                list.add(historyOrder);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Supplier getSupplierByID(int accId) {
        Supplier sup = null;
        String sql = "	select * from Supplier where accId=?;";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                sup = new Supplier();
                sup.setIdAcc(rs.getInt("accId"));
                sup.setNameCompany(rs.getString("nameCompany"));

            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }

        return sup;
    }

    public HistoryOrder getSupplierByTour(int tourId) {
        HistoryOrder historyOrder = null;
        String sql = "SELECT T.[id] AS TourId, s.[nameCompany], s.[accId] AS SupplierName FROM tour t JOIN supplier s ON t.[supplierId] = s.[accId] WHERE t.[id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, tourId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                DAO dao = new DAO();
                Tour tour = dao.getTourByID(rs.getInt("TourId"));
                Supplier supplier = dao.getSupplierByID(rs.getInt("SupplierName"));

                historyOrder = new HistoryOrder(tour, null, null, supplier, null);
                // Đây là một lựa chọn, nếu bạn không cần thông tin từ Order và OrderDetail
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historyOrder;
    }

    public Category getCategoryById(int categoryId) {
        Category category = null;
        String sql = "SELECT * FROM Category   WHERE id = ?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, categoryId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                category = new Category(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return category;
    }

    public List<Feedback> getFeedbackSupplier(int supplierId) {
        List<Feedback> list = new ArrayList<>();

        String sql = "  SELECT F.[id], F.[accId], A.[username] AS [accountUsername], \n"
                + "            F.[tourId], F.[versionId], F.[comment], F.[rating] , A.[avatar] as [avatarAc],T.[name] as [tourname]\n"
                + "              FROM [Feedback] F \n"
                + "              JOIN [Tour] T ON F.[tourId] = T.[id] \n"
                + "               JOIN [Account] A ON F.[accId] = A.[id] \n"
                + "               WHERE T.[supplierId] = ?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, supplierId);

            try ( ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Feedback feedback = new Feedback();

                    feedback.setId(rs.getInt("id"));
                    feedback.setAccId(rs.getInt("accId"));
                    feedback.setAccName(rs.getString("accountUsername"));
                    feedback.setTourId(rs.getInt("tourId"));
                    feedback.setVersionId(rs.getInt("versionId"));
                    feedback.setComment(rs.getString("comment"));
                    feedback.setRating(rs.getInt("rating"));
                    feedback.setAvatarAc(rs.getString("avatarAc"));
                    feedback.setNameTour(rs.getString("tourname"));
                    list.add(feedback);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public int countTourSupplier(int accId) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS count FROM Tour WHERE supplierId = ? ;";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public int countFeedbackSupplier(int accId) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS count FROM Feedback f join tour t on f.[tourId]= t.[id] WHERE t.supplierId = ?;";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public int countBlogSupplier(int accountId) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS count FROM Blog WHERE accountId = ? ;";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accountId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public int countOrderSupplier(int accId) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS count FROM [Order] WHERE accId = ? ;";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public static void main(String[] args) {
        // Assuming you have a DAO instance

    }

}
