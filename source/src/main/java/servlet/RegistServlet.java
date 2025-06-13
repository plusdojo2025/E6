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
import dto.User;


@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("regist_number") == null) {
			response.sendRedirect("/E6/LoginServlet");
			return;
		}

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/regist_data.jsp");
		dispatcher.forward(request, response);
	

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String company = request.getParameter("company");
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");


		// 登録処理を行う
		UsersDao bDao = new UsersDao();
		if (bDao.new_regist(new User(0, company, name, mail, password))) { // 登録成功
		} else { // 登録失敗

		}

		
	}
}
