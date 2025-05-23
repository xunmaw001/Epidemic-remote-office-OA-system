<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" href="../../assets/css/relys/login.css">
	</head>
	<body>
		<div class="container" id="app">
			<div class="loginBox">
				<h3>登录</h3>
				<form id="loginForm">
					<div class="input-wrapper">
						<label>账号:</label>
						<input v-model="username" type="email" name="" placeholder="请输入账号">
					</div>
					<div class="input-wrapper">
						<label>密码:</label>
						<input v-model="password" type="password" name="" placeholder="密码">
					</div>
				</form>
				<div style="display: flex;justify-content: space-between;">
					<div style="display: flex;flex-flow: column;line-height: 25px;">
					</div>
				</div>
				<div class="checkbox" style="display: flex;margin-top: 20px;">
						<div style="margin-right: 40px;display: flex;align-items: center;">
						  <input style="width: 15px;margin: 0;margin-right: 10px;" type="radio" value="yuangongxinxi" v-model="pick">员工信息
						</div>
				</div>
				<button type="button" @click="userLogin">登录</button>
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
					pick: "",
					yuangongxinxi: "yuangonggonghao",
					yuangongxinxizn: "员工信息",
					username: '',
					password: ''
				},
				methods: {
					userLogin(){
						if(!this.pick){
							alert("请选择登录用户")
							return
						}

						var data = {
							username: this.username,
							password: this.password,
							mima: this.password,
						}
						data[`${this[this.pick]}`] = this.username
						login(`${this.pick}`, data, (res)=>{
							if(res.code==0){
								alert("登录成功")
								localStorage.setItem('Token', res.token)
								localStorage.setItem("role", this[`${this.pick}zn`].split("信息")[0])
								localStorage.setItem('sessionTable', this.pick)
								localStorage.setItem('adminName', this.username)
								session(this.pick, (res) => {
									if(res.code==0){
										var userid = res.data.id
										localStorage.setItem('userid', userid)
										window.parent.location.href = `../../index.jsp`
									}
								})
							}
						})
					}
				}
			})
		</script>

	</body>
</html>
