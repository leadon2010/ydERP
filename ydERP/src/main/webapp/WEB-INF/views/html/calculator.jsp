<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>calculator.html</title>
    <style>
        div.cal {
            display: flex;
            flex-wrap: wrap;
            width: 300px;
            height: 350px;
            background-color: aqua;
            justify-content: space-around;
        }

        .cal>div {
            background-color: yellow;
            width: 50px;
            height: 50px;
            margin: 10px;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            line-height: 50px;
        }

        .cal>div:hover {
            cursor: pointer;
        }

        div#display {
            width: 190px;
            padding-right: 10px;
            text-align: right;
        }
    </style>
</head>

<body>
    <div class="cal">
        <div id='display'>0</div>
        <div>C</div>
        <div>1</div>
        <div>2</div>
        <div>3</div>
        <div>*</div>
        <div>4</div>
        <div>5</div>
        <div>6</div>
        <div>/</div>
        <div>7</div>
        <div>8</div>
        <div>9</div>
        <div>%</div>
        <div>0</div>
        <div>+</div>
        <div>-</div>
        <div>=</div>
    </div>

    <script>
        var dp = document.getElementById('display');
        var btns = document.querySelectorAll('div.cal>div');

        for (var i = 0; i < btns.length; i++) {
            btns[i].onclick = clickEvent;
        }

        var firstVal = 0,
            lastVal = 0,
            result = 0,
            oper = null;

        function clickEvent() {
            var touchVal = this.innerHTML;
            // dp.innerHTML = parseInt(touchVal);

            if (isNaN(touchVal)) { // 문자(*,/,+,-,=,C)
                if (touchVal == 'C') {
                    firstVal = 0;
                    lastVal = 0;
                    result = 0;
                    oper = null;
                } else if (touchVal != '=') {
                    oper = touchVal;
                } else {
                    if (oper == '+') {
                    	result = (firstVal + lastVal)
                    } else if (oper == '-') {
                    	result = (firstVal - lastVal)
                    } else if (oper == '*') {
                    	result = (firstVal * lastVal)
                    } else if (oper == '/') {
                    	result = (firstVal / lastVal)
                    } else if (oper == '%') {
                    	result = (firstVal % lastVal)
                    }
                    firstVal = result;
                    lastVal = 0;
                    dp.innerHTML = result;
                    return; // function 에서 return 을 만나면 종료.
                }
            } else { // 숫자....
                if (oper) {
                    // lastVal
                    lastVal += touchVal;
                } else {
                    // fistVal
                    firstVal += touchVal;
                }
            }
            dp.innerHTML = parseInt(firstVal) + oper + (lastVal == 0 ? '' : parseInt(lastVal));
        }
    </script>
</body>

</html>