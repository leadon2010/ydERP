<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					url : "getLookups.do",
					datatype : "json",
					styleUI : "Bootstrap",
					height : 380,
					autoheight : true,
					autowidth : true,

					colNames : [ "룩업", "룩업코드", "코드값", "코드Value", "코드설명", "사용여부", "하부룩업", "대표코드"],
					colModel : [ 
						{name : "LOOKUP_DESCRIPTION",width : 3},
						{name : "LOOKUP",width : 5},
						{name : "LOOKUP_CODE",width : 2}, 
						{name : "LOOKUP_VALUES",width : 2,align : "right"}, 
						{name : "DESCRIPTIONS",width: 2,align : "right"}, 
						{name : "FLAG",width : 2,align : "right"},
						{name : "DFF",width : 2,align : "right"}, 
						{name : "REFLAG",width : 2,align : "right"},
						],
					pager : "#pager",
					rowNum : 10,
					rowList : [ 10, 20, 30 ],
					sortname : "LOOKUP",
					sortorder : "asc",
					viewrecords : true,
					gridview : true,
					autoencode : true,
					loadonce : true,
					caption : "룩업코드"
				});
		jQuery("#list").jqGrid('navGrid', '#pager', {});
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
		var vend_cd = jQuery("#warehouseSelect").val();
		console.log(cd_mask + "============" + nm_mask);
		jQuery("#list").jqGrid(
				'setGridParam',
				{
					url : "getLookups.do?itemName=" + nm_mask + "&itemCode=" + cd_mask + "&vendorCode=" + vend_cd,
					datatype : "json",
					page : 1
				}).trigger("reloadGrid");
	}
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled", state);
	}
	title_nav = "[ getLookups.jsp ::: 룩업 관리 ]";
</script>
</head>
<body>
	<div class="col-lg-6">
		<div class="panel panel-default">
			<div class="panel-heading">Search Condition</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<input type="checkbox" id="autosearch"
							onclick="enableAutosubmit(this.checked)"> Enable Autosearch
					</div>
				</div>
				<div class="row" style="margin-top: 10px">
					<div class="col-lg-3">
						<input type="text" id="item_cd" class="form-control"
							placeholder="==> Enter ItemCode"
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<div class="col-lg-3">
						<button onclick="gridReload()" id="submitButton"
							class="btn btn-outline btn-success btn-block">Search</button>
					</div>
				</div>
				<div class="row" style="margin-top: 10px">
					<div class="col-lg-3">
						<input type="text" id="item_nm" class="form-control"
							placeholder="==> Enter ItemName"
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<div class="col-lg-3">
						<select id="warehouseSelect" name="searchWarehouse"
							class="form-control">
							<option value="">구매업체 선택</option>
							<c:forEach items="${vendorList}" var="lkup">
								<option value="${lkup.VENDOR_CODE}">${lkup.VENDOR_NAME}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<br>
				
			</div>
		</div>
	</div>
	<!-- col-lg-6 -->
	<br>
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