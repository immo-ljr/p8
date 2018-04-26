$(document).ready(function () {
	$.ajax({
        type: 'POST',
        async: false,
        url: 'kettle/kQuartz/getAllList',
        data: {},
        success: function (datas) {
        	var data = datas.data;
        	for (var i=0; i<data.length; i++){
        		$("#wsQuartz").append('<option value="' + data[i].id + '">' + data[i].quartzDescription + '</option>');
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
	var transId = $("#wsId").val();
	$.ajax({
        type: 'POST',
        async: false,
        url: 'kettle/kWebservice/getWs',
        data: {
        	id : transId
        },
        success: function (datas) {
        	var ws = datas.data;
        	$("#name").val(ws.name);      	
        	$("#wsName").find("option[value=" + ws.wsName + "]").prop("selected",true);
        	$("#wsQuartz").find("option[value=" + ws.wsQuartz + "]").prop("selected",true);
        	$("#wsDescription").val(ws.wsDescription);      	
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
    $("#wsForm").validate({
        rules: {
        	wsName: {
        		required: true,
        	},
        	name: {
        		required: true,
        		maxlength: 50
        	},
        	transDescription: {
        		maxlength: 500
        	}
        },
        messages: {
        	transPath: {
        		required: icon + "请选择WS方法",
        	},
        	transName: {
        		required: icon + "请输入名称",
        		maxlength: icon + "名称不能超过50个字符"
        	},
        	transDescription: {
        		maxlength: icon + "描述不能超过500个字符"
        	}
        },
        submitHandler:function(form){
        	$.post("kettle/kWebservice/update", decodeURIComponent($(form).serialize(),true), function(data){
    			if(data.httpStatus == "200"){
    				layer.msg('更新成功',{
            			time: 2000,
            			icon: 6
            		});              		
            		setTimeout(function(){
            			location.href = "index/listWsUI";
            		},2000);
    			}else {
    				layer.msg(data.message, {icon: 2}); 
    			}
    		});
        } 
    });
});

var cancel = function(){
	location.href = "index/listWsUI";
}