<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/Base.jsp"%>
<!doctype html >
<html>
<head>
<link href="css/console.css" rel="stylesheet">
</head>
<body>

	<h2 class="sub-header"><span class="glyphicon glyphicon-equalizer" style="margin-right: 4px" aria-hidden="true"></span>商品类型管理</h2>
	<button type="button" onclick="addNew();" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">新增</button>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>名称</th>
					<th>创建时间</th>
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

function postPower(power){
    $.ajax({
					type : "POST",
					url :"<%=basePath %>insertTypes",
					async:true,
					data:{"type.name":power},
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

function addNew(id){
   var html='<input id="typeName" autofocus />';
       
   var d = dialog({
    title: '请输入类型',
    content: html,
    okValue:'确定',
    ok:function(){
       var power=$("#typeName").val();
       postPower(power);
       
       },
    cancelValue:'取消',
    cancel:function(){
    
    }    
   });
   d.showModal();
}



function delUser(id){          
  if(confirm("确定删除此类型？")){
      $.ajax({
					type : "POST",
					url :"<%=basePath %>delectTypes",
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

function query(pageNo,pageSize){         //请求数据
          $.ajax({
					type : "POST",
					url :"<%=basePath %>queryAllBySizeTypes",
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
					               +"<td>"+b.dataset[i].currentCreate+"</td>"
					               +"<td>"
					               +"<a href='javascript:void(0);' onclick='delUser("+b.dataset[i].id+")'>删除类型"+"</a>"
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
</script>
</html>