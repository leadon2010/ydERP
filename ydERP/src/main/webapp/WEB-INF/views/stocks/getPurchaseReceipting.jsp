<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>구매전체조회</title>
<link rel="stylesheet" type="text/css" media="screen" 
		href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">

	$(document).ready(function() {

		// master grid
		$("#list").jqGrid({
			url : "getReceiptHeadersData",
			datatype : "json",
			mtype : "GET",
			styleUI : "Bootstrap",
			autowidth : true,
			colModel : [
				{	label : "구매코드", name : "purchaseCode", width : 110 },
				{	label : "구매일자", name : "purchaseDate", width : 85 },
				{	label : "구매처", name : "vendorCode", width : 80, align : "right" },
				{	label : "구매처명", name : "vendorName", width : 80, align : "right" },
				{   label : "결제금액", name : "purchaseCost", width : 80, align : "right" },
				{   label : "입고처리", name :'act',index:'act', width : 100 ,sortable:false, formatter: delButton}
			],
			pager : "#pager",
			rowNum : 5,
			height : 'auto',
			rowList : [ 10, 20, 30 ],
			rownumbers : true,
			sortname : "purchaseCode",
			sortorder : "desc",
			loadonce : true,
			viewrecords : true,
			navGrid : {
				view : true,
				del : false
			},
			gridview : true,
			autoencode : true,
			caption : "구매정보",
			onSelectRow : function(rowid, selected) {
				if (rowid != null) {
					var selectedPurchaseCode = $(this).getCell(rowid, 'purchaseCode');
					jQuery("#list1").jqGrid('setGridParam', {
						url : "getReceiptLinesData?purchaseCode=" + selectedPurchaseCode,
						datatype : 'json'
					}); // the last setting is for demo only
					jQuery("#list1").jqGrid('setCaption', '구매코드 : ' + selectedPurchaseCode);
					jQuery("#list1").trigger("reloadGrid");
				}
				console.log("선택된 구매코드 : " + selectedPurchaseCode);
			}
			
		// use the onSelectRow that is triggered on row click to show a details grid							
		});

		function delButton(cellvalue, options, rowObject) {
			//return '<input type="button" onclick="delete('+cellvalue+')" value="DEL"/>';
			return "<input style='height:22px;width:80px;' type='button' value='입고' onclick='receipt_proc(\"" + options.rowId + "\")' />";
		};

		$("#list1").jqGrid({
			datatype : "json",
			styleUI : "Bootstrap",
			autowidth : true,
			colModel : [
				{   label : "구매상세코드", name : "purchaseDetailCode", width : 110, editable : true },
				{   label : "구매코드", name : "purchaseCode", width : 110, editable : true },
				{   label : "품목코드", name : "purchaseItem", width : 85, editable : true },
				{   label : "품목명", name : "itemName", width : 85, editable : true },
				{   label : "품목수량", name : "purchaseQty", width : 80, align : "right", editable : true },
				{   label : "품목단가", name : "purchasePrice", width : 80, align : "right", editable : true },
				{   label : "부가세", name : "itemTax", width : 80, align : "center", editable : true },
				/* {   label : "입고여부", name : "incomingFlag", width : 80, editable : true, sortable : false, align : "center", formatter : "checkbox",
					editoptions : { value : 'Y:N', defaultValue : 'N' },
					formatoptions : { disabled : false } } */
			],
			pager : "#pager1",
			rowNum : 8,
			rownumbers : true,
			height : 'auto',
			rowList : [ 10, 20, 30 ],
			sortname : "purchaseDatailCode",
			sortorder : "desc",
			viewrecords : true,
			gridview : true,
			autoencode : true,
			editurl : "getReceiptLinesData",
			caption : "구매상세정보",

			/* 			onCellSelect : function(rowid, iCol) {
							if (rowid != null) {			 
								if (iCol == 6) {	
									var incoming = $("#list1").jqGrid("getCell", rowid, "incomingFlag"); // 체크했으면 수정
									console.log(incoming);
								}
							}
						}, */
			loadComplete : function() {
				var iCol = getColumnIndexByName($(this), 'incomingFlag'),
					rows = this.rows,
					i,
					c = rows.length;
				for (i = 0; i < c; i += 1) {
					$(rows[i].cells[iCol]).click(function(e) {
						var id = $(e.target).closest('tr')[0].id,
							isChecked = $(e.target).is(':checked');
						//alert("checked:" + isChecked);
						//you can also get the values of the row data
						// alert('clicked on the checkbox in the row with id=' + id + '\nNow the checkbox is ' + (isChecked ? 'checked' : 'not checked'));
						var purchaseDetailCode = $(e.target).closest('tr').find("td:first").attr("title");
						if (isChecked == true) {
							isChecked = "Y"
						} else {
							isChecked = "N"
						}
						/*  alert(purchaseDetailCode) //ajax $컨트롤러 입력. */
						jQuery.ajax({
							type : "POST",
							data : {
								'purchaseDetailCode' : purchaseDetailCode,
								incomingFlag : isChecked
							},
							url : "updatePurchases",
							contentType : "application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
							cache : false,
							success : function(data) {}
						});
					});
				}
			}
		}).navGrid("#pager1", {
			/* options */
			add : true,
			edit : true,
			view : true,
			del : true,
			search : true,
			refresh : true
		//add:false,edit:false,view:false,del:false,search:false,refresh:false
		}
			, { /* Edit options */
				closeAfterAdd : true,
				reloadAfterSubmit : false,
				closeOnEscape : true
			}
			, { /* Add options */
				closeAfterAdd : true,
				reloadAfterSubmit : false,
				closeOnEscape : true
			}
			, { /* Delete options */
				reloadAfterSubmit : false,
				closeOnEscape : true
			}
			, { /* Search options */
				closeOnEscape : true,
				onSearch : function() {} //onSearch:function(){
			} //Search Option
			, { /* view parameters*/
				closeOnEscape : true
			});
		jQuery("#list1").jqGrid('navGrid', "#pager1", {
			edit : false,
			add : false,
			del : false
		});
		jQuery("#list1").jqGrid('inlineNav', "#pager1");

		function clearSelection() {
			jQuery("#list1").jqGrid('setGridParam', {
				url : "getPurchaseDetailList",
				datatype : 'json'
			}); // the last setting is for demo purpose only
			jQuery("#list1").jqGrid('setCaption', "purchaseDatailCode");
			jQuery("#list1").trigger("reloadGrid");
		}
		getColumnIndexByName = function(grid, columnName) {
			var cm = grid.jqGrid('getGridParam', 'colModel'), i, l;
			for (i = 0, l = cm.length; i < l; i += 1) {
				if (cm[i].name === columnName) {
					return i; // return the index
				}
			}
			return -1;
		}
	});

	function receipt_proc(rowid) {
		console.log("start rowid= " + rowid);
		var selectedPurchaseCode = $("#list").getCell(rowid, 'purchaseCode');
		//common.in_txn(selectedPurchaseCode);//ajax controller
		jQuery.ajax({
			type : "POST",
			datatype : 'json',
			url : "insertPurchaseProc?pTxnNo=" + selectedPurchaseCode,
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			success : function() {
				alert("succss: "+selectedPurchaseCode);
				jQuery("#list").jqGrid('setGridParam', {
					url : "getReceiptHeadersData",
					datatype : 'json'
				});
				jQuery("#list").trigger("reloadGrid");
				jQuery("#list1").trigger("reloadGrid");
			}
		})
	};
	title_nav = "[ getPurchaseReceipting.jsp >>> 승인건에 대한 입고처리 ]";
</script>

</head>
<body>
	<div class="col-lg-5">
		<div class="panel panel-default">
			<div class="panel-heading">구매입고처리</div>
			<div class="container"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-10">
			<table id="list">
				<tr>
					<td></td>
				</tr>
			</table>
			<div id="pager"></div>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-lg-12">
			<table id="list1">
				<tr>
					<td></td>
				</tr>
			</table>
			<div id="pager1"></div>
		</div>
	</div>
</body>
</html>