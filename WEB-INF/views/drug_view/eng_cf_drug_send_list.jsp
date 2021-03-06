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
                <h5>处方头列表</h5>
            </div>
            <div class="ibox-content">
            	<div class="right col-sm-6 float-right">	
	            	<button onclick="search()" class="right btn btn-w-m btn-info" type="button">
	            		<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;搜索
            		</button>
           			<div class="right col-sm-3">
	           			<div class="input-append date form_datetime">
						    <input size="16" type="text"  id="engCfDrugSendEndDate" readonly>
						    <span class="add-on"><i class="icon-th"></i></span>
						</div>
					</div>
					<div class="right col-sm-3">
	           			<div class="input-append date form_datetime">
	           				 <input size="16" type="text"  id="engCfDrugSendStartDate" readonly>
						    <span class="add-on"><i class="icon-th"></i></span>
						</div>
					</div>
            	</div>
                <table id="engCfDrugSendList" data-toggle="table"
					data-url="kettle/engCfDrugSend/getListPage"	
					data-query-params=queryParams data-query-params-type="limit"
					data-pagination="true"
					data-side-pagination="server" data-pagination-loop="false">
					<thead>
						<tr>
							<th data-field="id">ID</th>
							<th data-field="cfId">处方ID</th>
							<th data-field="cfItemId">处方明细ID</th>
							<th data-field="dispenseStore">发药药房名称</th>
							<th data-field="patientNo">病人ID</th>
							<th data-field="patientName">病人姓名</th>
							<th data-field="drugId">药品id</th>
							<th data-field="drugName">医院药品名称</th>
							<th data-field="regName">商品名称</th>
							<th data-field="manufacturerName">厂家</th>
							<th data-field="continueDay">门诊用药持续时间</th>
							<th data-field="spec">规格</th>
							<th data-field="qty">发药数量</th>
							<th data-field="qtyUnit">发药单位</th>
							<th data-field="sendDose">发药剂量</th>
							<th data-field="sendUnit">发药剂量单位</th>
							<th data-field="sendDataTime">发药时间</th>
							<th data-field="groupNo">组号</th>
							<th data-field="firstUse">首剂使用</th>
							<th data-field="prepForm">剂型</th>
							<th data-field="adminRoute">给药途径</th>
							<th data-field="adminArea">给药部位</th>
							<th data-field="adminFrequency">给药频率</th>
							<th data-field="adminDose">单次剂量</th>
							<th data-field="totalAdminDose">总剂量</th>
							<th data-field="adminMethod">给药时机</th>
							<th data-field="specialPromote">备注信息</th>
							<th data-field="skinTest">皮试结果</th>
							<th data-field="comment">药品备注</th>
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
	    	var $startDate = $("#engCfDrugSendStartDate").val();
	    	var $endDate = $("#engCfDrugSendEndDate").val();
	    	var temp = { limit: 10, offset: params.offset/10+1, startDate:$startDate, endDate:$endDate };
	        return temp;
	    };
	    
	    function search(){
	    	$('#engCfDrugSendList').bootstrapTable('refresh', "kettle/engCfDrugSend/getListPage");
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