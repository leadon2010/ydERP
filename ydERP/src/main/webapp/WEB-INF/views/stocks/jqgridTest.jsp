<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	$(function (){
		jQuery("#list1").jqGrid({
			url : "getStockInOutListData",
			datatype : "json",
			styleUI : "Bootstrap",
		   	colNames:['stockId','itemCode', 'dealDate', 'dealerCode','inQtyt','outQty','tnxDate'],
		   	colModel:[
		   		{name:'stockId', width:75},
		   		{name:'itemCode',  width:90},
		   		{name:'dealDate',  width:100},
		   		{name:'dealerCode',  width:80, align:"right"},
		   		{name:'inQtyt', width:80, align:"right"},		
		   		{name:'outQty', width:80,align:"right"},		
		   		{name:'tnxDate', width:150, sortable:false}		
		   	],
		   	rowNum:10,
		   	autowidth: true,
		   	rowList:[10,20,30],
		   	pager: jQuery('#pager1'),
		   	sortname: 'stockId',
		    viewrecords: true,
		    sortorder: "desc",
		    caption:"XML Example",
		    loadonce : true,
		    multiSort: true,
		    height : 380,
		    //multiselect: true,
		}).navGrid('#pager1',{edit:true,add:true,del:true})
	});
</script> 


</head>
<body>
<table id="list1"></table>
<div id="pager1"></div>
</body>
</html>