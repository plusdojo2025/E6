package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import dto.Coin;
import dto.User;

public class CoinDao {
	
	
	
	  // DB接続情報（プロダクション環境では外部化推奨）
    private static final String DB_URL = "jdbc:mysql://localhost:3306/e6?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "password";

    /**
     * コインの月初処理（初回アクセス時のみ実行）
     * ranking_coin = receive_coin、hold_coin = 50、receive_coin = 0 に更新し、
     * 月初リセット済みとして記録する。
     */
    public boolean resetAndRankCoinsIfNeeded() {
        Connection conn = null;
        boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // 現在の年月を取得
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            int month = cal.get(Calendar.MONTH) + 1;

            // 今月の処理がすでに実行されたか確認
            if (!isResetDone(conn, year, month)) {
                result = performCoinReset(conn);

                if (result) {
                    logReset(conn, year, month);
                    System.out.println("月初処理を実行しました。");
                }
            } else {
                System.out.println("月初処理はすでに実行されています。");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return result;
    }

    /**
     * 月初リセットが今月すでに実行されたかどうかを確認
     */
    private boolean isResetDone(Connection conn, int year, int month) throws SQLException {
        String sql = "SELECT COUNT(*) FROM monthly_reset_log WHERE reset_year = ? AND reset_month = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, year);
            stmt.setInt(2, month);
            try (ResultSet rs = stmt.executeQuery()) {
                rs.next();
                return rs.getInt(1) > 0;
            }
        }
    }

    /**
     * コインテーブルを更新する（リセット処理）
     */
    private boolean performCoinReset(Connection conn) throws SQLException {
        String sql = "UPDATE coin SET ranking_coin = receive_coin, hold_coin = 50, receive_coin = 0";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }

    /**
     * 月初処理を記録する
     */
    private void logReset(Connection conn, int year, int month) throws SQLException {
        String sql = "INSERT INTO monthly_reset_log (reset_year, reset_month) VALUES (?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, year);
            stmt.setInt(2, month);
            stmt.executeUpdate();
        }
    }

	/*// コインリセット＆ランキングに代入
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
    }*/
	
	
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
                Coin coin = new Coin();
                user.setRegist_number(rs.getInt("regist_number"));
                user.setName(rs.getString("name"));
                coin.setReceive_coin(rs.getInt("recive_coin")); // DTOに必要なら追加
                topUsers.add(user);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return topUsers;
    }
	
	
	// ユーザー削除
    public boolean coin_data_del(Coin card) {
        Connection conn = null;
        boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e6?"
                    + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
                    "root", "password");
            

            String sql = "DELETE FROM coin WHERE regist_number=?";
            PreparedStatement pStmt = conn.prepareStatement(sql);

            if (card.getRegist_number() != 0) {
                pStmt.setInt(1, card.getRegist_number());
            } else {
                pStmt.setNull(1, java.sql.Types.INTEGER);
            }

            if (pStmt.executeUpdate() == 1) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return result;
    }
}

