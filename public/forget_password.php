<?php
session_start();
use classes\business\UserManager;
require_once "includes/autoload.php";
$pageTitle = "Forget Password";
include "includes/header.php";

$formerror = "";

if(isset($_POST["recover"])) {
	$email=$_POST["email"];
	$UM=new UserManager();
	$existuser=$UM->getUserByEmail($email);
	if(isset($existuser)) {
		$newPassword=$UM->randomPassword(10, 1, "lower_case,upper_case,numbers")[0];
		require_once "phpmailer/PHPMailerAutoload.php";
		$mail = new PHPMailer;
		$mail->isSMTP();
		$mail->Host = " in-v3.mailjet.com";
		$mail->SMTPAuth = true;
		$mail->Username = "fd3241188331e8c56a07adf3d0ac1154";
		$mail->Password = "5245b903fb65917f469012df3b57e492";
		$mail->SMTPSecure = "tls";
		$mail->Port = 25;
		$mail->From = "tomlin190@hotmail.com";
		$mail->FromName = "Site Admin";
		$mail->addAddress("$email");
		$mail->isHTML(true);
		$mail->Subject = "ABC Jobs Password Recovery";
		$mail->Body = "Please login with your new password: $newPassword";
		$mail->AltBody = "Please login with your new password: $newPassword";
		if(!$mail->send() {
			echo "Mailer Error: " . $mail->ErrorInfo;
		} else {
			$UM->updatePassword($email, $newPassword);
			echo "<meta http-equiv='Refresh' content='1; url=./forget_password_confirmation.php?email=$email'>";
		}
	} else {
		$formerror = "User does not exist in the system";
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

		<h6>Forgot your account's password? Enter your email address and we'll send you a recovery link.</h6>
		<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
			<input type="text" name="email" size="40">
			<p style="margin:0.6em 0 32em;">
				<input type="submit" name="recover" id="recover" value="Send Recovery Email" class="btn btn-success" style="background-color:#35AA84;padding:0.3em 1.375em;"><br/><br/>
				<?=$formerror?>
			</p>
		</form>
	</div>

<?php
include "includes/footer.php";
?>