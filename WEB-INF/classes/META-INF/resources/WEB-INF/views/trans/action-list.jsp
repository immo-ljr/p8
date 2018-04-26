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
<title>手动导参数</title>
<link href="static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="static/css/animate.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<form class="form-horizontal m-t" id="ActionTransForm">
					<input id="actionTransId" name="id" value="${id}" type="hidden">
					<div class="form-group">
						<label class="col-sm-3 control-label">开始时间：</label>
						<div class="col-sm-7">
							<input id="startDateId" name="startDate" type="text"
								value="2017-09-01" placeholder="请输入开始时间" class="form-control"
								aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">结束时间：</label>
						<div class="col-sm-7">
							<input id="endDateId" name="endDate" type="text"
								value="2017-09-05" placeholder="请输入结束时间" class="form-control"
								aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-9 col-sm-offset-3">
							<button class="btn btn-w-m btn-primary" type="button"
								onclick="actionTrans()">
								<i class="fa fa-reply" aria-hidden="true"></i>&nbsp;确定
							</button>
							<button class="btn btn-w-m btn-primary" type="button"
								onclick="cancel()">
								<i class="fa fa-check" aria-hidden="true"></i>&nbsp;取消
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 全局js -->
	<script src="static/js/jquery.min.js?v=2.1.4"></script>
	<!-- jQuery Validation plugin javascript-->
	<script src="static/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="static/js/plugins/validate/messages_zh.min.js"></script>
	<script src="static/js/bootstrap.min.js?v=3.3.6"></script>
	<!-- layer javascript -->
	<script src="static/js/plugins/layer/layer.min.js"></script>
	<!-- 自定义js -->
	<script src="static/js/content.js?v=1.0.0"></script>


	<script type="text/javascript">
	
		$(function(){
			initLoading();
		});
		
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

		var actionTrans = function() {
			var $transId = $("#actionTransId").val();
			var $startDateId = $("#startDateId").val();
			var $endDateId = $("#endDateId").val();
			if ($transId != "" && ($startDateId != "" || $endDateId != "")) {
				$.ajax({
					type : 'POST',
					async : true,
					url : 'kettle/kTrans/action',
					data : {
						"id" : $transId,
						"startDate" : $startDateId,
						"endDate" : $endDateId
					},
					beforeSend : function() {
						showLoading("处理中，请稍候");
					},
					complete : function() {
						hideLoading();
					},
					success : function(data) {
						location.href = "index/listTransUI";
					},
					error : function() {
						alert("系统出现问题，请联系管理员");
					},
					dataType : 'json'
				});
			}

		}

		var cancel = function() {
			location.href = "index/listTransUI";
		}
	</script>
</body>
</html>