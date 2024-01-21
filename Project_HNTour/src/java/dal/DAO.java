/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Tour;

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
            String profileImage,
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
            st.setString(4, profileImage);
            st.setString(5, phoneNumber);

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
                + " T.[imageId],"
                + " T.[intendedTime], "
                + "T.[price], "
                + "T.[description], "
                + "T.[categoryId], "
                + "T.[version], "
                + "T.[rule], "
                + "T.[feedbackID], "
                + "T.[supplierId], "
                + "T.[status], "
                + "IA.[imgMain] "
                + "FROM [HaNoiTour].[dbo].[Tour] T "
                + "JOIN [HaNoiTour].[dbo].[ImageAlbum] IA"
                + " ON T.[imageId] = IA.[id]";

        try ( PreparedStatement st = connection.prepareStatement(sql);  ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Tour tour = new Tour(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("imageId"),
                        rs.getTime("intendedTime"),
                        rs.getString("price"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getInt("version"),
                        rs.getString("rule"),
                        rs.getInt("feedbackID"),
                        rs.getInt("supplierId"),
                        rs.getBoolean("status"),
                        rs.getString("imgMain")
                );

                list.add(tour);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
}
