// # 条件分岐を使うことができる

// ## 1. 温度チェッカー

// 温度 t に応じて以下のように出力する関数 checkTemperature を定義してください。

// - t が 30 以上の場合は "Hot"
// - t が 30 未満かつ 15 以上の場合は "Warm"
// - t が 15 未満の場合は "Cold"

// ▼インプット

// ```js
// t：整数

// -50 <= t <= 50
// ```

// ▼アウトプット

// 温度に応じてメッセージを出力してください。

// ▼サンプル呼び出し

// ```js
// checkTemperature(30)
// ```

// ▼サンプルアウトプット

// ```js
// Hot
// ```

// ▼回答例

// ```js
// function checkTemperature() {
//   // 関数を完成させてください
// }
// ```

let checkTemperature = (temperature) => {
    let answer;
    if (-50 > temperature || temperature > 50 ) {
        answer = '-50から50の範囲で値を入力してください';
    } else if (temperature >= 30) {
        answer = 'Hot';
    } else if (temperature >= 15) {
        answer = 'Warm';
    } else {
        answer = 'Cold';
    }
    console.log(answer);
}
checkTemperature(51); //'-50から50の範囲で値を入力してください'
checkTemperature(49); //Hot
checkTemperature(16); //'Warm'
checkTemperature(14); //'Cold'
checkTemperature(-60); //'-50から50の範囲で値を入力してください' 

// ## 2. 偶数チェッカー

// 整数 n が偶数か奇数かを判定する関数 checkOddOrEven を定義してください。

// ▼インプット

// ```js
// n：整数
// ```

// ▼アウトプット

// n が偶数の場合は "Even"、奇数の場合は "Odd" を出力してください。

// ▼サンプル呼び出し

// ```js
// checkOddOrEven(2)
// ```

// ▼サンプルアウトプット

// ```js
// Even
// ```

// ▼回答例

// ```js
// function checkOddOrEven() {
//   // 関数を完成させてください
// }
// ```

let checkOddOrEven = (n) => {
    if ( Number.isInteger(n) ) {

    }else{
        return console.log('整数を入力してください');
    }
    (n % 2 == 0) ? console.log('Even') : console.log('Odd');
}

checkOddOrEven(1);
checkOddOrEven(2);
checkOddOrEven(100);
checkOddOrEven(99);
checkOddOrEven(8.8);
checkOddOrEven('4');