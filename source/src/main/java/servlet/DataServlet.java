package servlet;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CoinDao;
import dao.UsersDao;
import dto.Coin;
import dto.User;



@WebServlet("/DataServlet")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/E6/LoginServlet");
			return;
		}
	

		//リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String mail = request.getParameter("mail");
		String name = request.getParameter("name");
		String company = request.getParameter("company");
		String password = request.getParameter("password");
	
	// 削除を行う 
	UsersDao bDao = new UsersDao();
	if (bDao.user_data_del(new User(mail, password, name, company))) {

	    // セッションから regist_number を取得
	    Integer registNumber = (Integer) session.getAttribute("regist_number");

	    if (registNumber != null) {
	        // coinテーブルも削除（regist_number指定）
	    	CoinDao cDao = new CoinDao();
	    	Coin coin = new Coin();
	    	coin.setRegist_number(registNumber);
	        cDao.coin_data_del(coin);  // coin_data_delはCoin型を引数に取る想定
	    }

	    // セッション破棄（ログアウト）
	    session.invalidate();

	   
	}
}
}
