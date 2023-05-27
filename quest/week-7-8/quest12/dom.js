const h1_tag = document.getElementsByTagName('h1');
h1_tag[0].textContent = 'シンプルブログ';
const post_form = document.getElementById('post-form')
console.log(post_form.childNodes);
console.log(post_form.childNodes[13]);
const btn = post_form.childNodes[13];
btn.addEventListener('click', () => {
    console.log(document.getElementById('title').value);
    console.log(document.getElementById('content').value);
}, false);