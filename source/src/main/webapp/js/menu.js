function loadNotifications() {
    fetch('/E6/CoinReceiveServlet')
        .then(response => response.json())
        .then(data => {
            const list = document.getElementById('notificationList');
            list.innerHTML = ''; // 一度リセット

            if (data.length === 0) {
                list.innerHTML = '<li>新着通知はありません</li>';
            } else {
                data.forEach(n => {
                    const li = document.createElement('li');
                    li.textContent = n.message;
                    list.appendChild(li);
                });
            }
        })
        .catch(error => {
            console.error('通知の取得に失敗しました:', error);
        });
}

// 初回ロード
loadNotifications();
// 10秒ごとに更新
setInterval(loadNotifications, 10000);