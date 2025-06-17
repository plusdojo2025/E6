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

import dao.CoinDao;
import dao.SendDao;
import dto.Send;


@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer registNumber = (Integer) session.getAttribute("regist_number");
        if (registNumber == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        // 月初処理
        CoinDao coinDao = new CoinDao();
        coinDao.resetAndRankCoinsIfNeeded();

        // 新着受信履歴を取得
        SendDao sendDao = new SendDao();
        List<Send> recentMessages = sendDao.getRecentReceivedMessages(String.valueOf(registNumber));
        request.setAttribute("recentMessages", recentMessages);

        // メニューページへフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/menu.jsp");
        dispatcher.forward(request, response);
    }
}