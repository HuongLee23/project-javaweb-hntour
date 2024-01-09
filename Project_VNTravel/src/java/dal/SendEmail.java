/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author hello
 */
public class SendEmail {

    public boolean sendMailForCusBuy(String email, int randomNumber) {
        final String username = "vntraveltouring@gmail.com";
        final String password = "tsbe wzlc rold wikt";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.socketFactory.port", "587");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        prop.put("mail.mime.charset", "UTF-8");
        prop.put("mail.mime.encodefilename", "true");

        Session session = Session.getInstance(prop,
                new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            String emailContent = "TravelVN\n"
                    + "\n"
                    + "Kính gửi:\n"
                    + "Quý khách\n"
                    + "TravelVN đã nhận được yêu cầu của Quý khách về việc xác minh tài khoản để đặt lại mật khẩu.\n"
                    + "Để đặt lại mật khẩu. Quý khách vui lòng nhập lại mã xác minh sau:\n"
                    + "\t\t\t\t\t\t" + randomNumber + "\n"
                    + "TravelVN hân hạnh được phục vụ Quý khách.\n"
                    + "Trân trọng!";

            Multipart multipart = new MimeMultipart();
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setText(emailContent, "UTF-8");
            multipart.addBodyPart(textPart);

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.addRecipient(
                    Message.RecipientType.TO,
                    new InternetAddress(email));
            message.setSubject("TravelVN");
//            message.setText(content);
            message.setContent(multipart);

            Transport.send(message);
            System.out.println("Done");
            return true;
        } catch (MessagingException e) {
        }

        return false;
    }

}
