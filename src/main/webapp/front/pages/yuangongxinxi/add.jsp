<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>boo02</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="../../assetsimages/x-icon/agricul.png">
<link rel="stylesheet" href="../../assets/css/relys/animate.css">
<link rel="stylesheet" href="../../assets/css/relys/bootstrap.min.css">
<link rel="stylesheet" href="../../assets/css/relys/all.min.css">
<link rel="stylesheet" href="../../assets/css/relys/icofont.min.css">
<link rel="stylesheet" href="../../assets/css/relys/lightcase.css">
<link rel="stylesheet" href="../../assets/css/relys/swiper.min.css">
<link rel="stylesheet" href="../../assets/css/relys/style.css">
<!--
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
-->
<link rel="stylesheet" href="../../layui/css/layui.css">
<style type="text/css">
	.layui-form-label{
		width: 100px;
	}
	.form-box{
		padding-top: 90px;
		padding-bottom: 20px;
		width: 100%;
		background-color: #f8f8f8;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.form-box .form-content{
		width: 80%;
		height: auto;
		background: #FFF;
		padding: 40px 10%;
		position: relative;
		box-sizing: border-box;
	}
	.form-box .form-content .close-btn{
		position: absolute;
		width: auto!important;
		padding: 10px;
		background: #CCCCCC!important;
		color: #444;
		top: 40px;
		right: 10%;
	}
	.form-box .form-content .close-btn:hover{
		width: auto!important;
		padding: 10px;
		background: #CCCCCC!important;
	}
	.form-box .form-content h3{
		width: 100%;
		text-align: center;
		margin-bottom: 40px;
	}
	.form-box .form-content .input-item{
		margin-bottom: 20px;
		display: flex;
	}
	.form-box .form-content .input-item input{
		height: 50px;
		line-height: 50px;
		flex: 1;
	}
	.form-box .form-content .input-item .input-name{
		padding: 0;
		width: 100px;
		height: 50px;
		line-height: 50px;
	}
	.form-box .form-content .input-item img{
		width: 150px;
		height: 150px;
		border-radius: 10px;
		margin-left: 20px;
		object-fit: cover;
	}
	.form-box .form-content button{
		background: #FE4847;
		color: #fff;
		border: 0;
		width: 100%;
	}
	.form-box .form-content button:hover {
		background: #292929;
		color: #fff;
	}
	.layui-upload-img{
		width: 100px;
		height: 100px;
		object-fit: cover;
	}
</style>
</head>
<body>
<div id="app">
	<div class="form-box layui-form" lay-filter="layform">
		<div class="form-control form-content">
			<h3>员工信息填写</h3>
			<div>
				<div class="layui-form-item">
					<label class="layui-form-label">员工工号</label>
					<div class="layui-input-block">
						<input v-model="detail.yuangonggonghao" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入员工工号" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">员工姓名</label>
					<div class="layui-input-block">
						<input v-model="detail.yuangongxingming" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入员工姓名" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input v-model="detail.mima" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入密码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">请选择性别</label>
					<div class="layui-input-block">
						<select id="xingbie" name="interest" lay-filter="xingbie">
							<option :value="item" v-for="(item,index) in xingbieOptions">{{item}}</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">部门</label>
					<div class="layui-input-block">
						<input v-model="detail.bumen" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入部门" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">岗位</label>
					<div class="layui-input-block">
						<input v-model="detail.gangwei" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入岗位" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">联系电话</label>
					<div class="layui-input-block">
						<input v-model="detail.lianxidianhua" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入联系电话" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">身份证</label>
					<div class="layui-input-block">
						<input v-model="detail.shenfenzheng" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入身份证" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">照片</label>
					<div class="layui-input-block">
						<button type="button" class="layui-btn" id="zhaopianupload-img" v-if="!detail.zhaopian">上传图片</button>
						<div class="layui-upload-list" v-if="detail.zhaopian">
							<img class="layui-upload-img" id="zhaopianimg-temp" :src="detail.zhaopian?detail.zhaopian.split(',')[0]:''">
							<p id="demoText"></p>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">家庭住址</label>
					<div class="layui-input-block">
						<input v-model="detail.jiatingzhuzhi" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入家庭住址" class="layui-input">
					</div>
				</div>
			</div>
			<button style="margin-bottom: 20px;" type="button" class="btn btn-default" @click="onConfirmTap">提交</button>
		</div>
	</div>
</div>
<script src="../../assets/js/relys/jquery.js"></script>
<script src="../../assets/js/relys/vue.min.js"></script>
<script src="../../assets/js/api/api.js"></script>
<script src="../../assets/js/api/tplist.js"></script>
<script src="../../assets/js/api/defaultuser.js"></script>
<script src="../../assets/js/relys/utils.js"></script>
<script src="../../assets/js/relys/storage.js"></script>
<script src="../../layui/layui.js"></script>
<script src="../../assets/js/validate.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca04cee7ac952691aa67a131e6f0cee0"></script>
<script type="text/javascript" src="../../assets/js/relys/bootstrap.AMapPositionPicker.js"></script>
<div id="script"></div>
<script type="text/javascript">
	var app = new Vue({
		el: "#app",
		data: {
			crosstable: "",
			crosstableobj: {},
			detail: {
				yuangonggonghao: "",
				yuangongxingming: "",
				mima: "",
				xingbie: "",
				bumen: "",
				gangwei: "",
				lianxidianhua: "",
				shenfenzheng: "",
				zhaopian: "",
				jiatingzhuzhi: "",
			},
			xingbieOptions: [],
		},
		computed: {
		},
		updated() {
			layui.form.render('select','layform');
		},
		async created() {
			var id = getParam('id')
			var tablename = getParam('tablename')
			this.crosstable = tablename
			if(tablename){
				var cross = JSON.parse(localStorage.getItem("crossObj"))
				this.crosstableobj = cross
				for(var key in cross){
					if("yuangonggonghao" == key){
						this.detail[key] = cross[key]
					}
					if("yuangongxingming" == key){
						this.detail[key] = cross[key]
					}
					if("mima" == key){
						this.detail[key] = cross[key]
					}
					if("xingbie" == key){
						this.detail[key] = cross[key]
					}
					if("bumen" == key){
						this.detail[key] = cross[key]
					}
					if("gangwei" == key){
						this.detail[key] = cross[key]
					}
					if("lianxidianhua" == key){
						this.detail[key] = cross[key]
					}
					if("shenfenzheng" == key){
						this.detail[key] = cross[key]
					}
					if("zhaopian" == key){
						this.detail[key] = cross[key]
					}
					if("jiatingzhuzhi" == key){
						this.detail[key] = cross[key]
					}
				}
			}else if(id){
				await this.getDetail(id, tablename)
			}
			

			this.xingbieOptions = "男,女".split(',')
		},
		methods: {
			onPageTap(url) {
				window.location.href = url
			},
			updateTap(tablename, data){
				return new Promise((resolve) => {
					updateFun(tablename, data, (res) => {
						if(res&&res.code==0){
							console.log("更新成功")
							resolve(res)
						}
					})
				})
				
			},
			onConfirmTap(){
			if(!isMobile(this.detail.lianxidianhua)){
				alert(`联系电话应输入电话格式`);
				return
			}
			if(!checkIdCard(this.detail.shenfenzheng)){
				alert(`身份证应输入身份证格式`);
				return
			}
				addFun("yuangongxinxi", this.detail, (res) => {
					if(res&&res.code==0){
						alert("提交成功")
						window.history.go(-1)
					}
				})
			},
			getDetail(tablename, id) {
				return new Promise((resolve) => {
				goodsInfo(tablename, id, (res) => {
					this.detail = res.data
					resolve(res)
				})
				})
			}
		}
	})
 	$(function(){









		layui.use('upload', function(){
			var $ = layui.jquery
			,upload = layui.upload;
			//普通图片上传
			var uploadInst = upload.render({
				elem: '#zhaopianupload-img'
				,url: baseurl+"file/upload" //改成您自己的上传接口
				,headers: {
					Token: getStorage("Token")
				}
				,before: function(obj){
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result){
					$('#zhaopianimg-temp').attr('src', result); //图片链接（base64）
					});
				}
				,done: function(res){
					//如果上传失败
					if(res.code > 0){
					return layer.msg('上传失败');
					}else{
						app.detail.zhaopian = baseurl+"/upload/"+res.file
						return layer.msg('上传成功');
					}
					//上传成功
				}
			})
		});

		layui.use(['form','layedit'], function(){
			var form = layui.form,
				layedit = layui.layedit,
				$ = layui.jquery,
				layer = layui.layer;
				
			form.on('select(xingbie)', function(data){
				app.detail.xingbie = data.value
			});
		});
	});
</script>
</body>
</html>
