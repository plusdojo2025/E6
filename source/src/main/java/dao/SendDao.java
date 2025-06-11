package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Send;
import dto.User;

public class SendDao {
	//メニュー画面に表示する新着受信履歴を取得
	public List<Send> getRecentReceivedMessages(String receiverRegistNumber) {
        List<Send> sendList = new ArrayList<>();
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/e6?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9",
                "root", "password"
            );

            String sql = 
                "SELECT s.id, s.send_date, s.regist_number, u.name " +
                "FROM send s " +
                "JOIN users u ON s.regist_number = u.regist_number " +
                "WHERE s.receiver_number = ? " +
                "ORDER BY s.send_date DESC " +
                "LIMIT 3";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, receiverRegistNumber);

            ResultSet rs = pStmt.executeQuery();

            while (rs.next()) {
                Send send = new Send();
                send.setId(rs.getInt("id"));
                send.setSend_date(rs.getTimestamp("send_date"));
                send.setRegist_number(rs.getInt("regist_number"));
                send.setSender_name(rs.getString("name")); // DTOに追加が必要
                sendList.add(send);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return sendList;
    }

	
	//同じ会社のユーザーを取得
	public List<User> getUsersInSameCompany(String loginUserRegistNumber) {
        List<User> userList = new ArrayList<>();
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/e6?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9",
                "root", "password"
            );

            String sql = 
                "SELECT regist_number, name " +
                "FROM users " +
                "WHERE company = (SELECT company FROM users WHERE regist_number = ?)";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, loginUserRegistNumber);

            ResultSet rs = pStmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setRegist_number(String.valueOf(rs.getInt("regist_number")));
                user.setName(rs.getString("name"));
                userList.add(user);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return userList;
    }
	
	//送信情報登録
	public boolean insertSend(Send send) {
        Connection conn = null;
        boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/e6?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9",
                "root", "password"
            );

            String sql = 
                "INSERT INTO send (regist_number, comment, send_coin, receiver_number) " +
                "VALUES (?, ?, ?, ?)";

            PreparedStatement pStmt = conn.prepareStatement(sql);

            // 送信者登録番号
            pStmt.setInt(1, send.getRegist_number());

            // コメント
            pStmt.setString(2, send.getComment());

            // 送るコイン数
            pStmt.setInt(3, send.getSend_coin());

            // 受信者登録番号
            pStmt.setInt(4, send.getReceiver_number());

            int rows = pStmt.executeUpdate();
            result = (rows == 1);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return result;
    }
}
