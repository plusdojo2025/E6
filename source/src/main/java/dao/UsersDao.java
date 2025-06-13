package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.User;

public class UsersDao {

    // ログイン判定
    public boolean isLoginOK(User idpw) {
        Connection conn = null;
        boolean loginResult = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e6?"
                    + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
                    "root", "password");

            String sql = "SELECT * FROM users WHERE mail=? AND password=?";
            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, idpw.getMail());
            pStmt.setString(2, idpw.getPassword());

            ResultSet rs = pStmt.executeQuery();

            if (rs.next()) {
                // ログイン成功
                idpw.setRegist_number(rs.getInt("regist_number"));
                loginResult = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return loginResult;
    }

    // 新規登録
    public boolean new_regist(User card) {
        Connection conn = null;
        boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e6?"
                    + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
                    "root", "password");

            String sql = "INSERT INTO users (regist_number, mail, name, company, password) VALUES (0, ?, ?, ?, ?)";
            PreparedStatement pStmt = conn.prepareStatement(sql);

            pStmt.setString(1, card.getMail() != null ? card.getMail() : "");
            pStmt.setString(2, card.getName() != null ? card.getName() : "");
            pStmt.setString(3, card.getCompany() != null ? card.getCompany() : "");
            pStmt.setString(4, card.getPassword() != null ? card.getPassword() : "");

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


    // ユーザー情報の表示
    public boolean user_data(User card) {
        Connection conn = null;
        boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e6?"
                    + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
                    "root", "password");

            String sql = "SELECT company, name, mail FROM users WHERE regist_number=?";
            PreparedStatement pStmt = conn.prepareStatement(sql);

            if (card.getRegist_number() != 0) {
                pStmt.setInt(1, card.getRegist_number());
            } else {
                pStmt.setNull(1, java.sql.Types.INTEGER);
            }

            ResultSet rs = pStmt.executeQuery();

            if (rs.next()) {
                card.setCompany(rs.getString("company"));
                card.setName(rs.getString("name"));
                card.setMail(rs.getString("mail"));
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return result;
    }

    // ユーザー情報の更新
    public boolean user_data_up(User card) {
        Connection conn = null;
        boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e6?"
                    + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
                    "root", "password");

            String sql = "UPDATE users SET company=?, name=?, mail=? WHERE regist_number=?";
            PreparedStatement pStmt = conn.prepareStatement(sql);

            pStmt.setString(1, card.getCompany() != null ? card.getCompany() : "");
            pStmt.setString(2, card.getName() != null ? card.getName() : "");
            pStmt.setString(3, card.getMail() != null ? card.getMail() : "");
            if (card.getRegist_number() != null) {
                pStmt.setInt(4, card.getRegist_number());
            } else {
                pStmt.setNull(4, java.sql.Types.INTEGER);
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

    // ユーザー削除
    public boolean user_data_del(User card) {
        Connection conn = null;
        boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e6?"
                    + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
                    "root", "password");

            String sql = "DELETE FROM users WHERE regist_number=?";
            PreparedStatement pStmt = conn.prepareStatement(sql);

            Integer registNumber = card.getRegist_number();
            if (registNumber != null && registNumber != 0) {
                pStmt.setInt(1, registNumber);
            } else {
                pStmt.setNull(1, java.sql.Types.INTEGER);
            }

            int count = pStmt.executeUpdate();
            System.out.println("削除対象件数: " + count);
            if (count == 1) {
                result = true;
            } else {
                System.out.println("削除対象が見つかりませんでした");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return result;
    }
}
