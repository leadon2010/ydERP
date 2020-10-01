<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	var flag = 'N';
	var cd_mask = '';
	var nm_mask = '';
	var vend_cd = '';
	var grp_cd1 = '';
	var grp_cd2 = '';
	var grp_cd3 = '';
	var groups = '';
	
	$(function() {
		
		//품목재고 그리드.
		$("#list").jqGrid(
				{
					url : "getStockOnhandListData",
					datatype : "json",
					styleUI : "Bootstrap",
					height : 'auto',
					autoheight : true,
					autowidth : true,

					colNames : [ "품목코드", "품목명", "UOM", "인입수량", "구매가", "판매가",
							"부가세", "사용연한", "구매업체", "최저재고", "현재고" ],
					colModel : [ {
						name : "itemCode",
						width : 3
					}, {
						name : "itemName",
						width : 5
					}, {
						name : "uom",
						width : 2
					}, {
						name : "quantities",
						width : 2,
						align : "right"
					}, {
						name : "supplyPrice",
						width : 2,
						align : "right"
					}, {
						name : "sellingPrice",
						width : 2,
						align : "right"
					}, {
						name : "itemTax",
						width : 2,
						align : "right"
					}, {
						name : "expireDate",
						width : 2,
						align : "right"
					}, {
						name : "vendorName",
						width : 3,
						align : "right"
					}, {
						name : "minQty",
						width : 2,
						align : "right"
					}, {
						name : "onhandQty",
						width : 2,
						align : "right"
					}, ],
					pager : "#pager",
					rowNum : 13,
					rowList : [ 10, 20, 30 ],
					rownumbers : true,
					sortname : "itemCode",
					sortorder : "asc",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					loadonce : true,
					caption : "재고 현황조회"
				});
		
		jQuery("#list").jqGrid('navGrid', '#pager', {});

		jQuery("#list").click(
				function() {
					var id = jQuery("#list").jqGrid('getGridParam', 'selrow');

					if (id) {
						var ret = jQuery("#list").jqGrid('getRowData', id);
						//console.dir(ret)
						
						jQuery("#list2").jqGrid(
								'setGridParam',
								{
									url : 'getItemInOutListData?itemCode=' + ret.itemCode,
									datatype : 'json'
								});
						//console.dir(ret.itemCode)
						
						jQuery("#list2").jqGrid(
								'setCaption',
								'품목코드::' + ret.itemCode + " (" + ret.itemName + ")");
						
						jQuery("#list2").trigger("reloadGrid");
						$("#myModal").modal();

					} else {
						alert("Please select row");
					}
				});

		//입출력 이력 그리드.
		$("#list2").jqGrid({
			url : 'getItemInOutListData',
			mtype : "GET",
			datatype : "json",
			page : 1,
			styleUI : "Bootstrap",
			autoheight : true,

			colModel : [ {
				label : '구매/판매일',
				name : 'dealDate',
				key : true,
				width : 5
			}, {
				label : '구매/판매번호',
				name : 'dealerCode',
				width : 4
			}, {
				label : '입고수량',
				name : 'inQty',
				width : 3,
				align : "right"
			}, {
				label : '출고수량',
				name : 'outQty',
				width : 3,
				align : "right"
			}, {
				label : '입/출고일',
				name : 'txnDate',
				width : 5
			} ],
			width : 780,
			rowNum : 17,
			rownumbers : true,
			height : 'auto',
			loadonce : true,
			viewrecords : true,
			caption : '품목코드::',
			pager : "#pager2"
		});
		
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
		vend_cd = jQuery("#warehouseSelect").val();
		grp_cd1 = jQuery("#itemgroup1").val();
		grp_cd2 = jQuery("#itemgroup2").val();
		grp_cd3 = jQuery("#itemgroup3").val();
		groups = grp_cd1 + grp_cd2 + grp_cd3;
		console.log(cd_mask + "============" + flag);
		jQuery("#list").jqGrid(
				'setGridParam',
				{
					url : "getStockOnhandListData?itemName=" + nm_mask
							+ "&itemCode=" + cd_mask + "&vendorCode=" + vend_cd
							+ "&group1=" + grp_cd1 + "&group2=" + grp_cd2
							+ "&group3=" + grp_cd3 + "&zeroFlag=" + flag,
					datatype : "json",
					page : 1
				}).trigger("reloadGrid");
	}
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled", state);
	}

	function changeGroup1() {
		var grp1 = jQuery("#itemgroup1").val();
		console.log("grp1 =========" + grp1);
		$.ajax({
			url : "getItemGroup2.do?grp_code=" + grp1,
			datatype : "json",
			method : "POST",
			success : function(datas) {
				$("#itemgroup2 option:gt(0)").remove();
				for (i = 0; i < datas.length; i++) {
					console.log(i + "=====" + datas[i].grp_code + ", " + datas[i].grp_name);
					$("#itemgroup2").append(
							"<option value='"+datas[i].grp_code+"'>" + datas[i].grp_name);
				}
			}
		}) // $.ajax
	}

	function changeGroup2() {
		var grp2 = jQuery("#itemgroup2").val();
		console.log("grp2 =========" + grp2);
		$.ajax({
			url : "getItemGroup3.do?grp_code=" + grp2,
			datatype : "json",
			method : "POST",
			success : function(datas) {
				$("#itemgroup3 option:gt(0)").remove();
				for (i = 0; i < datas.length; i++) {
					$("#itemgroup3").append("<option value='"+datas[i].grp_code+"'>" + datas[i].grp_name);
				}
			}
		}) // $.ajax
	}
	


	function zeroStock(zeroflag) {
		console.log(zeroflag + "8888888888888888888");

		if (zeroflag)
			flag = 'Y'
		else
			flag = 'N';

		jQuery("#list").jqGrid(
				'setGridParam',
				{
					url : "getStockOnhandListData?itemName=" + nm_mask
							+ "&itemCode=" + cd_mask + "&vendorCode=" + vend_cd
							+ "&group1=" + grp_cd1 + "&group2=" + grp_cd2
							+ "&group3=" + grp_cd3 + "&zeroFlag=" + flag,
					datatype : "json",
					page : 1
				}).trigger("reloadGrid");
	}

	title_nav = "[ getStockOnhandList.jsp >>> 품목별 재고 조회 ]";
</script>
</head>
<body>
	<div class="col-lg-10">
		<div class="panel panel-default">
			<div class="panel-heading">재고조회</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-2">
						<input type="checkbox" id="autosearch"
							onclick="enableAutosubmit(this.checked)">
						자동검색기능 ON
					</div>
				</div>
				<!-- 조회조건의 첫번째 열 -->
				<div class="row" style="margin-top: 10px">
					<div class="col-lg-2">
						<select id="itemgroup1" name="itemgroup1" class="form-control"
							onchange="changeGroup1()">
							<option value="">대분류 선택</option>
							<c:forEach items="${itemGroup1}" var="lkup">
								<option value="${lkup.grp_code}">${lkup.grp_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-lg-2">
						<select id="itemgroup2" name="itemgroup2" class="form-control"
							onchange="changeGroup2()">
							<option value="">중분류 선택</option>
							<c:forEach items="${itemGroup2}" var="lkup">
								<option value="${lkup.grp_code}">${lkup.grp_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-lg-2">
						<select id="itemgroup3" name="itemgroup3" class="form-control">
							<option value="">소분류 선택</option>
							<c:forEach items="${itemGroup3}" var="lkup">
								<option value="${lkup.grp_code}">${lkup.grp_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-lg-2 checkbox">
						<label><input type="checkbox" name="zeroflag" id="zeroflag" 
						onclick="zeroStock(this.checked)">재고 : 0  조회</label>
					</div>
				</div>
				<!-- 조회조건의 두번째 열 -->
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
						<select id="warehouseSelect" name="warehouseSelect"
							class="form-control">
							<option value="">구매업체 선택</option>
							<c:forEach items="${vendorList}" var="lkup">
								<option value="${lkup.VENDOR_CODE}">${lkup.VENDOR_NAME}</option>
							</c:forEach>
						</select>
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
	<br>
	<div class="col-lg-12">
		<table id="list">
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="pager"></div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">입출고 이력</h4>
				</div>
				<div class="modal-body">
					<table id="list2">
						<tr>
							<td></td>
						</tr>
					</table>
					<div id="pager2"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>