
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

//import java.sql.Array;
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
import model.Cart;
import model.Category;
import model.Feedback;
import model.InformationAccount;
import model.Item;
//import model.ImageAlbum;
import model.Schedules;
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
                + "FROM [HaNoiTour].[dbo].[Tour] T ";

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
                + "               WHERE T.[id] = ?;";

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

//<<<<<<< HEAD
//    public List<Tour> getTourBySortPrice(String typeSort) {
//        List<Tour> list = new ArrayList<>();
//        String sql = "SELECT TOP (1000) "
//                + "T.[id], "
//                + "T.[name],"
//                + " T.[imageMain],"
//                + " T.[imageAlbum],"
//                + " T.[intendedTime], "
//                + "T.[price], "
//                + "T.[description], "
//                + "T.[categoryId], "
//                + "T.[version], "
//                + "T.[rule], "
//                + "T.[supplierId], "
//                + "T.[status] "
//                + "FROM [HaNoiTour].[dbo].[Tour] T "
//                + " ORDER BY T.[price]";
//        if (typeSort.equals("asc")) {
//            sql += " ASC";
//        } else if (typeSort.equals("desc")) {
//            sql += " DESC";
//        }
//        try {
//            PreparedStatement st;
//            st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                String imageAlbumString = rs.getString("imageAlbum");
//                // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
//                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));
//
//                Tour tour = new Tour(
//                        rs.getInt("id"),
//                        rs.getString("name"),
//                        rs.getString("imageMain"),
//                        imageAlbumList,
//                        rs.getTime("intendedTime"),
//                        rs.getDouble("price"),
//                        rs.getString("description"),
//                        rs.getInt("categoryId"),
//                        rs.getInt("version"),
//                        rs.getString("rule"),
//                        rs.getInt("supplierId"),
//                        rs.getBoolean("status")
//                );
//
//                list.add(tour);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//=======
//>>>>>>> Namcthe171385
//    public List<Tour> searchPriceUnder500() {
//        List<Tour> list = new ArrayList<>();
//        String sql = "SELECT T.[id]\n"
//                + "      ,T.[name]\n"
//                + "      ,T.[imageId]\n"
//                + "      ,T.[intendedTime]\n"
//                + "      ,T.[price]\n"
//                + "      ,T.[description]\n"
//                + "      ,T.[categoryId]\n"
//                + "      ,T.[version]\n"
//                + "      ,T.[rule]\n"
//                + "      ,T.[feedbackID]\n"
//                + "      ,T.[supplierId]\n"
//                + "      ,T.[status]\n"
//                + "	 ,IA.imgMain\n"
//                + "     FROM [dbo].[Tour] T JOIN [dbo].[ImageAlbum] IA "
//                + "     ON T.imageId = IA.id\n"
//                + "     WHERE T.[price] < 500000";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                list.add(new Tour(rs.getInt("id"),
//                        rs.getString("name"),
//                        rs.getInt("imageId"),
//                        rs.getTime("intendedTime"),
//                        rs.getString("price"),
//                        rs.getString("description"),
//                        rs.getInt("categoryId"),
//                        rs.getInt("version"),
//                        rs.getString("rule"),
//                        rs.getInt("feedbackID"),
//                        rs.getInt("supplierId"),
//                        rs.getBoolean("status"),
//                        rs.getString("imgMain")));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//
//    public List<Tour> searchPrice500To1000() {
//        List<Tour> list = new ArrayList<>();
//        String sql = "SELECT T.[id]\n"
//                + "      ,T.[name]\n"
//                + "      ,T.[imageId]\n"
//                + "      ,T.[intendedTime]\n"
//                + "      ,T.[price]\n"
//                + "      ,T.[description]\n"
//                + "      ,T.[categoryId]\n"
//                + "      ,T.[version]\n"
//                + "      ,T.[rule]\n"
//                + "      ,T.[feedbackID]\n"
//                + "      ,T.[supplierId]\n"
//                + "      ,T.[status]\n"
//                + "	 ,IA.imgMain\n"
//                + "     FROM [dbo].[Tour] T JOIN [dbo].[ImageAlbum] IA "
//                + "     ON T.imageId = IA.id\n"
//                + "     WHERE T.[price] >= 500000 and T.[price] <= 1000000";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                list.add(new Tour(rs.getInt("id"),
//                        rs.getString("name"),
//                        rs.getInt("imageId"),
//                        rs.getTime("intendedTime"),
//                        rs.getString("price"),
//                        rs.getString("description"),
//                        rs.getInt("categoryId"),
//                        rs.getInt("version"),
//                        rs.getString("rule"),
//                        rs.getInt("feedbackID"),
//                        rs.getInt("supplierId"),
//                        rs.getBoolean("status"),
//                        rs.getString("imgMain")));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//
//    public List<Tour> searchPriceAbove1000() {
//        List<Tour> list = new ArrayList<>();
//        String sql = "SELECT T.[id]\n"
//                + "      ,T.[name]\n"
//                + "      ,T.[imageId]\n"
//                + "      ,T.[intendedTime]\n"
//                + "      ,T.[price]\n"
//                + "      ,T.[description]\n"
//                + "      ,T.[categoryId]\n"
//                + "      ,T.[version]\n"
//                + "      ,T.[rule]\n"
//                + "      ,T.[feedbackID]\n"
//                + "      ,T.[supplierId]\n"
//                + "      ,T.[status]\n"
//                + "	 ,IA.imgMain\n"
//                + "     FROM [dbo].[Tour] T JOIN [dbo].[ImageAlbum] IA "
//                + "     ON T.imageId = IA.id\n"
//                + "     WHERE T.[price] > 1000000";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                list.add(new Tour(rs.getInt("id"),
//                        rs.getString("name"),
//                        rs.getInt("imageId"),
//                        rs.getTime("intendedTime"),
//                        rs.getString("price"),
//                        rs.getString("description"),
//                        rs.getInt("categoryId"),
//                        rs.getInt("version"),
//                        rs.getString("rule"),
//                        rs.getInt("feedbackID"),
//                        rs.getInt("supplierId"),
//                        rs.getBoolean("status"),
//                        rs.getString("imgMain")));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
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
    
    
    
//
//    public List<Tour> getTourBySortRating(String typeSort) {
//        List<Tour> list = new ArrayList<>();
//        String sql = "SELECT TOP (1000) T.[id],T.[name], \n"
//                + "				T.[imageMain], \n"
//                + "				T.[imageAlbum], \n"
//                + "				T.[intendedTime], \n"
//                + "				T.[price], \n"
//                + "                T.[description], \n"
//                + "                T.[categoryId], \n"
//                + "                T.[version], \n"
//                + "                T.[rule], \n"
//                + "                T.[supplierId], \n"
//                + "                T.[status],\n"
//                + "				F.rating\n"
//                + "                 FROM [HaNoiTour].[dbo].[Tour] T  JOIN [HaNoiTour].[dbo].[Feedback] F \n"
//                + "				 ON T.[id] = F.[id]\n"
//                + "                 ORDER BY F.[rating]";
//        if (typeSort.equals("asc")) {
//            sql += " ASC";
//        } else if (typeSort.equals("desc")) {
//            sql += " DESC";
//        }
//        try {
//            PreparedStatement st;
//            st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                String imageAlbumString = rs.getString("imageAlbum");
//                // Chia chuỗi thành mảng các chuỗi con bằng cách sử dụng phương thức split
//                List<String> imageAlbumList = Arrays.asList(imageAlbumString.split("/splitAlbum/"));
//
//                Tour tour = new Tour(
//                        rs.getInt("id"),
//                        rs.getString("name"),
//                        rs.getString("imageMain"),
//                        imageAlbumList,
//                        rs.getTime("intendedTime"),
//                        rs.getDouble("price"),
//                        rs.getString("description"),
//                        rs.getInt("categoryId"),
//                        rs.getInt("version"),
//                        rs.getString("rule"),
//                        rs.getInt("supplierId"),
//                        rs.getBoolean("status")
//                );
//
//                list.add(tour);
//                 == == == = e.printStackTrace(); // Print stack trace for debugging
//            }finally {
//                        // Close the ResultSet, PreparedStatement, and Connection
//                        if (rs != null) {
//                            try {
//                                rs.close();
//                            } catch (SQLException e) {
//                                e.printStackTrace();
//                            }
//                             >>> >>> > Namcthe171385
//                        }
//            if (st != null) {
//                            try {
//                                st.close();
//                            } catch (SQLException e) {
//                                e.printStackTrace();
//                            }
//                        }
//        }
//            return list;
//        }
//
//    }

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

    public Category getCategoryById(int categoryId) {
        Category category = null;
        String sql = "SELECT * FROM Category join  WHERE id = ?";

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

        
    //lay tat ca cac schedule cua tour do
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

    public void getFeedbackTour(int accId, int tourId, int versionId, String comment, int star) {
        String sql = "INSERT INTO [dbo].[Feedback]\n"
                + "           ([accId]\n"
                + "           ,[tourId]\n"
                + "           ,[versionId]\n"
                + "           ,[comment]\n"
                + "           ,[rating])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accId);
            st.setInt(2, tourId);
            st.setInt(3, versionId);
            st.setString(4, comment);
            st.setInt(5, star);

            st.executeUpdate();

            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

// Chưa hoàn thiện xong phần checkout
    public void addOrder(Account a, Cart cart, Voucher v) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([accId]\n"
                    + "           ,[date]\n"
                    + "           ,[totalPrice]\n"
                    + "           ,[voucherId])\n"
                    + "     VALUES\n"
                    + "           ( ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getId());
            st.setString(2, date);
            st.setDouble(3, cart.getTotalMoney());
            st.setInt(4, v.getId());
            st.executeUpdate();

            String sql1 = "SELECT top(1) [id]\n"
                    + "      ,[accId]\n"
                    + "      ,[date]\n"
                    + "      ,[totalPrice]\n"
                    + "      ,[voucherId]\n"
                    + "  FROM [dbo].[Order] where accId = ? \n"
                    + "  order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, a.getId());
            ResultSet rs = st1.executeQuery();

            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderDetail]\n"
                            + "           ([orderId]\n"
                            + "           ,[tourId]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price]\n"
                            + "           ,[versionId])\n"
                            + "     VALUES( ?, ?, ?, ?, ?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getTour().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.setInt(5, v.getId());
                    st2.executeUpdate();
                }

            }
        } catch (SQLException e) {
        }
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
            String price, String description, int categoryId, String rule, int supplierId,
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
                tourStatement.setInt(11, 1);

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

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Tour> l = d.getTourBySort("asc", "rating");
        System.out.println(l);

    }

}
