/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import ulti.PasswordEncryption;

/**
 *
 * @author hello
 */
public class AccountDAO extends DBContext {

    /*
        Create a new account
     */
    public boolean registerAccount(
            String email, String username, String password, int role
    ) {
        PasswordEncryption encry = new PasswordEncryption();
        String hasPassowrd = encry.hashPassword(password);

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
            st.setString(3, hasPassowrd);
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
        PasswordEncryption encry = new PasswordEncryption();
        String hasPassowrd = encry.hashPassword(password);
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            st.setString(2, hasPassowrd);

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

        PasswordEncryption encryPass = new PasswordEncryption();
        String hasPassowrd = encryPass.hashPassword(pass);

        PasswordEncryption encryNewPass = new PasswordEncryption();
        String hasNewPassowrd = encryNewPass.hashPassword(newPass);

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hasNewPassowrd);
            st.setString(2, email);
            st.setString(3, hasPassowrd);
            int result = st.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean forgotPassword(String email, String pass, String newPass) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [password] = ?\n"
                + " WHERE [email] = ? and [password] = ?";

        PasswordEncryption encryNewPass = new PasswordEncryption();
        String hasNewPassowrd = encryNewPass.hashPassword(newPass);

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hasNewPassowrd);
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
}
