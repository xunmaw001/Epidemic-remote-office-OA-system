<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>首页</title>
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
			.product-content a {
				width: 100%;
			}

			.product-content a h5 {
				width: 100%;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
			}
			.product-thumb{
				width: 100%;
				height: 0;
				padding-top: 60%;
				position: relative;
			}
			.post-thumb {
			    position: relative;
			    height: 0;
			    padding-top: 100%;
			}
			.product-thumb img, .post-thumb a img{
				width: 100%;
				position: absolute;
				top: 0;
				object-fit: cover;
				height: 100%;
			}
			.banner{
				width: 80%;
				margin: 100px auto 0 auto;
				border-radius: 10px;
				overflow: hidden;
				height: 400px;
			}
		</style>
	</head>
	<body>
		<div id="app">
			<!-- Banner Section Start Here -->
			<section class="banner banner-2" v-if="banners.length>0">
				<div class="banner-slider">
					<div class="swiper-wrapper">
						<div class="swiper-slide" v-for="item in banners">
							<div class="container">
								<div class="banner-item">
									<div class="banner-inner">
										<div class="banner-thumb">
											<img :src="item.value" alt="banner-slider" style="width: 100%;height: 100%;object-fit: cover;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="banner-pagination"></div>
				</div>
			</section>
			<!-- Banner Section Ending Here -->
			<!-- product section start here -->
			<section class="product-section product-style2 padding-tb" style="padding-bottom: 0;">
				<div class="container">
					<div class="section-header">
						<h3>请假平台</h3>
						<p @click="onPageTap('../qingjiapingtai/list.jsp')">查看更多</p>
					</div>
					<div class="section-wrapper">
						<div class="row">
							<div class="col-lg-3 col-md-6 col-12" v-for="(item, i) in qingjiapingtaiList">
								<div class="product-item-2">
									<div class="product-inner">
										<div class="product-thumb" v-if="item.tupian">
											<img :src="item.tupian.split(',')[0]" alt="product">
										</div>
										<div class="product-content">
											<a :href="`javascript: onPageTap('../qingjiapingtai/detail.jsp?id=${item.id}')`">
												<h5>{{item.biaoti}}</h5>
											</a>
											<div class="cart-option">
												<a :href="`javascript: onPageTap('../qingjiapingtai/detail.jsp?id=${item.id}')`" class="lab-btn"><span>查看详情</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="text-center">
							<a href="javascript: onPageTap('../qingjiapingtai/list.jsp')" class="lab-btn"><span>查看更多</span></a>
						</div>
					</div>
				</div>
			</section>
			<section class="product-section product-style2 padding-tb" style="padding-bottom: 0;">
				<div class="container">
					<div class="section-header">
						<h3>办公设备</h3>
						<p @click="onPageTap('../bangongshebei/list.jsp')">查看更多</p>
					</div>
					<div class="section-wrapper">
						<div class="row">
							<div class="col-lg-3 col-md-6 col-12" v-for="(item, i) in bangongshebeiList">
								<div class="product-item-2">
									<div class="product-inner">
										<div class="product-thumb" v-if="item.tupian">
											<img :src="item.tupian.split(',')[0]" alt="product">
										</div>
										<div class="product-content">
											<a :href="`javascript: onPageTap('../bangongshebei/detail.jsp?id=${item.id}')`">
												<h5>{{item.shebeimingcheng}}</h5>
											</a>
											<div class="cart-option">
												<a :href="`javascript: onPageTap('../bangongshebei/detail.jsp?id=${item.id}')`" class="lab-btn"><span>查看详情</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="text-center">
							<a href="javascript: onPageTap('../bangongshebei/list.jsp')" class="lab-btn"><span>查看更多</span></a>
						</div>
					</div>
				</div>
			</section>
			<section class="blog-section padding-tb">
				<div class="container">
					<div class="section-header">
						<h3>公告信息</h3>
						<p>News And Information</p>
					</div>
					<div class="section-wrapper">
						<div class="row justify-content-center">
							<div class="col-xl-4 col-md-6 col-12" v-for="(item, i) in news" :key="i">
								<div class="post-item">
									<div class="post-inner">
										<div class="post-thumb">
											<a :href="`javascript: onPageTap('../news/news-detail.jsp?id=${item.id}&tablename=news')`"><img :src="item.picture" alt="" /></a>
											<div class="meta-date">
												<div class="md-pre">
													<h5>ORDER</h5>
													<p>{{i+1}}</p>
												</div>
											</div>
										</div>
										<div class="post-content">
											<a :href="`javascript: onPageTap('../news/news-detail.jsp?id=${item.id}&tablename=news')`">
												<h5>{{item.title}}</h5>
											</a>
											<div class="text-btn">
												<a class="read-more" :href="`javascript: onPageTap('../news/news-detail.jsp?id=${item.id}&tablename=news')`">阅读更多</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<script src="../../assets/js/relys/jquery.js"></script>
			<script src="../../assets/js/relys/wow.min.js"></script>
			<script src="../../assets/js/relys/swiper.min.js"></script>
			<script src="../../assets/js/relys/fontawesome.min.js"></script>
			<script src="../../assets/js/relys/bootstrap.min.js"></script>
			<script src="../../assets/js/relys/vue.js"></script>
			<script src="../../assets/js/api/api.js"></script>
			<script src="../../assets/js/api/shop.js"></script>
			<script src="../../assets/js/api/tplist.js"></script>
			<script src="../../assets/js/api/defaultuser.js"></script>
			<div id="script"></div>
		</body>
		<script type="text/javascript">
			function onPageTap(url){
				window.location.href = url;
			}
			var app = new Vue({
				el: "#app",
				data: {
					banners: [],
					qingjiapingtaiList: [],
					bangongshebeiList: [],
					news: [],
				},
				methods: {
					onPageTap(url) {
						window.location.href = url;
					},
				},
				created() {
					tpPage("config",(res) => {
						this.banners = res.data.list
						if(this.banners.length==0){
							this.banners.push({value: "../../assets/images/banner/01.jpg"})
						}else{
							this.banners.forEach(item => {
								if(!item.value){
									item.value = "../../assets/images/banner/01.jpg"
								}
							})
						}
						this.$nextTick(() => {
							var swiper = new Swiper('.banner-slider', {
							    slidesPerView: 1,
							    autoplay: {
							    	autoplay: true,
							        delay: 10000,
							        disableOnInteraction: false,
							    },
							    pagination: {
							        el: '.banner-pagination',
							        clickable: true,
							    },
							    loop: true,
							});
						})
					})
					tplist("news", 1, 100, false, false, (res) => {
						this.news = res.data.list
					})
					recommend('qingjiapingtai', false, (res) => {
						if (res.code == 0) {
							this.qingjiapingtaiList = res.data.list
						}
					})
					recommend('bangongshebei', false, (res) => {
						if (res.code == 0) {
							this.bangongshebeiList = res.data.list
						}
					})
				}
			})
		</script>
</html>
