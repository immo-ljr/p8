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
						    <input size="16" type="text"  id="engCfEndDate" readonly>
						    <span class="add-on"><i class="icon-th"></i></span>
						</div>
					</div>
					<div class="right col-sm-3">
	           			<div class="input-append date form_datetime">
	           				 <input size="16" type="text"  id="engCfStartDate" readonly>
						    <span class="add-on"><i class="icon-th"></i></span>
						</div>
					</div>
            	</div>
                <table id="engCfList" data-toggle="table"
					data-url="kettle/engCf/getListPage"	
					data-query-params=queryParams data-query-params-type="limit"
					data-pagination="true"
					data-side-pagination="server" data-pagination-loop="false">
					<thead>
						<tr>
							<th data-field="id">处方ID号</th>
							<th data-field="visitNo">门诊号</th>
							<th data-field="departId">科室编号</th>
							<th data-field="department">科室名称</th>
							<th data-field="age">年龄</th>
							<th data-field="presType">处方类型</th>
							<th data-field="presDateTime">处方医生开具时间</th>
							<th data-field="sex">性别</th>
							<th data-field="payType">费用类型</th>
							<th data-field="patientNo">患者号</th>
							<th data-field="presNo">处方号</th>
							<th data-field="name">病人姓名</th>
							<th data-field="address">地址</th>
							<th data-field="phoneNo">联系电话</th>
							<th data-field="id_card">身份证号</th>
							<th data-field="height">身高</th>
							<th data-field="weight">体重</th>
							<th data-field="birthWeight">出生时体重</th>
							<th data-field="ccr">内生肌酐清除率</th>
							<th data-field="allergyList">过敏药品列表</th>
							<th data-field="pregnancy">是否怀孕</th>
							<th data-field="timeOfPpreg">孕期（周）</th>
							<th data-field="breastFeeding">是否哺乳</th>
							<th data-field="dialysis">是否透析</th>
							<th data-field="proxName">代办人姓名</th>
							<th data-field="proxIdCard">代办人身份证号</th>
							<th data-field="docId">医生工号</th>
							<th data-field="docName">医生姓名</th>
							<th data-field="docTitle">医生职称</th>
							<th data-field="deptGroup">科室组名称</th>
							<th data-field="totalAmount">处方金额</th>
							<th data-field="presSource">处方来源</th>
							<th data-field="corresCfPresno">退药标记</th>
							<th data-field="recipeType">处方类别</th>
							<th data-field="comment">备注项</th>
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
    	/* function repositoryNameFormatter(value, row, index){
    		if (value.length > 15){
    			var newValue = value.substring(0, 14);
    			return newValue + "……";
    		} else {
    			return value;
    		}
    	};  */
    	
    	function editTimeFormatter(value, row, index){
    		return timestampToTime(value);
    	}; 
		    
	    function queryParams(params) {
	    	var $startDate = $("#engCfStartDate").val();
	    	var $endDate = $("#engCfEndDate").val();
	    	var temp = { limit: 10, offset: params.offset/10+1, startDate:$startDate, endDate:$endDate };
	        return temp;
	    };
	    
	    function search(){
	    	$('#engCfList').bootstrapTable('refresh', "kettle/engCf/getListPage");
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