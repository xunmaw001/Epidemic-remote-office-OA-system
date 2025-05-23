<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">
		<link rel="shortcut icon" type="image/x-icon" href="../../assetsimages/x-icon/agricul.png">
		<link rel="stylesheet" href="../../assets/css/relys/animate.css">
		<link rel="stylesheet" href="../../assets/css/relys/bootstrap.min.css">
		<link rel="stylesheet" href="../../assets/css/relys/all.min.css">
		<link rel="stylesheet" href="../../assets/css/relys/icofont.min.css">
		<link rel="stylesheet" href="../../assets/css/relys/lightcase.css">
		<link rel="stylesheet" href="../../assets/css/relys/swiper.min.css">
		<link rel="stylesheet" href="../../assets/css/relys/style.css">
	</head>
	<body>
		<div id="app">
			<!-- Page Header Section Start Here -->
			<section class="page-header bg_img padding-tb">
			    <div class="overlay"></div>
			    <div class="container">
			        <div class="page-header-content-area">
			            <h4 class="ph-title">公告详情</h4>
			            <ul class="agri-ul">
			                <li><a>首页</a></li>
			                <li><a class="active">公告信息详情</a></li>
			            </ul>
			        </div>
			    </div>
			</section>
			<!-- Page Header Section Ending Here -->
			<!-- Blog Section Start Here -->
			<div class="blog-section blog-single padding-tb">
			    <div class="container">
			        <div class="section-wrapper">
			            <div class="row justify-content-center">
			                <div class="col-lg-12 col-12">
			                    <article>
			                        <div class="post-item-2">
			                            <div class="post-inner">
			                                <div class="post-thumb" v-if="detail.picture">
			                                    <img :src="detail.picture" alt="" />
			                                </div>
			                                <div class="post-content">
			                                    <h4>{{detail.title}}</h4>
			                                    <div v-html="detail.content"></div>
			                                </div>
			                            </div>
			                        </div>
			                    </article>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
		<script src="../../assets/js/relys/jquery.js"></script>
		<script src="../../assets/js/relys/vue.js"></script>
		<script src="../../assets/js/relys/vue.min.js"></script>
		<script src="../../assets/js/api/api.js"></script>
		<script src="../../assets/js/api/tplist.js"></script>
		<script src="../../assets/js/relys/utils.js"></script>
		<script type="text/javascript">
			var app = new Vue({
				el: "#app",
				data: {
					detail: {},
					id: "",
					tableName: ""
				},
				created(){
					var id = getParam('id')
					this.id = id
					var tablename = getParam('tablename')
					this.tableName = tablename
					console.log(this.tableName)
					tpDetail(this.tableName, id, (res) => {
						this.detail = res.data
					})
				}
			})
		</script>
	</body>
</html>
