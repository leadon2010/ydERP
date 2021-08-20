<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login form</title>
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css"
        rel="stylesheet" type="text/css">
    <!--  Jquery UI CSS -->
    <link href="${pageContext.request.contextPath}/resources/jquery/jquery-ui.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Chat -->
    <link href="${pageContext.request.contextPath}/resources/chat/chat.css" rel="stylesheet">


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

                document.form1.submit();
            });
        });
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
                        <form role="form" name="form1" method="post" action="loginCheck">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="아이디(사업자등록번호)" name="customerCode"
                                        id="customerCode" type="text" autofocus> </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호" name="customerPw" id="customerPw"
                                        type="password" value="">
                                </div>
                                <c:if test="${msg == 'failure'}">
                                    <div style="color: red">
                                        아이디 또는 비밀번호가 일치하지 않습니다.
                                    </div>
                                </c:if>
                                <c:if test="${msg == 'logout'}">
                                    <div style="color: red">
                                        로그아웃되었습니다. 안녕히 가세요.
                                    </div>
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