const todo_input = document.getElementById('todo-input');
const add_button = document.getElementById('add-button');
const todo_list = document.getElementById('todo-list');

const create_todo = (todo_item) => {
    todo_item.innerHTML = '<li class="todo-item"><input type="checkbox"><span>TODO</span><button class="delete-button">削除</button></li>';
    todo_item.children[0].children[1].textContent = todo_input.value;
    todo_input.value = null;
    todo_list.appendChild(todo_item);
}

const delete_evnt = (todo_item) =>{
    delete_button.parentNode.parentNode.parentNode.removeChild(todo_item);
}

const checkbox_event = (todo_item) => {
    if (todo_item.children[0].children[1].style.textDecoration == 'line-through') {
        todo_item.children[0].children[1].style.textDecoration = 'none';
    }else{
        todo_item.children[0].children[1].style.textDecoration = 'line-through';
    } 
}

const add_todo = () => {
    const todo_item = document.createElement('li');
    create_todo(todo_item);
    const delete_button = todo_item.children[0].children[2];
    delete_button.addEventListener('click', () => {
        delete_evnt(todo_item);
    }, false);
    const checkbox = todo_item.children[0].children[0];
    checkbox.addEventListener('click', () => {
        checkbox_event(todo_item);
    }, false); 
};

add_button.addEventListener('click', () => {
    add_todo();
}, false);
