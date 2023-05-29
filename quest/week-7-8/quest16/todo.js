const add_button = document.getElementById('add-button');
const todo_list = document.getElementById('todo-list')
const todo_item = []

add_button.addEventListener('click', () =>{
    todo_item.push(document.createElement('li'));
    todo_item[todo_item.length - 1].innerHTML = '<li class="todo-item"><input type="checkbox"><span>TODO</span><button class="delete-button">削除</button></li>'
    todo_list.appendChild(todo_item[todo_item.length - 1]);

}, false);