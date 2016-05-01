<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/Base.jsp"%>
<!doctype html >
<html>
<head>
<link href="css/console.css" rel="stylesheet">
</head>
<body>

	<h2 class="sub-header"><span class="glyphicon glyphicon-bullhorn" style="margin-right: 4px" aria-hidden="true"></span>发布公告</h2>
	<textarea rows="10" id="textarea" cols="60">
          
    </textarea> 
	<button type="button" onclick="addNew();" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">发布</button>
</body>
<script type="text/javascript">


function addNew(){
  var text=$.trim($("#textarea").val());
  if(text.length>0){
  alert(text);
     $.ajax({
					type : "POST",
					url :"<%=basePath %>noticeAdmin",
					async:true,
					data:{"message.message":text},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
							  window.location.reload(); 
							}else {
							  alert(b.message);
							}
						}
					  },
					  error : function(XMLHttpRequest, textStatus, errorThrown) {
						}
	});  
	}else{
	  alert("请输入内容！");
	}
}

function query(){         //请求数据
          $.ajax({
					type : "POST",
					url :"<%=basePath %>readNoticeAdmin",
					async:true,
					data:{},
					dataType : "json",
					success : function(data) {
						if(data){
							var b = eval(data); //转换为对象
							if(b.code==0 ){
							  $("#textarea").val(b.dataset.message);
					           
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
   
	query();
});


</script>
</html>