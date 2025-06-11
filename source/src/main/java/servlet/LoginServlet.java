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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/webapp/jsp/login.jsp");
		dispatcher.forward(request, response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");


	// ログイン処理を行う
			UsersDao iDao = new UsersDao();
			if (iDao.isLoginOK(new User(id, pw))) { // ログイン成功
				// セッションスコープにIDを格納する
				HttpSession session = request.getSession();
				session.setAttribute("id", new User(id));

				// ローディング画面にリダイレクトする
				response.sendRedirect("/E6/looding.html");
			} 

				
			}
		}
	


