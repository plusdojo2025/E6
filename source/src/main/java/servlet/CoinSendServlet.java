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
import dto.User;

@WebServlet("/CoinSendServlet")
public class CoinSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("regist_number") == null) {
			response.sendRedirect("/E6/LoginServlet");
			return;
		}

		// ログインユーザーの登録番号を取得
		Integer registNumber = (Integer) session.getAttribute("regist_number");

		// 同じ会社のユーザー一覧を取得（自分を除く）
		SendDao sDao = new SendDao();
		List<User> userList = sDao.getUsersInSameCompany(String.valueOf(registNumber));
		userList.removeIf(user -> user.getRegist_number() == registNumber); // 自分を除く

		request.setAttribute("userList", userList);

		// send.jsp へフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/send.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/E6/LoginServlet");
			return;
		}

		request.setCharacterEncoding("UTF-8");

		// フォームから送信された情報を取得
		String comment = request.getParameter("comment");
		int sendCoin = Integer.parseInt(request.getParameter("send_coin"));
		int receiverNumber = Integer.parseInt(request.getParameter("receiver_number"));

		// セッションから送信者の登録番号を取得
		Integer registNumber = (Integer) session.getAttribute("regist_number");

		// Send DTO を作成
		Send send = new Send();
		send.setRegist_number(registNumber);
		send.setComment(comment);
		send.setSend_coin(sendCoin);
		send.setReceiver_number(receiverNumber);

		// 登録処理
		SendDao sDao = new SendDao();
		boolean result = sDao.insertSend(send);

		if (result) {
			request.setAttribute("message", "コインを送信しました。");
		} else {
			request.setAttribute("error", "送信に失敗しました。");
		}

		// 送信後もリストを表示させるため再取得
		List<User> userList = sDao.getUsersInSameCompany(String.valueOf(registNumber));
		userList.removeIf(user -> user.getRegist_number() == registNumber);

		request.setAttribute("userList", userList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/Webapp/jsp/send.jsp");
		dispatcher.forward(request, response);
	}
}