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
    	String password2 = request.getParameter("password2");

    	// パスワード一致確認
    	if (!password.equals(password2)) {
    	    request.setAttribute("errorMessage2", "パスワードが一致しません");
    	    request.setAttribute("company", company);
    	    request.setAttribute("name", name);
    	    request.setAttribute("mail", mail);
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/regist_data.jsp");
    	    dispatcher.forward(request, response);
    	    return;
    	}

    	String hashedPassword = HashUtil.sha256(password);

    	// 重複チェック
    	UsersDao bDao = new UsersDao();
    	if (bDao.isEmailRegistered(mail)) {
    	    request.setAttribute("errorMessage", "このメールアドレスは登録済みです");
    	    request.setAttribute("company", company);
    	    request.setAttribute("name", name);
    	    request.setAttribute("mail", mail);
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/regist_data.jsp");
    	    dispatcher.forward(request, response);
    	    return;
    	}

    	// 新規登録処理
    	boolean result = bDao.new_regist(new User(0, company, name, mail, hashedPassword));

    	if (result) {
    	    response.sendRedirect(request.getContextPath() + "/LoginServlet");
    	} else {
    	    request.setAttribute("errorMessage2", "登録に失敗しました。もう一度お試しください。");
    	    request.setAttribute("company", company);
    	    request.setAttribute("name", name);
    	    request.setAttribute("mail", mail);
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/regist_data.jsp");
    	    dispatcher.forward(request, response);
    	}
    }
}
