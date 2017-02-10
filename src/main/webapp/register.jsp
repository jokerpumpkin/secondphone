<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>注册</title>
<jsp:include page="common/include.jsp"></jsp:include>
</head>
<body>
<div class="panel panel-primary" style="width: 400px;" >
    <div class="panel-heading">
        <h3 class="panel-title">用户注册</h3>
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
			<label class="col-sm-4 control-label">重复密码：</label>
			<div class="col-sm-8">
				<input type="password" id="rePassword" name="rePassword" class="form-control" placeholder="请输入重复密码"/>
			</div> 
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">手机号：</label>
			<div class="col-sm-8">
				<input type="text" width="200" id="phone" name="phone" class="form-control" placeholder="请输入手机号"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">找回密码问题：</label>
			<div class="col-sm-8">
				<input type="text" width="200" id="pwdQuestion" name="pwdQuestion" class="form-control" placeholder="请输入找回密码问题"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">找回密码答案：</label>
			<div class="col-sm-8">
				<input type="text" width="200" id="pwdAnswer" name="pwdAnswer" class="form-control" placeholder="请输入找回密码答案"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">头像：</label>
			<div class="col-sm-8">
				<img src="img/default.jpg" id="photo" name="photo" class="img-circle img-thumbnail" alt="头像" height="100px" width="100px"/>
			</div> 
		</div>
		<div class="form-group" align="center">
			<font id="warning" color="red"></font>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-8">
				<input type="button" id="btnOk" name="btnOk" class="btn btn-success" value="注册"/>&nbsp;
				<input type="button" id="btnReset" name="btnReset" class="btn btn-warning" value="重置"/>
			</div>
		</div>
	</form>
    </div>
</div>

<script type="text/javascript">

$(document).ready(function(){
	$('#btnOk').click(function(){
		if(validate()){
			$.ajax({
				url:'${pageContext.request.contextPath}/user/register',
				data:$('#frm').serialize(),
				type:'POST',
				success:function(result){
					if(result=="-1"){
						document.getElementById("warning").innerHTML="<I>该手机号已经注册过用户</I>";
					}else if(result=="-2"){
						document.getElementById("warning").innerHTML="<I>此用户名已被占用</I>";
					}else{
						document.getElementById("warning").innerHTML="";
						alert("注册成功");
						window.location.href="${pageContext.request.contextPath}/user/test?id="+result;
					}
				},error:function(){
					alert("注册失败");
				}
			});
		}
	});
}); 
function validate(){
	if($('#name').val()==null||$('#name').val()==""){
		document.getElementById("warning").innerHTML="<I>请输入用户名</I>";
		return false;
	}
	if($('#password').val()==null||$('#password').val()==""){
		document.getElementById("warning").innerHTML="<I>请输入密码</I>";
		return false;
	}
	if($('#rePassword').val()==null||$('#rePassword').val()==""){
		document.getElementById("warning").innerHTML="<I>请输入重复密码</I>";
		return false;
	}
	if($('#password').val()!=$('#rePassword').val()){
		document.getElementById("warning").innerHTML="<I>密码与重复密码不一致</I>";
		return false;
	}
	if($('#phone').val()==null||$('#phone').val()==""){
		document.getElementById("warning").innerHTML="<I>请输入手机号</I>";
		return false;
	}
	if(!/^1[3|5|8][0-9]\d{4,8}$/.test($('#phone').val())){
		document.getElementById("warning").innerHTML="<I>手机号格式有误</I>";
		return false;
	}
	if($('#pwdQuestion').val()==null||$('#pwdQuestion').val()==""){
		document.getElementById("warning").innerHTML="<I>请输入找回密码问题</I>";
		return false;
	}
	if($('#pwdAnswer').val()==null||$('#pwdAnswer').val()==""){
		document.getElementById("warning").innerHTML="<I>请输入找回密码答案</I>";
		return false;
	}
	document.getElementById("warning").innerHTML="";
	return true;
}
</script>
</body>
</html>