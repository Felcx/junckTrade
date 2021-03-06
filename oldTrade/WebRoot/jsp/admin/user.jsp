<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/Base.jsp"%>
<!doctype html >
<html>
<head>
<link href="css/console.css" rel="stylesheet">
</head>
<body>

	<h2 class="sub-header"><span class="glyphicon glyphicon-user" style="margin-right: 4px" aria-hidden="true"></span>用户管理</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>用户名</th>
					<th>电话号码</th>
					<th>卖家等级</th>
					<th>买家等级</th>
					<th>用户权限</th>
					<th>真实姓名</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="dataCotain">
				
			</tbody>
		</table>
		<div id="demo2"></div>
	</div>
</body>
<script type="text/javascript">

function postPower(id,power){
    $.ajax({
					type : "POST",
					url :"<%=basePath %>setPowerUser",
					async:true,
					data:{"user.id":id , "user.power":power},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
							  alert(b.message);
							  window.location.reload(); 
							}else {
							  alert(b.message);
							}
						}
					  },
					  error : function(XMLHttpRequest, textStatus, errorThrown) {
						}
	}); 
}

function setPower(id){
   var powers=[" ","可买卖","只可买","只可卖","功能被限制"];
   var html='<select id="powerSelect">'
             +'<option value="1">'+powers[1]+'</option>'
             +'<option value="2">'+powers[2]+'</option>'
             +'<option value="3">'+powers[3]+'</option>'
             +'<option value="4">'+powers[4]+'</option>'
             +'</select> ';
       
   var d = dialog({
    title: '请选择权限',
    content: html,
    okValue:'确定',
    ok:function(){
       var power=$("#powerSelect").val();
       postPower(id,power);
       
       },
    cancelValue:'取消',
    cancel:function(){
    
    }    
   });
   d.showModal();
}

function delUser(id){          
  if(confirm("确定删除此用户？")){
      $.ajax({
					type : "POST",
					url :"<%=basePath %>delectUser",
					async:true,
					data:{"user.id":id },
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
							  alert(b.message);
							  window.location.reload(); 
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

function query(pageNo,pageSize){         //请求登录
          $.ajax({
					type : "POST",
					url :"<%=basePath %>queryAllBySizeUser",
					async:true,
					data:{"pageNo":pageNo , "pageSize":pageSize},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
							$("#dataCotain").empty();
					        if(b.dataset.length>0){
					           for(var i=0;i<b.dataset.length;i++){
					               $("#dataCotain").append("<tr>"
					               +"<td>"+b.dataset[i].name+"</td>"
					               +"<td>"+b.dataset[i].phone+"</td>"
					               +"<td>"
					               +b.dataset[i].rangeSellCn
					               +"</td>"
					               +"<td>"+b.dataset[i].rangeBuyCn+"</td>"
					               +"<td>"+b.dataset[i].powerCn+"</td>"
					               +"<td>"+b.dataset[i].realName+"</td>"
					               +"<td>"
					               +"<a href='javascript:void(0);' onclick='setPower("+b.dataset[i].id+")'>设置权限"+"</a>"
					               +"&nbsp&nbsp<a href='javascript:void(0);' onclick='delUser("+b.dataset[i].id+")'>删除用户"+"</a>"
					               +"</td>"
					               +"</tr>"
					               );
					               
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

$(document).ready(function(){
   
	var pageNo=1;
	var pageSize=10;
	query(pageNo, pageSize);
});



function init(count,index){
var display=0;
if(count<=9){
  display=count;
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
</script>
</html>