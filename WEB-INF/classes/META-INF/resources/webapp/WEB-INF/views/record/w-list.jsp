<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WS任务执行日志记录</title>
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
                <h5>WS任务执行日志记录</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
            	<div class="col-sm-6 float-left">	
	            	<a href="kettle/kWebserviceMonitor/wMonitorUI" class="btn btn-w-m btn-info" type="button">
	            		<i class="fa fa-reply" aria-hidden="true"></i>&nbsp;返回
            		</a>
            	</div>
            	<div class="right col-sm-6 float-right">	
	            	<button onclick="search()" class="right btn btn-w-m btn-info" type="button">
	            		<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;搜索
            		</button>
           			<div class="right col-sm-3">
	           			<div class="input-append date form_datetime">
						    <input size="16" type="text"  id="endDateId" value="${endDate}" readonly>
						    <span class="add-on"><i class="icon-th"></i></span>
						</div>
					</div>
					<div class="right col-sm-3">
	           			<div class="input-append date form_datetime">
	           				 <input size="16" type="text"  id="startDateId" value="${startDate}" readonly>
						    <span class="add-on"><i class="icon-th"></i></span>
						</div>
					</div>
            		<div class="right col-sm-4">
                   		<select id="wsId" name="wsId" class="form-control">
                            <option value="">请选择WS任务</option>
                        </select>
                    </div> 
            	</div>
            	<input type="hidden" id="wsDefaultId" name="wsDefaultId" value="${wsId}">
                <table id="wsRecordList" data-toggle="table"
					data-url="kettle/wsRecord/getListPage"
					data-query-params="queryParams" data-query-params-type="limit"
					data-pagination="true" data-toolbar="#toolbar"
					data-side-pagination="server" data-pagination-loop="false">
					<thead>
						<tr>
							<th data-field="wsFunctionName" data-formatter="getWsnameByFunctionName">WS任务名称</th>
							<th data-field="wsFunctionName">WS方法名</th>
							<th data-field="startTime">WS任务执行起始时间</th>
							<th data-field="endTime">WS任务执行结束时间</th>
							<th data-field="recordStatus" data-formatter="recordStatusFormatter">WS任务执行状态</th>
							<th data-field="action" data-formatter="actionFormatter"
								data-events="actionEvents">操作</th>
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
    <script src="static/js/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
     <script src="static/js/plugins/bootstrap-datetimepicker/locale/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script>
		$(document).ready(function () {
			var $wsDefaultId = $("#wsDefaultId").val();
			$.ajax({
		        type: 'POST',
		        async: false,
		        url: 'kettle/kWebserviceMonitor/getAllList',
		        data: {
		        },
		        success: function (datas) {
		        	var data = datas.data;
		        	for (var i=0; i<data.length; i++){
		        		$("#wsId").append('<option value="' + data[i].monitorWebservice + '">' + data[i].monitorFunction + '</option>');
		        	}
		        },
		        error: function () {
		            alert("请求失败！请刷新页面重试");
		        },
		        dataType: 'json'
		    });
			$("#wsId").find("option[value=" + $wsDefaultId + "]").prop("selected",true);
			search();
		});
		
    	function getWsnameByFunctionName(value, row, index){
    		var recordws = "";
    		$.ajax({
		        type: 'POST',
		        async: false,
		        url: 'kettle/kWebservice/getWsByFunctionName',
		        data: {
		            "functionName": value          
		        },
		        success: function (datas) {
		        	var ws = datas.data;
		        	recordws = ws.name;		        	 				        	 
		        },
		        error: function () {
		            alert("系统出现问题，请联系管理员");
		        },
		        dataType: 'json'
		    });
    		return recordws;
    	}; 
    	function recordStatusFormatter(value, row, index){
    		if (value == "1"){
    			return "运行成功";
    		}else if (value == "2"){
    			return "运行失败";
    		}else {
    			return "未定义";
    		}
    	}
	    function actionFormatter(value, row, index) {
	    	if(row.recordStatus==2){
	    		return ['<a class="btn btn-primary btn-xs" id="detail" type="button"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;查看明细</a>'
	    		,'&nbsp;&nbsp;'
	    		,'<a class="btn btn-primary btn-xs" id="error" type="button"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;查看错误</a>'].join('');
	    	}else{
	    		return ['<a class="btn btn-primary btn-xs" id="detail" type="button"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;查看明细</a>'].join('');
	    	}
	    		
	    };
	    window.actionEvents = {
	    		'click #detail' : function(e, value, row, index) {
	    			var $wsId = $("#wsId").val();   
			    	var $startDate = $("#startDateId").val();
			    	var $endDate =$("#endDateId").val();
	    			location.href="kettle/wsRecordInfo/wsLogListUI?recordId=" + row.id+"&wsId="+$wsId+"&startDate="+$startDate+"&endDate="+$endDate;    			
	    		},
	    		'click #error' : function(e, value, row, index) {
	    			var $wsId = $("#wsId").val();   
			    	var $startDate = $("#startDateId").val();
			    	var $endDate =$("#endDateId").val();
	    			location.href="kettle/wsRecordError/wsErrorLogListUI?recordId=" + row.id+"&wsId="+$wsId+"&startDate="+$startDate+"&endDate="+$endDate;    			
	    		}
	    	};
		    
		    function queryParams(params) {
		    	var $wsId = $("#wsId").val();   
		    	if($wsId==null || $wsId.length<=0){
		    		$wsId = $("#wsDefaultId").val();
		    	}
		    	var $startDate = $("#startDateId").val();
		    	var $endDate =$("#endDateId").val();
		    	var temp = {limit: 10, offset: params.offset/10+1, wsId: $wsId, startDate:$startDate, endDate:$endDate};
		        return temp;
		    };
		    		    
		    function search(){
		    	$('#wsRecordList').bootstrapTable('refresh', "kettle/kwsRecord/getListPage");
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