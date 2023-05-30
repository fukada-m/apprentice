// # クラスを自作し使うことができる

// 音楽のプレイリストを管理する Playlist クラスを作成します。addSong()、removeSong()、play() のメソッドを用意します。

// 実装例は以下の通りです。

// ```js

// ```

// ## 1. クラスの定義

// Playlist クラスを定義してください。このクラスは以下のような特徴を持ちます。

// ## 2. インスタンス変数

// コンストラクタで、プレイリストの名前を受け取り、インスタンス変数に代入してください。また、インスタンス変数として、曲のリストを持たせてください。

// ## 3. メソッド

// addSong()、removeSong()、play() のメソッドをクラスに追加してください。

// - addSong() は、引数として曲名を受け取り、songs 配列に追加してください
// - removeSong() は、引数として曲名を受け取り、songs 配列からそれを削除してください
// - play() は、配列の最初の曲を再生していることを示す文字列「再生中: 曲名」を返してください

// A.

class Playlist {
  constructor(name) {
    this.name = name;
    this.songs = [];
  }

  addSong(value) {
    this.songs.push(value);
  }

  removeSong(value) {
    this.songs = this.songs.filter((song) => song != value);
  }

  play() {
    return "再生中: " + this.songs[0];
  }
}

let myPlaylist = new Playlist("お気に入りリスト");
myPlaylist.addSong("Lemon");
myPlaylist.addSong("花束");
console.log(myPlaylist.play()); // 再生中: Lemon
myPlaylist.removeSong("Lemon");
console.log(myPlaylist.play()); // 再生中：花束
