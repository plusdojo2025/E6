package servlet;

import java.net.PasswordAuthentication;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.TemporalAdjusters;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import jakarta.mail.*;
import jakarta.mail.internet.*;

public class MonthlyEmailScheduler {

    private static final String TO = "recipient@example.com";
    private static final String SUBJECT = "月末レポート";
    private static final String BODY = "これは月末に送信された自動メールです。";

    public static void main(String[] args) {
        scheduleNextSend();
    }

    private static void scheduleNextSend() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime nextRun = LocalDate.now()
            .with(TemporalAdjusters.lastDayOfMonth())
            .atTime(18, 0);  // 月末18:00送信

        // 月末を過ぎていたら来月末に設定
        if (now.isAfter(nextRun)) {
            nextRun = LocalDate.now().plusMonths(1)
                .with(TemporalAdjusters.lastDayOfMonth())
                .atTime(18, 0);
        }

        long delay = Duration.between(now, nextRun).toMillis();
        ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();

        scheduler.schedule(() -> {
            sendEmail();
            scheduler.shutdown(); // 一旦止める
            scheduleNextSend();   // 次回のスケジュール再設定
        }, delay, TimeUnit.MILLISECONDS);

        System.out.println("次回送信予定日時: " + nextRun);
    }

    private static void sendEmail() {
        String from = "your_email@example.com";
        final String username = "your_email@example.com";
        final String password = "your_password";
        String host = "smtp.example.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(
                Message.RecipientType.TO, InternetAddress.parse(TO));
            message.setSubject(SUBJECT);
            message.setText(BODY);

            Transport.send(message);
            System.out.println("メールを送信しました！");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
