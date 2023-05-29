let disp_content = '';
let tmp_num = '';
let operator = '';
const digit_button = document.getElementsByClassName('digit');
const operator_button = document.getElementsByClassName('operator');
const equals_button = document.getElementById('equals');
const clear_button = document.getElementById('clear');
const display = document.getElementById('display');


for (let i = 0; i < digit_button.length; i ++) {
    digit_button[i].addEventListener('click', () =>{
        disp_content = disp_content + digit_button[i].textContent;
        display.textContent = disp_content;
    }, false);
};

for (let i = 0; i < operator_button.length; i++) {
    operator_button[i].addEventListener('click', ()=> {
        operator = operator_button[i].textContent;
        display.textContent = operator;
        tmp_num = disp_content;
        disp_content = '';
    }, false);
}

equals_button.addEventListener('click', () => {
    switch(operator){
        case '+' :
            display.textContent = Number(tmp_num) + Number(display.textContent);
        break;
        case '-' :
            display.textContent = Number(tmp_num) - Number(display.textContent);
        break;
        case '*' :
            display.textContent = Number(tmp_num) * Number(display.textContent);
        break;
        case '/' :
            if (display.textContent == 0){
                display.textContent = 0;
            }else{
                display.textContent = Number(tmp_num) / Number(display.textContent);
            }
        break;
    }
    disp_content = '';
    tmp_num = '';
}, false);

clear_button.addEventListener('click', () =>{
    display.textContent = 0;
    operator = '';
    tmp_num = '';
    disp_content = '';
}, false);