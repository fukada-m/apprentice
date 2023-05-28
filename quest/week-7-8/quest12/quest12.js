// # オブジェクトを使うことができる

// ## 1. 書籍プリンター

// 書籍の名前と著者名をプロパティとして持つオブジェクトの配列 books を受け取り、「『書籍名』著者名」を出力する関数 printBooks を実装してください。

// ▼インプット
// よ

// ```js
// books：オブジェクトの配列
// ```

// ▼アウトプット

// ```js
// 『書籍名』著者名
// ```

// ▼サンプル呼び出し

// ```js
// books = [ , ] // オブジェクトの配列を定義する
// printBooks(books)
// ```

// ▼サンプルアウトプット

// ```js
// 『JavaScript入門』山田太郎
// 『JavaScriptの絵本』山田次郎
// ```

// ▼回答例

// ```js
// function printBooks(books) {
//   // 関数を完成させてください
// }
// ```

// ## 2. ユーザーパーミッションチェッカー

// ユーザー名 username とパーミッションの種類 permission を引数に受け取り、パーミッションが許可されているかどうかを判定する関数 checkPermission を実装してください。

// なお、ユーザーのパーミッションはオブジェクトの配列 users に格納されています。また、パーミッションの種類には canRead、canWrite、canDelete の 3種類があります。

// ```js
// let users = [
//   {
//     username: '山田',
//     permissions: {
//       canRead: true,
//       canWrite: true,
//       canDelete: false
//     }
//   },
//   {
//     username: '佐藤',
//     permissions: {
//       canRead: false,
//       canWrite: true,
//       canDelete: false
//     }
//   },
//   // ユーザーを追加してください
// ];
// ```

// ▼インプット

// ```js
// username：文字列
// permission：文字列
// ```

// ▼アウトプット

// パーミッションが許可されている場合は true、許可されていない場合は false を返す

// ▼サンプル呼び出し

// ```js
// checkPermission('山田', 'canWrite')
// ```

// ▼サンプルアウトプット

// ```js
// true
// ```

// ▼回答例

// ```js
// function checkPermission(username, permission) {
//   // 関数を完成させてください
// }
// ```

// ## 3. メソッド

// JavaScript ではオブジェクトのプロパティが関数である場合、それをメソッドと呼びます。メソッドの定義として正しいものを全て選択してください。なお、正しいかどうかは手元で実行して確認することができます。

// ①

// ```js
// const obj = {
//   method: function() {
//     console.log('method');
//   },
// }

// obj.method();
// ```

// ②

// ```js
// const obj = {
//   method: () => {
//     console.log('method');
//   },
// }

// obj.method();
// ```

// ③

// ```js
// const obj = {
//   method() {
//     console.log('method');
//   },
// }

// obj.method();
// ```

// ④

// ```js
// const obj = {
//   () => {
//     console.log('method');
//   },
// }

// obj.method();
// ```