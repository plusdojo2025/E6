package servlet;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SendDao;
import dto.Send;


@WebServlet("/CoinReceiveServlet")
public class CoinReceiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("regist_number") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}

		// regist_number（ログインユーザー）を取得
		String registNumber = session.getAttribute("regist_number").toString();

		// SendDaoを使って受信履歴を取得
		SendDao sDao = new SendDao();
		List<Send> receivedList = sDao.getRecentReceivedMessages(registNumber);
		
		
		// リクエストスコープに格納
		request.setAttribute("receivedList", receivedList);
		
		int page = 1;
		int pageSize = 10;
		String pageParam = request.getParameter("page");
		if (pageParam != null && pageParam.matches("\\d+")) {
			page = Integer.parseInt(pageParam);
		}

		List<Send> companySendList = sDao.getCompanySendHistoryWithPagination(registNumber, page, pageSize);
		int totalCompanySendCount = sDao.getCompanySendHistoryCount(registNumber);
		int totalPages = (int) Math.ceil((double) totalCompanySendCount / pageSize);

		request.setAttribute("companySendList", companySendList);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);

		
		// JSPにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/receive.jsp");
		dispatcher.forward(request, response);
	}
}
	