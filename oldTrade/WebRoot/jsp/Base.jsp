<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">   <!-- 屏幕配置 -->
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->   
    
    <base href="<%=basePath%>">
    <link rel="icon" href="img/title.png">
    <title>物物旧货交易网</title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/ui-dialog.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/webuploader.css">
	<link rel="stylesheet" type="text/css" href="css/diyUpload.css">
    
    <script src="js/jquery-1.12.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.paginate.js"></script>
    <script src="js/dialog-min.js"></script>
    <script src="js/dialog-plus-min.js"></script>
    <script type="text/javascript" src="js/webuploader.html5only.min.js"></script>
	<script type="text/javascript" src="js/diyUpload.js"></script>
   
  </head>
  
  <body>
  </body>
</html>
