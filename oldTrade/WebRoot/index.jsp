<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/Base.jsp"%>
<!doctype html >
<html>
<head>

<title>瓜瓜旧货交易网</title>
<link href="css/index.css" rel="stylesheet">

</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">物物旧货交易网</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<s:if test="null==#session.user">
					<ul class="nav navbar-nav">

						<li><a href="<%=basePath %>jsp/login.jsp">登录</a></li>
						<li><a href="#contact" style="visibility:hidden"></a></li>

					</ul>
				</s:if>
				<s:else>
					<ul class="nav navbar-nav">
						<li class="active"><a
							href="<%=basePath %>jsp/user_center.jsp"><s:property
									value="#session.user.name" /></a></li>
						<li><a href="<%=basePath %>logoutUser">注销</a></li>
						<li><a href="#">上次登录时间：<s:property
									value="#session.user.currentLogin" /></a></li>
					</ul>
				</s:else>
				<div id="navbar" class="navbar-collapse collapse navbar-right">


					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><span id="searchType">搜索选项</span> <span
								class="caret"></span></a>
							<ul class="dropdown-menu" id="searchItems">
								<li><a href="#" class="searchItem">商品名称</a></li>
								<li><a href="#" class="searchItem">类型</a></li>
								<li><a href="#" class="searchItem">卖家</a></li>
								<li><a href="#" class="searchItem">使用年限</a></li>
								<li><a href="#" class="searchItem">售价</a></li>
							</ul></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="iphone6s、笔记本">
						</div>
						<button type="submit" class="btn btn-default">搜索</button>
					</form>
				</div>
			</div>
			<!-- /.nav-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<!-- /.navbar -->

	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<div class="jumbotron"
					style="background-color:#63498B;color: white;">
					<h1>欢迎光临</h1>
					<p>祝您购物愉快</p>
				</div>
	<div class="row">
			<div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                          <img data-holder-rendered="true" src="img/eample.jpg" style="height: 200px; width: 100%; display: block;" data-src="holder.js/100%x200" alt="100%x200">
                             <div class="caption">
                                <h3>Thumbnail label</h3>
                                   <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                             </div>
                    </div>
           </div>
					<!--/.col-xs-6.col-lg-4-->
		  <div class="col-sm-6 col-md-4">
        			<div class="thumbnail">
          					<img data-holder-rendered="true" src="img/eample.jpg" style="height: 200px; width: 100%; display: block;" data-src="holder.js/100%x200" alt="100%x200">
         					 <div class="caption">
           							 <h3>Thumbnail label</h3>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
          </div>
        </div>
      </div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-sm-6 col-md-4">
        <div class="thumbnail">
          <img data-holder-rendered="true" src="img/eample.jpg" style="height: 200px; width: 100%; display: block;" data-src="holder.js/100%x200" alt="100%x200">
          <div class="caption">
            <h3>Thumbnail label</h3>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
          </div>
        </div>
      </div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-sm-6 col-md-4">
        <div class="thumbnail">
          <img data-holder-rendered="true" src="img/eample.jpg" style="height: 200px; width: 100%; display: block;" data-src="holder.js/100%x200" alt="100%x200">
          <div class="caption">
            <h3>Thumbnail label</h3>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
          </div>
        </div>
      </div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-sm-6 col-md-4">
        <div class="thumbnail">
          <img data-holder-rendered="true" src="img/eample.jpg" style="height: 200px; width: 100%; display: block;" data-src="holder.js/100%x200" alt="100%x200">
          <div class="caption">
            <h3>Thumbnail label</h3>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
          </div>
        </div>
      </div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-sm-6 col-md-4">
        <div class="thumbnail">
          <img data-holder-rendered="true" src="img/eample.jpg" style="height: 200px; width: 100%; display: block;" data-src="holder.js/100%x200" alt="100%x200">
          <div class="caption">
            <h3>Thumbnail label</h3>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
          </div>
        </div>
      </div>
					<!--/.col-xs-6.col-lg-4-->
				</div>
				<!--/row-->
			</div>
			<!--/.col-xs-12.col-sm-9-->

			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group" id="dataCotain">
					<a href="#" class="list-group-item active">商品类型</a>

				</div>
				<marquee id="notice"
					style="color:#414141;font-size:12px;line-height:17px;"
					direction="up" height="90" scrollamount="1" scrolldelay="100"
					onMouseOver="this.scrollDelay=500" onMouseOut="this.scrollDelay=1"
					width="100"></marquee>
			</div>
			<!--/.sidebar-offcanvas-->
		</div>
		<!--/row-->

		<hr>

		<footer>
			<p>
				&copy; Company 2016 李超 <a href="jsp/admin/login_admin.jsp"
					class="navbar-right"><span class="glyphicon glyphicon-globe"
					style="margin-right: 4px" aria-hidden="true"></span>后台</a>
			</p>
		</footer>

	</div>
</body>
<script src="js/index.js"></script>
<script type="text/javascript">

  $(document).ready(function(){
     initMenu();
     initMessage();
  });
   
   function initMenu(){
     $.ajax({
					type : "POST",
					url :"<%=basePath %>queryAllTypes",
					async:true,
					data:{},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
					        if(b.dataset.length>0){
					           for(var i=0;i<b.dataset.length;i++){
					               $("#dataCotain").append(
					               '<a href="javascript:void(0);"	class="list-group-item">'+
					               b.dataset[i].name+
					               '</a>'
					               );
					               
					           }
					        }		
							
							}else {
							  alert(b.message);
							}
						}
					  },
					  error : function(XMLHttpRequest, textStatus, errorThrown) {
						}
			}); 
   }
   
   function initMessage(){
      $.ajax({
			type : "POST",
			url :"<%=basePath %>readNoticeAdmin",
			async : true,
			data : {},
			dataType : "json",
			success : function(data) {
				if (data) {
					var b = eval(data); //转换为对象
					if (b.code == 0) {
						var message = "网站公告："
						message = message + b.dataset.message;
						$("#notice").text(message);
					} else {
						alert(b.message);
					}
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	}

	$(".searchItem").each(function() { //选择搜索类型
		$(this).click(function() {
			$("#searchType").text($(this).text());
		});
	});
</script>
</html>