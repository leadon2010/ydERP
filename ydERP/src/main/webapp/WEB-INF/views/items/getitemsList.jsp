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
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css" />
<script
	src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
<script>
	//대분류, 중분류 선택에 따라서, 하위 분류 목록이 달라지도록 설정된 함수 2개 + 구매업체 이름을 DB에서 가져와서 등록할시 구매코드로 등록하게 하는 함수 1개

	/* function firstChange() {

		var x = document.FormPost.pGroup1.selectedIndex;
		var groups = document.FormPost.pGroup1.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++) {
			group[i] = new Array();
		}
		group[0][0] = new Option("대분류", "");
		group[1][0] = new Option("중분류 선택", "");
		group[1][1] = new Option("볼펜", "B");
		group[1][2] = new Option("형광펜", "C");
		group[1][3] = new Option("샤프", "S");
		group[1][4] = new Option("연필", "P");
		group[2][0] = new Option("중분류 선택", "");
		group[2][1] = new Option("복사용지", "A");
		group[2][2] = new Option("노트", "N");
		group[3][0] = new Option("중분류 선택", "");
		group[3][1] = new Option("수정용품", "E");
		group[3][2] = new Option("칼/가위", "K");
		group[3][3] = new Option("용지", "J");
		group[3][4] = new Option("견출지", "G");
		group[4][0] = new Option("중분류 선택", "");
		group[4][1] = new Option("화일", "F");
		group[4][2] = new Option("바인더", "V");

		temp = document.FormPost.pGroup2;
		for (m = temp.options.length - 1; m > 0; m--) {
			temp.options[m] = null
		}
		for (i = 0; i < group[x].length; i++) {

			temp.options[i] = new Option(group[x][i].text, group[x][i].value);
		}
		temp.options[0].selected = true
	}

	function secondChange() {

		var first = document.FormPost.pGroup1.selectedIndex;
		var x = document.FormPost.pGroup2.options.selectedIndex;
		var groups = document.FormPost.pGroup2.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++) {
			group[i] = new Array();
		}
		if (first == 1) {
			group[0][0] = new Option("소분류", "");

			group[1][0] = new Option("소분류 선택", "");
			group[1][1] = new Option("유성볼펜", "O");
			group[1][2] = new Option("수성펜", "W");
			group[1][3] = new Option("중성펜", "N");

			group[2][0] = new Option("소분류 선택", "");
			group[2][1] = new Option("형광펜", "C");
			group[2][2] = new Option("붓펜", "B");

			group[3][0] = new Option("소분류 선택", "");
			group[3][1] = new Option("일반 샤프", "R");
			group[3][2] = new Option("샤프심", "S");
			group[4][0] = new Option("소분류 선택", "");
			group[4][1] = new Option("연필", "P");
			group[4][2] = new Option("연필깎이", "G");
			group[4][3] = new Option("색연필", "S");

		} else if (first == 2) {
			group[0][0] = new Option("소분류", "");

			group[1][0] = new Option("소분류 선택", "");
			group[1][1] = new Option("A4", "A");
			group[1][2] = new Option("A3", "B");
			group[1][3] = new Option("B4", "C");
			group[1][4] = new Option("B5", "D");

			group[2][0] = new Option("소분류 선택", "");
			group[2][1] = new Option("재생용지", "P");
			group[2][2] = new Option("일반노트", "R");
			group[2][1] = new Option("수첩", "H");
			group[2][2] = new Option("중고노트", "U");

		} else if (first == 3) {
			group[1][0] = new Option("소분류 선택", "");
			group[1][1] = new Option("수정테이프", "T");
			group[1][2] = new Option("지우개", "E");

			group[2][0] = new Option("소분류 선택", "");
			group[2][1] = new Option("소형커터", "S");
			group[2][2] = new Option("대형커터", "L");
			group[2][1] = new Option("커터날", "N");

			group[3][0] = new Option("소분류 선택", "");
			group[3][1] = new Option("일반포스트잇", "P");
			group[3][2] = new Option("메모지", "M");

			group[4][0] = new Option("소분류 선택", "");
			group[4][1] = new Option("일반견출지", "R");
			group[4][2] = new Option("보호비닐견출지", "B");
			group[4][3] = new Option("원형/모양견출지", "S");

		} else if (first == 4) {
			group[1][0] = new Option("소분류 선택", "");
			group[1][1] = new Option("일반 화일", "R");
			group[1][2] = new Option("종이 화일", "P");

			group[2][0] = new Option("소분류 선택", "");
			group[2][1] = new Option("장식 화일", "S");
			group[2][2] = new Option("D링 바인더", "D");
			group[2][1] = new Option("아치 바인더", "A");

		}

		temp = document.FormPost.pGroup3;
		for (m = temp.options.length - 1; m > 0; m--) {
			temp.options[m] = null
		}
		for (i = 0; i < group[x].length; i++) {
			temp.options[i] = new Option(group[x][i].text, group[x][i].value)
		}
		temp.options[0].selected = true
	}

	function selectVendor() {

	} */
	title_nav = "[ getitemsList.jsp ::: 품목기초정보 관리화면(입력/수정/삭제 처리) ]";
</script>
<!-- jqGrid -->
<script type="text/javascript">
	var lastsel3;
	var vendorData = ":선택";
	var params;
	var vgrp2 = ":선택";
	var vgrp3 = ":선택";
	var vwhere2;
	var vwhere3;

	$(function() {

		$(document.body).on("change", "#pGroup1", firstChange1);
		$(document.body).on("change", "#pGroup2", secondChange1);
		//$(document.body).on("selectVendor", "#vendorCode", selectVendor);

	});

	//업체리스트.
	$(function() {
		$.ajax({
			url : "./getVendorList2.do",
			data : params,
			async : false,
			dataType : "json",
			success : function(datas) {
				for (i = 0; i < datas.length; i++) {
					vendorData += ";" + datas[i].vendorCode + ":" + datas[i].vendorName;
				}
			}
		});
	});

	//중분류리스트.
	function firstChange1() {
		vwhere2 = $("#pGroup1").val();
		console.dir(vwhere2+"=========vwhere2")
		$.ajax({
			url : "./getItemGroups2.do?lookupCode="+vwhere2,
			data : params,
			async : false,
			dataType : "json",
			success : function(datas) {
				$("#pGroup2 option:gt(0)").remove();
				for (i = 0; i < datas.length; i++) {
					$("#pGroup2").append("<option value='"+datas[i].lookupCode+"'>"+datas[i].lookupValues+"</option>")
					//vgrp2 += ";" + datas[i].lookupCode + ":" + datas[i].lookupValues;
					console.dir(vgrp2);
				}
			}
		});
	};

	//소분류리스트.
	function secondChange1() {
		vwhere3 = $("#pGroup2").val();
		console.dir(vwhere3+"=========vwhere3")
		$.ajax({
			url : "./getItemGroups3.do?lookupCode="+vwhere3,
			data : params,
			async : false,
			dataType : "json",
			success : function(datas) {
				$("#pGroup3 option:gt(0)").remove();
				for (i = 0; i < datas.length; i++) {
					$("#pGroup3").append("<option value='"+datas[i].lookupCode+"'>"+datas[i].lookupValues+"</option>")
					//vgrp3 += ";" + datas[i].lookupCode + ":" + datas[i].lookupValues;
					console.dir(vgrp3);
				}
			}
		});
	};

	$(function() {

		$("#list").jqGrid({
			url : "getItemsList.do",
			editurl : "getItemsDataEdit",
			datatype : "json",
			styleUI : 'Bootstrap',
			colModel : [ {
				label : "품목코드",
				name : "itemCode",
				key : true,
				width : 90,
				editable : false
			}, {
				label : "품목 대분류",
				name : "pGroup1",
				width : 300,
				editrules : {
					required : false,
					edithidden : true
				},
				hidden : true,
				editable : true,
				edittype : "select",
				editoptions : {
					value : ":선택;P:필기구(P);A:용지류(A);O:사무용품(O);F:파일/바인더(F)"
				}
			}, {
				label : "품목 중분류",
				name : "pGroup2",
				width : 300,
				editrules : {
					required : false,
					edithidden : true
				},
				hidden : true,
				editable : true,
				edittype : "select",
				editoptions : {
					value : vgrp2
				}
			}, {
				label : "품목 소분류",
				name : "pGroup3",
				width : 300,
				editrules : {
					required : false,
					edithidden : true
				},
				hidden : true,
				editable : true,
				edittype : "select",
				editoptions : {
					value : vgrp3
				}
			}, {
				label : "품목 이름",
				name : "itemName",
				width : 250,
				editable : true
			}, {
				label : "UOM",
				name : "uom",
				width : 55,
				align : "center",
				editable : true
			}, {
				label : "수량",
				name : "inQty",
				width : 40,
				align : "right",
				editable : true

			}, {
				label : "최소 수량",
				name : "minQty",
				editrules : {
					required : false,
					edithidden : true
				},
				hidden : false,
				width : 60,
				align : "right",
				editable : true

			}, {
				label : "공급가",
				name : "supplyPrice",
				width : 90,
				align : "right",
				editable : true
			}, {
				label : "판매가",
				name : "sellingPrice",
				width : 90,
				align : "right",
				editable : true
			}, {
				label : "부가세",
				name : "itemTax",
				width : 55,
				align : "right",
				editable : true
			}, {
				label : "사용연한",
				name : "expireDate",
				width : 75,
				align : "right",
				editable : true
			}, {
				label : "구매 업체코드",
				name : "vendorCode",
				width : 90,
				hidden : true,
				align : "right",
				edittype : "select",
				editoptions : {
					value : vendorData
				},
				editable : true
			}, {
				label : "구매 업체명",
				name : "vendorName",
				width : 90,
				align : "right",
				edittype : "select",
				editoptions : {
					value : vendorData
				},
				editable : true
			}, {
				label : "품목 등록 일자",
				name : "addDate",
				width : 90,
				editable : false,
				formatter : 'date',
				formatoptions : {
					srcformat : 'U/1000',
					newformat : "Y/m/d"
				},
				editoptions : {
					srcformat : 'U/1000',
					newformat : "Y/m/d"
				}
			} ],
			pager : "#pager",
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			rownumbers : true,
			sortname : "addDate",
			sortorder : "desc",
			viewrecords : true,
			gridview : true,
			autoencode : true,
			loadonce : true,
			rowNum : 15,
			height : 'auto',
			autowidth : true,
			responsive : true,
			pager : "#pager"
		});

		$('#list').jqGrid('navGrid', "#pager", {
			search : true, // show search button on the toolbar
			edit : false,
			add : true,
			del : false,
			cancel : true,
			refresh : true,

		}, {}, {
			closeAfterAdd : true,
			reloadAfterSubmit : true,
			template : $("#form1").html(),
			afterComplete : function() {
				$("#list").setGridParam({
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');
			}
		}, {
			serializeDelData : function(postdata) {
				return "op.del&itemCode=" + postdata.id
			}
		});

		$('#list').inlineNav('#pager', {
			edit : true,
			add : false

		});

	});
</script>
</head>

<body>

	<div class="col-md-24">
		<div class="panel-heading">
			<h1>품목 리스트</h1>
			<div class="col-md-24"></div>
		</div>
	</div>

	<table id="list">
		<tr>
			<td></td>
		</tr>
	</table>
	<div id="pager"></div>
	<br>

</body>
</html>