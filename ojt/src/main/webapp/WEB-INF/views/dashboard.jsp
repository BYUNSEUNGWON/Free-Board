<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="includes/header.jsp" %>


  <div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-4">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title pull-left">전체 게시글수</h4>
						<small class="pull-right text-muted"><fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/></small>
					</header><!-- .widget-header -->

					<hr class="widget-separator">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="text-color m-t-xs m-b-md fw-600 fz-lg"><span data-plugin="counterUp"><fmt:formatNumber>${total}</fmt:formatNumber> </span></h3>
							<div class="text-primary">
								<i class="fa fa-long-arrow-up m-r-xs"></i>
								<sapn>33% from the last week</sapn>
							</div>
						</div>
						<div class="pull-right">
							<div class="m-t-md" data-plugin="sparkline" data-options="[8,12,4,12,10,13,16], { type: 'bar', chartRangeMin:0, height: 45, barColor: '#188ae2', barWidth: 8, barSpacing: 5 }"></div>
						</div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END cloumn -->
		
			<div class="col-md-4">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title pull-left">Your balance</h4>
						<small class="pull-right text-muted">10-30-2016</small>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="text-color m-t-xs m-b-md fw-600 fz-lg">$ <span data-plugin="counterUp">9,542.20</span></h3>
							<div class="text-danger">
								<i class="fa fa-long-arrow-down m-r-xs"></i>
								<sapn>43% from the last week</sapn>
							</div>
						</div>
						<div class="pull-right">
							<div class="m-t-md" data-plugin="sparkline" data-options="[3,8,10,12,4,12,8], { type: 'bar', chartRangeMin:0, height: 45, barColor: '#188ae2', barWidth: 8, barSpacing: 5 }"></div>
						</div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END cloumn -->
			<div class="col-md-4">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title pull-left">Total value</h4>
						<small class="pull-right text-muted">10-30-2016</small>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="text-color m-t-xs m-b-md fw-600 fz-lg">$<span data-plugin="counterUp">11,002.79</span></h3>
							<div class="text-primary">
								<i class="fa fa-long-arrow-up m-r-xs"></i>
								<sapn>33% from the last week</sapn>
							</div>
						</div>
						<div class="pull-right">
							<div class="m-t-md" data-plugin="sparkline" data-options="[8,6,3,11,10,9,7], { type: 'bar', chartRangeMin:0, height: 45, barColor: '#188ae2', barWidth: 8, barSpacing: 5 }"></div>
						</div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END cloumn -->
		</div><!-- .row -->
		<div class="row">
			<div class="col-md-8">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title pull-left">Sales</h4>
						<div class="pull-right">
							<a href="#" class="text-info">All time</a> /
							<a href="#" class="text-muted">2016</a> /
							<a href="#" class="text-info">June</a>
						</div>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
					  <div data-plugin="chart" data-options="{
					      tooltip : {
					          trigger: 'axis'
					      },
					      legend: {
					          data:['Preorder','Sale','Deal']
					      },
					      calculable : true,
					      xAxis : [
					          {
					              type : 'category',
					              boundaryGap : false,
					              data : ['Mon','Tue','Wed','Thu','Fri','Sat','Sun']
					          }
					      ],
					      yAxis : [
					          {
					              type : 'value'
					          }
					      ],
					      series : [
					          {
					              name:'Deal',
					              type:'line',
					              smooth:true,
					              itemStyle: {normal: {areaStyle: {type: 'default'}}},
					              data:[10, 12, 21, 54, 260, 830, 710]
					          },
					          {
					              name:'Sale',
					              type:'line',
					              smooth:true,
					              itemStyle: {normal: {areaStyle: {type: 'default'}}},
					              data:[30, 182, 434, 791, 390, 30, 10]
					          },
					          {
					              name:'Preorder',
					              type:'line',
					              smooth:true,
					              itemStyle: {normal: {areaStyle: {type: 'default'}}},
					              data:[1320, 1132, 601, 234, 120, 90, 20]
					          }
					      ]
					  }" style="height: 350px;">
					  </div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
			<div class="col-md-4">
				<div class="widget countries-widget">
				  <header class="widget-header">
				    <h4 class="widget-title">Top countries</h4>
				  </header><!-- .widget-header -->
				  <hr class="widget-separator">
				  <div class="widget-body">
						<div class="list-group m-0">
							<a href="#" class="list-group-item clearfix">
								<span class="pull-left avatar avatar-circle">
									<img src="/resources/assets/images/flags/Egypt.png" alt="">
								</span>
								<span class="pull-left fw-500 fz-md">Egypt</span>
								<div class="pull-right">$<span data-plugin="counterUp">64258</span></div>
							</a><!-- .list-group-item -->
							<a href="#" class="list-group-item clearfix">
								<span class="pull-left avatar avatar-circle">
									<img src="/resources/assets/images/flags/Italy.png" alt="">
								</span>
								<span class="pull-left fw-500 fz-md">Italy</span>
								<div class="pull-right">$<span data-plugin="counterUp">55825</span></div>
							</a><!-- .list-group-item -->
							<a href="#" class="list-group-item clearfix">
								<span class="pull-left avatar avatar-circle">
									<img src="/resources/assets/images/flags/United-States-of-America.png" alt="">
								</span>
								<span class="pull-left fw-500 fz-md">USA</span>
								<div class="pull-right">$<span data-plugin="counterUp">4587</span></div>
							</a><!-- .list-group-item -->
							<a href="#" class="list-group-item clearfix">
								<span class="pull-left avatar avatar-circle">
									<img src="/resources/assets/images/flags/China.png" alt="">
								</span>
								<span class="pull-left fw-500 fz-md">China</span>
								<div class="pull-right">$<span data-plugin="counterUp">4465</span></div>
							</a><!-- .list-group-item -->
							<a href="#" class="list-group-item clearfix">
								<span class="pull-left avatar avatar-circle">
									<img src="/resources/assets/images/flags/Russia.png" alt="">
								</span>
								<span class="pull-left fw-500 fz-md">Russia</span>
								<div class="pull-right">$<span data-plugin="counterUp">3300</span></div>
							</a><!-- .list-group-item -->
							<a href="#" class="list-group-item clearfix">
								<span class="pull-left avatar avatar-circle">
									<img src="/resources/assets/images/flags/France.png" alt="">
								</span>
								<span class="pull-left fw-500 fz-md">France</span>
								<div class="pull-right">$<span data-plugin="counterUp">350</span></div>
							</a><!-- .list-group-item -->
				  	</div><!-- .list-group -->
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
		</div><!-- .row -->
		<div class="row">
			<div class="col-md-12">
				<div class="widget">
				  <header class="widget-header">
				    <h4 class="widget-title">Items sales this month</h4>
				  </header><!-- .widget-header -->
				  <hr class="widget-separator">
				  <div class="widget-body">
				  	<table class="table table-striped">
				  		<tr><th>Date</th><th>Items sales count</th><th>Earnings</th></tr>
							<tr>
								<td>03-26-2016</td>
								<td>262</td>
								<td>$691</td>
							</tr>
							<tr>
								<td>06-25-2016</td>
								<td>500</td>
								<td>$1765</td>
							</tr>
							<tr>
								<td>06-25-2016</td>
								<td>214</td>
								<td>$6258</td>
							</tr>
							<tr>
								<td>05-14-2016</td>
								<td>258</td>
								<td>$1400</td>
							</tr>
							<tr>
								<td>03-25-2016</td>
								<td>158</td>
								<td>$8457</td>
							</tr>
							<tr>
								<td>08-14-2016</td>
								<td>741</td>
								<td>$2543</td>
							</tr>
							<tr>
								<td>07-25-2016</td>
								<td>158</td>
								<td>$5869</td>
							</tr>
				  	</table>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
		</div><!-- .row -->

		<div class="row">
			<div class="col-md-12">
				<div class="widget products-widget">
				  <header class="widget-header">
				    <h4 class="widget-title">Top items this month</h4>
				  </header><!-- .widget-header -->
				  <hr class="widget-separator">
				  <div class="widget-body">
						<div class="row">
							<div class="col-sm-6 col-md-3">
								<a href="javascript:void(0)" class="product">
									<img class="img-responsive" src="/resources/assets/images/product-1.jpg" alt="oroduct image">
									<div class="product-caption clearfix">
										<span>147 Sales</span>
										<span class="pull-right">$450</span>
									</div><!-- .product-caption -->
								</a><!-- .product -->
							</div><!-- END column -->
							<div class="col-sm-6 col-md-3">
								<a href="javascript:void(0)" class="product">
									<img class="img-responsive" src="/resources/assets/images/product-2.jpg" alt="oroduct image">
									<div class="product-caption clearfix">
										<span>147 Sales</span>
										<span class="pull-right">$450</span>
									</div><!-- .product-caption -->
								</a><!-- .product -->
							</div><!-- END column -->
							<div class="col-sm-6 col-md-3">
								<a href="javascript:void(0)" class="product">
									<img class="img-responsive" src="/resources/assets/images/product-3.jpg" alt="oroduct image">
									<div class="product-caption clearfix">
										<span>147 Sales</span>
										<span class="pull-right">$450</span>
									</div><!-- .product-caption -->
								</a><!-- .product -->
							</div><!-- END column -->
							<div class="col-sm-6 col-md-3">
								<a href="javascript:void(0)" class="product">
									<img class="img-responsive" src="/resources/assets/images/product-4.jpg" alt="oroduct image">
									<div class="product-caption clearfix">
										<span>147 Sales</span>
										<span class="pull-right">$450</span>
									</div><!-- .product-caption -->
								</a><!-- .product -->
							</div><!-- END column -->
						</div><!-- .row -->
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
		</div><!-- .row -->
	</section><!-- .app-content -->
</div><!-- .wrap -->
  

<%@ include file="includes/footer.jsp" %>