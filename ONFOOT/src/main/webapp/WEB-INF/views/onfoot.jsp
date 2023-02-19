<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<link href="/resources/css/styles.css" rel="stylesheet" />
	
<%@include file="fragments/header.jsp"%>


<body id="page-top">
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<img class="masthead-avatar mb-5" src="/resources/assets/img/sneaker.svg" />
			<h1 class="masthead-heading text-uppercase mb-0">ONFOOT</h1>
		</div>
	</header>
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<a href="#"><img class="button-svg" src="/resources/assets/img/plus.svg" /></a>
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Sneakers</h2>
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="row justify-content-center">
				<!-- Sneakers Item -->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto">
						<img class="img-fluid" src="/resources/assets/img/sneakers/cabin.png" />
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="fragments/footer.jsp"%>