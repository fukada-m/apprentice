# データ型を使い分けることができる

## 1. データ型とは

データ型とは何か、またデータに「型」があるのはなぜか、プログラミング初心者にわかるように説明してください。

A.「データ型」は、プログラム内で扱われるデータの種類を表す概念です。例えば、文字列型、整数型、ブール型などがあります。

データ型が必要な理由は 3 つあります。

1 つ目はメモリを効率的に使用するためです。型が決まるとデータが占めるメモリのサイズが決まります。
よって型を宣言することで確保するメモリの数値が明確になるので宣言しない場合より効率的にメモリを管理することができます。

2 つ目は操作の制約を付与します。型によって特定の操作しかできない場合があります。例えば数値型なら四則演算ができます。

3 つ目はプログラムの信頼性を確保するためです。データ型を明示することでプログラムが予期しないデータを受け入れてしまうというエラーを防ぐことができます。

## 2. データ型の種類

JavaScript のデータ型にはどのような種類があるか、種類を列挙してください。

A. Number: 数値を表します。整数だけでなく浮動小数点数も表すことができます。

String: テキストデータを表します。文字列はシングルクォート(')、ダブルクォート(")、バックティック(``)で囲みます。

Boolean: 真または偽を表します。true または false の値を持つことができます。

Object: JavaScript のオブジェクトを表します。オブジェクトはキーと値のペアの集合体です。

Array: 複数の値を順序付けて格納するためのデータ型です。JavaScript の配列は動的で、異なるデータ型の要素を混在させることができます。

Function: JavaScript では関数もオブジェクトの一種で、データ型として扱われます。関数は一連の命令をまとめて名前を付け、後から呼び出せるようにします。

Null: 何もない状態を表す特殊な値です。変数が意図的に何も持たない状態を示すために使われます。

Undefined: 変数が宣言されているが、値がまだ設定されていない状態を示します。

Symbol: ECMAScript 6 から追加された新しいデータ型で、ユニークで不変の値を生成します。
