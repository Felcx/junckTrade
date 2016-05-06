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
	       <div class="col-xs-3 col-md-3"><input id="name" class="form-control" readonly="true"/></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">手机号*:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="phone" class="form-control" placeholder="请输入手机号"/></div>
	    </div>
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">卖家等级:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="rangeSell" class="form-control" readonly="true"/></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">买家等级:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="rangeBuy" class="form-control" readonly="true"/></div>
	    </div>
	    
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">用户权限:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="power" class="form-control" readonly="true"/></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">创建时间:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="timeCreat" class="form-control" readonly="true"/></div>
	    </div>
	    
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">银行卡号:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="bancar" class="form-control" /></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">邮箱地址:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="email" class="form-control" /></div>
	    </div>
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">真实姓名:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="realName" class="form-control" /></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">真实地址:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="adress" class="form-control" /></div>
	    </div>
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">性别:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="sex" class="form-control" /></div>
	    </div>
	    <div calss="row">
	    <p class="text-center" style="margin-top:32px"><button type="button" style="width: 300px" onclick="update('<s:property value="#session.user.id" />');" class="btn btn-success btn-lg">提交</button>
	    </div>
	</div>
</body>
<script type="text/javascript">
    
    function update(id){
       var address= $("#adress").val();
       var phone=$("#phone").val();
       var email=$("#email").val();
       var bancar=$("#bancar").val();
       var realName=$("#realName").val(); 
       var sex=$("#sex").val();
        $.ajax({
					type : "POST",
					url :"<%=basePath %>updateUser",
					async:true,
					data:{"user.id":id,"user.address":address,"user.phone":phone,"user.realName":realName,"user.email":email,"user.bankCard":bancar,"user.sex":sex},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
					           alert(b.message);
							
							}else {
							  alert(b.message);
							}
						}
					  },
					  error : function(XMLHttpRequest, textStatus, errorThrown) {
						}
					}); 
            
       
    }
    
    function query(id){         //请求登录
          $.ajax({
					type : "POST",
					url :"<%=basePath %>findByIdUser",
					async:true,
					data:{"user.id":id},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
					           $("#name").val(b.dataset.name);
					           $("#phone").val(b.dataset.phone);
					           $("#rangeSell").val(b.dataset.rangeSellCn);
					           $("#rangeBuy").val(b.dataset.rangeBuyCn);
					           $("#timeCreat").val(b.dataset.currentCreate);
					           $("#bancar").val(b.dataset.bankCard);
					           $("#email").val(b.dataset.email);
					           $("#realName").val(b.dataset.realName);
					           $("#adress").val(b.dataset.address);
					           $("#power").val(b.dataset.powerCn);
							   $("#sex").val(b.dataset.sex);
							}else {
							  alert(b.message);
							}
						}
					  },
					  error : function(XMLHttpRequest, textStatus, errorThrown) {
						}
					}); 
    }

$(document).ready(function(){
   
	query('<s:property value="#session.user.id" />');
});

</script>
</html>