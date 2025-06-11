package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDao;



@WebServlet("/PwRegistServlet")
public class PwRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/E6/LoginServlet");
			return;
		}

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Webapp/jsp/regist.jsp");
		dispatcher.forward(request, response);
	


		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String password = request.getParameter("password");


		// 登録処理を行う
		UsersDao bDao = new UsersDao();
		if (bDao.insert(new Users( password ))) { // 登録成功
		
		} else { // 登録失敗
				}

	}
}


