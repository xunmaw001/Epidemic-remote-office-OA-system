<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zh-cn">

<head>
	<%@ include file="../../static/head.jsp"%>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
    window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
  	<style>
		.error{
			color:red !important;
		}
	</style>
<body class="materialdesign">
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- Header top area start-->
    <div class="wrapper-pro">
        <%@ include file="../../static/sidebar.jsp"%>
        <!-- Header top area start-->
        <div class="content-inner-all">
           <%@ include file="../../static/headerTop.jsp"%>
            <!-- Header top area end-->
            <!-- Breadcome start-->
            <div class="breadcome-area mg-b-30 small-dn">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcome-list shadow-reset">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="breadcome-heading">

                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <ul class="breadcome-menu">
                                            <li><a href="${pageContext.request.contextPath}/index.jsp">主页</a> <span class="bread-slash">/</span>
                                            </li>
                                            <li><span class="bread-blod">收藏表</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcome End-->
         
            <!-- Breadcome start-->

            <!-- Breadcome End-->
            <!-- Basic Form Start -->
            <div class="basic-form-area mg-b-15">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="sparkline12-list shadow-reset mg-t-30">
                                <div class="sparkline12-hd">
                                    <div class="main-sparkline12-hd">
                                        <h1>收藏表 编辑</h1>
                                        <div class="sparkline12-outline-icon">
                                            <span class="sparkline12-collapse-link"><i class="fa fa-chevron-up"></i></span>
                                            <span><i class="fa fa-wrench"></i></span>
                                            <span class="sparkline12-collapse-close"><i class="fa fa-times"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="sparkline12-graph">
                                    <div class="basic-login-form-ad">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="all-form-element-inner">
                                                    <form id="addOrUpdateForm" action="#">
                                                        <input id="updateId" name="id" type="hidden">   
                                                        <div class="form-group-inner">
                                                            <div class="row">
                                                                <div class="col-lg-3">
                                                                    <label class="login2 pull-right pull-right-pro">用户id</label>    
                                                                                                                                </div>
                                                                <div class="col-lg-2">
                                                                <input id="userid" name="userid" class="form-control" placeholder="用户id">
                                                                                                                                </div>
                                                            </div>
                                                        </div>
                                                                                                            <div class="form-group-inner">
                                                            <div class="row">
                                                                <div class="col-lg-3">
                                                                    <label class="login2 pull-right pull-right-pro">收藏id</label>    
                                                                                                                                </div>
                                                                <div class="col-lg-2">
                                                                <input id="refid" name="refid" class="form-control" placeholder="收藏id">
                                                                                                                                </div>
                                                            </div>
                                                        </div>
                                                                                                            <div class="form-group-inner">
                                                            <div class="row">
                                                                <div class="col-lg-3">
                                                                    <label class="login2 pull-right pull-right-pro">表名</label>    
                                                                                                                                </div>
                                                                <div class="col-lg-2">
                                                                <input id="tablename" name="tablename" class="form-control" placeholder="表名">
                                                                                                                                </div>
                                                            </div>
                                                        </div>
                                                                                                            <div class="form-group-inner">
                                                            <div class="row">
                                                                <div class="col-lg-3">
                                                                    <label class="login2 pull-right pull-right-pro">收藏名称</label>    
                                                                                                                                </div>
                                                                <div class="col-lg-2">
                                                                <input id="name" name="name" class="form-control" placeholder="收藏名称">
                                                                                                                                </div>
                                                            </div>
                                                        </div>
                                                                                                            <div class="form-group-inner">
                                                            <div class="row">
                                                                <div class="col-lg-3">
                                                                    <label class="login2 pull-right pull-right-pro">收藏图片</label>    
                                                                                                                                </div>
                                                                <div class="col-lg-2">
                                                                    <img id="pictureImg" src="" width="100" height="100">
                                                                    <input name="file" type="file" id="pictureupload" class="form-control-file">
                                                                    <label id="pictureFileName">{{ruleForm.picture}}</label>
                                                                    <input name="picture" id="picture-input" type="hidden">  
                                                                                                                                </div>
                                                            </div>
                                                        </div>
                                                                                                                        
                                                                                                                                                                                                                                                                    
													                                                                                                                                                                                                                
													                                                                                                                                                                                                                
													                                                                                                                                                                                                                
													                                                                                                                                                                <div class="form-group-inner">
                                                            <div class="login-btn-inner">
                                                                <div class="row">
                                                                    <div class="col-lg-3"></div>
                                                                    <div class="col-lg-9">
                                                                        <div class="login-horizental cancel-wp pull-left">
                                                                            <button id="submitBtn" class="btn btn-sm btn-primary login-submit-cs" type="button">提交</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Basic Form End-->

        </div>
    </div>
    <!-- Footer Start-->
   
    <!-- Footer End-->
    <!-- Chat Box Start-->
    <!-- Chat Box End-->
	<%@ include file="../../static/foot.jsp"%>
     <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
    <script>
        <%@ include file="../../utils/menu.jsp"%>
		<%@ include file="../../static/setMenu.js"%>
		<%@ include file="../../utils/baseUrl.jsp"%>   

        var tableName = "storeup";
		var pageType = "add-or-update";
		var updateId = "";
		var crossTableId = -1;
		var crossTableName = '';
		var ruleForm = {};
		var crossRuleForm = {};
																													
					      				      				      				      				      	
																											        var ruleForm = {};
		var vm = new Vue({
		  el: '#addOrUpdateForm',
		  data:{
			  ruleForm : {},
			},
		  beforeCreate: function(){
			  var id = window.sessionStorage.getItem("id");
				if(id != null && id != "" && id != "null"){
					http("storeup/info/" + id,"GET",{},(res)=>{
						if(res.code == 0){
							vm.ruleForm = res.data;
						}
					});
				}
			},
			methods: { }
	  	});
		// 文件上传
		function upload(){
																																								$('#pictureupload').fileupload({
						url: baseUrl + 'file/upload',
						headers:{ token: window.sessionStorage.getItem("token")},
						dataType: 'json',
						done: function (e, data) {
							document.getElementById('picture-input').setAttribute('value',baseUrl+"upload/"+data.result.file);
							if(document.getElementById('pictureFileName') != null){
								document.getElementById('pictureFileName').innerHTML = data.result.file +"";
							}						
							$("#pictureImg").attr("src",baseUrl+"upload/"+data.result.file);
							
							
						}
					});
									}  
		// 表单提交
		function submit() {
			if(validform() ==true && compare() == true){
				let data = {};
				getContent();
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) { 
							data[item.name] = item.value;
						});
				let json = JSON.stringify(data);
				//console.log('json : ',json);
				var urlParam;
				var successMes = '';
				let flag = true;
				if(updateId!=null && updateId!="null" && updateId!=''){
					urlParam = 'update';
					successMes = '修改成功';
				}else{
					
					urlParam = 'save';
					successMes = '添加成功';
				}
				httpJson("storeup/"+urlParam,"POST",data,(res)=>{
					if(res.code == 0){
						window.sessionStorage.removeItem('id');
																																																																													if(flag){
							alert(successMes);
						}
						if(window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true"){
							window.sessionStorage.removeItem('onlyme');
							window.location.href="${pageContext.request.contextPath}/index.jsp";
						}else{
							window.location.href="list.jsp";
						}
					}
				});
			}else{
				alert("表单未填完整或有错误");
			}
		}
		// 填充富文本框
		function setContent(){
																																			}  
		// 获取富文本框内容
		function getContent(){
																																			}
		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({ 
				rules: {
					           				       			 	           										    refid: {
														},
						       			 	           										    tablename: {
														},
						       			 	           										    name: {
															required: true,
														},
						       			 	           										    picture: {
															required: true,
														},
						       			 					},
				messages: {
																													refid: {
														},
																								tablename: {
														},
																								name: {
															required: "收藏名称不能为空",
														},
																								picture: {
															required: "收藏图片不能为空",
														},
															}
			}).form();
		}
		// 添加表单校验方法
		function addValidation(){
			jQuery.validator.addMethod("isPhone", function(value, element) {
					var length = value.length;
					var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
					return this.optional(element) || (length == 11 && mobile.test(value));
			}, "请填写正确的手机号码");
			jQuery.validator.addMethod("isIdCardNo", function(value, element) {
				return this.optional(element) || idCardNoUtil.checkIdCardNo(value);
			}, "请正确输入您的身份证号码");
		}
		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if(id != null && id != "" && id != "null"){
				updateId = id;
				window.sessionStorage.removeItem('id');
				http("storeup/info/" + id,"GET",{},(res)=>{
					if(res.code == 0){
						ruleForm = res.data
						// 是/否下拉框回显
						setSelectOption();
						// 设置图片src
						showImg();
						// 数据填充
						dataBind();							
																																																																																			// 富文本框回显														
						setContent();	
						//注册表单验证
						$(validform());  		
					}
				});
			}else{
																																																	
								//注册表单验证
		    	$(validform());  
			}
		}
		// 是/否 下拉框选项回显
		function setSelectOption(){
																																								}
		// 关联下拉框改变
		function lvSelectChange(level){
			let data = {};
			let value = $('#addOrUpdateForm').serializeArray();
			$.each(value, function (index, item) { 
			            data[item.name] = item.value;
			        });
																																									
		}
		// 清除可能会重复渲染的selection
		function clear(className){
			var elements = document.getElementsByClassName(className);
        	for(var i = elements.length - 1; i >= 0; i--) { 
        	  elements[i].parentNode.removeChild(elements[i]); 
        	}
		}
		function dateTimePick(){
			$.fn.datetimepicker.dates['zh-CN'] = { 
		            days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
		            daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
		            daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
		            months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		            monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		            today: "今天",
		            suffix: [],
		            meridiem: ["上午", "下午"]
		    };
																																								}

																											
		function calculation(){
			//积
			var x = 0;
			//和
			var y = 0;
			var flag = 0;
																																								}
		function calculationSE(colName){
			//单列求和接口
			http("storeup"+colName,"GET",{
				tableName: "storeup",
				columnName: colName
			},(res)=>{
				if(res.code == 0){
					$("#"+colName).attr("value",res.data);
				}
			});
		}

		function calculationPre(){
			//进入该页面就填充"单列求和"的列
																																								}
		
				
		function dataBind(){
			$("#updateId").val(ruleForm.id);	
												$("#userid").val(ruleForm.userid);	
																$("#refid").val(ruleForm.refid);	
																$("#tablename").val(ruleForm.tablename);	
																$("#name").val(ruleForm.name);	
																$("#picture").val(ruleForm.picture);	
									}
		//图片显示
		function showImg(){
																																								var pictureFileName = "\"" + ruleForm.picture + "\"";
					$("#pictureImg").attr("src",ruleForm.picture);
									}		
        //跨表

        //跨表
        function crossTable(){
            crossTableName = window.sessionStorage.getItem('crossTableName');
			crossTableId = window.sessionStorage.getItem('crossTableId');
            if(crossTableName != null && crossTableName != '' && crossTableId != null && crossTableId != '' && crossTableId != -1){
				http(crossTableName + "/info/" + crossTableId,"GET",{},(res)=>{
					if(res.code == 0){
						crossRuleForm = res.data;
						$('#updateId').val(crossTableId);
												if(res.data != null && res.data != '' && res.data.userid != null && res.data.userid != ''){

															$("#userid").val(res.data.userid);
													}
												if(res.data != null && res.data != '' && res.data.refid != null && res.data.refid != ''){

															$("#refid").val(res.data.refid);
													}
												if(res.data != null && res.data != '' && res.data.tablename != null && res.data.tablename != ''){

															$("#tablename").val(res.data.tablename);
													}
												if(res.data != null && res.data != '' && res.data.name != null && res.data.name != ''){

															$("#name").val(res.data.name);
													}
												if(res.data != null && res.data != '' && res.data.picture != null && res.data.picture != ''){

															$("#pictureImg").attr("src",res.data.picture);
								$("#picture-input").val(res.data.picture);
													}
											}
				});  
            }
            window.sessionStorage.removeItem('crossTableName');
			window.sessionStorage.removeItem('crossTableId');
        }
		//跨表更新字段
		function crossTableUpdate(){
			let flag = crossTableUpdateValidation();
			if(flag){
				httpJson(crossTableName + "/update","POST",{
					id: crossTableId,
																																																																},(res)=>{
					if(res.code == 0){
						console.log('跨表更新成功');
						return true;
					}
				});   
			}
			return false;
		}

		//跨表更新前验证
		function crossTableUpdateValidation(){
			//防止减法导致库存负值
																																									return true;
		}
				
		function readonly(){
			if(window.sessionStorage.getItem('role') != '管理员'){
				$('#jifen').attr('readonly','readonly');
				$('#money').attr('readonly','readonly');
			}
		}		

		//比较大小
		function compare(){
			var largerVal = null;
			var smallerVal = null;
																																				if(largerVal !=null && smallerVal != null){
				if(largerVal<=smallerVal){
					alert(smallerName+'不能大于等于'+largerName);
					return false;
				}
			}
			return true;
		}	


		// 用户登出
        <%@ include file="../../static/logout.jsp"%>
		$(document).ready(function() { 
			setMenu();
			dateTimePick();
			addValidation();          
			getDetails();
			upload();
			calculationPre();
			$('#submitBtn').on('click', function(e) {
			    e.preventDefault();
			    //console.log("点击了...提交按钮");
			    submit();
			});
			//跨表
			crossTable();
			<%@ include file="../../static/myInfo.js"%>
			readonly();
		});

    </script>
</body>

</html>