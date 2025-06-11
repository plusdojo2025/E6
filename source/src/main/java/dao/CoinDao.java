package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.User;

public class CoinDao {

	// コインリセット＆ランキングに代入
	public boolean resetAndRankCoins() {
        Connection conn = null;
        boolean result = false;

        try {
            // JDBCドライバの読み込み
            Class.forName("com.mysql.cj.jdbc.Driver");

            // DB接続
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/e6?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9",
                "root", "password"
            );

            // SQL文
            String sql = "UPDATE coin SET ranking_coin = receive_coin, hold_coin = 50, receive_coin = 0";
            PreparedStatement pStmt = conn.prepareStatement(sql);

            // 実行
            int rows = pStmt.executeUpdate();
            result = rows > 0;

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return result;
    }
	
	
	//ランキング情報取得
	public List<User> getRanking(String registNumber) {
        List<User> topUsers = new ArrayList<>();
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/e6?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9",
                "root", "password"
            );

            String sql = 
                "SELECT c.regist_number, u.name, c.recive_coin " +
                "FROM coin c " +
                "JOIN users u ON c.regist_number = u.regist_number " +
                "WHERE u.company = (SELECT company FROM users WHERE regist_number = ?) " +
                "ORDER BY c.recive_coin DESC " +
                "LIMIT 5";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, registNumber);

            ResultSet rs = pStmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setRegist_number(rs.getInt("regist_number"));
                user.setName(rs.getString("name"));
                user.setReceive_coin(rs.getInt("recive_coin")); // DTOに必要なら追加
                topUsers.add(user);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return topUsers;
    }
}
