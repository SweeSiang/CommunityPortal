<?php
session_start();
use classes\business\UserManager;
use classes\business\Validation;

require_once "includes/autoload.php";
$pageTitle = "Login";
include "includes/header.php";
$email="";
$password="";
$error_passwd="";
$formerror="";
$validate=new Validation();
if(isset($_POST["login"])) {
    $email=$_POST["email"];
    $password=$_POST["password"];
	if($validate->check_password($password, $error_passwd)) {
		$UM=new UserManager();
		$existuser=$UM->getUserByEmailPassword($email,$password);
		if(isset($existuser)) {
			$_SESSION["email"]=$email;
			$_SESSION["valid"]=true;
			if($existuser->role == "Administrator"){
				$_SESSION["admin"]=true;
			}
			echo "<meta http-equiv='Refresh' content='1; url=index.php'>";
		} else {
			$formerror="Invalid User Name or Password";
		}
	}
}
?>
	
	<br/><br/><br/>

	<div class="container">

		<ul class="nav nav-tabs">
			<li class="active"><a href="login.php" style="color:#555555;"><small>Log In</small></a></li>
			<li><a href="modules/user/registration.php"><small>Sign Up</small></a></li>
		</ul>

		<br/>

		<h3 class="text-center" style="color:#35AA84;"><strong>Login to your ABC Jobs account</strong></h3><br/>

		<div class="col-md-4 col-md-offset-4" style="margin-bottom:6em;">
		
			<div class="well" style="background:#FFFFFF;border-radius:0;">
			
				<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post"><br/>
					<div class="form-group">
						<label for="email">Email</label>
						<input type="email" class="form-control" name="email" id="email" placeholder="you@example.org" value="<?=$email?>">
					</div><br/>
					<div class="form-group">
						<label for="password">Password</label>
						<input type="password" class="form-control" name="password" id="password" placeholder="********" value="<?=$password?>">
						<p class="text-right"><a href="forget_password.php" style="color:#9FA6AD;"><small>forgot?</small></a></p>
						<?php echo $error_passwd; ?>
						<?php echo $formerror; ?>
					</div><br/>
					<input type="submit" name="login" value="Log In" class="btn btn-success center-block" style="background-color:#35AA84;padding:0.375em 1.375em;">
				</form><br/><br/>
				
				<p class="text-center"><small>Don't have an account? <a href="modules/user/registration.php">Sign up</a></small></p>
				<p class="text-center"><small>Forgot your password? <a href="forget_password.php">Click here</a></small></p><br/><br/>
			</div>
		</div>

	</div>

<?php
include "includes/footer.php";
?>