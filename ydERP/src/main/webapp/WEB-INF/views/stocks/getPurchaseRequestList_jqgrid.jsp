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
	$(function() {
		$("#list").jqGrid(
				{
					url : "getPurchaseRequestListData",
					datatype : "json",
					styleUI : "Bootstrap",
					height : 380,
					autoheight : true,
					autowidth : true,

					colNames : [ "품목코드", "품목명", "UOM", "인입수량", "구매가", "판매가", "부가세", "사용연한", "구매업체", "최저재고", "현재고","요청수량" ],
					colModel : [ 
						{name : "itemCode",width : 3},
						{name : "itemName",width : 5},
						{name : "uom",width : 2}, 
						{name : "inQty",width : 2,align : "right"}, 
						{name : "supplyPrice",width: 2,align : "right"}, 
						{name : "sellingPrice",width : 2,align : "right"},
						{name : "itemTax",width : 2,align : "right"}, 
						{name : "expireDate",width : 2,align : "right"},
						{name : "vendorName",width : 3,align : "right"},
						{name : "minQty",width : 2,align : "right"}, 
						{name : "onhandQty",width : 2,align : "right"}, 
						{name : "reqQty",width : 2,align : "right"}, 
						],
					pager : "#pager",
					rowNum : 10,
					rowList : [ 10, 20, 30 ],
					sortname : "itemCode",
					sortorder : "asc",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					loadonce : true,
					multiselect : true,
					caption : "재고부족품목 조회"
				});
		jQuery("#list").jqGrid('navGrid', '#pager', {});
	});
	title_nav = "[ getPurchaseRequestList_jqgrid.jsp :::  ]";
</script>
</head>
<body>
	<form name="frm" action="insertPurchaseRequest">
		<input type="submit" value="주문요청생성" />
		<div class="col-lg-12">
			<table id="list">
				<tr>
					<td></td>
				</tr>
			</table>
			<div id="pager"></div>
		</div>
	</form>
</body>
</html>