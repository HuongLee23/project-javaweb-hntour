package dal;

import java.sql.Connection;
import java.sql.Date;
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
import model.InformationAccount;
import model.Supplier;

public class AdminDAO extends DBContext {

    public List<Account> getListAccount(int role) {
        List<Account> listAccounts = new ArrayList<>();
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[email]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[role]\n"
                    + "      ,[address]\n"
                    + "      ,[avatar]\n"
                    + "      ,[phoneNumber]\n"
                    + "      ,[status]\n"
                    + "  FROM [HaNoiTour].[dbo].[Account] "
                    + "where [role] != 1";
            if (role != 0) {
                sql += "and [role] = " + role;
            }
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Account a = new Account();
                    a.setId(rs.getInt("id"));
                    a.setEmail(rs.getString("email"));
                    a.setUsername(rs.getString("username"));
                    a.setPassword(rs.getString("password"));
                    a.setRole(rs.getInt("role"));
                    a.setAddress(rs.getString("address"));
                    a.setAvatar(rs.getString("avatar"));
                    a.setPhoneNumber(rs.getString("phoneNumber"));
                    a.setStatus(rs.getBoolean("status"));
                    listAccounts.add(a);
                }
                return listAccounts;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int countAccountCustomer() {
        int totalAccountCustomer = 0;
        String sql = "SELECT COUNT(*) AS id FROM Account where [status] = 1 and [role] = 3";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalAccountCustomer = rs.getInt("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalAccountCustomer;
    }

    public int countAccountSupplier() {
        int totalAccountSupplier = 0;
        String sql = "SELECT COUNT(*) AS id FROM Account where [status] = 1 and [role] = 2";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalAccountSupplier = rs.getInt("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean registerSupplier(
            int idAcc, String fullName, Date birthday, String email,
            String phoneNumber, String frontCMND, String backCMND,
            String nameCompany, String addressCompany, String emailCompany,
            String phoneNumberCompany, String businessCode, String businessRegis,
            String taxCertificate, String taxPayment) {

        String sql = "INSERT INTO [dbo].[Supplier]\n"
                + "           ([fullName]\n"
                + "           ,[birthday]\n"
                + "           ,[email]\n"
                + "           ,[phoneNumber]\n"
                + "           ,[frontCMND]\n"
                + "           ,[backCMND]\n"
                + "           ,[nameCompany]\n"
                + "           ,[addressCompany]\n"
                + "           ,[emailCompany]\n"
                + "           ,[phoneNumberCompany]\n"
                + "           ,[businessCode]\n"
                + "           ,[businessRegis]\n"
                + "           ,[taxCertificate]\n"
                + "           ,[taxPayment]\n"
                + "           ,[accId])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullName);
            st.setDate(2, birthday);
            st.setString(3, email);
            st.setString(4, phoneNumber);
            st.setString(5, frontCMND);
            st.setString(6, backCMND);
            st.setString(7, nameCompany);
            st.setString(8, addressCompany);
            st.setString(9, emailCompany);
            st.setString(10, phoneNumberCompany);
            st.setString(11, businessCode);
            st.setString(12, businessRegis);
            st.setString(13, taxCertificate);
            st.setString(14, taxPayment);
            st.setInt(15, idAcc);

            int result = st.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public Supplier getInforSupplierByID(int id) {
        String sql = "SELECT [fullName]\n"
                + "      ,[birthday]\n"
                + "      ,[email]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[frontCMND]\n"
                + "      ,[backCMND]\n"
                + "      ,[nameCompany]\n"
                + "      ,[addressCompany]\n"
                + "      ,[emailCompany]\n"
                + "      ,[phoneNumberCompany]\n"
                + "      ,[businessCode]\n"
                + "      ,[businessRegis]\n"
                + "      ,[taxCertificate]\n"
                + "      ,[taxPayment]\n"
                + "      ,[accId]\n"
                + "  FROM [dbo].[Supplier] \n"
                + "  WHERE accId = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Supplier(
                        id,
                        rs.getString("fullName"),
                        rs.getDate("birthday"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getString("frontCMND"),
                        rs.getString("backCMND"),
                        rs.getString("nameCompany"),
                        rs.getString("addressCompany"),
                        rs.getString("emailCompany"),
                        rs.getString("phoneNumberCompany"),
                        rs.getString("businessCode"),
                        rs.getString("businessRegis"),
                        rs.getString("taxCertificate"),
                        rs.getString("taxPayment")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Supplier> getListRegisterSupplier() {
        List<Supplier> list = new ArrayList();
        try {
            String sql = "SELECT \n"
                    + "	s.[accId],\n"
                    + "    s.[fullName],\n"
                    + "    s.[birthday],\n"
                    + "    s.[email],\n"
                    + "    s.[phoneNumber],\n"
                    + "    s.[frontCMND],\n"
                    + "    s.[backCMND],\n"
                    + "    s.[nameCompany],\n"
                    + "    s.[addressCompany],\n"
                    + "    s.[emailCompany],\n"
                    + "    s.[phoneNumberCompany],\n"
                    + "    s.[businessCode],\n"
                    + "    s.[businessRegis],\n"
                    + "    s.[taxCertificate],\n"
                    + "    s.[taxPayment]\n"
                    + "FROM \n"
                    + "    [HaNoiTour].[dbo].[Supplier] AS s\n"
                    + "JOIN \n"
                    + "    [HaNoiTour].[dbo].[Account] AS a\n"
                    + "ON \n"
                    + "    s.[accId] = a.[id]\n"
                    + "WHERE \n"
                    + "    a.[role] = 3;";

            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Supplier s = new Supplier();
                    s.setIdAcc(rs.getInt("accId"));
                    s.setFullName(rs.getString("fullName"));
                    s.setBirthday(rs.getDate("birthday"));
                    s.setEmail(rs.getString("email"));
                    s.setPhoneNumber(rs.getString("phoneNumber"));
                    s.setFrontCMND(rs.getString("frontCMND"));
                    s.setBackCMND(rs.getString("backCMND"));
                    s.setNameCompany(rs.getString("nameCompany"));
                    s.setAddressCompany(rs.getString("addressCompany"));
                    s.setEmailCompany(rs.getString("emailCompany"));
                    s.setPhoneNumberCompany(rs.getString("phoneNumberCompany"));
                    s.setBusinessCode(rs.getString("businessCode"));
                    s.setBusinessRegis(rs.getString("businessRegis"));
                    s.setTaxCertificate(rs.getString("taxCertificate"));
                    s.setTaxPayment(rs.getString("taxPayment"));
                    list.add(s);
                }
                return list;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean confirmRegisterSupplier(int id) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [role] = 2\n"
                + " WHERE id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            int result = stm.executeUpdate();
            return result > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateInforCustomer(int id, String name, String password,
            String email, String phoneNumber, String address
    ) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [email] = ?\n"
                + "      ,[username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phoneNumber] = ?\n"
                + " WHERE id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, email);
            stm.setString(2, name);
            stm.setString(3, password);
            stm.setString(4, address);
            stm.setString(5, phoneNumber);
            stm.setInt(6, id);
            int result = stm.executeUpdate();
            return result > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Account> searchAccount(String txt) {
        List<Account> listAccounts = new ArrayList<>();
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[email]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[role]\n"
                    + "      ,[address]\n"
                    + "      ,[avatar]\n"
                    + "      ,[phoneNumber]\n"
                    + "      ,[status]\n"
                    + "  FROM [HaNoiTour].[dbo].[Account] "
                    + "where [role] != 1 and "
                    + "([email] LIKE ? or [username] LIKE ? "
                    + "or [address] LIKE ? or [phoneNumber] LIKE ? )";

            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                stm.setString(1, "%" + txt + "%");
                stm.setString(2, "%" + txt + "%");
                stm.setString(3, "%" + txt + "%");
                stm.setString(4, "%" + txt + "%");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Account a = new Account();
                    a.setId(rs.getInt("id"));
                    a.setEmail(rs.getString("email"));
                    a.setUsername(rs.getString("username"));
                    a.setPassword(rs.getString("password"));
                    a.setRole(rs.getInt("role"));
                    a.setAddress(rs.getString("address"));
                    a.setAvatar(rs.getString("avatar"));
                    a.setPhoneNumber(rs.getString("phoneNumber"));
                    a.setStatus(rs.getBoolean("status"));
                    listAccounts.add(a);
                }
                return listAccounts;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean deleteFeedbackWeb(int id) {
        String sql = "DELETE FROM [dbo].[FeedbackWeb]\n"
                + "      WHERE id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            int result = stm.executeUpdate();
            return result > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean cancelCooperationSupplier(int id) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [role] = 3\n"
                + " WHERE id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            int result = stm.executeUpdate();
            return result > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public static void main(String[] args) {
        AdminDAO d = new AdminDAO();
        Supplier s = d.getInforSupplierByID(1);
        System.out.println(s.getEmail());
    }
}
