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

/**
 *
 * @author Admin
 */
public class DAODoanhThu extends DBContext<Account> {
    
    public MonthTotalInvoice getMothTotalInvoice(int supplierId) {
        String sql = "WITH MonthlyRevenue AS (\n" +
"    SELECT\n" +
"        MONTH(o.[date]) AS Month,\n" +
"        COALESCE(SUM(od.quantity * od.price), 0) AS TotalRevenue\n" +
"    FROM\n" +
"        [HaNoiTour].[dbo].[Order] o\n" +
"        JOIN [HaNoiTour].[dbo].[OrderDetail] od ON o.id = od.orderId\n" +
"        JOIN [HaNoiTour].[dbo].[Tour] t ON od.tourId = t.id\n" +
"    WHERE\n" +
"        o.[date] >= DATEADD(MONTH, -12, GETDATE()) AND\n" +
"        t.supplierId = ?\n" +
"    GROUP BY\n" +
"    \n" +
"        MONTH(o.[date])\n" +
")\n" +
"SELECT\n" +
"    \n" +
"    COALESCE(MAX(CASE WHEN Month = 1 THEN TotalRevenue END), 0) AS Month1,\n" +
"    COALESCE(MAX(CASE WHEN Month = 2 THEN TotalRevenue END), 0) AS Month2,\n" +
"    COALESCE(MAX(CASE WHEN Month = 3 THEN TotalRevenue END), 0) AS Month3,\n" +
"    COALESCE(MAX(CASE WHEN Month = 4 THEN TotalRevenue END), 0) AS Month4,\n" +
"    COALESCE(MAX(CASE WHEN Month = 5 THEN TotalRevenue END), 0) AS Month5,\n" +
"    COALESCE(MAX(CASE WHEN Month = 6 THEN TotalRevenue END), 0) AS Month6,\n" +
"    COALESCE(MAX(CASE WHEN Month = 7 THEN TotalRevenue END), 0) AS Month7,\n" +
"    COALESCE(MAX(CASE WHEN Month = 8 THEN TotalRevenue END), 0) AS Month8,\n" +
"    COALESCE(MAX(CASE WHEN Month = 9 THEN TotalRevenue END), 0) AS Month9,\n" +
"    COALESCE(MAX(CASE WHEN Month = 10 THEN TotalRevenue END), 0) AS Month10,\n" +
"    COALESCE(MAX(CASE WHEN Month = 11 THEN TotalRevenue END), 0) AS Month11,\n" +
"    COALESCE(MAX(CASE WHEN Month = 12 THEN TotalRevenue END), 0) AS Month12\n" +
"FROM\n" +
"    MonthlyRevenue";
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
    
    public static void main(String[] args) {
        // Thực hiện kết nối đến cơ sở dữ liệu (đã được khởi tạo trước đó)
DAODoanhThu dao=new DAODoanhThu();
        // Thực hiện lấy doanh thu theo tháng cho một supplier cụ thể (thay thế supplierId bằng giá trị thích hợp)
        int supplierId = 2; // Thay giá trị supplierId bằng ID của supplier bạn quan tâm
        MonthTotalInvoice monthTotalInvoice = dao.getMothTotalInvoice(supplierId);

        // Kiểm tra xem có kết quả hay không
        if (monthTotalInvoice != null) {
            
            System.out.println("Month1: " + monthTotalInvoice.getMonth1());
            System.out.println("Month2: " + monthTotalInvoice.getMonth2());
            System.out.println("Month3: " + monthTotalInvoice.getMonth3());
            // ... Tiếp tục in ra các tháng khác
        } else {
            System.out.println("Không có dữ liệu doanh thu cho supplier có ID là " + supplierId);
        }

        // Đóng kết nối đến cơ sở dữ liệu (nếu có)
    }

}
