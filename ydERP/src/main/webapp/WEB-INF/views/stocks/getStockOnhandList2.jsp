<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	var ddate = new Date();
	console.dir("DATE===="+ddate);
	$(function() {
		$("#list").jqGrid(
				{
					url : "getStockOnhandListData",
					datatype : "json",
					styleUI : "Bootstrap",
					height : 300,
					autoheight : true,
					autowidth : true,

					colNames : [ "품목코드", "품목명", "UOM", "인입수량", "구매가", "판매가", "부가세", "사용연한", "구매업체", "최저재고", "현재고" ],
					colModel : [ 
						{name : "itemCode",width : 3},
						{name : "itemName",width : 5},
						{name : "uom",width : 2}, 
						{name : "quantities",width : 2,align : "right"}, 
						{name : "supplyPrice",width: 2,align : "right"}, 
						{name : "sellingPrice",width : 2,align : "right"},
						{name : "itemTax",width : 2,align : "right"}, 
						{name : "expireDate",width : 2,align : "right"},
						{name : "vendorCode",width : 3,align : "right"},
						{name : "minQty",width : 2,align : "right"}, 
						{name : "onhandQty",width : 2,align : "right"}, 
						],

					pager : "#pager",
					rowNum : 5,
					height : 'auto',
					rowList : [ 10, 20, 30 ],
					rownumbers : true,
					sortname : "itemCode",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					reccount : 15,
					loadonce : true,
					caption : "재고 현황조회",
	                onSelectRow: function(rowid, selected) {
						if(rowid != null) {
							var selectedItem = $(this).getCell(rowid, "itemCode");
							//alert(selectedItem);
							jQuery("#listDetail").jqGrid('setGridParam',{url: "getItemInOutListData?itemCode="+selectedItem,datatype: 'json'}); // the last setting is for demo only
							jQuery("#listDetail").jqGrid('setCaption', '품목코드::'+selectedItem);
							jQuery("#listDetail").trigger("reloadGrid");
						}					
					}, // use the onSelectRow that is triggered on row click to show a details grid
					onSortCol : clearSelection,
					onPaging : clearSelection,
				}
		);

		// detail grid
	    $("#listDetail").jqGrid({
			url: 'getItemInOutListData?txnDate='+ddate,
	        mtype: "GET",
	        datatype: "json",
	        page: 1,
	        styleUI : "Bootstrap",
			height : 200,
			autoheight : true,
			//autowidth : true,

	        colModel: [
	                { label: '구매/판매일', name: 'dealDate', key: true, width: 5 },
	                { label: '구매/판매번호', name: 'dealerCode', width: 4 },
	                { label: '입고수량', name: 'inQty', width: 3, align : "right" },
	                { label: '출고수량', name: 'outQty', width: 3, align : "right" },
	                { label: '입/출고일', name: 'txnDate', width: 5 }
			],
			width: 780,
			rowNum : 6,
			rownumbers : true,
			height : 'auto',
			loadonce: true,
			viewrecords: true,
			caption: '품목코드::',
			pager: "#pagerDetail"
		});
	
	    function clearSelection() {
			jQuery("#listDetail").jqGrid('setGridParam',{url: "getItemInOutListData?txnDate="+ddate, datatype: 'json'}); // the last setting is for demo purpose only
			jQuery("#listDetail").jqGrid('setCaption', 'Detail Grid:: none');
			jQuery("#listDetail").trigger("reloadGrid");
			
		}

	});
	
	var timeoutHnd;
	var flAuto = false;

	function doSearch(ev) {
		if (!flAuto)
			return;
		//		var elem = ev.target||ev.srcElement;
		if (timeoutHnd)
			clearTimeout(timeoutHnd)
		timeoutHnd = setTimeout(gridReload, 500)
	}

	function gridReload() {
		cd_mask = jQuery("#item_cd").val();
		nm_mask = jQuery("#item_nm").val();

		jQuery("#list").jqGrid(
				'setGridParam',
				{
					url : "getStockOnhandListData?itemName=" + nm_mask
							+ "&itemCode=" + cd_mask ,
					datatype : "json",
					page : 1
				}).trigger("reloadGrid");
	}
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled", state);
	}


	title_nav = "getStockOnhandList2.jsp >>> 품목의 재고 및 입출고 조회";
</script>
</head>
<body>
	<div class="col-lg-8">
		<div class="panel panel-default">
			<div class="panel-heading">재고 및 입출고 조회</div>
			<div class="container">
				<div class="row" style="margin-top: 10px">
					<div class="col-lg-2">
						<input type="text" id="item_cd" class="form-control"
							placeholder="ItemCode ..."
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<div class="col-lg-2">
						<input type="text" id="item_nm" class="form-control"
							placeholder="ItemName ..."
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<div class="col-lg-2">
						<button onclick="gridReload()" id="submitButton"
							class="btn btn-outline btn-success btn-block">Search</button>
					</div><br>
				</div><br>
			</div>
		</div>
	</div>
	<div class="col-lg-12">
		<table id="list">
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
	<div id="pager"></div>
	<div class="col-lg-10">
		<div id="detailsPlaceholder">
			<table id="listDetail"></table>
			<div id="pagerDetail"></div>
		</div>
	</div>
</body>
</html>