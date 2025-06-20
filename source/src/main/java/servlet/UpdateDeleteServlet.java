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
		if (session.getAttribute("regist_number") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		
		// regist_number をセッションから取得
				Integer registNumber = (Integer) session.getAttribute("regist_number");

				// Userオブジェクトを作成して、regist_number をセット
				User user = new User();
				user.setRegist_number(registNumber);

				// ユーザー情報をデータベースから取得して user にセット
				UsersDao dao = new UsersDao();
				boolean result = dao.user_data(user);

				if (!result) {
					request.setAttribute("error", "ユーザー情報の取得に失敗しました");
				}

		request.setAttribute("user", user);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/update_delete.jsp");
		dispatcher.forward(request, response);
	}
	// 【2】更新処理（POSTメソッド）
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("regist_number") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		request.setCharacterEncoding("UTF-8");

		int regist_number = Integer.parseInt(request.getParameter("regist_number"));
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");  // ← 今は未使用？
		String name = request.getParameter("name");
		String company = request.getParameter("company");
		
		
		User user = new User();
		user.setRegist_number(regist_number);
		user.setMail(mail);
		user.setPassword(password);
		user.setName(name);
		user.setCompany(company);

		UsersDao dao = new UsersDao();
		
		String action = request.getParameter("submit");

		 if ("更新".equals(action)) {
		        if (dao.user_data_up(user)) {
		            response.sendRedirect("UpdateDeleteServlet");
		        } else {
		            request.setAttribute("error", "更新に失敗しました");
		            doGet(request, response);
		        }
		    } else if ("削除".equals(action)) {
		        if (dao.user_data_del(user)) {
		            session.invalidate(); // ログアウト
		            response.sendRedirect(request.getContextPath() + "/LoginServlet");
		        } else {
		            request.setAttribute("error", "アカウント削除に失敗しました");
		            doGet(request, response);
		        }
		    }
		 
		 System.out.println(">>> submit: " + request.getParameter("submit"));
		 System.out.println(">>> regist_number: " + request.getParameter("regist_number"));
		 System.out.println(">>> password: " + request.getParameter("password"));
	}
}