<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>资源库列表</title>
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
                <h5>医嘱执行列表</h5>
            </div>
            <div class="ibox-content">
            	<div class="right col-sm-6 float-right">	
	            	<button onclick="search()" class="right btn btn-w-m btn-info" type="button">
	            		<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;搜索
            		</button>
           			<div class="right col-sm-3">
	           			<div class="input-append date form_datetime">
						    <input size="16" type="text"  id="engOrderDrugExecuteEndDate" readonly>
						    <span class="add-on"><i class="icon-th"></i></span>
						</div>
					</div>
					<div class="right col-sm-3">
	           			<div class="input-append date form_datetime">
	           				 <input size="16" type="text"  id="engOrderDrugExecuteStartDate" readonly>
						    <span class="add-on"><i class="icon-th"></i></span>
						</div>
					</div>
            	</div>
                <table id="engOrderDrugExecuteList" data-toggle="table"
					data-url="kettle/engOrderDrugExecute/getListPage"	
					data-query-params=queryParams data-query-params-type="limit"
					data-pagination="true"
					data-side-pagination="server" data-pagination-loop="false">
					<thead>
						<tr>
							<th data-field="id">ID</th>
							<th data-field="orderId">住院ID</th>
							<th data-field="orderDrugId">医嘱ID</th>
							<th data-field="patientNo">病人ID</th>
							<th data-field="patientName">病人姓名</th>
							<th data-field="type">医嘱类型</th>
							<th data-field="groupNo">组号</th>
							<th data-field="coAdmin">合用标志</th>
							<th data-field="drugId">药品 id</th>
							<th data-field="drugName">医院药品名称</th>
							<th data-field="prepForm">剂型</th>
							<th data-field="specName">规格</th>
							<th data-field="manufacturerName">厂家</th>
							<th data-field="adminRoute">给药途径</th>
							<th data-field="adminDose">执行剂量数量</th>
							<th data-field="adminDoseUnit">执行剂量单位</th>
							<th data-field="adminFrequency">给药频率</th>
							<th data-field="adminMethod">给药方式</th>
							<th data-field="adminGoal">用药目的</th>
							<th data-field="docId">医师工号</th>
							<th data-field="docName">医师姓名</th>
							<th data-field="executeTime" data-formatter="editTimeFormatter">执行时间</th>
							<th data-field="executeDepartmentId">执行科室ID</th>
							<th data-field="executeDepartment">执行科室</th>
							<th data-field="lastUpdateTime" data-formatter="editTimeFormatter" >最后更新时间</th>
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
	    	var $startDate = $("#engOrderDrugExecuteStartDate").val();
	    	var $endDate = $("#engOrderDrugExecuteEndDate").val();
	    	var temp = { limit: 10, offset: params.offset/10+1, startDate:$startDate, endDate:$endDate };
	        return temp;
	    };
	    
	    function search(){
	    	$('#engOrderDrugExecuteList').bootstrapTable('refresh', "kettle/engOrderDrugExecute/getListPage");
	    };
	    
	    $('.form_datetime').datetimepicker({  
	        format: 'yyyy-mm-dd',  
	         weekStart: 1,  
	         autoclose: true,  
	         startView: 2,  
	         minView: 2,  
	         forceParse: false,  
	         language: 'zh-CN'  
	    });  
    </script>
</body>
</html>