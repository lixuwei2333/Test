<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="auth.css">
<script type="text/javascript">
	function register(){
		window.location.href = "register.jsp";
	}
</script>
</head>
<!-- <body> -->
<!-- 	<h2>用户登录</h2> -->
<!-- 	<hr /> -->
<!-- 	<form action = "Login" method = "post"> -->
<!-- 		账号:<input type = "text" name = "account" /> <br /> -->
<!-- 		密码:<input type = "password" name = "password" /> <br /> -->
<!-- 		<input type = "submit" value = "登录" /> -->
<!-- 		<input type = "button" value = "注册"  onclick="register()"/> -->
<!-- 	</form> -->
<!-- </body> -->
<!-- </html> -->

<body>
	<div class="lowin lowin-blue">
		<div class="lowin-brand">
			<img src="kodinger.jpg" alt="logo">
		</div>
		<div class="lowin-wrapper">
			<div class="lowin-box lowin-login">
				<div class="lowin-box-inner">
					<form>
						<p>Sign in to continue</p>
						<div class="lowin-group">
							<label>Account <a href="#" class="login-back-link">Sign in?</a></label>
							<input type="text" name="account" class="lowin-input">
						</div>
						<div class="lowin-group password-group">
							<label>Password <a href="#" class="forgot-link">Forgot Password?</a></label>
							<input type="password" name="password" class="lowin-input">
						</div>
						<button class="lowin-btn login-btn">
							Sign In
						</button>

						<div class="text-foot">
							Don't have an account? <a href="" class="register-link">Register</a>
						</div>
					</form>
				</div>
			</div>

			<div class="lowin-box lowin-register">
				<div class="lowin-box-inner">
					<form action = "Register" method = "post">
						<p>Let's create your account</p>
						<div class="lowin-group">
							<label>Name</label>
							<input type="text" name="name" autocomplete="name" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>Account</label>
							<input type="text" name="account" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>Password</label>
							<input type="password" name="password" class="lowin-input">
						</div>
						<input class = "lowin-btn" type = "submit" value = "Sign Up" />
<!-- 						<button class="lowin-btn"> -->
<!-- 							Sign Up -->
<!-- 						</button> -->

						<div class="text-foot">
							Already have an account? <a href="" class="login-link">Login</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	
		<footer class="lowin-footer">
			Design By lxw
		</footer>
	</div>
	
	<script src="auth.js"></script>
	<script>
		Auth.init({
			login_url: 'Login',
			forgot_url: '#forgot'
		});
	</script>
	<script> 
	  	var error ='<%=request.getParameter("login")%>';
	  	if(error=='no'){
	   	alert("用户名或密码错误!");
	  	}
	</script>
	<script> 
	  	var error ='<%=request.getParameter("register")%>';
	  	if(error=='no'){
	   	alert("注册失败!");
	  	}
	  	if(error=='yes'){
		   	alert("注册成功!");
		 }
	</script>
</body>
</html>