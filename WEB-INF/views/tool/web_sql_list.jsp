<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>webSql类表</title>
    <link href="static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="static/css/animate.css" rel="stylesheet">
    <link href="static/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-content" >
            	<div class="right col-sm-12 float-left">
				    <textarea class="form-control" rows="3" name="textarea" ria-required="true" id ="sqlStr"></textarea>
				</div>
            	<div class="right col-sm-6 float-right">	
	            	<button onclick="search()" class="right btn btn-w-m btn-info" type="button">
	            		<i class="fa fa-search" aria-hidden="true"></i>&nbsp;搜索
            		</button>
            	</div>
            </div>
            <div class ="right col-sm-12 float-left">
                <table border="1" id = "webSqlList" >
                	<thead id = "thead_id">
                	</thead>
                	<tbody id ="tbody_id">
                	
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
    <script src="static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script>
	    function search(){
	    	var arr;
	    	var $websql = $("#sqlStr").val();
	    	if($websql.length > 0){
	    		var sqlStr = $websql.toUpperCase();
	    		if(sqlStr.startWith("SELECT")){
	    			$.ajax({
						type: "POST",			
						url: 'tool/getColNameList',
						data: {"webSqlStr":$websql+""},
						async: false,
						success: function (datas) {
							var thead_val = "";
							arr = datas.data;
							if(arr != null){
								$("#thead_id").empty();
								thead_val += "<tr>";
								for(var i=0;i<arr.length;i++){ 
									thead_val += "<td >"+arr[i]+"</td>"	
								}
								thead_val += "</tr>";
								$("#thead_id").append(thead_val);
							}else{
								alert("无数据！");
							}
								
						},
						error: function(xhr,status,error){
							alert("失败！");
						},
						complete: function(){
							$.ajax({
								type: "POST",			
								url: 'tool/getColDataList',
								data: {"webSqlStr":$websql},
								async: false,
								success: function (datas) {
									var tbody_val = "";
									$("#tbody_id").empty();
									var data = datas.data;
									for(var i= 0;i<data.length; i++){
										tbody_val += "<tr>";
										for(var j=0;j<arr.length;j++){
											tbody_val += "<td>"+data[i][arr[j]]+"</td>"	
										}
										tbody_val += "</tr>"; 
									} 
									$("#tbody_id").append(tbody_val);
								},
								error: function(xhr,status,error){
									alert("失败！");
								}
							});
						}
					});
	    		}else{
	    			alert("SQL不是查询");
	    		}
	    	}else{
	    		alert("SQL不能为空");
	    	} 
	    };
    </script>
</body>
</html>