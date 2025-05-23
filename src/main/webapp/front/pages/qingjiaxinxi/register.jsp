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
						<label>标题:</label>
						<input v-model="biaoti" type="text" name="" placeholder="请输入标题">
					</div>
					<div class="input-wrapper">
						<label>员工工号:</label>
						<input v-model="yuangonggonghao" type="text" name="" placeholder="请输入员工工号">
					</div>
					<div class="input-wrapper">
						<label>员工姓名:</label>
						<input v-model="yuangongxingming" type="text" name="" placeholder="请输入员工姓名">
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
					"biaoti": "",
					"yuangonggonghao": "",
					"yuangongxingming": "",
				},
				methods: {
					userRegister(){
						var data = {
							"biaoti": this.biaoti,
							"yuangonggonghao": this.yuangonggonghao,
							"yuangongxingming": this.yuangongxingming,
						}
						register('qingjiaxinxi', data, function(res){
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
