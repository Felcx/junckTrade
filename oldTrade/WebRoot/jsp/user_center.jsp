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
				<a class="navbar-brand" href="<%=basePath%>index.jsp">物物旧货交易网-用户中心</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="javascript:void(0);"><s:property
								value="#session.user.name" /></a></li>
					<li><a href="<%=basePath%>logoutUser">注销</a></li>
					<li><a href="javascript:void(0)" onclick="showPwd('<s:property value="#session.user.id" />')">修改密码</a></li>
					<li><a href="javascript:void(0);">本次登录时间：<s:property
								value="#session.user.currentLogin" /></a></li>
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
            <li class="active" ><a href="javascript:void(0);"><span class="glyphicon glyphicon-user" style="margin-right: 4px" aria-hidden="true"></span>个人信息 <span class="sr-only">(current)</span></a></li>
            <li ><a href="javascript:void(0);"><span class="glyphicon glyphicon-blackboard" style="margin-right: 4px" aria-hidden="true"></span>商品管理</a></li>
            <li ><a href="javascript:void(0);"><span class="glyphicon glyphicon-equalizer" style="margin-right: 4px" aria-hidden="true"></span>购物车</a></li>
          </ul>
          
        </div>
         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 ">
         <div class="embed-responsive embed-responsive-16by9"> 
              <iframe id="manFrame" class="embed-responsive-item" src="<%=basePath%>jsp/user_info.jsp"></iframe>
         </div>
        </div>
      </div>
    </div>

</body>
<script type="text/javascript">
  function chuangPwd(){
          alert("修改密码");
  }
  
  function postPower(id,oldPwd,pwd){
    $.ajax({
					type : "POST",
					url :"<%=basePath %>chuangePwdUser",
					async:true,
					data:{"user.id":id , "oldPwd":oldPwd, "user.pwd":pwd},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
							  alert(b.message);
							  //window.location.reload(); 
							}else {
							  alert(b.message);
							}
						}
					  },
					  error : function(XMLHttpRequest, textStatus, errorThrown) {
						}
	}); 
}
  
  function showPwd(id){
   var html='原始密码：<input id="srcPwd" type="password"/><br/>'
           +'新的密码：<input  id="newPwd" type="password"/><br/>'
           +'重复密码：<input id="newRePwd" type="password"/>';
       
   var d = dialog({
    title: '修改密码',
    content: html,
    okValue:'确定',
    ok:function(){
       var srcPwd=$("#srcPwd").val();
       var newPwd=$("#newPwd").val();
       var newRePwd=$("#newRePwd").val();
       if(srcPwd.length!=0&&newPwd.length!=0&&newRePwd.length!=0){
           if(newPwd==newRePwd){
              postPower(id,srcPwd,newPwd);
           }else{
              alert("新密码不一致！");
           }
       }else{
         alert("请输入密码");
       }
      
          
       },
    cancelValue:'取消',
    cancel:function(){
    
    }    
   });
   d.showModal();
}
  
  $("#items").children().each(function(i){
     $(this).click(function(){
       $("#items").children(".active").removeClass("active");
       var target="";
       switch(i){
       case 0:
       	target="<%=basePath%>jsp/user_info.jsp";
       break;
       case 1:
          target="<%=basePath%>jsp/manager_shell.jsp";
       break;
       case 2:
          target="<%=basePath%>jsp/manager_buy.jsp";
       break;
       }
       $("#manFrame").attr("src",target);
       $(this).addClass("active");
     });
  });
</script>
</html>