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

		<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap"
		 rel="stylesheet">
		<link rel="shortcut icon" type="image/x-icon" href="../../assetsimages/x-icon/agricul.png">
		<link rel="stylesheet" href="../../assets/css/relys/animate.css">
		<link rel="stylesheet" href="../../assets/css/relys/bootstrap.min.css">
		<link rel="stylesheet" href="../../assets/css/relys/all.min.css">
		<link rel="stylesheet" href="../../assets/css/relys/icofont.min.css">
		<link rel="stylesheet" href="../../assets/css/relys/lightcase.css">
		<link rel="stylesheet" href="../../assets/css/relys/swiper.min.css">
		<link rel="stylesheet" href="../../assets/css/relys/style.css">
		<style type="text/css">
			.product-thumbnail img {
				width: 130px;
				height: 130px;
				object-fit: cover;
			}

			.product-add-to-cart button {
				padding: 0 30px;
				line-height: 40px;
				background-color: #252525;
				text-align: center;
				border: 0;
				color: #fff;
			}

			.product-add-to-cart button:first-of-type {
				margin-bottom: 10px;
			}

			.product-add-to-cart button:last-of-type {
				margin-bottom: 0px;
			}

			.product-add-to-cart button:hover {
				background-color: #fe4847;
			}

			.product-name,
			.product-address {
				max-width: 125px;
			}

			.order-tab {
				width: 100%;
				height: 50px;
				display: flex;
				justify-content: center;
				background-color: #222;
			}

			.order-tab li {
				background-color: #222;
				color: #fff;
				font-size: 18px;
				line-height: 50px;
				width: 100px;
				text-align: center;
				cursor: default;
			}

			.order-tab li:hover {
				color: #fe4847;
			}

			.order-tab li.active {
				color: #FE4847;
			}
		</style>
	</head>
	<body>
		<div id="app">
			<!-- page-title-area start -->
			<div class="page-title-area">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="title-heading text-center">
								<h1>试卷列表</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- page-title-area end -->
			<div class="shop-cart padding-tb">
				<div class="container">
					<div class="section-wrapper">
						<div class="cart-top">
							<table>
								<thead>
									<tr>
										<th class="product-name"><span class="nobr">试卷名称</span></th>
										<th class="product-price"><span class="nobr"> 考试时间 </span></th>
										<th class="product-address"><span class="nobr"> 创建时间 </span></th>
										<th class="product-add-to-cart"><span class="nobr">操作</span></th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(item, i) in list">
										<td class="product-name"><span class="amount">{{item.name}}</span></td>
										<td class="product-price"><span class="amount">{{item.time/60}}分钟</span></td>
										<td class="product-price"><span class="amount">{{item.addtime}}</span></td>
										<td class="product-add-to-cart">
											<button @click="onExamTap(item)">考试</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="paginations">
							<ul class="agri-ul d-flex flex-wrap justify-content-center" id="paginator">
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
		<script src="../../assets/js/relys/jquery.js"></script>
		<script src="../../assets/js/relys/fontawesome.min.js"></script>
		<script src="../../assets/js/relys/waypoints.min.js"></script>
		<script src="../../assets/js/relys/bootstrap.min.js"></script>
		<script src="../../assets/js/relys/wow.min.js"></script>
		<script src="../../assets/js/relys/swiper.min.js"></script>
		<script src="../../assets/js/relys/jquery.countdown.min.js"></script>
		<script src="../../assets/js/relys/jquery.counterup.min.js"></script>
		<script src="../../assets/js/relys/isotope.pkgd.min.js"></script>
		<script src="../../assets/js/relys/lightcase.js"></script>
		<script src="../../assets/js/relys/functions.js"></script>
		<script src="../../assets/js/relys/vue.js"></script>
		<script src="../../assets/js/api/api.js"></script>
		<script src="../../assets/js/api/tplist.js"></script>
		<!-- 相关接口 -->
		<script src="../../assets/js/api/shop-address.js"></script>
		<script src="../../assets/js/relys/jq-paginator.min.js"></script>
		<script type="text/javascript">
			// 初始化 分页
			// var page_s1 = createPage('#pagechange');
			var app = new Vue({
				el: '#app',
				data: {
					list: [],
					showFlag: false,
					page: 1,
					limit: 16,
					total: 0
				},
				async created() {
					var data = await this.pageList()
					this.pageFun(data)
				},
				methods: {
					pageList() {
						var _this = this;
						return new Promise((resolve) => {
							goodsList('exampaper', this.page, this.limit, "", "", (res) => {
								_this.list = res.data.list
								_this.total = res.data.total
								resolve(res.data)
							})
						})

					},
					pageFun(data) {
						var that = this
						$('#paginator').jqPaginator({
							totalPages: data.totalPage,
							visiblePages: 7,
							currentPage: that.page,
							prev: '<li class="d-none d-sm-block"><a href="javascript: pageFun()">&lt;</a></li>',
							next: '<li class="d-none d-sm-block"><a href="javascript: pageFun()">&gt;</a></li>',
							page: `<li class="d-none d-sm-block"><a href="javascript: pageFun()">{{page}}</a></li>`,
							onPageChange: function(num, type) {
								that.page.page = num
							}
						});
					},
					onExamTap(item) {
						let userid = localStorage.getItem("userid");
						httpJson(`examrecord/deleteRecords?userid=${userid}&paperid=${item.id}`, 'post', {}, function(res) {
							window.parent.location.href = `./exam.jsp?id=${item.id}`;
						});
					},
				}
			})

			function pageFun() {
				app.pageList()
			}
			// var app = new Vue({
			// 	el: "#app",
			// 	data: {
			// 		group: false,
			// 		first: true,
			// 		list: [],
			// 		page: {
			// 			page: 1,
			// 			limit: 16,
			// 			total: 0
			// 		}
			// 	},
			// 	methods: {
			// 		onExamTap(item) {
			// 			let userid = localStorage.getItem("userid");
			// 			httpJson(`examrecord/deleteRecords?userid=${userid}&paperid=${item.id}`, 'post', {}, function(res) {
			// 				window.parent.location.href = `./exam.jsp?id=${item.id}`;
			// 			});
			// 		},
			// 		onPageTap(url) {
			// 			window.location.href = url;
			// 		},
			// 		getList() {
			// 			return new Promise((resolve) => {
			// 				goodsList('exampaper', this.page.page, this.page.limit, "", "", (res) => {
			// 					if (res.code == 0) {
			// 						this.$nextTick(() => {
			// 							this.list = res.data.list
			// 							this.page.total = res.data.total
			// 							var that = this
			// 							// 设置分页
			// 							setPage(page_s1, {
			// 								pageTotal: that.page.total, // 数据总条数   
			// 								pageSize: that.page.limit, // 每页显示条数
			// 								pageCurrent: that.page.page, //  当前页
			// 								maxBtnNum: 5, // 最多按钮个数  （最少5个）
			// 								change: function(e) { // 页数变化回调函数（返回当前页码）
			// 									$('#pagechange').jsp(e)
			// 									that.page.page = e
			// 									that.getList()
			// 								},
			// 							})
			// 							resolve(res.data)
			// 						})
			// 					}
			// 				})
			// 			})
			// 		},
			// 	},
			// 	async created() {
			// 		this.getList()
			// 	}
			// })
		</script>

		<!-- all js here -->
		<!-- bootstrap js -->
		<script src="../../assets/js/relys/bootstrap.min.js"></script>
		<!-- owl.carousel js -->
		<script src="../../assets/js/relys/owl.carousel.min.js"></script>
		<!-- meanmenu js -->
		<script src="../../assets/js/relys/jquery.meanmenu.js"></script>
		<!-- jquery-ui js -->
		<script src="../../assets/js/relys/jquery-ui.min.js"></script>
		<!-- wow js -->
		<script src="../../assets/js/relys/wow.min.js"></script>
		<!-- plugins js -->
		<script src="../../assets/js/relys/plugins.js"></script>
		<!-- main js -->
		<script src="../../assets/js/relys/main.js"></script>
	</body>
</html>
