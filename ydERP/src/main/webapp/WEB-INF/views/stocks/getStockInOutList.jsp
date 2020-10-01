<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />

<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$("#list").jqGrid(
				{
					url : "getStockInOutListData",
					datatype : "json",
					styleUI : "Bootstrap",
					height : 380,
					autoheight : true,
					autowidth : true,

					colNames : [ "SeqId", "품목코드", "품목명", "판매/구매일자", "판매/구매번호", "입고수량", "출고수량", "처리일자" ],
					colModel : [ 
						{ name : "stockId", width : 3 }, 
						{ name : "itemCode", width : 3 }, 
						{ name : "itemName", width : 5 }, 
						{ name : "dealDate", width : 4, align : "center" },
						{ name : "dealerCode", width : 3 },
						{ name : "inQty", width : 2, align : "right" },
						{ name : "outQty", width : 2, align : "right" },
						{ name : "txnDate", width : 4, align : "center" }, 
						],

					pager : "#pager",
					rowNum : 13,
					height : 'auto',
					rowList : [ 10, 20, 30 ],
					rownumbers : true,
					sortname : "stockId",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					reccount : 15,
					loadonce : true,
					caption : "입출고 현황조회"
				});
	});
	var timeoutHnd;
	var flAuto = false;

	function doSearch(ev){
		if(!flAuto)
			return;
//		var elem = ev.target||ev.srcElement;
		if(timeoutHnd)
			clearTimeout(timeoutHnd)
		timeoutHnd = setTimeout(gridReload,500)
	}

	function gridReload() {
		var cd_mask = jQuery("#item_cd").val();
		var nm_mask = jQuery("#item_nm").val();
		var deal_cd = jQuery("#deal_cd").val();
		var from_dt = jQuery("#from_cd").val();
		var to_dt = jQuery("#to_cd").val();

		console.log(from_dt + "=====================" + to_dt);
		jQuery("#list").jqGrid(
				'setGridParam',
				{
					url : "getStockInOutListData?itemName=" + nm_mask + "&itemCode=" + cd_mask + "&poSoNumber=" + deal_cd + "&fromDate=" + from_dt + "&toDate=" + to_dt ,
					datatype : "json",
					page : 1
				}).trigger("reloadGrid");
	}
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled", state);
	}
	title_nav = "[ getStockInOutList.jsp >>> 조건별 입출고 현황조회 ]";
</script>
</head>
<body>
	<div class="col-lg-8">
		<div class="panel panel-default">
			<div class="panel-heading">입/출고조회</div>
			
			<div class="container">
				<div class="row">
					<div class="col-lg-2">
						<input type="checkbox" id="autosearch"
							onclick="enableAutosubmit(this.checked)"> 자동검색기능 ON
					</div>
					<div class="col-lg-2">
						<input type="hidden"/> 처리 일자 조회
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px">
					<div class="col-lg-2">
						<input type="text" id="item_cd" class="form-control"
							placeholder="품목 코드"
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<div class="col-lg-2">
						<input type="date" id="from_cd" class="form-control"
							placeholder="==> Enter From"
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<div class="col-lg-2">
						<input type="date" id="to_cd" class="form-control"
							placeholder="==> Enter To"
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px">
					<div class="col-lg-2">
						<input type="text" id="item_nm" class="form-control"
							placeholder="품목명"
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<div class="col-lg-2">
						<input type="text" id="deal_cd" class="form-control"
							placeholder="판매/구매 번호"
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<div class="col-lg-2">
						<button onclick="gridReload()" id="submitButton"
							class="btn btn-outline btn-success btn-block">Search</button>
					</div>
				</div>
				
				<br>
			</div>
		</div>
	</div>
	<div class="col-lg-12">
		<table id="list">
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="pager"></div>
	</div>
</body>
</html>