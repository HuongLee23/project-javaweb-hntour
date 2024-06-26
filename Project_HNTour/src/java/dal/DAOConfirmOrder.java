
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
import model.Order;
import model.OrderDetail;
import model.TopProduct;
import model.Tour;

/**
 *
 * @author Admin
 */
public class DAOConfirmOrder extends DBContext {

    public List<TopProduct> getListOrderPending(int supplierId) {
        List<TopProduct> list = new ArrayList<>();
        try {
            String sql = "SELECT od.[orderId] as InvoiceNumber, od.[tourId], od.[quantity], od.[price], od.[dateDeparture], od.[status], od.[versionId], od.[voucherId],\n"
                    + "       t.id as TourId, t.[name], t.[imageMain] ,\n"
                    + "       a.id as AccountId, a.[email], a.[username] , a.[address] , a.[avatar] , a.[phoneNumber] \n"
                    + "FROM [HaNoiTour].[dbo].[OrderDetail] od\n"
                    + "INNER JOIN [HaNoiTour].[dbo].[Order] o ON od.[orderId] = o.[id]\n"
                    + "INNER JOIN [HaNoiTour].[dbo].[Tour] t ON od.[tourId] = t.[id]\n"
                    + "INNER JOIN [HaNoiTour].[dbo].[Account] a ON o.[accId] = a.[id]\n"
                    + "WHERE t.[supplierId] = ?\n";

            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                stm.setInt(1, supplierId);
                ResultSet rs = stm.executeQuery();
                DAO d = new DAO();
                while (rs.next()) {
                    TopProduct tp = new TopProduct();
                    Order order1 = d.getOrderByID(rs.getInt("InvoiceNumber"));
                    OrderDetail order = d.getOrderDetailByID(rs.getInt("InvoiceNumber"), rs.getInt("TourId"));
                    Tour tour = d.getTourByID(rs.getInt("TourId"));
                    Account account = d.getAccountByID(rs.getInt("AccountId"));
                    tp.setOrder(order1);
                    tp.setOrderdetail(order);
                    tp.setTour(tour);
                    tp.setAccount(account);
                    list.add(tp);

                }
                return list;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<TopProduct> searchOrdersByDateRange(int supplierId, LocalDate startDate, LocalDate endDate) throws SQLException {
        List<TopProduct> orders = new ArrayList<>();
        String sql = "SELECT od.[orderId] as InvoiceNumber, od.[tourId], od.[quantity], od.[price], od.[dateDeparture], od.[status], od.[versionId], od.[voucherId], "
                + "t.id as TourId, t.[name], t.[imageMain], "
                + "a.id as AccountId, a.[email], a.[username], a.[address], a.[avatar], a.[phoneNumber] "
                + "FROM [HaNoiTour].[dbo].[OrderDetail] od "
                + "INNER JOIN [HaNoiTour].[dbo].[Order] o ON od.[orderId] = o.[id] "
                + "INNER JOIN [HaNoiTour].[dbo].[Tour] t ON od.[tourId] = t.[id] "
                + "INNER JOIN [HaNoiTour].[dbo].[Account] a ON o.[accId] = a.[id] "
                + "WHERE t.[supplierId] = ? "
                + "AND o.[date] BETWEEN ? AND ?";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, supplierId);
            stm.setDate(2, java.sql.Date.valueOf(startDate));
            stm.setDate(3, java.sql.Date.valueOf(endDate));
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                TopProduct tp = new TopProduct();
                Order order1 = new DAO().getOrderByID(rs.getInt("InvoiceNumber"));
                OrderDetail order = new DAO().getOrderDetailByID(rs.getInt("InvoiceNumber"), rs.getInt("TourId"));
                Tour tour = new DAO().getTourByID(rs.getInt("TourId"));
                Account account = new DAO().getAccountByID(rs.getInt("AccountId"));
                tp.setOrder(order1);
                tp.setOrderdetail(order);
                tp.setTour(tour);
                tp.setAccount(account);
                orders.add(tp);
            }
        }
        return orders;
    }

    public List<TopProduct> searchOrdersByDateDi(int supplierId, LocalDate startDate, LocalDate endDate) throws SQLException {
        List<TopProduct> orders = new ArrayList<>();
        String sql = "SELECT od.[orderId] as InvoiceNumber, od.[tourId], od.[quantity], od.[price], od.[dateDeparture], od.[status], od.[versionId], od.[voucherId], "
                + "t.id as TourId, t.[name], t.[imageMain], "
                + "a.id as AccountId, a.[email], a.[username], a.[address], a.[avatar], a.[phoneNumber] "
                + "FROM [HaNoiTour].[dbo].[OrderDetail] od "
                + "INNER JOIN [HaNoiTour].[dbo].[Order] o ON od.[orderId] = o.[id] "
                + "INNER JOIN [HaNoiTour].[dbo].[Tour] t ON od.[tourId] = t.[id] "
                + "INNER JOIN [HaNoiTour].[dbo].[Account] a ON o.[accId] = a.[id] "
                + "WHERE t.[supplierId] = ? "
                + "AND od.[dateDeparture] BETWEEN ? AND ?";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, supplierId);
            stm.setDate(2, java.sql.Date.valueOf(startDate));
            stm.setDate(3, java.sql.Date.valueOf(endDate));
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                TopProduct tp = new TopProduct();
                Order order1 = new DAO().getOrderByID(rs.getInt("InvoiceNumber"));
                OrderDetail order = new DAO().getOrderDetailByID(rs.getInt("InvoiceNumber"), rs.getInt("TourId"));
                Tour tour = new DAO().getTourByID(rs.getInt("TourId"));
                Account account = new DAO().getAccountByID(rs.getInt("AccountId"));
                tp.setOrder(order1);
                tp.setOrderdetail(order);
                tp.setTour(tour);
                tp.setAccount(account);
                orders.add(tp);
            }
        }
        return orders;
    }

    public static void main(String[] args) {
        int supplierId = 2; // Thay đổi ID nhà cung cấp tùy theo nhu cầu của bạn
        DAOConfirmOrder dao = new DAOConfirmOrder(); // Thay YourDAOClass bằng tên lớp DAO của bạn
        List<TopProduct> topProducts = dao.getListOrderPending(supplierId);
        if (topProducts != null) {
            for (TopProduct tp : topProducts) {
                System.out.println("Order ID: " + tp.getOrderdetail().getOrderId());
                System.out.println("Tour ID: " + tp.getOrderdetail().getTourId());
                System.out.println("Tour Name: " + tp.getTour().getName());
                System.out.println("Tour Image: " + tp.getTour().getImageMain());
                System.out.println("Account ID: " + tp.getAccount().getId());
                System.out.println("Account Email: " + tp.getAccount().getEmail());
                System.out.println("Account Username: " + tp.getAccount().getUsername());
                System.out.println("Account Address: " + tp.getAccount().getAddress());
                System.out.println("Account Avatar: " + tp.getAccount().getAvatar());
                System.out.println("Account Phone Number: " + tp.getAccount().getPhoneNumber());
                System.out.println("-----------------------------");
            }
        } else {
            System.out.println("Failed to retrieve pending orders.");
        }
    }

    public boolean confirmSupplier(int orderId, int tourId) {
        String sql = "UPDATE [dbo].[OrderDetail] "
                + "SET [status] = N'Xác nhận đơn hàng' "
                + "WHERE orderId = ? AND tourId = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, orderId);
            stm.setInt(2, tourId);
            int rowsAffected = stm.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất một bản ghi được cập nhật thành công
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Xử lý ngoại lệ nếu cần thiết
            return false;
        }

    }

    public boolean cancelSupplier(int orderId, int tourId) {
        String sql = "UPDATE [dbo].[OrderDetail] "
                + "SET [status] = N'Hủy đơn hàng' "
                + "WHERE orderId = ? AND tourId = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, orderId);
            stm.setInt(2, tourId);
            int rowsAffected = stm.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất một bản ghi được cập nhật thành công
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Xử lý ngoại lệ nếu cần thiết
            return false;
        }

    }

}
