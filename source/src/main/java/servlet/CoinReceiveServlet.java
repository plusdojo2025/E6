package servlet;
 
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SendDao;
import dto.Send;


@WebServlet("/CoinReceiveServlet")
public class CoinReceiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 登録ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/Webapp/jsp/receive.jsp");
				dispatcher.forward(request, response);
			}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/E6/LoginServlet");
			return;
		}
		// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				String send_date = request.getParameter("send_date");
				String name = request.getParameter("name");
				String comment = request.getParameter("comment");
				String receive_coin = request.getParameter("receive_coin");

				// 登録処理を行う
				SendDao sDao = new SendDao();
				if (sDao.select(new Send(send_date, name, comment, receive_coin))) { // 登録成功
				
				} else { // 登録失敗
					
				}
	}
}
	