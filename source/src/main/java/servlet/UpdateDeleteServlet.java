package servlet;


import java.io.IOException;

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
		int regist_number = Integer.parseInt(request.getParameter("regist_number"));
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String company = request.getParameter("company");
		

		// 更新または削除を行う
		UsersDao bDao = new UsersDao();
		if (request.getParameter("submit").equals("更新")) {
			if (bDao.user_data_up(new User(regist_number, mail,  password, name, company))) { // 更新成功
				
			} else { // 更新失敗
				
			}
		
		}
	
	}
}

