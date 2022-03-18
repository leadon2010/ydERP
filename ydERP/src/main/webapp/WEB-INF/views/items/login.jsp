<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login form</title>

    <!-- font awesome -->
    <link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Style -->
    <!-- <link href="css/style.css" rel="stylesheet"> -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <script>
        $(document).ready(function () {
            $("#btnLogin").click(function () {
                var customerCode = $("#customerCode").val();
                var customerPw = $("#customerPw").val();
                if (customerCode == "") {
                    alert("아이디(사업자등록번호)를 입력하세요.");
                    $("#customerCode").focus();
                    return;
                }
                if (customerPw == "") {
                    alert("비밀번호를 입력하세요.");
                    $("#customerPw").focus();
                    return;
                }

                document.loginForm.submit();
            });
        });

        //아이디 입력하고 엔터치면 비밀번호 input 태그로 넘어가게.
        function jumptoPWbtn() {
            var keyCode = window.event.keyCode;
            if (keyCode == 13)
                $("#customerPw").focus();
        }


        //로그인시 엔터키 치면 넘어가게.
        function onEnterSubmit() {

            var keyCode = window.event.keyCode;
            if (keyCode == 13)
                document.loginForm.submit();

        }
    </script>

</head>
<!--  -->

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">YedamERP 로그인</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" name="loginForm" id="loginForm" method="post" action="loginCheck">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="아이디(사업자등록번호)" name="customerCode"
                                        id="customerCode" type="text" onkeydown='javascript:jumptoPWbtn()' autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호" name="customerPw" id="customerPw"
                                        type="password" value="" onkeydown='javascript:onEnterSubmit()'>
                                </div>
                                <c:if test="${msg == 'failure'}">
                                    <div style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</div><br>
                                </c:if>
                                <c:if test="${msg == 'logout'}">
                                    <div style="color: red">로그아웃되었습니다. 안녕히 가세요.</div><br>
                                </c:if>
                                <a id="btnLogin" class="btn btn-lg btn-success btn-block">로그인</a>

                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>

</html>