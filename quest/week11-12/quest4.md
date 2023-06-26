## ポート番号について説明できる

## 1. ポート番号とは

ポート番号とは何か、何のためにあるものか、プログラミング初心者にわかるように説明してください。

A. ポート番号は、コンピューター上の特定のプログラムやサービスを識別するために使用されます。

IPアドレスが通信の「どのコンピュータ」を指すのに対し、ポート番号はそのコンピュータ内の「どのアプリケーション」へ通信を向けるべきかを示します。

これにより、同じコンピュータ上で動いているさまざまなサービスやプログラムが、同時にインターネットからの通信を受け取ることが可能となります。

## 2. 代表的なポート番号

代表的なポート番号はウェルノウンポートと呼ばれています。ウェルノウンポートをいくつか挙げてください。また、それぞれのポート番号が何のために使われているか説明してください。

A. Port 20 & 21: FTP (File Transfer Protocol) - ファイル転送のために使われます。Port 20はデータ転送に、21は制御コネクションに使用されます。

Port 22: SSH (Secure Shell) - セキュアなリモート操作やファイル転送のために使われます。

Port 23: Telnet - リモート操作のために使われますが、セキュリティが弱いため現在ではほとんど使われません。

Port 25: SMTP (Simple Mail Transfer Protocol) - メール送信のために使われます。

Port 53: DNS (Domain Name System) - ドメイン名とIPアドレスの変換のために使われます。

## 3. HTTP/HTTPS 通信

ブラウザでウェブページを開く際に、ポート番号を指定することができます。

`https://www.google.com/` をブラウザで開く際に `https://www.google.com:443` を指定しても同じページが開かれますが、`https://www.google.com:22` とするとページが開かれません。

その理由を説明してください。また、ブラザでウェブページを開く際に通常はポート番号を指定しませんが、その理由も説明してください。

A. ポート番号22はSSH（Secure Shell）のために予約されているポートです。

ブラウザはウェブページの取得のためにHTTP（ポート80）またはHTTPS（ポート443）を使用します。

したがって、ブラウザでウェブページを開こうとしてポート22を指定すると、サーバー側ではSSHの接続を待っていますが、ブラウザからはHTTPまたはHTTPSのリクエストが送られるため、通信が成立しません。これが、https://www.google.com:22でページが開かれない理由です。

URLでポート番号を指定しない場合、ブラウザはデフォルトのポート番号を使用します。

HTTPの場合はポート80、HTTPSの場合はポート443がそれぞれデフォルトのポート番号となります。

そのため、通常のウェブブラウジングにおいては、デフォルトのポート番号で問題なく通信できます。

## 4. データベースへの接続

データベースに接続する際に、ポート番号を指定しています。ポート番号何番を指定しているか確認してください。

A. MySQLは3306。PostgreSQLは5432。MongoDBは27017。

## 5. ポート番号の確認

今自分が使用しているパソコンで使用しているポート番号とそのポート番号を動かしているプログラムを調べてください。

A. sudo lsof -i -P -n　で調べられる