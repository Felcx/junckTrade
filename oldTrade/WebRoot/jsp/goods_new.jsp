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
	       <div class="col-xs-3 col-md-3"><input id="name" class="form-control" /></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">商品类型:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="type" class="form-control" /></div>
	    </div>
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">原始价格:</div>
	       <div class="col-xs-3 col-md-3"><input id="price" class="form-control" readonly="true"/></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">出售价格:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="priceNew" class="form-control" readonly="true"/></div>
	    </div>
                	    
	    <div class="row">
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">几成新:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="rangeOld" class="form-control" readonly="true"/></div>
	       <div class="col-xs-3 col-md-3"><p class="text-right" style="margin-top: 8px">描述:</p></div>
	       <div class="col-xs-3 col-md-3"><input id="description" class="form-control" readonly="true"/></div>
	    </div>
	    
	    
	    <div calss="row">
	    <p class="text-center" style="margin-top:32px"><button type="button" onclick="update('<s:property value="#session.user.id" />')" style="width: 300px" class="btn btn-success btn-lg">提交</button>
	    </div>
	</div>
</body>
<script type="text/javascript">

$('#test').diyUpload({
	url:"<%=basePath %>uploadFileGoods",
	success:function( data ) {
	   
		console.info( data );
	},
	error:function( err ) {
		console.info( err );	
	}
});

function update(id){
       var name=$("#name").val();
       var type=$("#type").val();
       var srcPrice=$("#price").val();
       var priceNew=$("#priceNew").val();
       var rangOld=$("#rangeOld").val();
       var discrip=$("#description").val();
       
        $.ajax({
					type : "POST",
					url :"<%=basePath %>insertGoods",
					async:true,
					data:{"userId":id,"good.name":name,"typeId":type,"good.price":srcPrice,"good.priceNew":priceNew,"good.rangeOld":rangOld,"good.description":discrip},
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
</script>
</html>