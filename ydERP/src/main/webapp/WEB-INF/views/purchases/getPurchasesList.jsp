<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>구매전체조회</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />

<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>

<script type="text/javascript">

	$(document).ready(function() {

		// master grid

		$("#list").jqGrid({
			url : "getPurchasesList",
			datatype : "json",
			mtype : "GET",
			styleUI : "Bootstrap",
			hidegrid: false,
			autowidth : true,
			colModel : [
				{
					label : "구매코드",
					name : "purchaseCode",
					width : 110
				},
				{
					label : "구매일자",
					name : "purchaseDate",
					width : 85
				},
				{
					label : "구매처",
					name : "vendorCode",
					width : 80,
					align : "right"
					
				},
				{
					label : "구매처명",
					name : "vendorName",
					width : 100,
					align : "right"
				},
				{
					label : "총합",
					name : "total",
					width : 100,
					align : "right"
				},
				{
					label : "총갯수",
					name : "itemCount",
					width : 100,
					align : "right"
				}
			],
			pager : "#pager",
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			sortname : "purchaseCode",
			sortorder : "desc",
			loadonce : true,
			viewrecords : true,			
			gridview : true,
			autoencode : true,
			rownumbers : true,
			//caption : "구매정보",
			onSelectRow : function(rowid, selected) {
				if (rowid != null) {
					var selectedPurchaseCode = $(this).getCell(rowid, 'purchaseCode');
					jQuery("#list1").jqGrid('setGridParam', {
						url : "getPurchaseDetailList?purchaseCode=" + selectedPurchaseCode,
						datatype : 'json'
					}); // the last setting is for demo only
					jQuery("#list1").jqGrid('setCaption', '구매코드 : ' + selectedPurchaseCode);
					jQuery("#list1").trigger("reloadGrid");
				}
				console.log("선택된 구매코드 : " + selectedPurchaseCode);
			}
		
		// use the onSelectRow that is triggered on row click to show a details grid							
		});


		$("#list1").jqGrid({
			datatype : "json",
			styleUI : "Bootstrap",
			hidegrid: false,
			autowidth : true,
			colModel : [

				{
					label : "구매상세코드",
					name : "purchaseDetailCode",
					width : 110,
					editable : true
				},
				{
					label : "구매코드",
					name : "purchaseCode",
					width : 110,
					editable : true
				},
				{
					label : "품목코드",
					name : "purchaseItem",
					width : 85,
					editable : true
				},
				{
					label : "품목명",
					name : "itemName",
					width : 200,
					editable : true
				},
				{
					label : "품목수량",
					name : "purchaseQty",
					width : 80,
					align : "right",
					editable : true
				},
				{
					label : "품목단가",
					name : "purchasePrice",
					width : 80,
					align : "right",
					editable : true
				},

				{
					label : "부가세",
					name : "itemTax",
					width : 80,
					align : "center",
					editable : true
				},
 
			 	{
					label : "입고여부",
					name : "incomingFlag",
					width : 80,					
					editable: true,        
				    sortable: false,  
				    align: "center", 
				    formatter: "checkbox", 
				    editoptions :{value:'Y:N', defaultValue:'N'},
				    formatoptions: {disabled: false}					  
				    
				} 

			],
			pager : "#pager1",
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			sortname : "purchaseDatailCode",
			sortorder : "desc",			
			viewrecords : true,
			gridview : true,			
			autoencode : true,
			editurl : "getPurchaseDetailList",
			caption : "구매상세정보",			
	
/* 			onCellSelect : function(rowid, iCol) {
	
		
				if (rowid != null) {			 
					if (iCol == 6) {	
						var incoming = $("#list1").jqGrid("getCell", rowid, "incomingFlag"); // 체크했으면 수정
						console.log(incoming);
					}
				}
			}, */
			 loadComplete: function () {
                 var iCol = getColumnIndexByName($(this), 'incomingFlag'), rows = this.rows, i, c = rows.length;
                 for (i = 0; i < c; i += 1) {
                     $(rows[i].cells[iCol]).click(function (e) {
                         var id = $(e.target).closest('tr')[0].id, isChecked = $(e.target).is(':checked');
                         //alert("checked:" + isChecked);
                         //you can also get the values of the row data
                        // alert('clicked on the checkbox in the row with id=' + id + '\nNow the checkbox is ' + (isChecked ? 'checked' : 'not checked'));
                         var purchaseDetailCode = $(e.target).closest('tr').find("td:first").attr("title");
                         if(isChecked == true ) {
                        	 isChecked = "Y"
	                     } else { 
	                    	 isChecked = "N"    
	                     }
                        /*  alert(purchaseDetailCode) //ajax $컨트롤러 입력. */
                         jQuery.ajax({type:"POST", 
                        	   data:{'purchaseDetailCode':purchaseDetailCode, incomingFlag:isChecked},
                        	   url:"updatePurchases", 
                        	   contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
                        	   cache: false, 
                        	   success:function(data) { 
                        	    
                        	     }
                        	  });
                     });
                 }
             }
		
		}).navGrid("#pager1", {
			 excel:true,
			 edit:false,
			 add:false,
			 del:false,
			 refresh:false,
			 search:false  		
  		}).navButtonAdd("#pager1", {
  		
  			caption:"Excel DownLoad",
     	    onClickButton: function(e){ 
     	   	jQuery("#list1").jqGrid('excelExport', 
     	   			{url:'PurchaseView'});	
     	    }});

		function clearSelection() {
			jQuery("#list1").jqGrid('setGridParam', {
				url : "getPurchaseDetailList",
				datatype : 'json'
			}); // the last setting is for demo purpose only
			jQuery("#list1").jqGrid('setCaption', "purchaseDatailCode");
			jQuery("#list1").trigger("reloadGrid");
		}		
		getColumnIndexByName = function (grid, columnName) {
            var cm = grid.jqGrid('getGridParam', 'colModel'), i, l;
            for (i = 0, l = cm.length; i < l; i += 1) {
                if (cm[i].name === columnName) {
                    return i; // return the index
                }
            }
            return -1;
        }
	});
	
	var timeoutHnd;
	var flAuto = true; 
	
	function doSearch(ev) {
		if (!flAuto)
			return;
		//		var elem = ev.target||ev.srcElement;
		if (timeoutHnd)
			clearTimeout(timeoutHnd)
		timeoutHnd = setTimeout(gridReload, 500)
	}
	
	 function gridReload() {
		var cd_mask = jQuery("#vendorName").val();			
		console.log(cd_mask);
		jQuery("#list").jqGrid(
				'setGridParam',
				{
					url : "getPurchasesList?" + "&vendorName=" + cd_mask,
					datatype : "json",
					page : 1
				}).trigger("reloadGrid");
	}
	function enableAutosubmit(state) {
		flAuto = state;
		jQuery("#submitButton").attr("disabled", state);
	}	
	title_nav = "[ 구매 정보 조회 : getPurchasesList.jsp >>> 구매 정보 조회 및 확인  ]";
</script>

</head>
<body> 
	<div class="col-lg-4">
		<div class="panel panel-default">
			<div class="panel-heading">구매 조회</div>
			<div class="container">
				<div class="row" style="margin-top: 10px">
					<div class="col-lg-2">
						<input type="text" id="vendorName" class="form-control"
							placeholder="구매처명"
							onkeydown="doSearch(arguments[0]||event)" />
					</div>
					<!-- <div class="col-lg-2">
						<input type="text" id="item_nm" class="form-control"
							placeholder="ItemName ..."
							onkeydown="doSearch(arguments[0]||event)" />
					</div> -->
					<div class="col-lg-1">
						<button onclick="gridReload()" id="submitButton"
							class="btn btn-outline btn-success btn-block">Search</button>
					</div><br>
				</div><br>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-8">
			<table id="list">
				<tr>
					<td></td>
				</tr>
			</table>
			<div id="pager"></div>
		</div>
	</div>
	<br>
	<h3>구매상세정보</h3>
	<div class="row">
		<div class="col-lg-8">
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