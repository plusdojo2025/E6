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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");


	// ログイン処理を行う
		UsersDao iDao = new UsersDao();
        User loginUser = new User(mail, password); // このオブジェクトを使いまわす

        if (iDao.isLoginOK(loginUser)) {
            System.out.println("ログイン成功");

            // セッションにログイン情報を保持
            HttpSession session = request.getSession();
            session.setAttribute("regist_number", loginUser.getRegist_number());

            // ローディングページへリダイレクト
            String contextPath = request.getContextPath();
            System.out.println("リダイレクト先: " + contextPath + "/html/looding.html");
            response.sendRedirect(contextPath + "/html/looding.html");

        } else {
            System.out.println("ログイン失敗");
            
            // エラーメッセージと入力情報をリクエストにセット
            request.setAttribute("loginError", "メールアドレスまたはパスワードが間違っています。");
            request.setAttribute("enteredMail", mail);

            // ログイン失敗時はログイン画面に戻る
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            dispatcher.forward(request, response);
       }
	}
}


