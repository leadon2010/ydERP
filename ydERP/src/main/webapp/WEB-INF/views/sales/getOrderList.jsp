<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	var lastsel2;
	var selectedOrderCode;				// 마스터 그리드(orderList)에서 선택된 주문코드
	$(document).ready(function() {
		/* Order List : 마스터 그리드 */
		$("#orderList").jqGrid({
			url : "getOrderList.do",
			editurl : "editOrderList.do",
			datatype : "json",
			styleUI : "Bootstrap",
			colNames : [ "주문코드", "주문일자", "주문처", "배송주소", "배송사원", "출고창고", "승인", "취소", "폐기"],			
			colModel : [
				{	name : "saleCode",		width : 6,	align : "center",	editable : false,	key : true	},
				{	name : "saleDate",		width : 8,	align : "center",	editable : false	},
				{	name : "customerName",	width : 6,	align : "left",		editable : false	},				
				{	name : "deliveryAddr",	width : 14,	align : "left",		editable : false	},
				{	name : "deliveryEmp",	width : 5,	align : "center",	editable : true,
					edittype : "select",	editoptions:{value:"${employeeList}"}					},					
				{	name : "warehouse",		width : 6,	align : "center",	editable : true,
					edittype : "select",	editoptions:{value:"${lookupValueList}"}				},
				{	name : "permit",		width : 4,	align : "center",	sortable : false,		formatter : permitBtn,
					autocomplete : true	},
				{	name : "permitCancle",	width : 4,	align : "center",	sortable : false,		formatter : cancleBtn	},
				{	name : "deleteOrder",	width : 4,	align : "center",	sortable : false,		formatter : deleteBtn	}
			],
			height : 'auto',				width : 'auto',
			autowidth : true,
			rownumbers : true,				sortname : "saleCode",
			rowNum : 10,					reccount : 15,
			viewrecords : true,				gridview : true,
			autoencode : true,				caption : "주문 내역 정보",
			pager : "#pagerOrderList",		loadonce : true,
			onSortCol : clearSelection,		onPaging : clearSelection,
			reloadAfterSubmit : true,		closeAfterAdd : true,
			onSelectRow : function(rowid, selected) {
				if(rowid && rowid!==lastsel2){
					jQuery('#orderList').jqGrid('restoreRow',lastsel2);
					jQuery('#orderList').jqGrid('editRow',rowid,true);
					lastsel2=rowid;
				}
				if (rowid != null) {
					selectedOrderCode = $(this).getCell(rowid, 'saleCode');
					jQuery("#orderDetail").jqGrid('setGridParam', {
						url : "getOrderDetail.do?saleCode=" + selectedOrderCode, datatype: 'json'
					});
					jQuery('#orderDetail').jqGrid('setCaption', '주문 코드 [' + selectedOrderCode + '] 의 상세 내역');
					jQuery('#orderDetail').trigger("reloadGrid");
				}
				console.log("선택된 주문 코드 : " + selectedOrderCode);
			},
			jqGridInlineAfterSaveRow : function() {
				console.log("리로딩");
				$("#orderList").trigger("reloadGrid");
			},
			/* afterSubmit : function() {
				$("#orderList").setGridParam({
					url : "getOrderList.do",
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');			
			},
			afterComplete : function() {
				$("#orderList").setGridParam({
					url : "getOrderList.do",
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');
			} */
		});	// JQGRID : Master
		 
		/* Order Details : 디테일 그리드 */
		$("#orderDetail").jqGrid({
			url : "getOrderDetail.do",
			mtype : "GET",
			datatype : "json",
			styleUI : "Bootstrap",
			colNames : [ "상세코드", "품목코드", "품목", "판매가(원)", "부가세", "수량", "사용연한(년)", "구매처", "구매처 코드" ],
			colModel : [
				{	name : "saleDetailCode",	width : 4,	align : "center"	},
				{	name : "saleItemCode",		width : 4,	align : "center"	},
				{	name : "saleItemName",		width : 10,	align : "left"		},
				{	name : "salePrice",			width : 4,	align : "right"		},
				{	name : "itemTax",			width : 4,	align : "right"		},
				{	name : "saleQty",			width : 4,	align : "right"		},
				{	name : "expireDate",		width : 4,	align : "center"	},
				{	name : "vendorName",		width : 4,	align : "left"		},
				{	name : "vendorCode",		width : 4,	align : "center"	}
			],
			height : 'auto',						autowidth : true,
			width  : 'auto',
			rownumbers : true,						sortname : "orderDetailCode",
			rowNum : 10,							reccount : 15,
			viewrecords : true,						gridview : true,
			autoencode : true,						search : true,
			pager : "#pagerOrderDetail",			page : 1,
			loadonce : true		
		});

		// 그리드 네비게이션 
		$('#orderList').jqGrid('navGrid', "#pagerOrderList", {
			search : false,
			add : false,
			edit : false,
			cancel : false,
			del : false,
			refresh : true
		}, {
			closeAfterAdd : true,
			reloadAfterSubmit : true,
			afterComplete : function() {	$("#orderList").setGridParam({	datatype : 'json',	page : 1	}).trigger("reloadGrid");	}
		}, {
			serializeDelData : function(postdata) {
				return "oper=del&saleCode=" + postdata.id
			}
		});
	});
	
	function clearSelection() {
		jQuery("#orderDetail").jqGrid('setGridParam',{url: "getOrderDetail.do", datatype: 'json'});
		jQuery("#orderDetail").jqGrid('setCaption', '주문 상세 목록');
		jQuery("#orderDetail").trigger("reloadGrid");
	}
	
	saveparameters = {
		"successfunc" : function(response) {
			if(response.responseJSON.result == "false") {
				alert(response.responseJSON.data);
			}
			else if(response.responseJSON.result == "true") {
				alert("주문이 승인되었습니다.");
			}
		}
	};
	
	/* 승인확인 버튼 생성 */
	function permitBtn (cellvalue, options, rowObject) {
		return '<input type="button" onclick="jQuery(\'#orderList\').saveRow(\''+options.rowId+'\',saveparameters);" value="확인"/>';
		// return "<input type='button' onclick='permitProc(\"" + options.rowId + "\")' value='확인'/>";
	};
	
	/* 편집취소 버튼 생성 */
	function cancleBtn(cellvalue, options, rowObject) {
     	return '<input type="button" onclick=\"jQuery(\'#orderList\').restoreRow(\''+options.rowId+'\');" value="확인"/>';     
	};
	
	/* 주문취소 버튼 생성 */
	function deleteBtn(cellvalue, options, rowObject) {
		return '<input type="button" onclick="deleteOrder(\''+options.rowId+'\')" value="확인"/>';
		jQuery("#orderList").trigger("reloadGrid");
		jQuery("#orderDetail").trigger("reloadGrid");
	}
	
	/* 주문 취소 */
	function deleteOrder(saleCode) {
		var params = {saleCode:saleCode}
		$.ajax ({
			url : "deleteOrderList.do",
			type : "POST",
			dataType : "json",
			data : params,
			success : function( ) { $("#orderList").trigger("reloadGrid"); }
		})
	}
	
	var timeoutHnd;
	var flAuto = false;

	function doSearch(ev) {
		if(!flAuto)	return;
		if(timeoutHnd) clearTimeout(timeoutHnd)
		timeoutHnd = setTimeout(gridReload,500)
	}

	/* 검색 버튼을 눌렀을 때 실행되는 처리 */
	function gridReload() {
		
		// FORM 태그 내에 있는 모든 INPUT 값을 매개변수로 저장한다.
		var params = $('#orderSearchForm').serialize();

		// getOrderByCondition.do를 호출하여 데이터를 조회하고 결과를 orderList 그리드에 표시한다.
		jQuery("#orderList").jqGrid('setGridParam', {url:"getOrderByCondition.do?"+params, datatype: "json", page:1}).trigger("reloadGrid");
	}
	
	/* 초기화 버튼을 눌렀을 떄 실행되는 처리 */
	function gridReset() {
		
		// INPUT 값을 초기화한다.
		document.getElementById("orderCodePut").value = "";
		document.getElementById("customerNamePut").value = "";
		document.getElementById("orderDatePut").value = "";
		document.getElementById("orderCostPut").value = "";
		document.getElementById("deliveryAddrPut").value = "";
		
		// 초기값을 매개변수로 전달하여 검색 전 데이터를 orderList 그리드에 표시한다.
		var params = $('#orderSearchForm').serialize();
		jQuery("#orderList").jqGrid('setGridParam',{url:"getOrderByCondition.do?"+params, datatype: "json", page:1}).trigger("reloadGrid");
	}
	
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled",state);
	}
	
	function permitProc(rowid) {
		var selected
	}
	
	title_nav = "[ getOrderList.jsp :::  주문내역 관리 (검색 | 조회 | 승인 | 폐기)]";
</script>
<style type="text/css">
#orderPageTitle {
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

#orderListDiv {
	margin-left: auto;
	margin-right: auto;
	padding: 10px;
	text-align: center;
}

#orderDetailDiv {
	margin-left: auto;
	margin-right: auto;
	padding: 10px;
	text-align: center;
}

#permitOrderDiv {
	background-color: #3F7FFF;
	padding : 50px;
	float: left;

}

.searchTd{
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

</style>
<title>getOrderList.jsp</title>
</head>
<body>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"> 주문 관리</div>
				<hr>
				<div id="searchDiv">
					<form id="orderSearchForm" name="orderSearchForm">
						<table>
							<tr>
								<td class="searchTd">주문코드</td><td class="inputTd"><input type="text" id="orderCodePut" name="saleCode" /></td>
								<td class="searchTd">주문처</td><td class="inputTd"><input type="text" id="customerNamePut" name="customerName" /></td>
								<td class="searchTd">주문일자</td><td class="inputTd"><input type="date" id="orderDatePut" name="saleDate" /></td>
							</tr>
							<tr>
								<td class="searchTd">결제금액</td><td class="inputTd"><input type="text" id="orderCostPut" name="saleCost" /></td>
								<td class="searchTd">배송주소</td><td class="inputTd"><input type="text" id="deliveryAddrPut" name="deliveryAddr" /></td>
								<td class="submitTd"><button type="button" onclick="gridReload()" id="submitButton" class="btn btn-success btn-lg">검색</button></td>
								<td class="submitTd"><button type="button" onclick="gridReset()" id="resetButton" class="btn btn-warning btn-lg">초기화</button></td>
							</tr>
						</table>
					</form>
				</div>
				<hr>
				<div id="orderListDiv">
					<table id="orderList">
						<tr>
							<td></td>
						</tr>
					</table>
					<div id="pagerOrderList"></div>
				</div>
				<hr>
				<div id="orderDetailDiv">
					<table id="orderDetail">
						<tr>
							<td></td>
						</tr>
					</table>
					<div id="pagerOrderDetail"></div>
				</div>
			</div>
		</div>
	</body>
</html>