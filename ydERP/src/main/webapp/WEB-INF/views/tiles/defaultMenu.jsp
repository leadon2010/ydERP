<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                        ${sessionScope.viewCustomer.customerName}환영합니다!!<br>
                        <input class="btn btn-primary" type="button" name="logout" value="로그아웃"
                            onclick="logoutcheck()" />
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

            <c:if
                test="${not empty sessionScope.viewCustomer.customerCode && sessionScope.viewCustomer.customerCode!='admin12345'}">
                <li><a href="getPurchaseRequestForm">구매요청화면</a></li>
            </c:if>
            <c:if test="${sessionScope.viewCustomer.customerCode=='admin12345'}">
                <li><a href="index.html"><i class="fa fa-info fa-fw"></i>메인페이지<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="getItemsList">상품리스트</a></li>
                        <li><a href="getItemsListLch">상품리스트lch</a></li>
                        <li><a href="getEmployeeList">사원리스트</a></li>
                        <li><a href="manageVendorForm">협력업체</a></li>
                        <li><a href="manageCustomerForm">구매업체</a></li>
                        <li><a href="getSalesRequesting">판매요청</a></li>

                    </ul>
                </li>
                <%@ include file="./defaultMenu2.jsp"%>
                <li><a href="tables.html"><i class="fa fa-krw fa-fw"></i>테이블페이지<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="getOrderList">주문리스트</a></li>
                        <li><a href="getSaleList">판매리스트</a></li>
                        <li><a href="getSaleChart">챠트</a></li>
                    </ul>
                </li>
                <%@ include file="./defaultMenu4.jsp"%>
                <%@ include file="./defaultMenu5.jsp"%>
                <%@ include file="./defaultMenu6.jsp"%>
            </c:if>
        </ul>
    </div>
</div>