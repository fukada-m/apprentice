echo Enter two numbers:
read num1
read num2
echo "Chose an arithmetic operation (+, -, *, /)"
read ope
if [ "$ope" = "+" ]; then
    let result=num1+num2
    elif [ "$ope" = "-" ]; then
    let result=num1-num2
    elif [ "$ope" = "*" ]; then
    let result=num1*num2
    elif [ "$ope" = "/" ]; then
    let result=num1/num2
fi


echo "The result:$result"