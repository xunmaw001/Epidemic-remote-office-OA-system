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
		<link rel="stylesheet" type="text/css" href="../../assets/css/relys/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="../../assets/css/relys/style.css"/>
		<link rel="stylesheet" type="text/css" href="style.css"/>
		<style type="text/css">
			.product-thumbnail img {
				width: 130px;
				height: 130px;
				object-fit: cover;
			}

			.wc-proceed-to-checkout button,
			.save-btn {
				padding: 0 30px;
				line-height: 45px;
				background-color: #252525;
				text-align: center;
				border: 0;
				color: #fff;
				margin-top: 40px;
				box-sizing: border-box;
			}

			.save-btn {
				background-color: #1a73e8;
				padding: 0 50px;
				box-sizing: border-box;
			}

			.wc-proceed-to-checkout button:hover,
			.save-btn:hover {
				background-color: #1a73e8;
			}

			.select {
				background: #fff none repeat scroll 0 0;
				border: 1px solid #e5e5e5;
				border-radius: 0;
				height: 42px;
				padding: 0 0 0 10px;
				width: 100%;
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
						<h4 class="ph-title">{{id?'地址编辑':'新增地址'}}</h4>
						<ul class="agri-ul">
							<li><a href="index.jsp">首页</a></li>
							<li><a class="active">{{id?'地址编辑':'新增地址'}} </a></li>
						</ul>
					</div>
				</div>
			</section>
			<!-- Page Header Section Ending Here -->
			<!-- checkout-area start -->
			<div class="checkout-area">
				<div class="container">
					<div class="row" style="display: flex;justify-content: center;">
						<div class="col-md-6">
							<div class="checkbox-form" style="padding-top: 90px;">
								<h3 style="margin-bottom: 50px;">{{id?'地址编辑':'新增地址'}} </h3>
								<div class="row">
									<div class="col-md-12">
										<div class="checkout-form-list">
											<label>联系人<span class="required">*</span></label>
											<input v-model="detail.name" type="text" placeholder="请填写联系人" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="checkout-form-list">
											<label>手机号码<span class="required">*</span></label>
											<input v-model="detail.phone" type="text" placeholder="请输入手机号码" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="checkout-form-list">
											<label>地址<span class="required">*</span></label>
											<input type="text" placeholder="请选择地址" id="id_address_input" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="checkout-form-list">
											<label>详细地址<span class="required">*</span></label>
											<input type="text" placeholder="请填写详细地址" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="checkout-form-list">
											<label>是否默认</label>
											<select v-model="detail.isdefault" class="form-control select">
												<option value="否">否</option>
												<option value="是">是</option>
											</select>
										</div>
									</div>
									<div class="col-md-12">
										<button class="save-btn" type="button" @click="onSubmitTap">保存</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- checkout-area end -->
		</div>
		<!-- jquery latest version -->
		<script src="../../assets/js/relys/jquery.js"></script>
		<!-- vue.js -->
		<script src="../../assets/js/relys/vue.js"></script>
		<!-- 工具类 -->
		<script src="../../assets/js/relys/utils.js"></script>
		<!-- 异步请求 -->
		<script src="../../assets/js/api/api.js"></script>
		<!-- 相关接口 -->
		<script src="../../assets/js/api/shop-address.js"></script>
		<!-- bootstrap js -->
		<script src="../../assets/js/relys/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca04cee7ac952691aa67a131e6f0cee0"></script>
		<script type="text/javascript" src="../../assets/js/relys/bootstrap.AMapPositionPicker.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#id_address_input").AMapPositionPicker();
			});
			var app = new Vue({
				el: '#app',
				data: {
					detail: {},
					id: ''
				},
				created() {
					var id = getParam('id')
					if (id) {
						this.id = id;
						var _this = this;
						addressInfo(id, function(res) {
							_this.detail = res.data;
							$("#id_address_input").val(res.data.address);
						})
					}
				},
				methods: {
					onSubmitTap() {
						this.detail.address = $('#id_address_input').val();
						if (this.id) {
							addressUpdate(this.detail, function(res) {
								alert('操作成功')
								window.location.href = './address-list.jsp'
							})
						} else {
							addressSave(this.detail, function(res) {
								alert('操作成功')
								window.location.href = './address-list.jsp'
							})
						}
					}
				}
			})
		</script>
	</body>
</html>
