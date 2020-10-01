<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<!-- 구글 차트 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="./scripts/json.min.js"></script>

<!--  <script>
	if ('${sessionScope.viewCustomer.customerName}' == '') {
		location.href = 'login';
	}

	function logoutcheck() {
		location.href = 'logout';
	}
</script> -->

<link rel='stylesheet' type='text/css'
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css" />

<link rel='stylesheet' type='text/css'
	href="${pageContext.request.contextPath}/resources/fullcalendar/scheduler.min.css" />
<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>
<script type='text/javascript'
	src="${pageContext.request.contextPath}/resources/fullcalendar/ko.js"></script>

<script>
	$(document).ready(function() {

		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

		$('#calendar').fullCalendar({
			editable : true,
			lang : "ko",
			events : [{
		          title: '이창호',
		          start: '2018-04-02',
		          end: '2018-04-07',
		          color: 'black'
		        },
		        {
		        	 title: '이창호',
			         start: '2018-04-09',
			         end: '2018-04-14',
			         color: 'black'
		        },
		        {
		        	 title: '이창호',
			         start: '2018-04-16',
			         end: '2018-04-21',
			         color: 'black'
		        },
		        {
		        	 title: '이창호',
			         start: '2018-04-23',
			         end: '2018-04-28',
			         color: 'black'
		        },
		        {
		        	 title: '이창호',
			         start: '2018-04-30',
			         end: '2018-05-05',
			         color: 'black'
		        },
		        {
		        	 title: '김일희',
			         start: '2018-04-03',
			         end: '2018-04-08',
			         color: 'green'
		        },		      
		        {
		        	 title: '김일희',
			         start: '2018-04-10',
			         end: '2018-04-15',
			         color: 'green'
		        },
		        {
		        	 title: '김일희',
			         start: '2018-04-17',
			         end: '2018-04-22',
			         color: 'green'
		        },
		        {
		        	 title: '김일희',
			         start: '2018-04-24',
			         end: '2018-04-29',
			         color: 'green'
		        },		       
		        {
		        	 title: '이재완',
			         start: '2018-04-02',
			         end: '2018-04-06',
			         color: 'grey'
		        },
		        {
		        	 title: '이재완',
			         start: '2018-04-08',
			         color: 'grey'
		        },
		        {
		        	 title: '이재완',
			         start: '2018-04-09',
			         end: '2018-04-13',
			         color: 'grey'
		        },
		        {
		        	 title: '이재완',
			         start: '2018-04-15',
			         color: 'grey'
		        },
		        {
		        	 title: '이재완',
			         start: '2018-04-16',
			         end: '2018-04-20',
			         color: 'grey'
		        },
		        {
		        	 title: '이재완',
			         start: '2018-04-22',
			         color: 'grey'
		        },
		        {
		        	 title: '이재완',
			         start: '2018-04-23',
			         end: '2018-04-27',
			         color: 'grey'
		        },
		        {
		        	 title: '이재완',
			         start: '2018-04-29',
			         color: 'grey'
		        },
		        {
		        	 title: '이명철',
			         start: '2018-04-02'			       
		        },
		        {
		        	 title: '이명철',
			         start: '2018-04-05',
			       	 end: '2018-04-09'
		        },
		        {
		        	 title: '이명철',
			         start: '2018-04-09'			       
		        },
		        {
		        	 title: '이명철',
			         start: '2018-04-12',
			       	 end: '2018-04-16'
		        },
		        {
		        	 title: '이명철',
			         start: '2018-04-16'			       
		        },
		        {
		        	 title: '이명철',
			         start: '2018-04-19',
			       	 end: '2018-04-23'
		        },
		        {
		        	 title: '이명철',
			         start: '2018-04-23'			       
		        },
		        {
		        	 title: '이명철',
			         start: '2018-04-26',
			       	 end: '2018-04-30'
		        }
		        
			]
		});

	});
</script>
<script>
	$(function() {
		var j;

		$.ajax({
			url : "./getTitle1.do",
			//data : params,
			//async : false,
			dataType : "json",
			success : function(datas) {
				for (i = 0; i < datas.length; i++) {
					j = i + 1;
					$("#vcnt_" + j + "").text(datas[i].cnt);
					$("#vtitle_" + j + "").text(datas[i].title);
					$("#vdetail_" + j + "").text(datas[i].detailView);
				}
			}
		});
	});
</script>

	<!-- 차트 생성 스크립트 -->
	<script>
		google.charts.load("current", {packages:['corechart']});		// 구글 차트 로드
	
		/* 메인 버블 차트 생성 함수 콜백 */
		google.charts.setOnLoadCallback(drawBubbleChart);
		
		/* 메인 버블 차트 그리기 */
		function drawBubbleChart() {
			
			/* AJAX 타입으로 차트 데이터 설정 및 그래프 옵션을 설정한다. */
			$.ajax({
				url : "./getBubbleChart.do",							// 차트 데이터를 형성하기 위한 메서드 요청 URL이다.
				method : "POST",
				type : "json",
				success : function(datas) {
					var bubbleChartData = [];
					bubbleChartData.push(["품목명", "판매가", "판매량", "품목분류", "재고량"]);
					
						for(i = 0; i < datas.length; i++) {
							bubbleChartData.push([datas[i].itemName
												, datas[i].itemPrice
												, datas[i].saleQty
												, datas[i].itemCategory
												, datas[i].itemQty]);
						};
						
						/* 그래프 옵션 */
						var bubbleChartOptions = {
							title: '한달 간의 판매 실적과 재고 그래프',
					        hAxis: {title: '판매가'},
					        vAxis: {title: '판매량'},
					        bubble: {textStyle: {fontSize: 15}},
					        width: "1100",
					        height: "1000",
					        legend: {position: "bottom" }
						}
						
						console.log(bubbleChartData);
						
						// 차트를 그릴 위치의 태그 ID를 받아온다.
						var bubbleChart = new google.visualization.BubbleChart(document.getElementById('bubbleChartDiv'));
						
						// 차트를 그린다.
					    bubbleChart.draw(google.visualization.arrayToDataTable(bubbleChartData), bubbleChartOptions);
						
						 // 반응형 차트 그리기
						window.addEventListener	(
							'resize',
							function() {
								bubbleChart.draw(google.visualization.arrayToDataTable(bubbleChartData), bubbleChartOptions);
							},
							false
						);
					}
					
				})
		}
	</script>

</head>
<body>

	<div class="row">
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-barcode fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge" id="vcnt_1">26</div>
							<div id="vtitle_1">New Customer</div>
						</div>
					</div>
				</div>
				<a href="getSalesRequesting">
					<div class="panel-footer">
						<span class="pull-left" id="vdetail_1">View Detail</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-green">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-check fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge" id="vcnt_2">12</div>
							<div id="vtitle_2">New Tasks!</div>
						</div>
					</div>
				</div>
				<a href="getPurchaseRequesting">
					<div class="panel-footer">
						<span class="pull-left" id="vdetail_2">View Details2</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-yellow">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-shopping-cart fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge" id="vcnt_3">124</div>
							<div id="vtitle_3">New Orders!</div>
						</div>
					</div>
				</div>
				<a href="getPurchaseReceipting">
					<div class="panel-footer">
						<span class="pull-left" id="vdetail_3">View Details3</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-red">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-check-square-o fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge" id="vcnt_4">13</div>
							<div id="vtitle_4">Support Tickets!</div>
						</div>
					</div>
				</div>
				<a href="getOrderList">
					<div class="panel-footer">
						<span class="pull-left" id="vdetail_4">View Details4</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
	</div>
		<div id='calendar' class="col-lg-12"></div>
	
		<!-- 차트 화면 부분 -->
		<div id="bubbleChartDiv" class="col-lg-12"></div>
</body>
</html>
