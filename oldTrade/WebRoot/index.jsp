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
				<a class="navbar-brand" href="javascript:void(0);">物物旧货交易网</a>
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
						<li><a href="#">本次登录时间：<s:property
									value="#session.user.currentLogin" /></a></li>
					</ul>
				</s:else>
				<div id="navbar" class="navbar-collapse collapse navbar-right">


					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><span id="searchType">商品名称</span> <span
								class="caret"></span></a>
							<ul class="dropdown-menu" id="searchItems">
								<li><a href="#" class="searchItem">商品名称</a></li>
								<li><a href="#" class="searchItem">卖家</a></li>
								<li><a href="#" class="searchItem">售价</a></li>
							</ul></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" id="searcher" class="form-control"
								placeholder="iphone6s、笔记本">
						</div>
						<button type="submit" onclick="search();" class="btn btn-default">搜索</button>
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
	          <div class="row" id="goodsContain">
        
				</div>
				<!--/row-->
				<div id="demo2"></div>
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
					style=" margin-right: 4px" aria-hidden="true"></span>后台</a>
			</p>
		</footer>

	</div>
</body>
<script src="js/index.js"></script>
<script type="text/javascript">



  $(document).ready(function(){
     initMenu();
     initMessage();
     
     var pageNo=1;
	var pageSize=10;
     initGoods(-1,pageNo,pageSize);
  });
  
  function search(){
    var text=$.trim($("#searcher").val());
    var searchType=$("#searchType").text();
    if(text.length>0){
       $.ajax({
					type : "POST",
					url :"<%=basePath %>queryAllBySizeGoods",
					async:true,
					data:{"searchType":searchType,"searcher":text,"pageNo":1 , "pageSize":10},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
							$("#goodsContain").empty();
					        if(b.dataset.length>0){
					           for(var i=0;i<b.dataset.length;i++){
					              var good=b.dataset[i];
					             
					               $("#goodsContain").append(creatImage(good));
					              
					           }
					        }		
							  var pageSize=10;
							  pageNo=1;
							  var count=Math.ceil(b.totalCount/pageSize);
							  init(count,pageNo);
							}else {
							  alert(b.message);
							}
						}
					  },
					  error : function(XMLHttpRequest, textStatus, errorThrown) {
						}
			}); 
    }    
  }
  
  function viewDetail(id){
  	window.location.href="<%=basePath %>jsp/view_good.jsp?goodsId="+id;
  }
  
  function creatImage(good){
   var box='';
  box=box+'<div class="col-sm-6 col-md-4" >'
   +'<a style="text-decoration:none;cursor:pointer" href="<%=basePath%>jsp/view_good.jsp?goodId='+good.id+'">'
   +'<div class="thumbnail">'
   +'<img data-holder-rendered="true" src="<%=basePath%>upload/'+good.photos[0]+'" style="width:auto!important;height:200px!important; display: block;" data-src="holder.js/100%x200" alt="人家是图">'
   +'<div class="caption">'
   +'<h3>'+good.name+'</h3>'
   +'<p>'+good.description+'</p>'
   +'<p class="text-center" style="color:green;">￥'+good.priceNew+'</p>'
   +'</div>'
   +'</div>'
   +'</a>'
   +'</div>';
  return box;
}

   function initGoods(typeid,pageNo,pageSize){
     $.ajax({
					type : "POST",
					url :"<%=basePath %>queryAllBySizeGoods",
					async:true,
					data:{"typeId":typeid,"pageNo":pageNo , "pageSize":pageSize},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
							$("#goodsContain").empty();
					        if(b.dataset.length>0){
					           for(var i=0;i<b.dataset.length;i++){
					              var good=b.dataset[i];
					               if(good.state ==1){         //只有上架的才显示
					               $("#goodsContain").append(creatImage(good));
					                }
					           }
					        }		
							
							  var count=Math.ceil(b.totalCount/pageSize);
							  init(count,pageNo);
							}else {
							  alert(b.message);
							}
						}
					  },
					  error : function(XMLHttpRequest, textStatus, errorThrown) {
						}
					}); 
   }
   
   function init(count,index){
         var display=0;
         if(count<=9){
           display=count;
             if(count<=0){
           display=1;
           count=1;
  }
}else{
  display=9;
}
     $("#demo2").paginate({
				count 		: count,
				start 		: index,
				display     : display,
				border: true,
                border_color            : '#AAE',
				text_color  			: '#79B5E3',
				text_hover_color        : '#FFFFFF',
				background_hover_color	: '#26B', 
				border_hover_color      : '#AAE',
				background_color        : '#FFFFFF',
				images		            : false,
				mouse		: 'press',
				onChange     			: function(page){
											query(page,10);
                                          }
			});
			}
   
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
					               '<a href="javascript:void(0);" onclick="initGoods('+b.dataset[i].id+',1,10)" class="list-group-item">'+
					               b.dataset[i].name
					               +'</a>'
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