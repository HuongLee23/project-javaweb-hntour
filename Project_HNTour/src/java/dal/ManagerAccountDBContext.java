package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

public class ManagerAccountDBContext extends DBContext<Account> {

    public List<Account> getListAccount() {
        List<Account> listAccounts = new ArrayList<>();
        try {
            String sql = "SELECT id,  email, username, [password],[address],[role],[status] FROM Account where [role] = 2";
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Account a = new Account();
                    a.setId(rs.getInt("id"));
                    a.setEmail(rs.getString("email"));
                    a.setRole(rs.getInt("role"));
                    a.setUsername(rs.getString("username"));
                    a.setPassword(rs.getString("password"));
                    a.setAddress(rs.getString("address"));
                    a.setStatus(rs.getBoolean("status"));
                    listAccounts.add(a);
                }
                return listAccounts;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public int countAccountCustomer() {
        int totalAccountCustomer = 0;
        String sql = "SELECT COUNT(*) AS id FROM Account where [status] = 1 and [role] = 2";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalAccountCustomer = rs.getInt("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalAccountCustomer;
    }

    public int countAccountSupplier() {
        int totalAccountSupplier = 0;
        String sql = "SELECT COUNT(*) AS id FROM Account where [status] = 1 and [role] = 3";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalAccountSupplier = rs.getInt("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalAccountSupplier;
    }

    public String totalPrice() {
        int totalPrice = 0;
        String formattedAmount = "";
        String sql = "Select sum(totalPrice) as totalPrice\n"
                + "from [Order]";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalPrice = rs.getInt("totalPrice");
                DecimalFormat decimalFormat = new DecimalFormat("#,##0");
                formattedAmount = decimalFormat.format(totalPrice);
            }
        } catch (SQLException ex) {

        }
        return formattedAmount;
    }

    public int totalAccountBanned() {
        int totalBanned = 0;
        String sql = "SELECT COUNT(*) AS id FROM Account where [status] = 0 and [role] = 2";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalBanned = rs.getInt("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalBanned;
    }

    public void banAccount(int id) {
        String sql = "Update Account\n"
                + "Set [status] = '0'\n"
                + "Where id = ?;";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void unbanAccount(int id) {
        String sql = "Update Account\n"
                + "Set [status] = '1'\n"
                + "Where id = ?;";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
