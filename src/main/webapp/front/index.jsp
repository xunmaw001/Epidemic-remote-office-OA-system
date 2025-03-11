<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
	<head>
		<title>疫情居家办公OA系统</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- google fonts -->
		<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap"
		 rel="stylesheet">
		<link rel="shortcut icon" type="image/x-icon" href="assets/images/x-icon/agricul.png">

		<link rel="stylesheet" href="assets/css/relys/animate.css">
		<link rel="stylesheet" href="assets/css/relys/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/relys/all.min.css">
		<link rel="stylesheet" href="assets/css/relys/icofont.min.css">
		<link rel="stylesheet" href="assets/css/relys/lightcase.css">
		<link rel="stylesheet" href="assets/css/relys/swiper.min.css">
		<link rel="stylesheet" href="assets/css/relys/style.css">
		<link rel="stylesheet" type="text/css" href="assets/css/icons.css"/>
		<link rel="stylesheet" href="assets/css/tableft.css">
		<style>
			html, body {
		        height: 100%;
		        overflow: auto;
		        margin: 0;
		    }

		    html {
		        overflow: scroll;
		    }
			/* 客服 */
			.kefu-area {
			  height: 100%;
			  display: flex;
			  flex-direction: column;
			  position: fixed;
			  width: 100%;
			  height: 100%;
			  top: 0;
			  left: 0;
			  z-index: 10000000;
			  background-color: #fff;
			}
			.kefu-area .top-bar {
			  background-color: #ffffff;
			  border-bottom: solid 1px #d6d6d6;
			  display: flex;
			  justify-content: space-between;
			  align-items: center;
			  padding: 0px 40px;
			}
			.kefu-area .top-bar .user-info {
			  display: grid;
			  grid-template-columns: auto minmax(0, 1fr);
			  grid-template-rows: 1fr 1fr;
			  grid-template-areas: "user-image user-name" "user-image user-status";
			  align-items: center;
			}
			.kefu-area .top-bar .user-info .user-head {
			  grid-area: user-image;
			  margin-right: 20px;
			}
			.kefu-area .top-bar .user-info .user-head:after {
			  display: none;
			}
			.kefu-area .top-bar .user-info .name {
			  grid-area: user-name;
			  font-size: 23px;
			  position: relative;
			  top: 6px;
			}
			.kefu-area .top-bar .user-info .status {
			  grid-area: user-status;
			  font-size: 12px;
			  display: flex;
			  align-items: center;
			  position: relative;
			  top: -3px;
			}
			.kefu-area .top-bar .user-info .status:before {
			  content: '';
			  width: 10px;
			  height: 10px;
			  display: block;
			  border-radius: 50%;
			  background-color: #f95b55;
			  margin-right: 5px;
			}
			.kefu-area .top-bar .user-info .status.online:before {
			  background-color: #01e777;
			}
			.kefu-area .top-bar .user-info .status.away:before {
			  background-color: #fda14c;
			}
			.kefu-area .top-bar .user-info .status.offline:before {
			  background-color: #f95b55;
			}
			.kefu-area .top-bar .user-info .status:after {
			  content: 'online';
			}
			.kefu-area .top-bar .buttons svg {
			  height: 25px;
			  fill: #c0c2c3;
			}
			.kefu-area .top-bar .buttons div {
			  cursor: pointer;
			}
			.kefu-area .top-bar .buttons div:hover > svg {
			  fill: #363e47;
			}
			.kefu-area .messages {
			  height: calc(100% - 160px);
			  display: flex;
			  flex-direction: column;
			  overflow-y: scroll;
			}
			.kefu-area .messages .date-split {
			  text-align: center;
			  color: #afafaf;
			  display: flex;
			  justify-content: center;
			  align-items: center;
			}
			.kefu-area .messages .date-split:before, .kefu-area .messages .date-split:after {
			  content: '';
			  display: block;
			  height: 1px;
			  width: 100px;
			  background-color: #c4c3c3;
			}
			.kefu-area .messages .date-split:before {
			  margin-right: 20px;
			}
			.kefu-area .messages .date-split:after {
			  margin-left: 20px;
			}
			.kefu-area .messages .message {
			  display: flex;
			  margin: 20px;
			  position: relative;
			}
			.kefu-area .messages .message .user-head:after {
			  display: none;
			}
			.kefu-area .messages .message:after {
			  content: '';
			  width: 0;
			  height: 0;
			  border-style: solid;
			  border-width: 0 20px 15px 0;
			  border-color: transparent #ffffff transparent transparent;
			  position: absolute;
			  left: 59px;
			}
			.kefu-area .messages .message .content {
			  max-width: 70%;
			  width: fit-content;
			  height: fit-content;
			  background-color: #fff;
			  padding: 15px;
			  border-radius: 0 10px 10px 10px;
			  margin-left: 30px;
			  color: #626c76;
			}
			.kefu-area .messages .message.fromme {
			  flex-direction: row-reverse;
			}
			.kefu-area .messages .message.fromme:after {
			  border-width: 15px 20px 0 0;
			  border-color: #01e777 transparent transparent transparent;
			  right: 59px;
			  left: unset;
			}
			.kefu-area .messages .message.fromme .content {
			  border-radius: 10px 0px 10px 10px;
			  margin-left: unset;
			  margin-right: 30px;
			  background-color: #01e777;
			  color: #fff;
			}
			.kefu-area .bottom-bar {
			  background-color: #ffffff;
			  height: 80px;
			  width: 100%;
			  display: flex;
			  justify-content: space-between;
			  align-items: center;
			  position: fixed;
			  bottom: 0;
			  left: 0;
			}
			.kefu-area .bottom-bar .msg-input {
			  width: calc(100% - 160px);
			  margin: 30px;
			  height: 40px;
			  border-radius: 30px;
			  border: 0px;
			  background-color: #ececec;
			  padding: 10px 15px 0px 15px;
			  font-size: 18px;
			}
			.kefu-area .bottom-bar .msg-input::placeholder {
			  color: #c5c5c5;
			}
			.kefu-area .bottom-bar .send-button {
			  box-sizing: content-box;
			  width: 30px;
			  height: 30px;
			  background-color: #0091e9;
			  padding: 10px;
			  border-radius: 50%;
			  margin-right: 20px;
			  cursor: pointer;
			}
			.kefu-area .bottom-bar .send-button:hover {
			  background-color: #1cc1f3;
			}
			.kefu-area .bottom-bar .send-button:active {
			  background-color: #0091e9;
			}
			.kefu-area .bottom-bar .send-button svg {
			  fill: white;
			  position: relative;
			  left: 1px;
			  top: 2px;
			  width: 25px;
			  height: 25px;
			}
			.kefu-area .user-head {
			  width: 49px;
			  height: 49px;
			}
			.kefu-area .user-head img {
			  border-radius: 50%;
			  width: 49px;
			  height: 49px;
			}
			.kefu-area .user-head:after {
			  content: '';
			  display: block;
			  position: relative;
			  width: 11px;
			  height: 11px;
			  background-color: #f95b55;
			  bottom: 19px;
			  right: -33px;
			  border-radius: 50%;
			  border: solid 3px #363e47;
			}
			.kefu-area .user-head.online:after {
			  background-color: #01e777;
			}
			.kefu-area .user-head.away:after {
			  background-color: #fda14c;
			}
		</style>
	</head>
	<body>
	<div id="app">
		<div>
		<!-- Wrapper -->
		<div id="wrapper">
			<!-- sidebar -->
			<div class="main_sidebar">
			
				<!-- sidebar Menu -->
				<div class="sidebar">
					<div class="sidebar_innr" data-simplebar>
						<div class="sections">
							<h3> 导航菜单 </h3>
							<ul>
								<li :class="item.url==url?'active':''" v-for="(item, i) in navs" :key="i">
									<a v-if="!item.window" :href="`javascript: onPageTap('${item.url}')`"><span>{{item.name}}</span> </a>
									<a v-if="item.window" :href="item.url" target="view_window"><span>{{item.name}}</span> </a>
									<ul v-if="item.children.length>0">
										<li>
											<a :href="`javascript: onPageTap('${item.url}')`">{{item.name}}</a>
										</li>
										<li>
											<a v-for="(ele, idx) in item.children" :key="idx" :href="`javascript: onPageTap('${ele.url}')`">{{ele.name}}</a>
										</li>
									</ul>
			
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<!-- header -->
			<div id="main_header">
				<header>
			
					<!-- Logo-->
					<i class="header-traiger uil-bars" uk-toggle="target: #wrapper ; cls: collapse-sidebar mobile-visible"></i>
			
					<!-- Logo-->
					<div id="logo">疫情居家办公OA系统</div>
			
					<!-- user icons -->
					<div class="head_user">
						<a href="pages/login/login.jsp" class="btn-upgrade uk-visible@s"> <i class="uil-bolt-alt"></i> 登录</a>
					</div>
				</header>
			</div>
		</div>
		<!-- desktop menu ending here -->
		<!-- iframe start here -->
		<iframe src="pages/home/home.jsp/" frameborder="0" scrolling="no" id="main" width="100%" onload="test(this)"></iframe>
		<!-- iframe ending here -->
		<!-- footer section start here -->
		
		<footer class="footer-section padding-tb pb-0" style="padding: 40px">
			<div class="footer-bottom">
				<p>&copy; 2020<a href="index.jsp" target="_blank"><span>疫情居家办公OA系统</span></a>All Rights Reserved By<a href="#" target="_blank"><span>jiuling</span></a></p>
			</div>
		</footer>
	</div>
	</div>

		<script src="assets/js/relys/jquery.js"></script>
		<script src="assets/js/relys/fontawesome.min.js"></script>
		<script src="assets/js/relys/waypoints.min.js"></script>
		<script src="assets/js/relys/bootstrap.min.js"></script>
		<script src="assets/js/relys/wow.min.js"></script>
		<script src="assets/js/relys/swiper.min.js"></script>
		<script src="assets/js/relys/jquery.countdown.min.js"></script>
		<script src="assets/js/relys/jquery.counterup.min.js"></script>
		<script src="assets/js/relys/isotope.pkgd.min.js"></script>
		<script src="assets/js/relys/lightcase.js"></script>
		<script src="assets/js/relys/functions.js"></script>
		<script src="assets/js/relys/vue.js"></script>
		<script src="assets/js/api/api.js"></script>
		<script src="assets/js/api/defaultuser.js"></script>
		<script src="assets/js/api/tplist.js"></script>
		<script type="text/javascript">
			var app = new Vue({
				el: "#app",
				data: {
					liuyan: "",
					hstoken: false,
					url: '',
					navs: [
						{
							name: '首页',
							url: './pages/home/home.jsp',
							children: []
						},
						{
							name: '签到平台模块'.split('模块')[0],
							url: './pages/qiandaopingtai/list.jsp',
							children: [
							]
						},
						{
							name: '请假平台模块'.split('模块')[0],
							url: './pages/qingjiapingtai/list.jsp',
							children: [
							]
						},
						{
							name: '办公设备模块'.split('模块')[0],
							url: './pages/bangongshebei/list.jsp',
							children: [
							]
						},
						{
							name: '个人中心',
							url: './pages/personal/personal.jsp',
							yanzheng: true,
							children: [
								{
									name: '我的收藏',
									url: './pages/storeup/list.jsp',
								},
							]
						}
					]
				},
				created() {
							var obj = [
								{
									menuname: "签到平台列表".split('列表')[0],
									menutable: "qiandaopingtai",
									buttons: [
										"查看",
										"签到",
									]
								},
								{
									menuname: "请假平台列表".split('列表')[0],
									menutable: "qingjiapingtai",
									buttons: [
										"查看",
										"请假",
									]
								},
								{
									menuname: "办公设备列表".split('列表')[0],
									menutable: "bangongshebei",
									buttons: [
										"查看",
										"申请",
									]
								},
							]
					localStorage.setItem("daohangmenus", JSON.stringify(obj))
					var obj2 = {
						yuangongxinxi: [
							{
								menuname: "签到信息列表".split('列表')[0],
								menutable: "qiandaoxinxi",
								buttons: [
									"查看",
									"删除",
								]
							},
							{
								menuname: "设备申请信息列表".split('列表')[0],
								menutable: "shebeishenqingxinxi",
								buttons: [
									"查看",
									"修改",
									"删除",
								]
							},
							{
								menuname: "请假信息列表".split('列表')[0],
								menutable: "qingjiaxinxi",
								buttons: [
									"查看",
									"修改",
									"删除",
								]
							},
						],
					}
					localStorage.setItem("frontRoleMenus", JSON.stringify(obj2))
					this.navs.push({
						name: '后台管理',
						url: adminurl+"login",
						window: true,
						children: []
					})
				},
				methods: {
					onPageTap(url) {
						$('#main').attr('src', url);
					},
				}
			})
			
			//获取子页面的高度
			function reinitIframe() {
				var childPageH = $('#main').contents().find('#app').height();
				$('#main').height(childPageH);
			}
			window.setInterval("reinitIframe()", 200);

			function onPageTap(url) {
				$('#main').attr('src', url);
			}
			function test(that){
				that.height = 0
				app.url=$('#main').attr('src')
				console.log(app.url)
			}
			setInterval(function() {
				var token = localStorage.getItem('Token')
				app.hstoken = token ? true : false
			}, 1000)
			$('.sidebar_innr ul li a').on('click', function (e) {
				if ($(this).closest("li").children("ul").length) {
					if ($(this).closest("li").is(".active-submenu")) {
						$('.sidebar_innr ul li').removeClass('active-submenu');
					} else {
						$('.sidebar_innr ul li').removeClass('active-submenu');
						$(this).parent('li').addClass('active-submenu');
					}
					e.preventDefault();
				}
			});
		</script>
	</body>
</html>
