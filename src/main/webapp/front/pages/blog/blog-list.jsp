<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
			            <h4 class="ph-title">留言板</h4>
			            <ul class="agri-ul">
			                <li><a>首页</a></li>
			                <li><a class="active">留言板</a></li>
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
			                    <div id="comments" class="comments">
			                        <ul class="agri-ul comment-list">
			                            <li class="comment" id="li-comment-1" v-for="item in list">
			                                <div class="com-thumb">
			                                    <img alt="" src="../../assets/images/author.jpg"class="avatar avatar-90 photo" height="90" width="90">          
			                                </div>
			                                <div class="com-content">
			                                    <div class="com-title">
			                                        <div class="com-title-meta">
			                                            <h6>{{item.username}}</h6>
			                                        </div>
			                                    </div>
												<p>{{item.content}}</p>
												<p v-if="item.reply">回复：{{item.reply}}</p>
			                                </div>
			                            </li>
			                        </ul>
			                    </div>
			                </div>
							<div class="paginations">
								<ul class="agri-ul d-flex flex-wrap justify-content-center" id="paginator">
								</ul>
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
		<script src="../../assets/js/relys/vue.js"></script>
		<script src="../../assets/js/api/api.js"></script>
		<script src="../../assets/js/api/tplist.js"></script>
		<script src="../../assets/js/relys/jq-paginator.min.js"></script>
		<script type="text/javascript">
			var app = new Vue({
				el: "#app",
				data: {
					page: {
						page: 1,
						limit: 20,
					},
					list: []
				},
				async created(){
					var data = await this.getList()
					this.pageFun(data)
				},
				methods: {
					getList(){
						return new Promise((resolve) => {
							httpJson(`messages/list?page=${this.page.page}&limit=${this.page.limit}`, "GET", "", (res) => {
								if(res&&res.code==0){
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
				}
			})
			function pageFun(){
				app.getList()
			}
		</script>
	</body>
</html>
