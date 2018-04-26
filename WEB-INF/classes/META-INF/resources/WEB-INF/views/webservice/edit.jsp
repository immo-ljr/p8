<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑转换</title>
    <link href="static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/plugins/jsTree/style.min.css" rel="stylesheet">
    <link href="static/css/animate.css" rel="stylesheet">
    <link href="static/css/plugins/cron-generator/cronGen.css" rel="stylesheet">
    <link href="static/css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>编辑WS任务</h5>
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
            	<form class="form-horizontal m-t" id="wsForm">
            		<input type="hidden" name="id" id="wsId" value="${id}">
					<div class="form-group">
						<label class="col-sm-3 control-label">名称：</label>
						<div class="col-sm-7">
							<input id="name" name="name" type="text" placeholder="请输入WS任务名称"
								class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">ws方法：</label>
						<div class="col-sm-5">
							<select id="wsName" name="wsName" class="form-control">
								<option value="" selected>请选择webservice方法</option>
								<option value="importHisEngOrder">导入住院患者信息</option>
								<option value="importHisEngOrderCost">导入住院患者费用结算数据</option>
								<option value="importHisEngOrderInfection">查询住院患者感染及病理信息</option>
								<option value="importHisEngOrderDrug">查询住院医嘱（药品部分）开具数据</option>
								<option value="importHisEngOrderDrugExecute">查询住院医嘱（药品部分）执行数据</option>
								<option value="importHisEngOrderDrugSend">查询住院医嘱（药品部分）发药数据</option>
								<option value="importHisEngOrderFeeDetail">查询住院收费明细数据</option>
								<option value="importHisEngOrderDiagnose">查询住院患者诊断数据</option>
								<option value="importHisEngOrderOperation">查询手术医嘱</option>
								<option value="importHisEngOrderExamine">查询检验医嘱</option>
								<option value="importHisRegister">查询挂号信息</option>
								<option value="importHisEngCf">查询门诊处方</option>
								<option value="importHisEngCfItemFee">查询门诊收费明细表(门诊费用清单)</option>
								<option value="importHisEngCfDrugSend">查询门诊发药明细表(门诊各药房发药清单)</option>
								<option value="importHisDrugCatalog">药品目录信息</option>
								<option value="importHisDrugConvert">药品单位转换比信息</option>
								<option value="importHisDepartMent">科室信息</option>
								<option value="importHisDoctor">医生信息</option>
								<option value="importHisAdminRoute">给药途径</option>
								<option value="importHisAdminFrequency">给药频率</option>
								<option value="importHisAllergy">过敏药物</option>
								<option value="importHisOrderDaily">住院每日统计数据</option>
								<option value="importHisOrderPatientDailyFee">住院患者每日收费统计数据</option>
								<option value="importHisOrderPatientDailySendDrug">住院患者每日发药统计数据</option>
								<option value="importHisOrderDrugDailyFee">住院药品每日收费统计数据</option>
								<option value="importHisOrderDrugDailySendDrug">住院患者药品每日发药统计数据</option>
								<option value="importHisCfDaily">门诊每日统计数据</option>
								<option value="importHisCfPatientDailyFee">门诊患者每日收费统计数据</option>
								<option value="importHisCfPatientDailySendDrug">门诊患者每日发药统计数据</option>
								<option value="importHisCfDrugDailyFee">门诊药品每日收费统计数据</option>
								<option value="importHisCfDrugDailySendDrug">门诊药品每日发药统计数据</option>
								<option value="importHisCfDoctorDaily">门诊医生每日就诊统计数据</option>							</select>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div id="default" style="display: block">
							<label class="col-sm-3 control-label">执行策略：</label>
							<div class="col-sm-5">
								<select id="wsQuartz" name="wsQuartz" class="form-control">
									<option value="0" selected>请选择执行策略</option>
								</select>
							</div>
						</div>
						<div id="custom" style="display: none">
							<label class="col-sm-3 control-label">执行策略：</label>
							<div class="col-sm-5">
								<input id="customerQuarz" readonly name="customerQuarz"
									placeholder="请选择定时任务的cron编码" class="form-control">
							</div>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-w-m btn-primary"
								id="changeQuartz">
								<i class="fa fa-exchange" aria-hidden="true"></i>&nbsp;切换输入方式
							</button>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">WS任务描述：</label>
						<div class="col-sm-7">
							<textarea id="wsDescription" name="wsDescription"
								placeholder="请输入WS任务描述，不超过500字" class="form-control"
								aria-required="true"></textarea>
						</div>
					</div>
	                <div class="form-group">
	                    <div class="col-sm-9 col-sm-offset-3">
	                    	<button class="btn btn-w-m btn-primary" type="submit"><i class="fa fa-check" aria-hidden="true"></i>&nbsp;保存</button>
	                    	<button class="btn btn-w-m btn-primary" type="button" onclick="cancel()"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp;取消</button>
	                    </div>
	                </div>
	            </form>  
            </div>
        </div>
	</div>
	<!-- 全局js -->
    <script src="static/js/jquery.min.js?v=2.1.4"></script>
    <script src="static/js/plugins/cron-generator/cronGen.js"></script>
    <!-- jQuery Validation plugin javascript-->
    <script src="static/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="static/js/plugins/validate/messages_zh.min.js"></script>
    <script src="static/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- layer javascript -->
    <script src="static/js/plugins/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script src="static/js/content.js?v=1.0.0"></script>    
	<script src="static/js/plugins/jsTree/jstree.min.js"></script>	  
	<script src="static/js/my/ws/ws-edit.js"></script>   
</body>
</html>