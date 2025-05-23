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
						<label>设备编号:</label>
						<input v-model="shebeibianhao" type="text" name="" placeholder="请输入设备编号">
					</div>
					<div class="input-wrapper">
						<label>设备名称:</label>
						<input v-model="shebeimingcheng" type="text" name="" placeholder="请输入设备名称">
					</div>
					<div class="input-wrapper">
						<label>数量:</label>
						<input v-model="shuliang" type="text" name="" placeholder="请输入数量">
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
					"shebeibianhao": "",
					"shebeimingcheng": "",
					"shuliang": "",
				},
				methods: {
					userRegister(){
					if(!isIntNumer(this.shuliang)){
						alert(`数量应输入整数`);
						return
					}
						var data = {
							"shebeibianhao": this.shebeibianhao,
							"shebeimingcheng": this.shebeimingcheng,
							"shuliang": this.shuliang,
						}
						register('bangongshebei', data, function(res){
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
