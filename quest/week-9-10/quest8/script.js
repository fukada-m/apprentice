const api = 'https://todo-api-yp3z.onrender.com/'; // API の URL に置き換える

function addTodo() {
    const title = document.getElementById('new-todo').value;
    fetch(`${api}/todos`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ todo: { title } })
    })
        .then(response => response.json())
        .then(() => {
            document.getElementById('new-todo').value = '';
            fetchTodos();
        });
}

function fetchTodos() {
    fetch(`${api}/todos`)
        .then(response => response.json())
        .then(data => {
            const todoList = document.getElementById('todo-list');
            todoList.innerHTML = '';
            for (let todo of data.todos) {
                let listItem = document.createElement('li');
                listItem.className = 'todo-item';
                listItem.innerHTML = `
        ${todo.title}
        <button onclick="editTodo(${todo.id})">編集</button>
        <button onclick="deleteTodo(${todo.id})">削除</button>
      `;
                todoList.appendChild(listItem);
            }
        });
}

function editTodo(id) {
    const newTitle = prompt("新しいTODOを入力してください");
    fetch(`${api}/todos/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ todo: { title: newTitle } })
    })
        .then(response => response.json())
        .then(() => fetchTodos());
}

function deleteTodo(id) {
    fetch(`${api}/todos/${id}`, {
        method: 'DELETE'
    })
        .then(() => fetchTodos());
}


fetchTodos();