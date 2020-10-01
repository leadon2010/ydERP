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
					url : "getItemInOutListData",
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
						{ name : "dealDate", width : 5, align : "center" },
						{ name : "dealerCode", width : 4 },
						{ name : "inQty", width : 3, align : "right" },
						{ name : "outQty", width : 3, align : "right" },
						{ name : "txnDate", width : 5, align : "center" }, 
						],

					pager : "#pager",
					rowNum : 10,
					rowList : [ 10, 20, 30 ],
					rownumbers : true,
					sortname : "stockId",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					reccount : 15,
					loadonce : true,
					caption : "품목 입출고 현황조회"
				});
	});
	title_nav = "[ getItemInOutList.jsp ::: 품목 입출고 정보 ]";
</script>
</head>
<body>
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