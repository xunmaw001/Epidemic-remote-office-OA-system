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
						<label>用户id:</label>
						<input v-model="userid" type="text" name="" placeholder="请输入用户id">
					</div>
					<div class="input-wrapper">
						<label>收藏id:</label>
						<input v-model="refid" type="text" name="" placeholder="请输入收藏id">
					</div>
					<div class="input-wrapper">
						<label>表名:</label>
						<input v-model="tablename" type="text" name="" placeholder="请输入表名">
					</div>
					<div class="input-wrapper">
						<label>收藏名称:</label>
						<input v-model="name" type="text" name="" placeholder="请输入收藏名称">
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
					"userid": "",
					"refid": "",
					"tablename": "",
					"name": "",
				},
				methods: {
					userRegister(){
						if(!this.userid){
							alert(`用户id不能为空`);
							return
						}
						if(!this.name){
							alert(`收藏名称不能为空`);
							return
						}
						if(!this.picture){
							alert(`收藏图片不能为空`);
							return
						}
						var data = {
							"userid": this.userid,
							"refid": this.refid,
							"tablename": this.tablename,
							"name": this.name,
						}
						register('storeup', data, function(res){
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
