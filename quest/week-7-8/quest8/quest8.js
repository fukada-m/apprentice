// # 関数を定義し使うことができる

// ## 1. 挨拶

// 名前 name を受け取り、"Hello, name!" と出力する関数 greet を定義してください。

// ▼インプット

// ```js
// name：文字列
// ```

// ▼アウトプット

// 挨拶を出力してください。

// ▼サンプル呼び出し

// ```js
// greet("Hikaru")
// ```

// ▼サンプルアウトプット

// ```js
// Hello, Hikaru!
// ```

// ▼回答例

// ```js
// function greet(name) {
//   // 関数を完成させてください
// }
// ```
let greet = (name) => {
    console.log('Hello, ' + name + '!');
}

greet('Hikaru');