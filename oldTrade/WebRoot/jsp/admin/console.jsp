<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/Base.jsp"%>
<!doctype html >
<html>
<head>
<link href="css/console.css" rel="stylesheet">
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
				<a class="navbar-brand" href="javascript:void(0);">物物旧货交易网-管理员后台</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="javascript:void(0);"><s:property
								value="#session.admin.name" /></a></li>
					<li><a href="<%=basePath%>logoutAdmin">注销</a></li>
					<li><a href="javascript:void(0);">上次登录时间：<s:property
								value="#session.admin.currentLogin" /></a></li>
				</ul>
			</div>
			<!-- /.nav-collapse -->
		</div>
		<!-- /.container -->
	</nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar" id="items">
            <li class="active" ><a href="javascript:void(0);"><span class="glyphicon glyphicon-user" style="margin-right: 4px" aria-hidden="true"></span>用户管理 <span class="sr-only">(current)</span></a></li>
            <li ><a href="javascript:void(0);"><span class="glyphicon glyphicon-blackboard" style="margin-right: 4px" aria-hidden="true"></span>商品管理</a></li>
            <li ><a href="javascript:void(0);"><span class="glyphicon glyphicon-equalizer" style="margin-right: 4px" aria-hidden="true"></span>商品类型管理</a></li>
            <li ><a href="javascript:void(0);"><span class="glyphicon glyphicon-bullhorn" style="margin-right: 4px" aria-hidden="true"></span>发布公告</a></li>
          </ul>
          
        </div>
         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 ">
         <div class="embed-responsive embed-responsive-16by9"> 
              <iframe id="manFrame" class="embed-responsive-item" src="<%=basePath%>jsp/admin/user.jsp"></iframe>
         </div>
          
        </div>
      </div>
    </div>

</body>
<script type="text/javascript">
  function clearSelected(){
          
  }
  $("#items").children().each(function(i){
     $(this).click(function(){
       $("#items").children(".active").removeClass("active");
       var target="";
       switch(i){
       case 0:
       	target="<%=basePath%>jsp/admin/user.jsp";
       break;
       case 1:
          target="<%=basePath%>jsp/admin/user.jsp";
       break;
       case 2:
          target="<%=basePath%>jsp/admin/type.jsp";
       break;
       case 3:
          target="<%=basePath%>jsp/admin/notice.jsp";
       break;
       }
       $("#manFrame").attr("src",target);
       $(this).addClass("active");
     });
  });
</script>
</html>