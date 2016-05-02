<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/Base.jsp"%>
<!doctype html >
<html>
<head>
<link href="css/console.css" rel="stylesheet">
</head>
<body>

	<h2 class="sub-header"><span class="glyphicon glyphicon-user" style="margin-right: 4px" aria-hidden="true"></span>个人信息</h2>
	<div class="container">
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">用户名:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.name" class="form-control" readonly="true"/></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">手机号*:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.phone" class="form-control" placeholder="请输入手机号"/></div>
	    </div>
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">卖家等级:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.rangeSell" class="form-control" readonly="true"/></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">买家等级:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.rangeBuy" class="form-control" readonly="true"/></div>
	    </div>
	    
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">用户权限:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="user.power" class="form-control" readonly="true"/></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">创建时间:</p></div>
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
    

</script>
</html>