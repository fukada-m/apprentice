# オブジェクト指向が何かを説明できる

## 1. オブジェクト指向の目的

- Q. オブジェクト指向が何のためにあるのか、プログラミング初心者にわかるように説明してください。

- A. オブジェクト指向は複数の変数と関数をまとめて小さな部品を作ることでコードを整理整頓するためにある。その結果、簡潔で再利用可能なコードを作成することができる。

## 2. カプセル化

- Q. オブジェクト指向におけるカプセル化とはどのような概念か、プログラミング初心者にわかるように説明してください。
- A.オブジェクトが自身のデータと操作を隠蔽し、外部からの直接アクセスを制限すること。つまり、自身の操作を実行するためのメソッドのみを外部に公開すること。その結果、外部からは限られたメソッドしかアクセスできないことでより簡潔にコードを安全にできる 


## 3. 継承

- Q. オブジェクト指向における継承とはどのような概念か、プログラミング初心者にわかるように説明してください。

- A. クラスの共通部分を別クラスにまとめる仕組みで、既存のクラスを引き継いで新しいクラスを作成することができる。ただし、継承は慎重に行う必要がある。階層構造が複雑になるとコードの理解やメンテナンスが困難になる場合がある。

## 4. ポリモーフィズム

- Q. オブジェクト指向におけるポリモーフィズムとはどのような概念か、プログラミング初心者にわかるように説明してください。

- A. 共通メインルーチンを作るための仕組みである。つまり呼び出される側（インスタンスの種類）が増えてもメインルーチンを修正する必要がなく、複数のクラスで同じメソッドを共有することができる。


## 5. 単一責任の原則

- Q. オブジェクト指向の重要な設計原則である「単一責任の原則」について、プログラミング初心者にわかるように説明してください。

- A. 1つのクラスやメソッドには1つだけの責任を持たせるべきであるという考え方です。つまり、クラスやメソッドが持つ責務は明確に定義され、その責務に集中するようにする設計。