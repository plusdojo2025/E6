package servlet;
 
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CoinSendServlet")
public class CoinSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 登録ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/Webapp/jsp/send.jsp");
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
				String company = request.getParameter("");
				String department = request.getParameter("");
				String position = request.getParameter("");
			

				// 登録処理を行う
				Dao bDao = new BcDAO();
				if (bDao.insert(new Bc(0, , ))) { // 登録成功
				
				} else { // 登録失敗
					
				}
	}
	
	
}
