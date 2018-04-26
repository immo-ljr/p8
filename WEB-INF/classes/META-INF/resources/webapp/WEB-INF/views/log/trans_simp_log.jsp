<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>数据导入简报</title>
    <link href="static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="static/css/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="static/css/animate.css" rel="stylesheet">
    <link href="static/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>处方头列表</h5>
            </div>
            <div class="ibox-content">
            	<div class="right col-sm-6 float-right">	
	            	<button onclick="search()" class="right btn btn-w-m btn-info" type="button">
	            		<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;搜索
            		</button>
					<div class="right col-sm-3">
	           			<div class="input-append date form_datetime">
	           				 <input size="16" type="text"  id="transSimpLogDate" readonly>
						    <span class="add-on"><i class="icon-th"></i></span>
						</div>
					</div>
            	</div>
                <table id="transSimpLogfList" data-toggle="table"
					data-url="/kettle/kTransLog/getListSimpLog"	
					data-query-params="queryParams" data-query-params-type="limit"
					data-pagination="true"
					data-side-pagination="server" data-pagination-loop="false">
					<thead>
						<tr>
							<th data-field="step_name">名称</th>
							<th data-field="add_time" data-formatter="editTimeFormatter" >抽数时间</th>
							<th data-field="insert_num">插入数据</th>
							<th data-field="update_num">更新数据</th>
							<th data-field="error_num">错误数据</th>
							<th data-field="start_date" data-formatter="editTimeFormatter" >开始时间</th>
							<th data-field="end_date" data-formatter="editTimeFormatter" >结束时间</th>
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
    <script src="static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="static/js/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script src="static/js/plugins/bootstrap-datetimepicker/locale/bootstrap-datetimepicker.zh-CN.js"></script>
	<script>
		function editTimeFormatter(value, row, index){
			return timestampToTime(value);
		};	
	
	    function queryParams(params) {
	    	var $transSimpLogDate = $("#transSimpLogDate").val();
	    	var temp = { limit: 50, offset: params.offset, logDate:$transSimpLogDate };
	        return temp;
	    };
	    
	    function search(){
	    	$('#transSimpLogfList').bootstrapTable('refresh', "kettle/kTransLog/getListSimpLog");
	    };
	    
	    $('.form_datetime').datetimepicker({  
	        format: 'yyyy-mm-dd',  
	         weekStart: 1,  
	         autoclose: true,  
	         startView: 2,
	         todayBtn: 1,
	         initialDate: new Date(),
	         minView: 2,  
	         forceParse: false,  
	         language: 'zh-CN'  
	    });  
    </script>
</body>
</html>