// 2. 要素ノードの変更
// JavaScript を使って、h1 タグのテキストを「シンプルブログ」変更してください。

const h1_tag = document.getElementsByTagName('h1');
h1_tag[0].textContent = 'シンプルブログ';

// 3. イベントハンドラの設定
// JavaScript を使って、フォームの送信ボタンをクリックしたときに、フォームに入力された内容（タイトルと本文）をコンソールに出力するようにしてください。
const post_form = document.getElementById('post-form')
console.log(post_form.childNodes)
const btn = post_form.childNodes[13];
btn.addEventListener('click', () => {
    event.preventDefault();
    title = document.getElementById('title');
    content = document.getElementById('content');
    console.log(title.value);
    console.log(content.value);
}, false);

// 4. 要素ノードの追加
// JavaScript を使って、フォームの送信ボタンをクリックしたときに、フォームの内容を #posts の div タブ内に、以下の形式で表示するようにしてください。

// <div id="posts">
//   <h2>入力されたタイトル</h2>
//   <p>入力された本文</p>
// </div>
const posts = document.getElementById('posts')
const title_tag = [];
const content_tag = [];

btn.addEventListener('click', () => {
    title_tag.push(document.createElement('h2'));
    content_tag.push(document.createElement('p'));
    posts.appendChild(title_tag[title_tag.length - 1]);
    posts.appendChild(content_tag[content_tag.length - 1]);
    title_tag[title_tag.length - 1].textContent = title.value;
    content_tag[content_tag.length - 1].textContent = content.value;
    
}, false);

// 5. 要素ノードの追加
// JavaScript を使って、フォームの送信ボタンをクリックしたときに、フォームの中身を空にしてください。
btn.addEventListener('click', () => {
    title.value = null;
    content.value = null;
}, false);


// 6. スタイルの変更
// JavaScript を使って、#post-form の div タブ上にマウスポインターを乗せたタイミングで背景色を黄色に、マウスポインターを外したタイミングで白色に変更するようにしてください。
post_form.addEventListener('mouseover', () =>{
    post_form.style.cssText = 'background-color: yellow;'
}, false);
post_form.addEventListener('mouseout', () => {
    post_form.style.cssText = 'background-color: white;'
}, false);


// 7. 要素ノードの削除
// フォームの投稿が増え、#posts の div タブ内に表示される投稿が多くなってきたとします。このとき #posts の div タブ内に追加された投稿の数が3つを超えた場合、一番古い投稿を削除してください。なお、4で作成した投稿の表示形式は変更して構いません。
btn.addEventListener('click', () => {
    if (title_tag.length > 2) {
        let i = 0;
        while (i < 2){
            posts.removeChild(posts.childNodes[0]);
            i++;
        }
    }
}, false);
