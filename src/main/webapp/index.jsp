<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<jsp:include page="/common/include.jsp"></jsp:include>
</head>
<body>
<nav class="navbar navbar-default" role="navigation" style="margin: 0">
    <div class="container-fluid"> 
    <div class="navbar-header">
    	<img src="img/face.jpg" alt="balabala" height="50px"/>
    </div>
    <div class="navbar-header">
        <div class="navbar-brand" href="#">菜鸟教程</div>
    </div>
    <div>
        <div class="navbar-right navbar-brand">
        	<a href="">登录</a>
            <a href="">注册</a>
            <a href="">个人设置</a>
            <a href="">购物车</a>
            <a href="">心愿单</a>
           	 欢迎您，游客
        </div>
    </div>
    </div>
</nav>
<div id="carousel" class="row" >
<div class="col-xs-3"></div>
<div id="myCarousel" class="carousel slide col-xs-6">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>   
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="img/face.jpg" alt="First slide">
        </div>
        <div class="item">
            <img src="img/face.jpg" alt="Second slide">
        </div>
        <div class="item">
            <img src="img/face.jpg" alt="Third slide">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel" 
        data-slide="prev">&lsaquo;
    </a>
    <a class="carousel-control right" href="#myCarousel" 
        data-slide="next">&rsaquo;
    </a>
</div>
<div class="col-xs-3"></div>
</div>

<div id="list">
	<form id="frm">
			<table>
				<tr><td>品牌</td><td><a>小米</a><a>华为</a></td></tr>
				<tr><td>型号</td><td></td></tr>
				<tr><td>颜色</td><td></td></tr>
				<tr><td>业务版本</td><td></td></tr>
			</table>
		</form>
	<div class="row">
    <div class="col-sm-6 col-md-3">
        <div  class="thumbnail">
            <img src="img/face.jpg" alt="通用的占位符缩略图">
             <div class="caption">
                <h3>缩略图标签</h3>
                <p>一些示例文本。一些示例文本。</p>
                <p>
                    <a href="#" class="btn btn-primary" role="button">按钮</a> 
                    <a href="#" class="btn btn-default" role="button">按钮</a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div  class="thumbnail">
            <img src="img/face.jpg" alt="通用的占位符缩略图">
             <div class="caption">
                <h3>缩略图标签</h3>
                <p>一些示例文本。一些示例文本。</p>
                <p>
                    <a href="#" class="btn btn-primary" role="button">按钮</a> 
                    <a href="#" class="btn btn-default" role="button">按钮</a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div  class="thumbnail">
            <img src="img/face.jpg" alt="通用的占位符缩略图">
             <div class="caption">
                <h3>缩略图标签</h3>
                <p>一些示例文本。一些示例文本。</p>
                <p>
                    <a href="#" class="btn btn-primary" role="button">按钮</a> 
                    <a href="#" class="btn btn-default" role="button">按钮</a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div  class="thumbnail">
            <img src="img/face.jpg" alt="通用的占位符缩略图">
             <div class="caption">
                <h3>缩略图标签</h3>
                <p>一些示例文本。一些示例文本。</p>
                <p>
                    <a href="#" class="btn btn-primary" role="button">按钮</a> 
                    <a href="#" class="btn btn-default" role="button">按钮</a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div  class="thumbnail">
            <img src="img/face.jpg" alt="通用的占位符缩略图">
            <div class="caption">
                <h3>缩略图标签</h3>
                <p>一些示例文本。一些示例文本。</p>
                <p>
                    <a href="#" class="btn btn-primary" role="button">按钮</a> 
                    <a href="#" class="btn btn-default" role="button">按钮</a>
                </p>
            </div>
        </div>
    </div>
    </div>
    <div align="center" id="div_test">
    	<input type="button" class="btn-lg" value="点击显示更多"/><br />
    </div>
</div>
<script>
$(function(){
	queryData();
	//alert("Hello world!", "welcome to my world :)", function () {}, {type: 'success', confirmButtonText: 'OK'});
});
	function queryData(){
		//alert("h");
		$.ajax({
			url:'${pageContext.request.contextPath}/user/test',
			data:'id=1',
			type:'get',
			success:function(data){
				 var jsonObj = eval(data);
			        console.log(jsonObj)
			        $.each(jsonObj, function (i, item) {
			        	
			        	console.log(item.PHONEPHOTO);
			        	$("#div_test").append("<img src='"+item.PHONEPHOTO+"'/>");});
			},error:function(){
				alert("出错啦");
			}
		});
	}
</script>
</body>
</html>