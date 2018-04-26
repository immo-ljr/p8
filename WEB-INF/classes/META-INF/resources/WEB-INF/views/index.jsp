<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>DingData--Process</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/animate.css" rel="stylesheet">
    <link href="static/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" src="static/img/logo.jpg"></span>            
                        </div>
                        <div class="logo-element">Data</div>
                    </li>
                    <li>
                    	<a href="javascript:void(0)">
                            <i class="fa fa-database" aria-hidden="true"></i>
                            <span class="nav-label">资源库管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="index/listRepositoryUI">&nbsp;数据库资源库</a>
                            </li>
                        </ul>
                    </li>   
                    <li>
                    	<a href="javascript:void(0)">
                            <i class="fa fa-tasks" aria-hidden="true"></i>
                            <span class="nav-label">任务管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                           <!--  <li>
                                <a class="J_menuItem" href="index/listJobUI">&nbsp;作业管理</a>
                            </li> -->
                            <li>
                                <a class="J_menuItem" href="index/listTransUI">&nbsp;转换管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index/listWsUI">&nbsp;ws管理</a>
                            </li>
                        </ul>
                    </li> 
                    <li>
                    	<a href="javascript:void(0)">
                            <i class="fa fa-tasks" aria-hidden="true"></i>
                            <span class="nav-label">系统工具</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="index/webSqlListUI">&nbsp;WebSQL</a>
                            </li>
                        </ul>
                    </li> 
                    <li>
                    	<a href="javascript:void(0)">
                            <i class="fa fa-desktop" aria-hidden="true"></i>
                            <span class="nav-label">监控管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                          <!--   <li>
                                <a class="J_menuItem" href="index/jobMonitorUI">&nbsp;作业监控</a>
                            </li> -->
                            <li>
                                <a class="J_menuItem" href="index/transMonitorUI">&nbsp;转换监控</a>
                            </li>
							<li>
                                <a class="J_menuItem" href="kettle/kWebserviceMonitor/wMonitorUI">&nbsp;WS任务监控</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index/transMonitorSimpLogUI">&nbsp;查看简报</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="check/checkUI">&nbsp;查看检查</a>
                            </li>
                        </ul>
                    </li>   
                     <li>
                    	<a href="javascript:void(0)">
                            <i class="fa fa-desktop" aria-hidden="true"></i>
                            <span class="nav-label">数据管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="index/engCfListUI">&nbsp;处方头表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engCfItemListUI">&nbsp;处方明细表</a>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="index/engCfDiagnoseListUI">&nbsp;处方诊断表</a>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="index/engRegisterListUI">&nbsp;挂号信息表</a>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="index/engCfItemFeeListUI">&nbsp;处方收费表</a>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="index/engCfDrugSendListUI">&nbsp;处方发药明细表</a>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="index/engOrderListUI">&nbsp;医嘱头表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engOrderDrugListUI">&nbsp;医嘱明细表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engOrderDiagnoseListUI">&nbsp;医嘱诊断表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engOrderOperationListUI">&nbsp;医嘱手术表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engOrderCostListUI">&nbsp;医嘱费用结算表</a>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="index/engOrderInfectionListUI">&nbsp;医嘱患者感染及病理表</a>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="index/engOrderExamineListUI">&nbsp;医嘱检查表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engOrderDrugExecuteListUI">&nbsp;医嘱执行表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engOrderDrugSendListUI">&nbsp;医嘱发药表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engOrderFeeDetailListUI">&nbsp;医嘱收费明细表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/drugCatalogListUI">&nbsp;药品目录表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/drugConvertListUI">&nbsp;药品单位转换表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engDepartmentListUI">&nbsp;科室信息表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engDoctorListUI">&nbsp;医生信息表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/adminRouteListUI">&nbsp;给药途径表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/adminFrequencyListUI">&nbsp;给药频率表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engAllergyListUI">&nbsp;过敏药物表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/engOrderDetailCheckListUI">&nbsp;住院药嘱明细校验表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/orderDailyListUI">&nbsp;住院每日统计表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/orderPatientDailyFeeListUI">&nbsp;住院患者每日收费统计表</a>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="index/orderPatientDailySendDrugListUI">&nbsp;住院患者每日发药统计表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/orderDrugDailyFeeListUI">&nbsp;住院药品每日收费统计表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/orderDrugDailySendDrugListUI">&nbsp;住院患者药品每日发药统计表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/cfDailyListUI">&nbsp;门诊每日统计表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/cfPatientDailyFeeListUI">&nbsp;门诊患者每日收费统计表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/cfPatientDailySendDrugListUI">&nbsp;门诊患者每日发药统计表</a>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="index/cfDrugDailyFeeListUI">&nbsp;门诊药品每日收费统计表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/cfDrugDailySendDrugListUI">&nbsp;门诊药品每日发药统计表</a>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="index/cfDoctorDailyListUI">&nbsp;门诊医生每日就诊统计表</a>
                            </li>
                        </ul>
                    </li>               
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="javascript:void(0)"><i class="fa fa-bars"></i> </a>
                    </div>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i></button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                         <a href="index/mainUI" class="active J_menuTab" data-id="index/mainUI">首页</a> 
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i></button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span></button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive">
                            <a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll">
                            <a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther">
                            <a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="index/mainUI" frameborder="0" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2017</div>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
    <!-- 全局js -->
    <script src="static/js/jquery.min.js?v=2.1.4"></script>
    <script src="static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="static/js/plugins/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script type="text/javascript" src="static/js/hplus.js?v=4.1.0"></script>
    <script type="text/javascript" src="static/js/contabs.js"></script>
    <!-- 第三方插件 -->
    <script type="text/javascript" src="static/js/plugins/pace/pace.min.js"></script>
    <!-- 自定义js -->
    <script type="text/javascript" src="static/js/my/main.js"></script>
</body>
</html>