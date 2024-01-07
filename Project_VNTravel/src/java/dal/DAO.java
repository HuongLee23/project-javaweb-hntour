/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

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
        String sql = "SELECT [id]\n"
                + "      ,[email]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[role]\n"
                + "      ,[address]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[cmnd]\n"
                + "  FROM [dbo].[Account]\n"
                + "  Where [email] = ? and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(
                        rs.getInt("id"),
                        rs.getString("email"), rs.getString("username"),
                        rs.getString("password"), rs.getInt("role"),
                        rs.getString("address"),
                        rs.getString("phoneNumber"), rs.getString("cmnd")
                );
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /*
    Change Password
     */
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

}
