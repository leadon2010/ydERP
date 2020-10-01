<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />

    <script src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css" />
    <script src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script>
        title_nav = "[ getEmployeeList.jsp ::: 사원정보관리(조회/입력/수정 처리) ]";
    </script>
    <script type="text/javascript">
		
    </script>
</head>

<body>
    <div id="wrapper">
        <div id="wrapper" style="min-height: 887px;">
            <div class="col-md-24">
                <div class="panel-heading">
                    <h1>사원 리스트</h1>
                </div>
            </div>
            <div class="ui-jqgrid" dir="ltr">
                <div class="ui-jqgrid-view table-responsive" role="grid"> 
                    <div class="ui-jqgrid-hdiv">
                        <div class="ui-jqgrid-hbox">
                            <table class="ui-jqgrid-htable ui-common-table table table-bordered">
                            </table>
                        </div>
                    </div>
                    <div class="ui-jqgrid-bdiv" style="height: auto; width: auto;">
                        <div style="position: relative;">
                            <div></div>
                            <table id="list" class="ui-jqgrid-btable ui-common-table table table-bordered">
                                <thead>
                                    <tr class="ui-jqgrid-labels">
                                        <th>사원번호</th>
                                        <th>이름</th>
                                        <th>성별</th>
                                        <th>생년월일</th>
                                        <th>연락처</th>
                                        <th>업무</th>
                                        <th>직급</th>
                                        <th>입사일</th>
                                        <th>근무일</th>
                                        <th>급여</th>
                                        <th>고용여부</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list }" var="lst">
                                        <tr>
                                            <td>${lst.id }</td>
                                            <td>${lst.name }</td>
                                            <td>${lst.gender }</td>
                                            <td>${lst.birthday }</td>
                                            <td>${lst.phone }</td>
                                            <td>${lst.job }</td>
                                            <td>${lst.grade }</td>
                                            <td>${lst.hireDate }</td>
                                            <td>${lst.workDay }</td>
                                            <td>${lst.salary }</td>
                                            <td>${lst.hireStatus }</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>