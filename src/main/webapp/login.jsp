<%@page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<jsp:include page="/common/include.jsp"></jsp:include>
</head>
<body>
<div id="loginModal" class="panel panel-primary" tabindex="-1" style="width: 400px;height: 400px" >
    <div class="panel-heading">
        <h3 class="panel-title">用户登录</h3>
    </div>
    <div class="panel-body">
        	<form id="frm" name="frm" class="form-horizontal" role="form">
	
		<div class="form-group">
			<label class="col-sm-4 control-label">用户名：</label>
			<div class="col-sm-8">
				<input type="text" width="200" id="name" name="name" class="form-control" placeholder="请输入用户名"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">密码：</label>
			<div class="col-sm-8">
				<input type="password" id="password" name="password" class="form-control" placeholder="请输入密码"/>
			</div>
		</div>
		
		
		<div class="form-group">
			<label class="col-sm-4 control-label">验证码：</label>
			<div class="col-sm-8">
				<img id="imgVcode" src="vcode.jsp" width="60px" height="30px" align="bottom">&nbsp;
				<a onclick="changeVcode()">看不清，换一张</a>
			</div> 
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">输入验证码：</label>
			<div class="col-sm-8">
				<input type="text" id="vcode" name="vcode" class="form-control" placeholder="请输入验证码"/>
			</div> 
		</div>
		
		<div class="form-group" align="center">
			<font id="warning" color="red"></font>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-8">
				<input type="button" id="btnOk" name="btnOk" class="btn btn-success" value="登录"/>
				<input type="button" id="btnCancel" name="btnCancel" class="btn btn-error" value="取消"/>
			</div>
		</div>
	</form>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#btnOk').click(function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/user/login',
			data:$('#frm').serialize(),
			type:'POST',
			success:function(result){
				if(result==-1){
					document.getElementById("warning").innerHTML="<I>验证码错误，请重新输入</I>";
					changeVcode();
				}
				else if(result==-2){
					document.getElementById("warning").innerHTML="<I>用户名或密码错误，请重新输入</I>";
					changeVcode();
				}
				else if(result==2){//用户状态为已冻结
					document.getElementById("warning").innerHTML="<I>您的用户已被冻结，请联系管理员</I>";
					changeVcode();
				}
				else if(result==1){//用户状态为已保存
					alert("登录成功，跳转index页面");
					//window.location.href="#";
				}
			},
			error:function(){
				alert("登录失败");
			}
		});
	});
});

//刷新验证码
function changeVcode(){
	document.getElementById('imgVcode').src='vcode.jsp?'+Math.random();
}
</script>
</body>
</html>