<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/Base.jsp"%>
<!doctype html >
<html>
<head>
<link href="css/console.css" rel="stylesheet">


<style>
* {
	margin: 0;
	padding: 0;
}

#box {
	margin: 50px auto;
	width: 540px;
	min-height: 400px;
	background: #FF9
}

#demo {
	margin: 50px auto;
	width: 540px;
	min-height: 800px;
	background: #CF9
}
</style>
</head>
<body>

	<h2 class="sub-header">
		<span class="glyphicon glyphicon-blackboard" style="margin-right: 4px"
			aria-hidden="true"></span>发布商品
	</h2>
	<div class="container">
		<p class="text-left">
			<a id="goback" href="<%=basePath %>jsp/manager_shell.jsp" class="navbar-left"
				style="font-size:1.2em; margin-bottom: 10px;margin-right: 10px">
				<span class="glyphicon glyphicon-arrow-left"
				style="margin-right: 4px" aria-hidden="true"></span>返回
			</a>
		</p>
		
		<div class="row" id="imgContain">
		</div>
		
		
		<p class="text-center" id="boxText" style="margin-top: 32px">上传图片:</p>
		<div class="row">
			<div id="box">
				<div id="test"></div>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-3 col-md-3">
				<p class="text-right" style="margin-top: 8px">商品名:</p>
			</div>
			<div class="col-xs-3 col-md-3">
				<input id="name" class="form-control" />
			</div>
			<div class="col-xs-3 col-md-3">
				<p class="text-right" style="margin-top: 8px">商品类型:</p>
			</div>
			<div class="col-xs-3 col-md-3">
				<select id="type" class="form-control"></select>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-3 col-md-3">
				<p class="text-right" style="margin-top: 8px">原始价格:
			</div>
			<div class="col-xs-3 col-md-3">
				<input id="price" class="form-control"
					onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" />
			</div>
			<div class="col-xs-3 col-md-3">
				<p class="text-right" style="margin-top: 8px">出售价格:</p>
			</div>
			<div class="col-xs-3 col-md-3">
				<input id="priceNew" class="form-control"
					onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" />
			</div>
		</div>

		<div class="row">
			<div class="col-xs-3 col-md-3">
				<p class="text-right" style="margin-top: 8px">几成新:</p>
			</div>
			<div class="col-xs-3 col-md-3">
				<select id="rangeOld" class="form-control">
					<option value="10">10成新</option>
					<option value="9">9成新</option>
					<option value="8">8成新</option>
					<option value="7">7成新</option>
					<option value="6">6成新</option>
					<option value="5">5成新</option>
					<option value="4">4成新</option>
					<option value="3">3成新</option>
					<option value="2">2成新</option>
					<option value="1">1成新</option>
				</select>
			</div>
			<div class="col-xs-3 col-md-3">
				<p class="text-right" style="margin-top: 8px">已用多长时间:</p>
			</div>
			<div class="col-xs-3 col-md-3">
				<input id="hasUsed"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')"
					class="form-control" placeholder="请输入已用月份数" />
			</div>
		</div>
		<div class="row">
			<div class="col-xs-3 col-md-3">
				<p class="text-right" style="margin-top: 8px">描述:</p>
			</div>
			<div class="col-xs-3 col-md-3">
				<input id="description" class="form-control" />
			</div>
		</div>


		<div calss="row">
			<p class="text-center" style="margin-top:32px">
				<button type="button" id="buttonSumit"
					onclick="update('<s:property value="#session.user.id" />')"
					style="width: 300px" class="btn btn-success btn-lg">提交</button>
		</div>
	</div>
</body>
<script type="text/javascript">
var goodsId;
var userId='<s:property value="#session.user.id" />';
var hasPhoto=false;
var typeSee='<%=request.getParameter("type")%>';


$(document).ready(function(){
   var requestId=<%=request.getParameter("goodId")%>;
   
   
   if(requestId){
     goodsId=requestId;
     display(goodsId);
     <%request.removeAttribute("goodId"); %>
     hasPhoto=true;
   }else{
     goodsId=Math.floor((new Date()).valueOf()/1000);
    
   }
   if(typeSee!='see'){
    
    $('#test').diyUpload({
	url:"<%=basePath %>uploadFileGoods?goodsId="+goodsId+"&userId="+userId,
	success:function( data ) {
	   hasPhoto=true;
		console.info( data );
	},
	error:function( err ) {
		console.info( err );	
	}
    });
    }else{
      $("#box").hide();
      $("#buttonSumit").hide();
      $("#boxText").hide();
      $("#goback").attr({href:"<%=basePath %>jsp/admin/good.jsp"});
    }
	query();
	
	
});

function creatImage(imgSrc,index,n){
var box='';
  if(index==0){
    box+='<p class="text-center" style="margin-top: 32px">商品图片:</p>';
   }
   if(typeSee =='see'){
  box=box+'<div class="col-sm-6 col-md-4">'
   +'<div class="thumbnail">'
   +'<img data-holder-rendered="true" src="<%=basePath%>upload/'+imgSrc+'" style="width:auto!important;height:200px!important; display: block;" data-src="holder.js/100%x200" alt="人家是图">'
   
   +'</div>'
   +'</div>';}
   else{
    box=box+'<div class="col-sm-6 col-md-4">'
   +'<div class="thumbnail">'
   +'<img data-holder-rendered="true" src="<%=basePath%>upload/'+imgSrc+'" style="width:auto!important;height:200px!important; display: block;" data-src="holder.js/100%x200" alt="人家是图">'
   +'<div class="caption">'
   +'<p class="text-center"><a href="javascript:void(0);" onclick="delect(\''+imgSrc+'\')" class="btn btn-danger" role="button">删除</a></p>'
   +'</div>'
   +'</div>'
   +'</div>';
   }
  return box;
}

function delect(imgSrc){

        $.ajax({
					type : "POST",
					url :"<%=basePath %>delectImgGoods",
					async:true,
					data:{"imagePath":imgSrc},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
					           alert(b.message);
					           window.location.reload(); 
								} else {
									alert(b.message);
								}
							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
						}
					});
	}


function display(goodsId){
     $.ajax({
					type : "POST",
					url :"<%=basePath %>findByIdGoods",
					async:true,
					data:{"goodsId":goodsId},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
							//alert(b.message);
							var good=b.dataset;
						  $("#name").val(good.name);
                          $("#type").val(good.types.id);
                          $("#price").val(good.price);
       					  $("#priceNew").val(good.priceNew);
       					  $("#rangeOld").val(good.rangeOld);
       					  $("#description").val(good.description);
      					  $("#hasUsed").val(good.timeCanUser);
      					  for(var index in good.photos){
      					    $("#imgContain").append(creatImage(good.photos[index],index,good.photos.length));
      					       
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

function query(){         //请求商品类型
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
					                 $("#type").append(""
					               +"<option value="+b.dataset[i].id+">"+b.dataset[i].name+"</option>"
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

function update(id){

   if(hasPhoto){
       var name=$("#name").val();
       var type=$("#type").val();
       var srcPrice=$("#price").val();
       var priceNew=$("#priceNew").val();
       var rangOld=$("#rangeOld").val();
       var discrip=$("#description").val();
       var hasUsed=$("#hasUsed").val();
        $.ajax({
					type : "POST",
					url :"<%=basePath %>genxinGoods",
					async:true,
					data:{"good.timeCanUser":hasUsed,"goodsId":goodsId,"userId":id,"good.name":name,"typeId":type,"good.price":srcPrice,"good.priceNew":priceNew,"good.rangeOld":rangOld,"good.description":discrip},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
					           alert(b.message);
							   window.location.href="<%=basePath %>jsp/manager_shell.jsp";
								} else {
									alert(b.message);
								}
							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
						}
					});

		} else {
			alert("请先上传商品图片！");
		}
	}
</script>
</html>