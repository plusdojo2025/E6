function loadNotifications() {
    fetch('/E6/NotificationServlet')  // サーブレットのURL（パスに注意）
        .then(response => {
            if (!response.ok) {
                throw new Error('通信エラー');
            }
            return response.json();
        })
        .then(data => {
            const list = document.getElementById('notificationList');
            list.innerHTML = '';  // 一旦リストを空に

            if (data.length === 0) {
                list.innerHTML = '<li>新着通知はありません</li>';
            } else {
                data.forEach(notification => {
                    const li = document.createElement('li');
                    const date = new Date(notification.send_date).toLocaleString();
                    li.textContent = `${date}：${notification.sender_name} さんからコインが届きました！`;
                    list.appendChild(li);
                });
            }
        })
        .catch(error => {
            console.error('通知の取得失敗:', error);
        });
}

// 初回読み込み
loadNotifications();

// 10秒ごとに自動更新
setInterval(loadNotifications, 10000);