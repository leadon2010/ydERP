<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
    function logoutcheck() {
        location.href = 'logout';
    }
</script>

<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <c:if test="${not empty sessionScope.viewCustomer.customerCode }">
                        ${sessionScope.viewCustomer.customerName}님 환영합니다.<br>
                        <input class="btn btn-primary" type="button" name="logout" value="로그아웃" onclick="logoutcheck()" />
                    </c:if>
                </div>

                <div class="input-group custom-search-form">
                    <!-- <input type="text" class="form-control" placeholder="Search..."> -->
                    <!-- <span class="input-group-btn"> -->
                    <!-- <button class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button> -->
                    <!-- </span> -->
                </div> <!-- /input-group -->
            </li>

            <c:if test="${not empty sessionScope.viewCustomer.customerCode && sessionScope.viewCustomer.customerCode!='admin12345'}">
                <li><a href="getPurchaseRequestForm">판매업체 구매신청</a></li>
            </c:if>
            <c:if test="${sessionScope.viewCustomer.customerCode=='admin12345'}">
                <li><a href="index.html"><i class="fa fa-info fa-fw"></i>
                        기초정보관리<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="getItemsList">품목정보</a></li>
                        <li><a href="getItemsListLch">품목정보2</a></li>
                        <li><a href="getEmployeeList">사원정보</a></li>
                        <li><a href="manageVendorForm">구매업체 관리</a></li>
                        <li><a href="manageCustomerForm">판매업체 관리</a></li>
                        <li><a href="getSalesRequesting">판매주문요청승인</a></li>

                    </ul>
                </li>
                <%@ include file="./defaultMenu2.jsp"%>
                <li><a href="tables.html"><i class="fa fa-krw fa-fw"></i>
                        판매정보<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="getOrderList">주문내역</a></li>
                        <li><a href="getSaleList">판매내역</a></li>
                        <li><a href="getSaleChart">판매차트</a></li>
                    </ul>
                </li>
                <%@ include file="./defaultMenu4.jsp"%>
                <%@ include file="./defaultMenu5.jsp"%>
            </c:if>
        </ul>
    </div>
</div>