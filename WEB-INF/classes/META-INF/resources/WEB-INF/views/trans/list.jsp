<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>转换列表</title>
    <link href="static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="static/css/animate.css" rel="stylesheet">
    <link href="static/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>转换列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <!-- <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a> -->
                </div>
            </div>
            <div class="ibox-content">
            	<div class="col-sm-6 float-left">	
	            	<a href="index/rAddTransUI" class="btn btn-w-m btn-info" type="button">
	            		<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;新增资源库转换
            		</a>
            		<!-- <a href="index/fAddRransUI" class="btn btn-w-m btn-info" type="button">
	            		<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;新增文件转换
            		</a> -->
            	</div>
            	<div class="right">	
	            	<button onclick="search()" class="btn btn-w-m btn-info" type="button">
	            		<i class="fa fa-flash" aria-hidden="true"></i>&nbsp;刷新列表
            		</button>
            	</div>
                <table id="transList" data-toggle="table"
					data-url="kettle/kTrans/getPageList"
					data-query-params=queryParams data-query-params-type="limit"
					data-pagination="true"
					data-side-pagination="server" data-pagination-loop="false">
					<thead>
						<tr>
							<th data-field="transName">转换名称</th>
							<th data-field="transDescription">转换描述 </th> 
							<th data-field="quartzDescription">执行策略</th>
							<th data-field="quartzCron">策略表达式</th> 
							<th data-field="transStatus" data-formatter="transStatusFormatter">定时任务</th>
							<th data-field="runStatus" data-formatter="runStatusFormatter">运行状态</th>
							<th data-field="editTime" data-formatter="editTimeFormatter">转换更新时间</th>
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
    <script src="static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script> 
	  //转化的  运行状态、启动状态
	    function transStatusFormatter(value, row, index){
	    	if (value == "1"){
	    		return "已启动";
	    	}else if (value == "2"){
	    		return "停止";
	    	}else {
	    		return "未定义";
	    	}
	    }
	  
	    function runStatusFormatter(value, row, index){
	    	if (value == "1"){
	    		return "运行中";
	    	}else if (value == "2"){
	    		return "停止";
	    	}else {
	    		return "未定义";
	    	}
	    }
	    
	    function actionFormatter(value, row, index) {
	    	if (row.transStatus == "1"){
	    		return ['<a class="btn btn-primary btn-xs" id="stop" type="button"><i class="fa fa-stop" aria-hidden="true"></i>&nbsp;停止</a>',
		    			'&nbsp;&nbsp;',
		    			'<a class="btn btn-primary btn-xs" id="edit" type="button"><i class="fa fa-paste" aria-hidden="true"></i>&nbsp;编辑</a>',
		    			'&nbsp;&nbsp;',
		    			'<a class="btn btn-primary btn-xs" id="delete" type="button"><i class="fa fa-trash" aria-hidden="true"></i>&nbsp;删除</a>',
		    			'&nbsp;&nbsp;',
		    			'<a class="btn btn-primary btn-xs" id="action" type="button"><i class="fa fa-play" aria-hidden="true"></i>&nbsp;手动</a>'].join('');	
	    	}else if (row.transStatus == "2"){
	    		return ['<a class="btn btn-primary btn-xs" id="start" type="button"><i class="fa fa-play" aria-hidden="true"></i>&nbsp;启动</a>',
	    			'&nbsp;&nbsp;',
	    			'<a class="btn btn-primary btn-xs" id="edit" type="button"><i class="fa fa-paste" aria-hidden="true"></i>&nbsp;编辑</a>',
	    			'&nbsp;&nbsp;',
	    			'<a class="btn btn-primary btn-xs" id="delete" type="button"><i class="fa fa-trash" aria-hidden="true"></i>&nbsp;删除</a>',
	    			'&nbsp;&nbsp;',
	    			'<a class="btn btn-primary btn-xs" id="action" type="button"><i class="fa fa-play" aria-hidden="true"></i>&nbsp;手动</a>'].join('');	
	    	}else {
	    		return ['<a class="btn btn-primary btn-xs" id="edit" type="button"><i class="fa fa-paste" aria-hidden="true"></i>&nbsp;编辑</a>',
	    			'&nbsp;&nbsp;',
	    			'<a class="btn btn-primary btn-xs" id="delete" type="button"><i class="fa fa-trash" aria-hidden="true"></i>&nbsp;删除</a>'].join('');	
	    	}
	    };
	    window.actionEvents = {	    		
				'click #start' : function(e, value, row, index) {
					layer.confirm('确定启动该转换？', {
	    				  btn: ['确定', '取消'] 
	    				},
	    				function(index){
	    				    layer.close(index);
	    				    $.ajax({
	    				        type: 'POST',
	    				        async: true,
	    				        url: 'kettle/kTrans/start',
	    				        data: {
	    				            "id": row.id          
	    				        },
	    				        success: function (data) {
	    				        	location.replace(location.href); 				        	 
	    				        },
	    				        error: function () {
	    				            alert("系统出现问题，请联系管理员");
	    				        },
	    				        dataType: 'json'
	    				    });
	    		  		}, 
	    		  		function(){
	    		  			layer.msg('取消操作');
  		  				}
  		  			);
	    		},
	    		'click #stop' : function(e, value, row, index) {
	    			layer.confirm('确定停止该转换？', {
	    				  btn: ['确定', '取消'] 
	    				},
	    				function(index){
	    				    layer.close(index);
	    				    $.ajax({
	    				        type: 'POST',
	    				        async: true,
//	    				        url: 'trans/stop.shtml',
	    				        url: 'kettle/kTrans/stop',
	    				        data: {
	    				            "id": row.id          
	    				        },
	    				        success: function (data) {
	    				        	location.replace(location.href); 				        	 
	    				        },
	    				        error: function () {
	    				            alert("系统出现问题，请联系管理员");
	    				        },
	    				        dataType: 'json'
	    				    });
	    		  		}, 
	    		  		function(){
	    		  			layer.msg('取消操作');
		  				}
		  			);
	    		},
	    		'click #edit' : function(e, value, row, index) {
	    			var transId = row.id;
	    			location.href = "index/editTransUI?id=" + transId;
	    		},
	    		'click #delete' : function(e, value, row, index) {
	    			layer.confirm('确定删除该单位？', {
	    				  btn: ['确定', '取消'] 
	    				},
	    				function(index){
	    				    layer.close(index);
	    				    $.ajax({
	    				        type: 'POST',
	    				        async: true,
	    				        url: 'kettle/kTrans/delete',
	    				        data: {
	    				            "id": row.id          
	    				        },
	    				        success: function (data) {
	    				        	location.replace(location.href); 				        	 
	    				        },
	    				        error: function () {
	    				            alert("系统出现问题，请联系管理员");
	    				        },
	    				        dataType: 'json'
	    				    });
	    		  		}, 
	    		  		function(){
	    		  			layer.msg('取消操作');
    		  			}
    		  		);
	    		},
	    		'click #action' : function(e, value, row, index) {
	    			var transId = row.id;
	    			location.href ="index/actionTransUI?id="+transId;
	    		},
	    	};
		    
		    function queryParams(params) {
		    	var temp = { limit: 10, offset: params.offset/10+1 };
		        return temp;
		    };
		    
		    function search(){
		    	$('#transList').bootstrapTable('refresh', "index/listTransUI");
		    }
    </script>
</body>
</html>