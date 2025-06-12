package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CoinDao;


@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/E6/LoginServlet");
			return;
		}
		
		// 月初処理を試みる（DAO内部で月初＆未実行時のみ処理される）
        CoinDao coinDao = new CoinDao();
        coinDao.resetAndRankCoinsIfNeeded();

		// メニューページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/webapp/jsp/menu.jsp");
		dispatcher.forward(request, response);
	}
}
