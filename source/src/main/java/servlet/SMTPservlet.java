package servlet;

import java.net.PasswordAuthentication;
import java.util.Properties;

import jakarta.mail.*;
import jakarta.mail.internet.*;

public class OutlookMailSender {
    public static void main(String[] args) {
        // OutlookのSMTPサーバ情報
        final String smtpHost = "smtp.office365.com";
        final String smtpPort = "587";
        final String username = "your_email@outlook.com";   // 自分のOutlookメールアドレス
        final String password = "your_password";            // Outlookのアカウントパスワード

        // 送信先とメールの内容
        String to = "recipient@example.com";
        String subject = "Outlookメールテスト";
        String body = "これはJavaから送ったOutlookメールのテストです。";

        // プロパティ設定
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.port", smtpPort);
        props.put("mail.smtp.ssl.trust", smtpHost);  // 信頼できるSMTPサーバとして指定

        // 認証付きセッションの作成
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // メールメッセージの構築
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);

            // メール送信
            Transport.send(message);
            System.out.println("Outlook経由でメールを送信しました。");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
