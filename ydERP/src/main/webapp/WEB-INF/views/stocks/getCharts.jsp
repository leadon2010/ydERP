<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>Welcome!!! YedamERP</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid5/ui.jqgrid-bootstrap.css" />
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/grid.locale-kr.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/jqgrid5/jquery.jqGrid.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="./scripts/json.min.js"></script>

<script type="text/javascript">
	google.charts.load("current", {
		packages : [ 'corechart' ]
	});
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});

	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		//PieChart:판매량
		$.ajax({
			url : "./getMostSoldItem.do",
			method : "POST",
			type : "json",
			success : function(datas) {
				var data1 = [];
				data1.push([ "품목명", "판매량" ]);
				for (i = 0; i < datas.length; i++) {
					data1.push([ datas[i].ITEM_NAME,
							parseInt(datas[i].QUANTITY) ]);
				};
				var options1 = {
					title : '[판매] Best Top 5'
				};

				var chart1 = new google.visualization.PieChart(document.getElementById('piechart'));
				chart1.draw(google.visualization.arrayToDataTable(data1), options1);
			}
		});

		//PieChart:구매량
		$.ajax({
			url : "./getMostBuyItem.do",
			method : "POST",
			type : "json",
			success : function(datas) {
				var data4 = [];
				data4.push([ "품목명", "판매량" ]);
				for (i = 0; i < datas.length; i++) {
					data4.push([ datas[i].ITEM_NAME,
							parseInt(datas[i].QUANTITY) ]);
				};
				var options4 = {
					title : '[구매] Best Top 5'
				};

				var chart4 = new google.visualization.PieChart(document.getElementById('piechart2'));
				chart4.draw(google.visualization.arrayToDataTable(data4), options4);
			}
		});

		//Line Chart
		$.ajax({
			url : "./getInOutQtyChart.do",
			method : "POST",
			type : "json",
			success : function(datas) {
				var data3 = [];
				data3.push([ "일별", "ReceiptQty", "IssueQty" ]);
				for (i = 0; i < datas.length; i++) {
					data3.push([ datas[i].IN_OUT_DAY, (datas[i].IN_QTY), (datas[i].OUT_QTY) ]);
				};
				var options3 = {
					title : '[재고] 일별 입/출고 변화',
					curveType : 'function',
					legend : {
						position : 'bottom'
					}
				};

				var chart3 = new google.visualization.LineChart(document.getElementById('curve_chart'));
				chart3.draw(google.visualization.arrayToDataTable(data3), options3);
			}
		});

		$.ajax({
			url : "./getInOutAmtChart.do",
			method : "POST",
			type : "json",
			success : function(datas) {
				var data2 = [];
				data2.push([ "Daily", "구매", "판매", "이익" ]);
				for (i = 0; i < datas.length; i++) {
					data2.push([ datas[i].IN_OUT_DAY, (datas[i].PURCHASE_AMT), (datas[i].SALE_AMT), (datas[i].VAR_AMT) ]);
				}
				;
				var options2 = {
					chart : {
						title : 'Company Performance',
						subtitle : 'Sales, Expenses, and Profit ' + '2017',
					}
				};

				var chart2 = new google.charts.Bar(document.getElementById('columnchart_material'));
				chart2.draw(google.visualization.arrayToDataTable(data2), options2);
			}
		});
	}
	title_nav = "[ getCharts.jsp ::: Chart 확인 ]";
</script>
</head>
<body>
	<div class="col-lg-12">
		<div class="panel panel-default col-lg-12">
			<!-- <div class="panel-heading col-lg-12">[  ]</div> -->
			<div class="container col-lg-12">
					<div class="col-lg-6" id="columnchart_material" style="height: 400px;"></div>
					<div class="col-lg-6" id="curve_chart" style="height: 400px;"></div>
					<div class="col-lg-6" id="piechart" style="height: 400px;"></div>
					<div class="col-lg-6" id="piechart2" style="height: 400px;"></div>
			</div>
		</div>
	</div>
</body>
</html>