<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>重置密码</title>
		<link rel="stylesheet" href="../../assets/css/relys/login.css">
	</head>
	<body>
		<div class="container" id="app">
			<div class="loginBox">
				<h3>重置密码</h3>
				<form id="loginForm">
					<div class="input-wrapper">
						<label>账号:</label>
						<input v-model="username" type="email" name="" placeholder="请输入账号">
					</div>
					<div class="input-wrapper">
						<label>原密码:</label>
						<input v-model="oldpassword" type="password" name="" placeholder="密码">
					</div>
					<div class="input-wrapper">
						<label>新密码:</label>
						<input v-model="mima" type="password" name="" placeholder="密码">
					</div>
				</form>
				<a href="../login/login.jsp">去登录</a>
				<button type="button" @click="userReset">重置</button>
			</div>
		</div>
		<script src="../../assets/js/relys/jquery.js"></script>
		<script src="../../assets/js/relys/vue.js"></script>
		<script src="../../assets/js/api/api.js"></script>
		<script src="../../assets/js/api/defaultuser.js"></script>
				<script type="text/javascript">
			var app = new Vue({
				el: "#app",
				data: {
					username: "",
					oldpassword: "",
					mima: "",
					user: {
						id: "",
						biaoti: "",
						xiangqing: "",
						tupian: "",
					}
				},
				created(){
					session("qiandaopingtai", (res) => {
						if(res&&res.code==0){
							for(var key in res.data){
								this.user[key] = res.data[key]
							}
						}
					})
				},
				methods: {
					userReset(){
						this.user.mima = this.mima
						updateUser('qiandaopingtai', this.user, function(res) {
							if(res&&res.code==0){
								alert("密码修改成功")
								window.location.href = '../login/login.jsp'
							}
						})
					}
				}
			})
			function onPageTap(url) {
				console.log(url)
				window.location.href = url;
			}
		</script>

	</body>
</html>
