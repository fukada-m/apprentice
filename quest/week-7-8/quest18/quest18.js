// # 例外処理を使うことができる

// ## 1. try...catch 構文

// 整数 num を受け取り、それが5で割り切れるかどうかをチェックする関数 checkDivisibleByFive を作成してください。次に、checkDivisibleByFive 関数を try...catch 構文内で呼び出してください。

// checkDivisibleByFive 関数は、数値が5で割り切れる場合は true を返し、5で割り切れない場合は、「数値は5で割り切れません」というメッセージとともに例外を投げます。

// この例外を処理するために try...catch 構文を使用し、例外が投げられた場合はエラーメッセージをコンソールに表示します。

// ▼回答例

// ```js
// function checkDivisibleByFive(num) {
//   // 処理を記述
// }

// // 処理を記述、try...catch 構文を使用し、その中で checkDivisibleByFive 関数を呼び出す
// ```

const checkDivisibleByFive = (num) => {
  return num % 5 == 0 ? true : false;
};

try {
  if (checkDivisibleByFive(10)) {
    console.log(true);
  } else {
    throw new Error("数値は5で割り切れません");
  }
  if (checkDivisibleByFive(19)) {
    console.log(true);
  } else {
    throw new Error("数値は5で割り切れません");
  }
} catch (error) {
  console.log(error.message);
}
