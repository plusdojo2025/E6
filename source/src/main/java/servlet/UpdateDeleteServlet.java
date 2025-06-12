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

@WebServlet("/UpdateDeleteServlet")
public class UpdateDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 【1】表示処理（GETメソッド）
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/E6/LoginServlet");
			return;
		}

		
		int registNumber = (int) session.getAttribute("regist_number");

		UsersDao dao = new UsersDao();
		User user = dao.user_data(registNumber); // ユーザー取得

		request.setAttribute("user", user);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/account.jsp");
		dispatcher.forward(request, response);
	}
	// 【2】更新処理（POSTメソッド）
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/E6/LoginServlet");
			return;
		}

		request.setCharacterEncoding("UTF-8");

		int regist_number = Integer.parseInt(request.getParameter("regist_number"));
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");  // ← 今は未使用？
		String name = request.getParameter("name");
		String company = request.getParameter("company");

		UsersDao bDao = new UsersDao();

		if ("更新".equals(request.getParameter("submit"))) {
			if (bDao.user_data_up(new User(regist_number, mail, password, name, company))) {
				// 更新成功 → 表示画面にリダイレクト
				response.sendRedirect("UpdateDeleteServlet");  // GETで再読み込み
			} else {
				// 更新失敗 → エラーメッセージをセットして表示
				request.setAttribute("error", "更新に失敗しました");
				doGet(request, response);
			}
		}
	}
}