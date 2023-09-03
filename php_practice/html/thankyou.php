<?php declare(strict_types=1); ?>
<body>
    <?php
        function escape($var){
            return htmlspecialchars($var, ENT_QUOTES | ENT_HTML5, "UTF-8");
        }
        if (!isset($_POST["operation"])){
            echo 'この画面への直接アクセスは許可されていません';
            return;
        }
    ?>
    <h2>お問い合わせありがとうございました。内容は以下の通りです</h2>
    <table border="1">
        <tr>
            <th>お名前</th>
            <td><?=escape($_POST['simei'])?></td>
        </tr>
        <tr>
            <th>メールアドレス</th>
            <td><?=escape($_POST['email'])?></td>
        </tr>
        <tr>
            <th>地域</th>
            <td><?=escape($_POST['area'])?></td>
        </tr>
        <tr>
            <th>お問い合わせ種別</th>
            <td><?=escape(implode($_POST['type'], '*'))?></td>
        </tr>
        <tr>
            <th>お問い合わせ内容</th>
            <td><?=nl2br(escape($_POST['inquiry']))?></td>
        </tr>
        <tr>
            <th>お得な情報をEメールで受け取りますか？</th>
            <td><?=escape($_POST['news_type'])?></td>
        </tr>
    </table>
</body>
