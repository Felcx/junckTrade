<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/Base.jsp"%>
<!doctype html >
<html>
<head>
<link href="css/signin.css" rel="stylesheet">
</head>
<body>
	<div class="container">

		<div class="form-signin">
			<h2 class="form-signin-heading">请登录</h2>
			<label for="inputEmail" class="sr-only">Email address</label> <input
				type="text" id="inputEmail" class="form-control"
				placeholder="管理员账号" required autofocus> <label
				for="inputPassword" class="sr-only">Password</label> <input
				type="password" id="inputPassword" class="form-control"
				placeholder="密码" required> <label for="inputPassword"
				class="sr-only">Password</label>
			<div class="form-inline">
				<input id="authoCode" class="form-control" placeholder="验证码"
					required onkeypress="if(event.keyCode==13) {check();return false;}">
				<img alt=""
					onclick="this.src='<%=basePath%>jsp/g_image.jsp?'+Math.random()"
					style="width: 30%" src="<%=basePath%>jsp/g_image.jsp">

			</div>
			<div class="form-inline" style="margin-top: 10px">
				<a href="<%=basePath %>index.jsp" class="navbar-left"
					style="font-size:1.2em; margin-bottom: 10px;margin-right: 10px">
					<span class="glyphicon glyphicon-arrow-left" style="margin-right: 4px" aria-hidden="true"></span>返回</a>
				
			</div>
			<button class="btn btn-lg btn-primary btn-block" onclick="check()">登录</button>
		</div>

	</div>
	<!-- /container -->
</body>
<script type="text/javascript">
       function query(name,pwd,authCode){         //请求登录
          $.ajax({
					type : "POST",
					url :"<%=basePath %>loginAdmin",
					async:true,
					data:{"user.name":name , "user.pwd":pwd,'authCode':authCode},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
							  //alert(b.message);
							  window.location.href="<%=basePath %>jsp/admin/console.jsp";
							}else {
							  alert(b.message);
							}
						}
					  },
					  error : function(XMLHttpRequest, textStatus, errorThrown) {
						}
					}); 
    }
    
	function check() {                                  //字段校验
		var name = $.trim($("#inputEmail").val());
		var pwd = $("#inputPassword").val();
		var authCode = $("#authoCode").val();
		if (name.length != 0) {
			if (pwd.length != 0  && authCode.length!=0) {
				if (pwd.length >= 6) {
						query(name,pwd,authCode)
				} else {
					alert("密码最少六位");
				}
			} else {
				alert("请输入密码或验证码");
			}
		} else {
			alert("用户名不为空！");
		}
	}

</script>
</html>