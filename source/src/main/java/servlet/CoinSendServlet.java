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

    // GET：メニューからの遷移などで送信画面を表示する
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("regist_number") == null) {
            response.sendRedirect("/E6/LoginServlet");
            return;
        }

        Integer registNumber = (Integer) session.getAttribute("regist_number");

        SendDao sDao = new SendDao();
        List<User> userList = sDao.getUsersInSameCompany(String.valueOf(registNumber));
        userList.removeIf(user -> user.getRegist_number() == registNumber);
        request.setAttribute("userList", userList);
        
        SendDao cDao = new SendDao();
        int holdCoin = cDao.getHoldCoin(registNumber);
        request.setAttribute("holdCoin", holdCoin);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/send.jsp");
        dispatcher.forward(request, response);
    }

    // POST：コイン送信処理
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("regist_number") == null) {
            response.sendRedirect("/E6/LoginServlet");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        try {
            String comment = request.getParameter("comment");
            int sendCoin = Integer.parseInt(request.getParameter("send_coin"));
            int receiverNumber = Integer.parseInt(request.getParameter("receiver_number"));
            Integer registNumber = (Integer) session.getAttribute("regist_number");

            SendDao cDao = new SendDao();
            int holdCoin = cDao.getHoldCoin(registNumber);

            if (sendCoin > holdCoin) {
                request.setAttribute("error", "所持コインが不足しています。送信できません。");
                request.setAttribute("holdCoin", holdCoin);
            } else {
                Send send = new Send();
                send.setRegist_number(registNumber);
                send.setComment(comment);
                send.setSend_coin(sendCoin);
                send.setReceiver_number(receiverNumber);

                SendDao sDao = new SendDao();
                boolean result = sDao.insertSend(send);

                if (result) {
                    request.setAttribute("message", "コインを送信しました。");
                } else {
                    request.setAttribute("error", "送信に失敗しました。");
                }
            }

            // 再度ユーザー一覧を取得し、送信画面に戻る
            SendDao seDao = new SendDao();
            List<User> userList = seDao.getUsersInSameCompany(String.valueOf(registNumber));
            userList.removeIf(user -> user.getRegist_number() == registNumber);
            request.setAttribute("userList", userList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/send.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "入力内容に誤りがあります。");

            Integer registNumber = (Integer) session.getAttribute("regist_number");

            SendDao sDao = new SendDao();
            List<User> userList = sDao.getUsersInSameCompany(String.valueOf(registNumber));
            userList.removeIf(user -> user.getRegist_number() == registNumber);
            request.setAttribute("userList", userList);

            SendDao cDao = new SendDao();
            int holdCoin = cDao.getHoldCoin(registNumber);
            request.setAttribute("holdCoin", holdCoin);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/send.jsp");
            dispatcher.forward(request, response);
        }
    }
}