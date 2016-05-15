<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/Base.jsp"%>
<!doctype html >
<html>
<head>
<link href="css/console.css" rel="stylesheet">
</head>
<body>

	<h2 class="sub-header"><span class="glyphicon glyphicon-blackboardr" style="margin-right: 4px" aria-hidden="true"></span>商品类型管理</h2>
	<button type="button" onclick="addNew();" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">新增</button>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>名称</th>
					<th>价格</th>
					<th>类型</th>
					<th>状态</th>
					<th>买家</th>
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

function addNew(){
    window.location.href="<%=basePath%>jsp/goods_new.jsp";
}




function delUser(id){          
  if(confirm("确定下架此商品？")){
      $.ajax({
					type : "POST",
					url :"<%=basePath %>downGoods",
					async:true,
					data:{"goodsId":id },
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

function postSell(id,power){
    $.ajax({
					type : "POST",
					url :"<%=basePath %>howBuyUser",
					async:true,
					data:{"user.id":id,"range":power},
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

function send(id){
  if(confirm("确认发货了吗？")){
      $.ajax({
					type : "POST",
					url :"<%=basePath %>sendGoods",
					async:true,
					data:{"goodsId":id },
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

function howBuy(id){
  var powers=["5星","4星","3星","2星","1星"];
   var html='<select id="powerSelect">'
             +'<option value="5">'+powers[0]+'</option>'
             +'<option value="4">'+powers[1]+'</option>'
             +'<option value="3">'+powers[2]+'</option>'
             +'<option value="2">'+powers[3]+'</option>'
             +'<option value="1">'+powers[4]+'</option>'
             +'</select> ';
       
   var d = dialog({
    title: '请选择满意度',
    content: html,
    okValue:'确定',
    ok:function(){
       var power=$("#powerSelect").val();
       postSell(id,power);
       
       },
    cancelValue:'取消',
    cancel:function(){
    
    }    
   });
   d.showModal();
}

function create(good){          //设置操作方法
   var str="";
   switch(good.currentState){
   case "上架":
    str=str
    +"<a href='<%=basePath%>jsp/goods_new.jsp?goodId="+good.id+"'>修改&nbsp;&nbsp;&nbsp;</a>"
	+"<a href='javascript:void(0);' onclick='delUser("+good.id+")'>下架"+"</a>";
	break;
	case "下架":
	  str=str
    +"<a href='<%=basePath%>jsp/goods_new.jsp?goodId="+good.id+"&type=see'>查看&nbsp;&nbsp;&nbsp;</a>";
   break;
    case "已预订":
    str=str
    +"<a href='<%=basePath%>jsp/goods_new.jsp?goodId="+good.id+"&type=see'>查看&nbsp;&nbsp;&nbsp;</a>"; 
    break;
    case "已付款":
    str=str
    +"<a href='<%=basePath%>jsp/goods_new.jsp?goodId="+good.id+"&type=see'>查看&nbsp;&nbsp;&nbsp;</a>"
   +"<a href='javascript:void(0);' onclick='send("+good.id+")'>发货"+"</a>";
    break;
    case "已发货":
    str=str
    +"<a href='<%=basePath%>jsp/goods_new.jsp?goodId="+good.id+"&type=see'>查看&nbsp;&nbsp;&nbsp;</a>"; 
    break;
    case "已收货":
    str=str
   +"<a href='<%=basePath%>jsp/goods_new.jsp?goodId="+good.id+"&type=see'>查看&nbsp;&nbsp;&nbsp;</a>"
   +"<a href='javascript:void(0);' onclick='howBuy("+good.userByIdOwner.id+")'>评价买家"+"</a>";
  
    break;
     
   }
   return str;
 }

function query(pageNo,pageSize){         //请求数据
          $.ajax({
					type : "POST",
					url :"<%=basePath %>queryAllBySizeGoods",
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
					           var buyer="";
					           if(b.dataset[i].userByIdBuyer){
					             buyer=b.dataset[i].userByIdBuyer.name;
					             buyer="<a href='<%=basePath%>jsp/user_info.jsp?userid="+b.dataset[i].userByIdBuyer.id+"'>"+b.dataset[i].userByIdBuyer.name+"</a>";
					           }
					            if(b.dataset[i].userByIdOwner.id=='<s:property value="#session.user.id" />'){
					               $("#dataCotain").append("<tr>"
					               +"<td>"+b.dataset[i].name+"</td>"
					               +"<td>"+b.dataset[i].priceNew+"</td>"
					               +"<td>"+b.dataset[i].currentType+"</td>"
					               +"<td>"+b.dataset[i].currentState+"</td>"
					               +"<td>"+buyer+"</td>"
					               +"<td>"+b.dataset[i].currentCreate+"</td>"
					               +"<td>"
					               +create(b.dataset[i])
					               +"</td>"
					               +"</tr>"
					               );
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