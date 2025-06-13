package servlet;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CoinDao;
import dto.User;

@WebServlet("/RankingServlet")
public class RankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// セッションからログインユーザーのIDを取得
		HttpSession session = request.getSession();
		Integer registNumber = (Integer) session.getAttribute("regist_number");

		if (registNumber == null) {
			// ログインしていない場合、ログインページにリダイレクト
			response.sendRedirect("/E6/LoginServlet");
			return;
		}

		// CoinDao を使用してランキング取得
		CoinDao coinDao = new CoinDao();
		List<User> rankingList = coinDao.getRanking(String.valueOf(registNumber));

		// リクエストにランキングリストを設定
		request.setAttribute("rankingList", rankingList);

		// JSP へフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/ranking.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response); // POSTもGETと同様の処理を行う
	}
	
	

}
