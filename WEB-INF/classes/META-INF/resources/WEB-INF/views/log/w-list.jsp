<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>明细日志记录</title>
<link href="static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="static/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link href="static/css/animate.css" rel="stylesheet">
<link href="static/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>WS任务执行日志记录</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<div class="col-sm-6 float-left">
					<a href="javascript:void(0)" onclick="cancal()" class="btn btn-w-m btn-info"
						type="button"> <i class="fa fa-reply" aria-hidden="true"></i>&nbsp;返回
					</a>
				</div>
				<input type="hidden" id="wsRecordId" value="${recordId}">
				<input type="hidden" id="logTWs" value="${wsId}">
				<input type="hidden" id="logStartDate" value="${startDate}">
				<input type="hidden" id="logEndDate" value="${endDate}">
				<table id="transLogList" data-toggle="table"
					data-url="kettle/wsRecordInfo/getListPage"
					data-query-params="queryParams" data-query-params-type="limit"
					data-pagination="true" data-side-pagination="server" 
					data-pagination-loop="false">
					<thead>
						<tr>
							<!-- <th data-field="recordTrans" data-formatter="recordTransFormatter">转换名称</th> -->
							<th data-field="tableName">表名称</th>
							<th data-field="selectNum">流入数量</th>
							<th data-field="succeedNum">成功数</th>
							<th data-field="errorNum">错误数量</th>
							<th data-field="updateNum">更新数量</th>
							<th data-field="insertionNum">插入数量</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<!-- 全局js -->
	<script src="static/js/jquery.min.js?v=2.1.4"></script>
	<script src="static/js/bootstrap.min.js?v=3.3.6"></script>
	<!-- layer javascript -->
	<script src="static/js/plugins/layer/layer.min.js"></script>
	<!-- 自定义js -->
	<script src="static/js/content.js?v=1.0.0"></script>
	<!-- Bootstrap table -->
	<script src="static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script>
		$(document).ready(function() {
		});
	
		function queryParams(params) {
			var $wsRecordId = $("#wsRecordId").val();
			var temp = {
				limit : 10,
				offset : params.offset/10+1,
				recordId : $wsRecordId
			};
			return temp;
		};
		
		function cancal(){
			var $transId = $("#logTWs").val();
			var $startDate = $("#logStartDate").val();
			var $endDate = $("#logEndDate").val();
			location.href="kettle/wsRecord/recordListUI?wsId="+$transId+"&startDate="+$startDate+"&endDate="+$endDate;
		}
	</script>
</body>
</html>