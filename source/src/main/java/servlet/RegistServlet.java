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
import util.HashUtil;


@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	//登録ページ表示（GET）
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ログインチェック
        HttpSession session = request.getSession();
        /*if (session.getAttribute("regist_number") == null) {
            response.sendRedirect("/E6/LoginServlet");
            return;
        }*/

        // 登録ページへフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/regist_data.jsp");
        dispatcher.forward(request, response);
    }

    // 登録処理（POST）
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 文字コード設定
        request.setCharacterEncoding("UTF-8");

        // パラメータ取得
        String company = request.getParameter("company");
        String name = request.getParameter("name");
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        
        String hashedPassword = HashUtil.sha256(password);

        // 新規ユーザー登録処理
        UsersDao bDao = new UsersDao();
        boolean result = bDao.new_regist(new User(0, company, name, mail, password));

        if (result) {
            // 登録成功 → メニュー画面などにリダイレクト
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
        } else {
            // 登録失敗 → エラーメッセージを表示（例：登録画面に戻す）
            request.setAttribute("errorMessage", "登録に失敗しました。もう一度お試しください。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/regist_data.jsp");
            dispatcher.forward(request, response);
        }

		
	}
}
