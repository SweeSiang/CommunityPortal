<?php
session_start();
require_once "includes/autoload.php";
$pageTitle = "Forget Password Confirmation";
include "includes/header.php";
$email = "";
if(isset($_GET["email"])) {
	$email = $_GET["email"];
}
?>
	
	<br/><br/><br/>

	<div class="container">

		<ul class="nav nav-tabs">
			<li class="active"><a href="login.php" style="color:#555555;"><small>Log In</small></a></li>
			<li><a href="modules/user/registration.php"><small>Sign Up</small></a></li>
		</ul>

		<br/>
		
		<div class="row" style="margin-bottom:20em;">
			<div class="col-md-6 col-md-offset-3" style="margin-bottom:3em;">'
				<div class="well well-lg" style="background:#EDF8F1;border-radius:0;border-color:#35AA84;">
					<p><img class="center-block img-responsive" src="images/tick.png"></p>
					<p class="text-center"><strong>Account recovery email sent to <?=$email?></strong></p>
					<p>If you don't see this email in your inbox within 15 minutes, look for it in your junk mail folder. If you find it there, please mark it as "Not Junk".</p>
				</div>
			</div>
		</div>

	</div>

<?php
include "includes/footer.php";
?>