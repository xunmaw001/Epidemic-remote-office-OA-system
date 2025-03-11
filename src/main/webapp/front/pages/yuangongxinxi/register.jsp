<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
		<link rel="stylesheet" href="../../assets/css/relys/login.css">
	</head>
	<body>
		<div class="container" id="app">
			<div class="loginBox">
				<h3>注册</h3>
				<form id="loginForm">
					<div class="input-wrapper">
						<label>员工工号:</label>
						<input v-model="yuangonggonghao" type="text" name="" placeholder="请输入员工工号">
					</div>
					<div class="input-wrapper">
						<label>员工姓名:</label>
						<input v-model="yuangongxingming" type="text" name="" placeholder="请输入员工姓名">
					</div>
					<div class="input-wrapper">
						<label>密码:</label>
						<input v-model="mima" type="text" name="" placeholder="请输入密码">
					</div>
					<div class="input-wrapper">
						<label>部门:</label>
						<input v-model="bumen" type="text" name="" placeholder="请输入部门">
					</div>
					<div class="input-wrapper">
						<label>岗位:</label>
						<input v-model="gangwei" type="text" name="" placeholder="请输入岗位">
					</div>
					<div class="input-wrapper">
						<label>联系电话:</label>
						<input v-model="lianxidianhua" type="text" name="" placeholder="请输入联系电话">
					</div>
					<div class="input-wrapper">
						<label>身份证:</label>
						<input v-model="shenfenzheng" type="text" name="" placeholder="请输入身份证">
					</div>
					<div class="input-wrapper">
						<label>家庭住址:</label>
						<input v-model="jiatingzhuzhi" type="text" name="" placeholder="请输入家庭住址">
					</div>
				</form>
				<a href="../login/login.jsp">已有账号？去登录</a>
				<button type="button" @click="userRegister">注册</button>
			</div>
		</div>
		<script src="../../assets/js/relys/jquery.js"></script>
		<script src="../../assets/js/relys/vue.js"></script>
		<script src="../../assets/js/api/api.js"></script>
		<script src="../../assets/js/api/defaultuser.js"></script>
			<script src="../../assets/js/validate.js"></script>
		<script type="text/javascript">
			var app = new Vue({
				el: "#app",
				data: {
					"yuangonggonghao": "",
					"yuangongxingming": "",
					"mima": "",
					"bumen": "",
					"gangwei": "",
					"lianxidianhua": "",
					"shenfenzheng": "",
					"jiatingzhuzhi": "",
				},
				methods: {
					userRegister(){
					if(!isMobile(this.lianxidianhua)){
						alert(`联系电话应输入电话格式`);
						return
					}
					if(!checkIdCard(this.shenfenzheng)){
						alert(`身份证应输入身份证格式`);
						return
					}
						var data = {
							"yuangonggonghao": this.yuangonggonghao,
							"yuangongxingming": this.yuangongxingming,
							"mima": this.mima,
							"bumen": this.bumen,
							"gangwei": this.gangwei,
							"lianxidianhua": this.lianxidianhua,
							"shenfenzheng": this.shenfenzheng,
							"jiatingzhuzhi": this.jiatingzhuzhi,
						}
						register('yuangongxinxi', data, function(res){
							if(res.code==0){
								alert('注册成功')
								window.parent.location.href = '../login/login.jsp'
							}
						})
					}
				}
			})
		</script>
	</body>
</html>
