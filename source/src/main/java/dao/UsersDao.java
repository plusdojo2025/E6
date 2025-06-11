/*package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Bc;
import dto.User;

public class UsersDao {

	// ログイン判定(usersテーブルからメールアドレスとパスワードの項目で合う数を探す)
		public boolean isLoginOK(User idpw) {
			Connection conn = null;
			boolean loginResult = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("com.mysql.cj.jdbc.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e6?"
						+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
						"root", "password");

				// SELECT文を準備する
				String sql = "SELECT count(*) FROM users WHERE mail=? AND password=?";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				pStmt.setString(1, idpw.getId());
				pStmt.setString(2, idpw.getPw());

				// SELECT文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// ユーザーIDとパスワードが一致するユーザーがいれば結果をtrueにする
				rs.next();
				if (rs.getInt("count(*)") == 1) {
					loginResult = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				loginResult = false;
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				loginResult = false;
			} finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
						loginResult = false;
					}
				}
			}

			// 結果を返す
			return loginResult;
		}
	}


//新規登録（usersテーブルに入力された情報を挿入する）
	public boolean new_regist(User card) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e6?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する
			String sql = "\"INSERT INTO users (regist_number, mail, name, company, password) VALUES (0, ?, ?, ?, '')";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (card.getMail() != null) {
				pStmt.setString(1, card.getMail());
			} else {
				pStmt.setString(1, "");
			}
			if (card.getName() != null) {
				pStmt.setString(2, card.getName());
			} else {
				pStmt.setString(2, "");
			}
			if (card.getCompany() != null) {
				pStmt.setString(3, card.getCompany());
			} else {
				pStmt.setString(3, "");
			}
			

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}
	
	//パスワード登録（usersテーブルに入力された情報を挿入する）
	public boolean ps_regist(User card) {
	    Connection conn = null;
	    boolean result = false;

	    try {
	        // JDBCドライバを読み込む
	        Class.forName("com.mysql.cj.jdbc.Driver");

	        // データベースに接続する
	        conn = DriverManager.getConnection(
	            "jdbc:mysql://localhost:3306/e6?"
	            + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
	            "root", "password"
	        );

	        // SQL文を準備する（passwordのみ更新）
	        String sql = "UPDATE users SET password = ? WHERE mail = ?";
	        PreparedStatement pStmt = conn.prepareStatement(sql);

	        // SQL文を完成させる
	        if (card.getPassword() != null) {
	            pStmt.setString(1, card.getPassword());
	        } else {
	            pStmt.setString(1, "");
	        }

	        if (card.getMail() != null) {
	            pStmt.setString(2, card.getMail());
	        } else {
	            pStmt.setString(2, "");
	        }

	        // SQL文を実行する
	        if (pStmt.executeUpdate() == 1) {
	            result = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } finally {
	        // データベースを切断
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

	    // 結果を返す
	    return result;
	}
	

	//ユーザー情報の表示（usersテーブルからregist_number が指定された値と一致するユーザーの「会社名」「名前」「メールアドレス」を取得する）
		public boolean user_data(User card) {
		    Connection conn = null;
		    boolean result = false;

		    try {
		        // JDBCドライバを読み込む
		        Class.forName("com.mysql.cj.jdbc.Driver");

		        // データベースに接続する
		        conn = DriverManager.getConnection(
		            "jdbc:mysql://localhost:3306/e6?"
		            + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
		            "root", "password"
		        );

		        // SQL文を準備する（passwordのみ更新）
		        String sql = "SELECT company, name, mail FROM users WHERE regist_number=?";
		        PreparedStatement pStmt = conn.prepareStatement(sql);

		        // SQL文を完成させる
		        if (card.getRegist_number() != null) {
		            pStmt.setString(1, card.getRegist_number());
		        } else {
		            pStmt.setString(1, "");
		        }


		        // SQL文を実行する
		        if (pStmt.executeUpdate() == 1) {
		            result = true;
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } catch (ClassNotFoundException e) {
		        e.printStackTrace();
		    } finally {
		        // データベースを切断
		        if (conn != null) {
		            try {
		                conn.close();
		            } catch (SQLException e) {
		                e.printStackTrace();
		            }
		        }
		    }

		    // 結果を返す
		    return result;
		}
		
		
		//ユーザー情報の登録（usersテーブルに、入力された会社名と氏名、メールアドレスを挿入)
				public boolean user_data_up(User card) {
				    Connection conn = null;
				    boolean result = false;

				    try {
				        // JDBCドライバを読み込む
				        Class.forName("com.mysql.cj.jdbc.Driver");

				        // データベースに接続する
				        conn = DriverManager.getConnection(
				            "jdbc:mysql://localhost:3306/e6?"
				            + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
				            "root", "password"
				        );

				        // SQL文を準備する
				        String sql = "UPDATE SET users SET company=?, name=?, mail=? WHERE regist_number=?";
				        PreparedStatement pStmt = conn.prepareStatement(sql);

				        // SQL文を完成させる
				        if (card.getCompany() != null) {
				            pStmt.setString(1, card.getCompany());
				        } else {
				            pStmt.setString(1, "");
				        }
				        if (card.getName() != null) {
				            pStmt.setString(2, card.getName());
				        } else {
				            pStmt.setString(2, "");
				        }
				        if (card.getMail() != null) {
				            pStmt.setString(3, card.getMail());
				        } else {
				            pStmt.setString(3, "");
				        }
				        if (card.getRegist_number() != null) {
				            pStmt.setString(4, card.getRegist_number());
				        } else {
				            pStmt.setString(4, "");
				        }


				        // SQL文を実行する
				        if (pStmt.executeUpdate() == 1) {
				            result = true;
				        }
				    } catch (SQLException e) {
				        e.printStackTrace();
				    } catch (ClassNotFoundException e) {
				        e.printStackTrace();
				    } finally {
				        // データベースを切断
				        if (conn != null) {
				            try {
				                conn.close();
				            } catch (SQLException e) {
				                e.printStackTrace();
				            }
				        }
				    }

				    // 結果を返す
				    return result;
				}

				//ユーザー情報の削除（usersテーブルからregist_number が指定された値と一致するユーザーの情報を削除する）
				public boolean user_data_del(User card) {
				    Connection conn = null;
				    boolean result = false;

				    try {
				        // JDBCドライバを読み込む
				        Class.forName("com.mysql.cj.jdbc.Driver");

				        // データベースに接続する
				        conn = DriverManager.getConnection(
				            "jdbc:mysql://localhost:3306/e6?"
				            + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
				            "root", "password"
				        );

				        // SQL文を準備する
				        String sql = "DELETE FROM users WHERE regist_number=?;";
				        PreparedStatement pStmt = conn.prepareStatement(sql);

				        // SQL文を完成させる
				        
				        if (card.getRegist_number() != null) {
				            pStmt.setString(1, card.getRegist_number());
				        } else {
				            pStmt.setString(1, "");
				        }


				        // SQL文を実行する
				        if (pStmt.executeUpdate() == 1) {
				            result = true;
				        }
				    } catch (SQLException e) {
				        e.printStackTrace();
				    } catch (ClassNotFoundException e) {
				        e.printStackTrace();
				    } finally {
				        // データベースを切断
				        if (conn != null) {
				            try {
				                conn.close();
				            } catch (SQLException e) {
				                e.printStackTrace();
				            }
				        }
				    }

				    // 結果を返す
				    return result;
				}
				}
				
				*/

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
            pStmt.setString(1, idpw.getId());
            pStmt.setString(2, idpw.getPw());

            ResultSet rs = pStmt.executeQuery();

            if (rs.next()) {
                // ログイン成功
                idpw.setRegist_number(String.valueOf(rs.getInt("regist_number")));
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

            String sql = "INSERT INTO users (regist_number, mail, name, company, password) VALUES (0, ?, ?, ?, '')";
            PreparedStatement pStmt = conn.prepareStatement(sql);

            pStmt.setString(1, card.getMail() != null ? card.getMail() : "");
            pStmt.setString(2, card.getName() != null ? card.getName() : "");
            pStmt.setString(3, card.getCompany() != null ? card.getCompany() : "");

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

    // パスワード登録（更新）
    public boolean ps_regist(User card) {
        Connection conn = null;
        boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e6?"
                    + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
                    "root", "password");

            String sql = "UPDATE users SET password = ? WHERE mail = ?";
            PreparedStatement pStmt = conn.prepareStatement(sql);

            pStmt.setString(1, card.getPassword() != null ? card.getPassword() : "");
            pStmt.setString(2, card.getMail() != null ? card.getMail() : "");

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

            pStmt.setString(1, card.getRegist_number() != null ? card.getRegist_number() : "");

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
            pStmt.setString(4, card.getRegist_number() != null ? card.getRegist_number() : "");

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

            pStmt.setString(1, card.getRegist_number() != null ? card.getRegist_number() : "");

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
