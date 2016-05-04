<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/Base.jsp"%>
<!doctype html >
<html>
<head>
<link href="css/console.css" rel="stylesheet">
<style>
*{ margin:0; padding:0;}
#box{ margin:50px auto; width:540px; min-height:400px; background:#FF9}
#demo{ margin:50px auto; width:540px; min-height:800px; background:#CF9}
</style>
</head>
<body>

	<h2 class="sub-header"><span class="glyphicon glyphicon-user" style="margin-right: 4px" aria-hidden="true"></span>发布商品</h2>
	<div class="container">
	<p class="text-left"><a href="<%=basePath %>jsp/manager_shell.jsp" class="navbar-left"
					style="font-size:1.2em; margin-bottom: 10px;margin-right: 10px">
					<span class="glyphicon glyphicon-arrow-left" style="margin-right: 4px" aria-hidden="true"></span>返回</a></p>
	  <p class="text-center" style="margin-top: 32px">商品图片:</p>
	    <div class="row">
	    	<div id="box">
				<div id="test" ></div>
			</div>
	    </div>
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">商品名:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.name" class="form-control" /></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">商品类型:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.phone" class="form-control" placeholder="请输入手机号"/></div>
	    </div>
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">:</p>原始价格</div>
	       <div class="col-xs-3 col-md-3"><input id="user.rangeSell" class="form-control" readonly="true"/></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">出售价格:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.rangeBuy" class="form-control" readonly="true"/></div>
	    </div>
	    
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">几成新:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.power" class="form-control" readonly="true"/></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.timeCreat" class="form-control" readonly="true"/></div>
	    </div>
	    
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">银行卡号:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.bancar" class="form-control" /></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">邮箱地址:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.email" class="form-control" /></div>
	    </div>
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">真实姓名:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.realName" class="form-control" /></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">真实地址:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.adress" class="form-control" /></div>
	    </div>
	    <div calss="row">
	    <p class="text-center" style="margin-top:32px"><button type="button" style="width: 300px" class="btn btn-success btn-lg">提交</button>
	    </div>
	</div>
</body>
<script type="text/javascript">
    $('#test').diyUpload({
	url:'server/fileupload.php',
	success:function( data ) {
		console.info( data );
	},
	error:function( err ) {
		console.info( err );	
	}
});

</script>
</html>