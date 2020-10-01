<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.3.1.min.js"></script>
    <script>
        title_nav = "[ getEmployeeList.jsp ::: 사원정보관리(조회/입력/수정 처리) ]";
    </script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url: "getEmployeeListData",
                success: function (result) {
                    var $checked = "";
                    var aryDay = ["월", "화", "수", "목", "금", "토", "일"];
                    var $tag = "";
                    $tag += "<div id=\"wrapper\" style=\"min-height: 887px;\">";
                    $tag += "<div class=\"col-md-24\">";
                    $tag += "<div class=\"panel-heading\">";
                    $tag += "<h1>사원 리스트</h1>";
                    $tag += "</div>";
                    $tag += "</div>";
                    $tag += "<div class=\"ui-jqgrid\" dir=\"ltr\">";
                    $tag += "<div class=\"ui-jqgrid-view table-responsive\" role=\"grid\">";
                    $tag += "<div class=\"ui-jqgrid-hdiv\">";
                    $tag += "<div class=\"ui-jqgrid-hbox\">";
                    $tag += "<table class=\"ui-jqgrid-htable ui-common-table table table-bordered\">";
                    $tag += "</table>";
                    $tag += "</div>";
                    $tag += "</div>";
                    $tag += "<div class=\"ui-jqgrid-bdiv\" style=\"height: auto; width: auto;\">";
                    $tag += "<div style=\"position: relative;\">";
                    $tag += "<div></div>";

                    $tag += "<table class=\"ui-jqgrid-btable ui-common-table table table-bordered\">";
                    $tag += "<tr><th>사원번호</th><th>이름</th><th>성별</th><th>생년월일</th><th>연락처</th><th>업무</th><th>직급</th><th>입사일</th><th>근무일</th><th>급여</th><th>고용여부</th></tr>";
                    for (var i = 0; i < result.length; i++) {
                        var splt = result[i].workDay.split(",");
                        $tag += "<tr>";
                        $tag += "<td>" + result[i].id + "</td>";
                        $tag += "<td>" + result[i].name + "</td>";
                        $tag += "<td>" + result[i].gender + "</td>";
                        $tag += "<td>" + result[i].birthday + "</td>";
                        $tag += "<td>" + result[i].phone.substring(0, 3) + "-" + result[i].phone.substring(3, 7) + "-" + result[i].phone.substring(7, 11) + "</td>";
                        $tag += "<td>" + result[i].job + "</td>";
                        $tag += "<td>" + result[i].grade + "</td>";
                        $tag += "<td>" + result[i].hireDate + "</td><td>";

                        for (var j = 0; j < aryDay.length; j++) {
                            $checked = "";
                            for (var k = 0; k < splt.length; k++) {
                                if (aryDay[j] == splt[k])
                                    $checked = "checked";
                            }
                            $tag += "<fieldset><label><input type='checkbox' name='workDay'" + $checked + " value='" + aryDay[j] + "' />" + aryDay[j] + "</label></fieldset>";
                        }
                        $tag += "</td><td>" + result[i].salary.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</td>";
                        $tag += "<td>" + result[i].hireStatus + "</td>";
                        $tag += "</tr>";
                    }
                    $tag += "</table>";
                    $("#jquery").append($tag);
                }
            });
        })
    </script>
</head>

<body>
    <div id="jquery"></div>
</body>

</html>