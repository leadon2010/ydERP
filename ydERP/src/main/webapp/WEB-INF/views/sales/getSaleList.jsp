<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" media="screen"
			href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
		<script
			src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
			type="text/javascript"></script>
		<script>
			var selectedSaleCode;				// 마스터 그리드(saleList)에서 선택된 판매코드
			$(document).ready(function() {
				/* Sale List : 마스터 그리드 */
				$("#saleList").jqGrid({
					url : "getSaleList.do",
					datatype : "json",
					styleUI : "Bootstrap",
					colNames : [ "판매코드", "판매일자", "결제금액", "판매처", "판매처 코드", "배송주소", "배송사원", "출하창고"],
					colModel : [
						{	name : "saleCode",		width : 6,		align : "center",	key : true	},
						{	name : "saleDate",		width : 8,		align : "center"	},
						{	name : "saleCost",		width : 4,		align : "right"		},
						{	name : "customerName",	width : 4,		align : "left"		},
						{	name : "customerCode",	width : 6,		align : "center"	},
						{	name : "deliveryAddr",	width : 14,		align : "left"		},
						{	name : "deliveryEmp",	width : 6,		align : "center"	},
						{	name : "warehouse",		width : 4,		align : "center"	},
					],
					height : 'auto',				autowidth : true,
					width  : 'auto',
					rownumbers : true,				sortname : "saleCode",
					rowNum : 10,					reccount : 15,
					viewrecords : true,				gridview : true,
					autoencode : true,				caption : "판매 내역 정보",
					pager : "#pagerSaleList",		loadonce : true,
					onSortCol : clearSelection,		onPaging : clearSelection,
					onSelectRow : function(rowid, selected) {
						if (rowid != null) {
							selectedSaleCode = $(this).getCell(rowid, 'saleCode');
							jQuery("#saleDetail").jqGrid('setGridParam', {
								url : "getSaleDetail.do?saleCode=" + selectedSaleCode, datatype: 'json'		// "./getSaleDetail.do?saleCode="
							});
							jQuery("#saleDetail").jqGrid('setCaption', '판매 코드 [' + selectedSaleCode + '] 의 상세 내역');
							jQuery("#saleDetail").trigger("reloadGrid");
						}
						console.log("선택된 판매코드 : " + selectedSaleCode);
					}
				}); // JQGRID : Master
		
				/* Sale Details : 디테일 그리드 */
				$("#saleDetail").jqGrid({
					url : "getSaleDetail.do",
					mtype : "GET",
					datatype : "json",
					styleUI : "Bootstrap",
					colNames : [ "상세코드", "품목코드", "품목", "판매가(원)", "부가세", "수량", "사용연한(년)", "구매처", "구매처 코드" ],
					colModel : [
						{	name : "saleDetailCode",	width : 4,	align : "center"	},
						{	name : "saleItemCode",		width : 4,	align : "center"	},
						{	name : "saleItemName",		width : 10,	align : "left"		},
						{	name : "salePrice",			width : 4,	align : "right"		},
						{	name : "itemTax",			width : 4,		align : "right"	},
						{	name : "saleQty",			width : 4,		align : "right"	},
						{	name : "expireDate",		width : 4,	align : "center"	},
						{	name : "vendorName",		width : 4,	align : "left"		},
						{	name : "vendorCode",		width : 4,	align : "center"	}
					],
					height : 'auto',				autowidth : true,
					width  : 'auto',
					rownumbers : true,				sortname : "saleDetailCode",
					rowNum : 10,					reccount : 15,
					viewrecords : true,				gridview : true,
					autoencode : true,				search : false,
					pager : "#pagerSaleDetail",		page : 1,
					loadonce : true
				});
		
				// 그리드 네비게이션 
				$('#saleList').jqGrid('navGrid', "#pagerSaleList", {
					add : false,
					edit : false,
					del : false,
					search : false,
					refresh : false
				}, {
					closeAfterAdd : true,
					reloadAfterSubmit : true,
					afterComplete : function() {	$("#saleList").setGridParam({	datatype : 'json',	page : 1	}).trigger('reloadGrid');	}
				});
				
				function clearSelection() {
					jQuery("#saleDetail").jqGrid('setGridParam', {url: "getSaleDetail.do", datatype: 'json'});
					jQuery("#saleDetail").jqGrid('setCaption', '판매 상세 목록');
					jQuery("#saleDetail").trigger("reloadGrid");
				}
			});
			
			var timeoutHnd;
			var flAuto = false;
		
			function doSearch(ev) {
				if(!flAuto)	return;
				if(timeoutHnd) clearTimeout(timeoutHnd)
				timeoutHnd = setTimeout(gridReload,500)
			}
		
			/* 검색 버튼을 눌렀을 때 실행되는 처리 */
			function gridReload() {
				var params = $('#saleSearchForm').serialize();
				jQuery("#saleList").jqGrid('setGridParam',{url:"getSaleByCondition.do?"+params, datatype: "json", page:1}).trigger("reloadGrid");
			}
			
			/* 초기화 버튼을 눌렀을 떄 실행되는 처리 */
			function gridReset() {
				
				// INPUT 값을 초기화한다.
				document.getElementById("saleCodePut").value = "";
				document.getElementById("customerNamePut").value = "";
				document.getElementById("saleDatePut").value = "";
				document.getElementById("saleCostPut").value = "";
				document.getElementById("deliveryAddrPut").value = "";
				document.getElementById("deliveryListSelect").value = "";
				document.getElementById("paymentListSelect").value = "";
				
				// 초기값을 매개변수로 전달하여 검색 전 데이터를 orderList 그리드에 표시한다.
				var params = $('#saleSearchForm').serialize();
				jQuery("#saleList").jqGrid('setGridParam',{url:"getSaleByCondition.do?"+params, datatype: "json", page:1}).trigger("reloadGrid");
			}
			
			function enableAutosubmit(state) {
				flAuto = state;
				jQuery("#submitButton").attr("disabled",state);
			}
			
			title_nav = "[ getSaleList.jsp :::  판매내역 관리 (검색 | 조회)]";
		</script>
		<style type="text/css">
		#salePageTitle {
			padding : 10px;
			text-align : left;
			background-color : #7F7F7F;
			color : #FFFFFF;
		}
		
		#pageName {
			background-color : #000000;
			color : #FFFFFF;
		}
		
		#searchDiv {
			margin-top : 50x;
			margin-left : 25px;
		}
		
		#saleListDiv {
			margin-left: auto;
			margin-right: auto;
			padding: 10px;
			text-align: center;
		}
		
		#saleDetailDiv {
			margin-left: auto;
			margin-right: auto;
			padding: 10px;
			text-align: center;
		}
		
		.submitTr {
			text-align : center;
		}
		
		.searchTd {
			padding-right : 15px;
			padding-top : 10px;
			padding-bottom : 10px;
			size: auto;
		}
		
		.inputTd {
			padding-right : 45px;
			padding-top : 10px;
			padding-bottom : 10px;
			size : auto;
		}
		
		.submitTd {
			text-align: center;
		}
		
		#saleCodePut, #customerCodePut, ##saleDatePut, #saleCostPut {
			width : 1000px;
		}
		</style>
		<title>getSaleList.jsp</title>
	</head>
	<body>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">판매 관리</div>
		<hr>
		<div id="searchDiv">
			<form id="saleSearchForm" name="saleSearchForm">
				<table>
						<tr>
							<td class="searchTd">판매코드</td><td class="inputTd"><input type="text" id="saleCodePut" name="saleCode"/></td>
							<td class="searchTd">판매처</td><td class="inputTd"><input type="text" id="customerNamePut" name="customerName" /></td>
							<td class="searchTd">판매일자</td><td class="inputTd"><input type="date" id="saleDatePut" name="saleDate"/></td>
						</tr>
						<tr>
							<td class="searchTd">결제금액</td><td class="inputTd"><input type="text" id="saleCostPut" name="saleCost"/></td>
							<td class="searchTd">배송주소</td><td colspan="2"><input type="text" id="deliveryAddrPut" name="deliveryAddr"/></td>
						</tr>
						<tr class="searchTr">
							<td class="searchTd">배송상태</td>
							<td class="inputTd">
								<select id="deliveryListSelect" name="deliveryStatus">
									<option value="">전체</option>
									<c:forEach items="${lookupDeliveryList}" var="lkdl">						
										<option value="${lkdl.LOOKUP_CODE}" >${lkdl.LOOKUP_VALUES}</option>			
									</c:forEach>
								</select>
							</td>
							<td class="searchTd">결제상태</td>
							<td class="inputTd">
								<select id="paymentListSelect" name="payStatus">
									<option value="">전체</option>
									<c:forEach items="${lookupPaymentList}" var="lkpl">						
										<option value="${lkpl.LOOKUP_CODE}">${lkpl.LOOKUP_VALUES}</option>					
									</c:forEach>
								</select>
							</td>
							<td class="submitTd"><button type="button" onclick="gridReload()" id="submitButton" class="btn btn-success btn-lg">검색</button></td>
							<td class="submitTd"><button type="button" onclick="gridReset()" id="resetButton" class="btn btn-warning btn-lg">초기화</button></td>
						</tr>
				</table>
			</form>
		</div>
		<hr>
		<div id="saleListDiv">
			<table id="saleList">
				<tr>
					<td></td>
				</tr>
			</table>
			<div id="pagerSaleList"></div>
		</div>
		<hr>
		<div id="saleDetailDiv">
			<table id="saleDetail">
				<tr>
					<td></td>
				</tr>
			</table>
			<div id="pagerSaleDetail"></div>
		</div>
		</div>
		</div>
	</body>
</html>