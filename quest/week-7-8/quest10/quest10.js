// # ループを使うことができる

// ## 1. 奇数が含まれるかの判定

// 整数の配列 numbers を受け取り、奇数が含まれるかどうかを返す関数 hasOdd を実装してください。

// ▼インプット

// ```js
// numbers：整数の配列
// ```

// ▼アウトプット

// 奇数が含まれる場合は true、含まれない場合は false を出力してください。

// ▼サンプル呼び出し

// ```js
// hasOdd([1, 2, 3, 4, 5])
// ```

// ▼サンプルアウトプット

// ```js
// true
// ```

// ▼回答例

// ```js
// function hasOdd(numbers) {
//   // 関数を完成させてください
// }
// ```


let hasOdd = (numbers) =>{
    let istrue = false; 
    numbers.forEach(num => {
        (num % 2 == 0) ? istrue = true : undefined;
    });
    console.log(istrue);
}

let numbers = [1, 2, 3]
hasOdd(numbers); 
numbers = [1, 3]
hasOdd(numbers); 

// ## 2. 奇数の抽出

// 整数の配列 numbers を受け取り、奇数のみの配列を返す関数 odd を実装してください。

// ▼インプット

// ```js
// numbers：整数の配列
// ```

// ▼アウトプット

// 奇数のみを出力してください。

// ▼サンプル呼び出し

// ```js
// odd([1, 2, 3, 4, 5])
// ```

// ▼サンプルアウトプット

// ```js
// [1, 3, 5]
// ```

// ▼回答例

// ```js
// function odd(numbers) {
//   // 関数を完成させてください
// }
// ```

let odd = (numbers) => {
    let result = numbers.filter(num => num % 2 == 1);
    console.log(result);
}

odd(numbers);
numbers = [4, 5, 6, 7, 8, 9];
odd(numbers);

// ## 3. 2乗の計算

// 整数の配列 numbers を受け取り、各要素を2乗した配列を返す関数 square を実装してください。

// ▼インプット

// ```js
// numbers：整数の配列
// ```

// ▼アウトプット

// 各要素を2乗した配列を出力してください。

// ▼サンプル呼び出し

// ```js
// square([1, 2, 3, 4, 5])
// ```

// ▼サンプルアウトプット

// ```js
// [1, 4, 9, 16, 25]
// ```

// ▼回答例

// ```js
// function square(numbers) {
//   // 関数を完成させてください
// }
// ```

let square = (numbers) => {
    console.log(numbers.map(num => num * num));
}
square(numbers);
numbers = [1, 2, 3, 4, 5];
square(numbers);