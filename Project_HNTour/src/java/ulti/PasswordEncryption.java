/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulti;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author hello
 */
public class PasswordEncryption {

    //Hàm mã hóa password
    public String hashPassword(String password) {
        try {
            // Tạo một instance của MessageDigest với thuật toán MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // Chuyển đổi mật khẩu thành mảng byte
            byte[] temp = password.getBytes();

            // Tính toán giá trị băm của mảng byte
            byte[] hashData = md.digest(temp);

            // Chuyển đổi giá trị băm thành chuỗi hex
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashData) {
                // Chuyển đổi mỗi byte thành một số hex và nối vào chuỗi hexString
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            // Trả về chuỗi hex
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            // Xử lý nếu thuật toán không tồn tại
            e.printStackTrace();
            return null;
        }
    }

    //Hàm giải mã password
    public String decodeHashedPassword(String hashedPassword) {
        // Tạo một StringBuilder để lưu trữ kết quả
        StringBuilder result = new StringBuilder();

        // Lặp qua từng cặp ký tự trong chuỗi hex
        for (int i = 0; i < hashedPassword.length(); i += 2) {
            // Lấy cặp ký tự hex tiếp theo
            String hexPair = hashedPassword.substring(i, i + 2);

            // Chuyển đổi cặp ký tự hex thành giá trị byte
            int byteValue = Integer.parseInt(hexPair, 16);

            // Chuyển đổi giá trị byte thành ký tự và thêm vào kết quả
            result.append((char) byteValue);
        }

        // Trả về chuỗi kết quả
        return result.toString();
    }

    public static void main(String[] args) {
//        String password = "Ngoc2345";
//        String hashedPassword = hashPassword(password);
//        System.out.println("Hashed Password: " + hashedPassword);
//
//        // Giải mã mật khẩu
//        String decodedPassword = decodeHashedPassword(hashedPassword);
//        System.out.println("Decoded Password: " + decodedPassword);
    }
}
