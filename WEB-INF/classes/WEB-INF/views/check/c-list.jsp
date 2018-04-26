<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>转换监控记录</title>
<link href="static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="static/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link
	href="static/css/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="static/css/animate.css" rel="stylesheet">
<link href="static/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>检查</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<div class="right">
					<div class="col-sm-3">
						<div class=" date form_datetime">
							<span class="add-on"><i class="icon-th"></i></span><input
								size="16" type="text" id="startTime" readonly
								placeholder="请选择开始时间" />
						</div>
					</div>
					<div class="col-sm-3">
						<div class=" date form_datetime">
							<span class="add-on"><i class="icon-th"></i></span><input
								size="16" type="text" id="endTime" readonly
								placeholder="请选择结束时间" />
						</div>
					</div>
					<button onclick="search()" class="btn btn-w-m btn-info"
						type="button">
						<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;查询
					</button>
				</div>
				<table class="table table-hover fixed-table-container">
					<thead>
						<tr>
							<th>指标</th>
							<th>his
							<th>local</th>
							<th>公式</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">住院</td>
						</tr>
						<tr>
							<td>出院总人数</td>
							<td><span id="his_outPatientNum">0</span></td>
							<td><span id="local_outPatientNum">0</span></td>
							<td></td>
						</tr>
						<tr>
							<td>出院病人总费用</td>
							<td><span id="his_outPatientfee">0</span></td>
							<td><span id="local_outPatientfee">0</span></td>
							<td></td>
						</tr>
						<tr>
							<td>出院病人总药品费用</td>
							<td><span id="his_outPatientDrugFee">0</span></td>
							<td><span id="local_outPatientDrugFee">0</span></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="4">门诊</td>
						</tr>
						<tr>
							<td>每日就诊总人数</td>
							<td><span id="his_patientNum">0</span></td>
							<td><span id="local_patientNum">0</span></td>
						</tr>
						<tr>
							<td>每日就诊总人次数</td>
							<td><span id="his_patientTimeNum">0</span></td>
							<td><span id="local_patientTimeNum">0</span></td>
							<td></td>
						</tr>
						<tr>
							<td>每日总处方数</td>
							<td><span id="his_cfCount">0</span></td>
							<td><span id="local_cfCount">0</span></td>
							<td></td>
						</tr>
						<tr>
							<td>每日总费用</td>
							<td><span id="his_totalFee">0</span></td>
							<td><span id="local_totalFee">0</span></td>
							<td></td>
						</tr>
						<tr>
							<td>每日总药品费用</td>
							<td><span id="his_totalDrugFee">0</span></td>
							<td><span id="local_totalDrugFee">0</span></td>
							<td></td>
						</tr>
					</tbody>
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
	<script
		src="static/js/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script
		src="static/js/plugins/bootstrap-datetimepicker/locale/bootstrap-datetimepicker.zh-CN.js"></script>

	<script>
		$(document).ready(function() {
			$('.form_datetime').datetimepicker({
				format : 'yyyy-mm-dd',
				weekStart : 1,
				autoclose : true,
				startView : 2,
				todayBtn : 1,
				initialDate : new Date(),
				minView : 2,
				forceParse : false,
				language : 'zh-CN'
			});
			initLoading();
		});
		function MonitorTransFormatter(value, row, index) {
			var MonitorTrans = "";
			$.ajax({
				type : 'POST',
				async : false,
				url : 'kettle/kTrans/getTrans',
				data : {
					"id" : value
				},
				success : function(datas) {
					var Trans = datas.data;
					MonitorTrans = Trans.transName;
				},
				error : function() {
					alert("系统出现问题，请联系管理员");
				},
				dataType : 'json'
			});
			return MonitorTrans;
		};

		function actionFormatter(value, row, index) {
			return [ '<a class="btn btn-primary btn-xs" id="viewDetail" type="button"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;查看详细</a>' ]
					.join('');
		};
		window.actionEvents = {
			'click #viewDetail' : function(e, value, row, index) {
				location.href = "index/recordListUI?transId="
						+ row.monitorTrans + "&id=" + row.id
						+ "&startDate=&endDate=";
			},
		};
		function queryParams(params) {
			var temp = {
				limit : 10,
				offset : params.offset / 10 + 1
			};
			return temp;
		};

		function search() {
			$.ajax({
				type : 'POST',
				async : false,
				url : 'check/searchCheck',
				data : {
					"startTime" : $('#startTime').val(),
					"endTime" : $('#endTime').val()
				},
				beforeSend : function() {
					showLoading("处理中，请稍候");
				},
				complete : function() {
					hideLoading();
				},   
				success : function(datas) {
					var data = datas.data;
					if (data != null) {
						var cf_hisCountMap = data.cf_hisCountMap;
						if (cf_hisCountMap != null) {
							$("#his_patientNum")
									.text(cf_hisCountMap.patientNum);
							$("#his_patientTimeNum").text(
									cf_hisCountMap.patientTimeNum);
							$("#his_cfCount").text(cf_hisCountMap.cfCount);
							$("#his_totalFee").text(cf_hisCountMap.totalFee);
							$("#his_totalDrugFee").text(
									cf_hisCountMap.totalDrugFee);
						}
						var cf_localCountMap = data.cf_localCountMap;
						if (cf_localCountMap != null) {
							$("#local_patientNum").text(
									cf_localCountMap.patientNum);
							$("#local_patientTimeNum").text(
									cf_localCountMap.patientTimeNum);
							$("#local_cfCount").text(cf_localCountMap.cfCount);
							$("#local_totalFee")
									.text(cf_localCountMap.totalFee);
							$("#local_totalDrugFee").text(
									cf_localCountMap.totalDrugFee);
						}
						var order_hisCountMap = data.order_hisCountMap;
						if (order_hisCountMap != null) {
							$("#his_outPatientNum").text(
									order_hisCountMap.outPatientNum);
							$("#his_outPatientfee").text(
									order_hisCountMap.outPatientfee);
							$("#his_outPatientDrugFee").text(
									order_hisCountMap.outPatientDrugFee);
						}

						var order_localCountMap = data.order_localCountMap;
						if (order_localCountMap != null) {
							$("#local_outPatientNum").text(
									order_localCountMap.outPatientNum);
							$("#local_outPatientfee").text(
									order_localCountMap.outPatientFee);
							$("#local_outPatientDrugFee").text(
									order_localCountMap.out_patient_drug_fee);
						}

					}
				},
				error : function() {
					alert("系统出现问题，请联系管理员");
				},
				dataType : 'json'
			});
		};
		function initLoading() {
			$("body")
					.append(
							"<!-- loading -->"
									+ "<div class='modal fade' id='loading' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' data-backdrop='static'>"
									+ "<div class='modal-dialog' role='document'>"
									+ "<div class='modal-content'>"
									+ "<div class='modal-header'>"
									+ "<h4 class='modal-title' id='myModalLabel'>提示</h4>"
									+ "</div>"
									+ "<div id='loadingText' class='modal-body'>"
									+ "<span class='glyphicon glyphicon-refresh' aria-hidden='true'>1</span>"
									+ "处理中，请稍候。。。" + "</div>" + "</div>"
									+ "</div>" + "</div>");
		}

		function showLoading(text) {
			$("#loadingText").html(text);
			$("#loading").modal("show");
		}

		function hideLoading() {
			$("#loading").modal("hide");
		}
	</script>
</body>
</html>