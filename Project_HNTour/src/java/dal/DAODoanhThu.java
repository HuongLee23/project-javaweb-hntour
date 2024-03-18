/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.MonthTotalInvoice;
import model.Quater;

/**
 *
 * @author Admin
 */
public class DAODoanhThu extends DBContext<Account> {

    public MonthTotalInvoice getMothTotalInvoice(int supplierId) {
        String sql = "WITH MonthlyRevenue AS (\n"
                + "    SELECT\n"
                + "        MONTH(o.[date]) AS Month,\n"
                + "        COALESCE(SUM(od.quantity * od.price), 0) AS TotalRevenue\n"
                + "    FROM\n"
                + "        [HaNoiTour].[dbo].[Order] o\n"
                + "        JOIN [HaNoiTour].[dbo].[OrderDetail] od ON o.id = od.orderId\n"
                + "        JOIN [HaNoiTour].[dbo].[Tour] t ON od.tourId = t.id\n"
                + "    WHERE\n"
                + "        o.[date] >= DATEADD(MONTH, -12, GETDATE()) AND\n"
                + "        t.supplierId = ?\n"
                + "    GROUP BY\n"
                + "    \n"
                + "        MONTH(o.[date])\n"
                + ")\n"
                + "SELECT\n"
                + "    \n"
                + "    COALESCE(MAX(CASE WHEN Month = 1 THEN TotalRevenue END), 0) AS Month1,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 2 THEN TotalRevenue END), 0) AS Month2,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 3 THEN TotalRevenue END), 0) AS Month3,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 4 THEN TotalRevenue END), 0) AS Month4,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 5 THEN TotalRevenue END), 0) AS Month5,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 6 THEN TotalRevenue END), 0) AS Month6,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 7 THEN TotalRevenue END), 0) AS Month7,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 8 THEN TotalRevenue END), 0) AS Month8,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 9 THEN TotalRevenue END), 0) AS Month9,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 10 THEN TotalRevenue END), 0) AS Month10,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 11 THEN TotalRevenue END), 0) AS Month11,\n"
                + "    COALESCE(MAX(CASE WHEN Month = 12 THEN TotalRevenue END), 0) AS Month12\n"
                + "FROM\n"
                + "    MonthlyRevenue";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                MonthTotalInvoice m = new MonthTotalInvoice(
                        rs.getDouble("Month1"), rs.getDouble("Month2"),
                        rs.getDouble("Month3"), rs.getDouble("Month4"),
                        rs.getDouble("Month5"), rs.getDouble("Month6"),
                        rs.getDouble("Month7"), rs.getDouble("Month8"),
                        rs.getDouble("Month9"), rs.getDouble("Month10"),
                        rs.getDouble("Month11"), rs.getDouble("Month12"));
                return m;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Quater getTotalInvoiceByQuater(int supplierId) {
        String sql = "SELECT\n"
                + "    YEAR(o.[date]) AS [Year],\n"
                + "    SUM(CASE WHEN DATEPART(QUARTER, o.[date]) = 1 THEN od.quantity * od.price ELSE 0 END) AS [Quarter1],\n"
                + "    SUM(CASE WHEN DATEPART(QUARTER, o.[date]) = 2 THEN od.quantity * od.price ELSE 0 END) AS [Quarter2],\n"
                + "    SUM(CASE WHEN DATEPART(QUARTER, o.[date]) = 3 THEN od.quantity * od.price ELSE 0 END) AS [Quarter3],\n"
                + "    SUM(CASE WHEN DATEPART(QUARTER, o.[date]) = 4 THEN od.quantity * od.price ELSE 0 END) AS [Quarter4]\n"
                + "FROM\n"
                + "    [HaNoiTour].[dbo].[Order] o\n"
                + "INNER JOIN\n"
                + "    [HaNoiTour].[dbo].[OrderDetail] od ON o.[id] = od.[orderId]\n"
                + "INNER JOIN\n"
                + "    [HaNoiTour].[dbo].[Tour] t ON od.[tourId] = t.[id]\n"
                + "WHERE\n"
                + "    t.supplierId = ?\n"
                + "GROUP BY\n"
                + "    YEAR(o.[date]);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Quater q = new Quater(rs.getDouble(2), rs.getDouble(3),
                        rs.getDouble(4), rs.getDouble(5));
                return q;
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) {
        // Thay đổi supplierId tùy theo nhà cung cấp bạn muốn kiểm tra
        int supplierId = 2; // Thay 123 bằng ID thực tế của nhà cung cấp

        DAODoanhThu dt = new DAODoanhThu();

        Quater totalInvoice = dt.getTotalInvoiceByQuater(supplierId);
        if (totalInvoice != null) {
            System.out.println("Total invoice for supplier " + supplierId + " : ");

            System.out.println("Quarter: " + totalInvoice.getQuater1());
            System.out.println("Revenue: " + totalInvoice.getQuater2());
        } else {
            System.out.println("No data found for supplier " + supplierId);
        }
    }

}
