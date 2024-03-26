
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.Item;
import model.Tour;
import model.Voucher;

/**
 *
 * @author hello
 */
public class CheckoutDAO extends DBContext {

    //Lấy voucher mà tài khoản đang có
    public List<Voucher> listVoucherByIdAcc(int id) {
        List<Voucher> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[code]\n"
                + "      ,[discountPercentage]\n"
                + "      ,[status]\n"
                + "      ,[supplierId]\n"
                + "      ,[idAcc]\n"
                + "  FROM [dbo].[Voucher] where idAcc = ?";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Voucher v = new Voucher();
                v.setId(rs.getInt("id"));
                v.setCode(rs.getString("code"));
                v.setDiscount(rs.getInt("discountPercentage"));
                v.setStatus(rs.getBoolean("status"));
                v.setSupplierId(rs.getInt("supplierId"));
                v.setIdAcc(rs.getInt("idAcc"));
                list.add(v);
            }
            return list;
        } catch (SQLException e) {
            Logger.getLogger(CheckoutDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    // Xử lý checkout sản phẩm đối với Buy now
    public boolean addOrderForBuyNow(Item item, Account a, int idInforAcc) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //Insert giá trị vào Order
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([accId]\n"
                    + "           ,[idInforAcc]\n"
                    + "           ,[date]\n"
                    + "           ,[totalPrice])\n"
                    + "     VALUES\n"
                    + "           ( ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getId());
            st.setInt(2, idInforAcc);
            st.setString(3, date);
            st.setDouble(4, item.getPriceSale() != 0 ? item.getPriceSale() : item.getPrice());
            st.executeUpdate();

            //Lấy giá trị của Order vừa mới Insert cho vào OrderDetail
            String sql1 = "SELECT top(1) [id]\n"
                    + "      ,[accId]\n"
                    + "      ,[idInforAcc]\n"
                    + "      ,[date]\n"
                    + "      ,[totalPrice]\n"
                    + "  FROM [dbo].[Order]\n"
                    + "  Where accId = ?\n"
                    + "  order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, a.getId());
            ResultSet rs = st1.executeQuery();

            if (rs.next()) {
                int oid = rs.getInt("id");
                //Insert giá trị vào OrderDetail
                String sql2 = "INSERT INTO [dbo].[OrderDetail]\n"
                        + "           ([orderId]\n"
                        + "           ,[tourId]\n"
                        + "           ,[quantity]\n"
                        + "           ,[price]\n"
                        + "           ,[dateDeparture]\n"
                        + "           ,[versionId]\n"
                        + "           ,[voucherId])\n"
                        + "     VALUES\n"
                        + "           ( ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, oid);
                st2.setInt(2, item.getTour().getId());
                st2.setInt(3, item.getQuantity());
                st2.setDouble(4, rs.getDouble("totalPrice"));
                st2.setString(5, item.getDateDeparture());
                st2.setInt(6, item.getTour().getVersion());
                st2.setInt(7, item.getIdVoucher());
                st2.executeUpdate();
            }
            if (item.getIdVoucher() != 0) {
                //Nếu có áp mã voucher thì xóa cái voucher mà Account này có
                String sql3 = "UPDATE Voucher\n"
                        + "SET idAcc = NULL\n"
                        + "WHERE id = ?;";
                PreparedStatement st3 = connection.prepareStatement(sql3);
                st3.setInt(1, item.getIdVoucher());
                st3.executeUpdate();
            }

            return true;
        } catch (SQLException e) {
            Logger.getLogger(CheckoutDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

// Xử lý checkout các sản phẩm trong giỏ hàng
    public boolean addOrderForCart(Cart cart, Account a, int idInforAcc) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([accId]\n"
                    + "           ,[idInforAcc]\n"
                    + "           ,[date]\n"
                    + "           ,[totalPrice])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getId());
            st.setInt(2, idInforAcc);
            st.setString(3, date);
            st.setDouble(4, cart.getTotalMoneyUseVoucher() != 0 ? cart.getTotalMoneyUseVoucher() : cart.getTotalMoney());
            st.executeUpdate();

            String sql1 = "SELECT top(1) [id]\n"
                    + "      ,[accId]\n"
                    + "      ,[date]\n"
                    + "      ,[totalPrice]\n"
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
                            + "           ,[dateDeparture]\n"
                            + "           ,[versionId]\n"
                            + "           ,[voucherId])\n"
                            + "     VALUES\n"
                            + "           ( ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getTour().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPriceSale() != 0 ? i.getPriceSale() : i.getPrice());
                    st2.setString(5, i.getDateDeparture());
                    st2.setInt(6, i.getTour().getVersion());
                    st2.setInt(7, i.getIdVoucher());
                    st2.executeUpdate();

                }
            }

            //Kiểm tra xem item nào dùng voucher
            for (Item i : cart.getItems()) {
                if (i.getIdVoucher() != 0) {
                    //Nếu có áp mã voucher thì xóa cái voucher mà Account này có
                    String sql3 = "UPDATE Voucher\n"
                            + "SET idAcc = NULL\n"
                            + "WHERE id = ?;";
                    PreparedStatement st3 = connection.prepareStatement(sql3);
                    st3.setInt(1, i.getIdVoucher());
                    st3.executeUpdate();
                }
            }

            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {

    }
}

