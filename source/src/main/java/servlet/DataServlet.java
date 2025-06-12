package servlet;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDao;



@WebServlet("/DataServlet")
public class DataServlet extends HttpServlet {
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
		String mail = request.getParameter("mail");
		String name = request.getParameter("name");
		String company = request.getParameter("company");
	}
	// 削除を行う 
	UsersDao bDao = new UsersDao();
	if (bDao.delete(new Users(mail, password, name, company))) {

	    // セッションから regist_number を取得
	    HttpSession session = request.getSession();
	    Integer registNumber = (Integer) session.getAttribute("regist_number");

	    if (registNumber != null) {
	        // coinテーブルも削除（regist_number指定）
	        CoinDao cDao = new CoinDao();
	        cDao.deleteByRegistNumber(registNumber);
	    }

	    // セッション破棄（ログアウト）
	    session.invalidate();

	   
	}
}
}
