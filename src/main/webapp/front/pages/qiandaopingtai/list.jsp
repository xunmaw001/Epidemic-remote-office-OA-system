<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>列表</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
			.img-box {
				width: 100%;
				height: 0;
				padding-top: 100%;
				position: relative;
				overflow: hidden;
			}

			.img-box img {
				width: 100%;
				position: absolute;
				top: 0;
				object-fit: cover;
				height: 100%;
			}
		</style>
	</head>
	<body>
		<div id="app">
			<!-- Page Header Section Start Here -->
			<section class="page-header bg_img padding-tb">
				<div class="overlay"></div>
				<div class="container">
					<div class="page-header-content-area">
						<h4 class="ph-title">签到平台列表</h4>
						<ul class="agri-ul">
							<li><a href="../../index.jsp">首页</a></li>
							<li><a class="active">签到平台列表</a></li>
						</ul>
					</div>
				</div>
			</section>
			<!-- Page Header Section Ending Here -->
			<!-- shop page Section Start Here -->
			<div class="shop-page padding-tb">
				<div class="container">
					<div class="section-wrapper">
						<div class="row justify-content-center">
							<div :class="group?'col-lg-9 col-12':'col-lg-12 col-12'">
								<article>
									<div class="shop-product-wrap grids row justify-content-center"style="justify-content: flex-start!important;">
										<div class="col-lg-4 col-md-6 col-12" v-for="(item, i) in list" @click="onPageTap(`./detail.jsp?id=${item.id}`)">
											<div class="product-item">
													<div class="img-box">
														<img :src="item.tupian.split(',')[0]" alt="shope">
													</div>
												<div class="product-content">
													<h6><a :href="`javascript: onPageTap('./detail.jsp?id=${item.id}')`">{{item.biaoti}}</a></h6>
												</div>
											</div>
										</div>
									</div>
									<div class="paginations">
										<ul class="agri-ul d-flex flex-wrap justify-content-center" id="paginator">
										</ul>
									</div>
								</article>
							</div>
							<div class="col-lg-3 col-md-7 col-12">
							    <aside>
							        <div class="widget widget-search">
							            <div class="widget-header">
							                <h5>关键词搜索</h5>
							            </div>
							            <form @submit.prevent="searchbiaotiTap" class="search-wrapper" style="margin-bottom: 20px;">
							                <input v-model="biaoti" type="text" name="s" placeholder="请输入标题">
							                <button type="submit"><i class="icofont-search-2"></i></button>
							            </form>
							        </div>
							    </aside>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- shop page Section ENding Here -->
		</div>
		<script src="../../assets/js/relys/jquery.js"></script>
		<script src="../../assets/js/relys/fontawesome.min.js"></script>
		<script src="../../assets/js/relys/bootstrap.min.js"></script>
		<script src="../../assets/js/relys/vue.js"></script>
		<script src="../../assets/js/api/api.js"></script>
		<script src="../../assets/js/api/tplist.js"></script>
		<script src="../../assets/js/relys/utils.js"></script>
		<script src="../../assets/js/relys/jq-paginator.min.js"></script>
		<div id="script"></div>
	</body>
	<script type="text/javascript">
		var app = new Vue({
			el: "#app",
			data: {
				group: false,
				first: true,
				list: [],
				page: {
					page: 1,
					limit: 9,
					total: 0
				},
				biaoti: "",
				searchname: '',
				searchval: '',
			},
			methods: {
				searchbiaotiTap(){
					this.page.page = 1
					this.searchname = "biaoti"
					this.searchval = this.biaoti
					this.getList(this.searchname, this.searchval)
				},
				onPageTap(url) {
					window.location.href = url;
				},
				getList(searchname, searchval) {
					return new Promise((resolve) => {
						goodsList('qiandaopingtai',this.page.page, this.page.limit, searchname, searchval, (res) => {
							if (res.code == 0) {
									this.list = res.data.list
									resolve(res.data)
							}
						})
					})
				},
				pageFun(data){
					var that = this
					$('#paginator').jqPaginator({
						totalPages: data.totalPage,
						visiblePages: 7,
						currentPage: that.page.page,
						prev: '<li class="d-none d-sm-block"><a href="javascript: pageFun()">&lt;</a></li>',
						next: '<li class="d-none d-sm-block"><a href="javascript: pageFun()">&gt;</a></li>',
						page: `<li class="d-none d-sm-block"><a href="javascript: pageFun()">{{page}}</a></li>`,
						onPageChange: function(num, type) {
							that.page.page = num
						}
					});
				}
			},
			async created() {
				setTimeout(() => {
					var scripts = [
						'../../assets/js/relys/wow.min.js',
						'../../assets/js/relys/swiper.min.js',
						'../../assets/js/relys/jquery.countdown.min.js',
						'../../assets/js/relys/jquery.counterup.min.js',
						'../../assets/js/relys/isotope.pkgd.min.js',
						'../../assets/js/relys/lightcase.js',
						'../../assets/js/relys/functions.js',
					]
					scripts.forEach(ele => {
						var new_element = document.createElement("script");
						new_element.setAttribute("type", "text/javascript");
						new_element.setAttribute("src", ele); // 在这里引入了a.js
						$('#script').append(new_element);
						})
					}, 500)
				var search = getParam('search')
				var searchname = 'biaoti'

				if(search){
					this.searchname = searchname
					this.searchval = search
				}
				var res = await this.getList(this.searchname, this.searchval)
				this.pageFun(res)
				this.group = true
			}
		})

		function onPageTap(url) {
			window.location.href = url;
		}
		
		function pageFun(){
			app.getList(false, false)
		}
	</script>
</html>
