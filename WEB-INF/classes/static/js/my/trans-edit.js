$(document).ready(function () {
	$.ajax({
        type: 'POST',
        async: false,
        url: 'kettle/kRepository/getAllList',
        data: {},
        success: function (datas) {
        	var data = datas.data;
        	for (var i=0; i<data.length; i++){
        		$("#transRepositoryId").append('<option value="' + data[i].id + '">' + data[i].repositoryName + '</option>');
        	}
        },
        error: function () {
            alert("请求失败！请刷新页面重试");
        },
        dataType: 'json'
    });	 
	$.ajax({
        type: 'POST',
        async: false,
        url: 'kettle/kQuartz/getAllList',
        data: {},
        success: function (datas) {
        	var data = datas.data;
        	for (var i=0; i<data.length; i++){
        		$("#transQuartz").append('<option value="' + data[i].id + '">' + data[i].quartzDescription + '</option>');
        	}
        },
        error: function () {
            alert("请求失败！请刷新页面重试");
        },
        dataType: 'json'
    });	
	$("#customerQuarz").cronGen({
    	direction : 'left'
	});
	reset();
});

var reset = function(){
	var transId = $("#transId").val();
	$.ajax({
        type: 'POST',
        async: false,
        url: 'kettle/kTrans/getTrans',
        data: {
        	id : transId
        },
        success: function (datas) {
        	var Trans = datas.data;
        	$("#transRepositoryId").find("option[value=" + Trans.transRepositoryId + "]").prop("selected",true);
        	$("#transPath").val(Trans.transPath);
        	$("#transName").val(Trans.transName);
        	$("#transQuartz").find("option[value=" + Trans.transQuartz + "]").prop("selected",true);
        	$("#transLogLevel").find("option[value=" + Trans.transLogLevel + "]").prop("selected",true);
        	$("#transDescription").val(Trans.transDescription);      	
        },
        error: function () {
            alert("请求失败！请刷新页面重试");
        },
        dataType: 'json'
    });
}

$("#changeQuartz").click(function(){
	$("#default").toggle();
	$("#custom").toggle();
	//$("#transQuartz").val("");
	$("#customerQuarz").val("");
});
$.validator.setDefaults({
	highlight: function (element) {
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function (element) {
        element.closest('.form-group').removeClass('has-error').addClass('has-success');
    },
    errorElement: "span",
    errorPlacement: function (error, element) {
        if (element.is(":radio") || element.is(":checkbox")) {
            error.appendTo(element.parent().parent().parent());
        } else {
            error.appendTo(element.parent());
        }
    },
    errorClass: "help-block m-b-none",
    validClass: "help-block m-b-none"	
});
$().ready(function () {
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#RepositoryTransForm").validate({
        rules: {
        	transName: {
        		required: true,
        		maxlength: 50
        	},
        	transLogLevel: {
        		required: true,
        	},
        	transDescription: {
        		maxlength: 500
        	}
        },
        messages: {
        	transName: {
        		required: icon + "请输入转换名称",
        		maxlength: icon + "转换名称不能超过50个字符"
        	},
        	transLogLevel: {
        		required: icon + "请选择转换的日志记录级别",
        	},
        	transDescription: {
        		maxlength: icon + "转换描述不能超过500个字符"
        	}
        },
        submitHandler:function(form){
        	$.post("kettle/kTrans/update", decodeURIComponent($(form).serialize(),true), function(data){
    			if(data.httpStatus == "200"){
    				layer.msg('更新成功',{
            			time: 2000,
            			icon: 6
            		});              		
            		setTimeout(function(){
            			location.href = "index/listTransUI";
            		},2000);
    			}else {
    				layer.msg(data.message, {icon: 2}); 
    			}
    		});
        } 
    });
});

var cancel = function(){
	location.href = "index/listTransUI";
}