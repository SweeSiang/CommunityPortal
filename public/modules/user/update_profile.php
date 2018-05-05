<?php
session_start();
require_once "../../includes/autoload.php";
$pageTitle = "Update Profile";
ob_start();
include '../../includes/security.php';
include "../../includes/header.php";

use classes\business\UserManager;
use classes\business\Validation;
use classes\entity\User;

$error_passwd="";
$formerror="";
$validate=new Validation();

if(!isset($_POST["update"])) {
	$UM=new UserManager();
	$existuser=$UM->getUserByEmail($_SESSION["email"]);
	$firstName=$existuser->firstName;
	$lastName=$existuser->lastName;
	$company=$existuser->company;
	$country=$existuser->country;
	$city=$existuser->city;
	$email=$existuser->email;
	$password="********";
} else {
    $firstName=$_POST["firstName"];
	$lastName=$_POST["lastName"];
	$company=$_POST["company"];
	$country=$_POST["country"];
	$city=$_POST["city"];
    $email=$_POST["email"];
	$password=$_POST["password"];
	if($validate->check_password($password, $error_passwd)) {
		$update=true;
		$UM=new UserManager();
        if($email!=$_SESSION["email"]){
			$existuser=$UM->getUserByEmail($email);
			if(is_null($existuser)==false){
				$formerror="User email already in use, please choose another email";
				$update=false;
            }
		}
		if($update){
			$existuser=$UM->getUserByEmail($_SESSION["email"]);
			$existuser->firstName=$firstName;
			$existuser->lastName=$lastName;
			$existuser->company=$company;
			$existuser->country=$country;
			$existuser->city=$city;			
			$existuser->email=$email;
			$existuser->password=$password;
			$UM->updateUser($existuser);
			$_SESSION["email"]=$email;
			header("Location:../../index.php");
		}
	}
}
?>

	<script>
		function input_validation(input, mx, my) {
			var input_element = document.getElementById(input);
			var input_length = input_element.value.length;
			var display_element = document.getElementById(input + "_validation");
			if (input_length >= my || input_length < mx) {
				var message = "Please enter " + mx + " to " + my + " characters";
				display_element.innerHTML = message;
				display_element.style.visibility = "visible";
				display_element.style.color = "#FF0000";
			} else {
				display_element.innerHTML = "";
				}
			}
		function password_validation() {
			var password = document.getElementById("password").value;
			var regular_expression  = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
			var display_element = document.getElementById("password_validation");
			if(!regular_expression.test(password)) {
				var message = "Password must consist of at least 6 characters with at least 1 uppercase letter, 1 lowercase letter and 1 digit";
				display_element.innerHTML = message;
				display_element.style.visibility = "visible";
				display_element.style.color = "#FF0000";
			} else {
				display_element.innerHTML = "";
				}
			}
		function form_validation() {
			var inputs = document.getElementsByTagName("input");
			var errors = document.getElementsByTagName("p");
			var error_message = "";
			for (var i = 0; i < errors.length; i++) {
				if(errors[i].innerHTML != "" || inputs[i+1].value == "") {
					error_message = "Please double check your entries";
				}
			}
			if(error_message != "") {
				alert(error_message);
				event.preventDefault();
			} else {
				return true;
			}
		}
	</script>
	<br/><br/><br/>

	<div class="container">

		<ul class="nav nav-tabs">
			<li><a href="../../login.php" style="color:#555555;"><small>Log In</small></a></li>
			<li class="active"><a href="registration.php"><small>Sign Up</small></a></li>
		</ul>

		<br/>

		<h3 class="text-center" style="color:#35AA84;"><strong>Update your ABC Jobs account</strong></h3>

		<div class="col-md-6 col-md-offset-3" style="margin-bottom:3em;">

			<form class="form-horizontal" id="registration_form" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post" onsubmit="form_validation();"><br/>

				<div class="form-group">
					<label class="control-label col-md-3" for="firstName">First Name</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="firstName" id="firstName" placeholder="e.g. John" value="<?=$firstName?>" onblur="input_validation('firstName',1,45)">
					<p id="firstName_validation" style="visibility:hidden;margin:0;padding:0;height:0;overflow:visible;"></p>
				</div>
				</div><br/>

				<div class="form-group">
					<label class="control-label col-md-3" for="lastName">Last Name</label>
				<div class="col-md-9"> 
					<input type="text" class="form-control" name="lastName" id="lastName" placeholder="e.g. Doe" value="<?=$lastName?>" onblur="input_validation('lastName',1,45)">
					<p id="lastName_validation" style="visibility:hidden;margin:0;padding:0;height:0;overflow:visible;"></p>
				</div>
				</div><br/>

				<div class="form-group">
					<label class="control-label col-md-3" for="company">Company</label>
				<div class="col-md-9"> 
					<input type="text" class="form-control" name="company" id="company" placeholder="e.g. ABC Jobs Pte Ltd" value="<?=$company?>" onblur="input_validation('company',1,45)">
					<p id="company_validation" style="visibility:hidden;margin:0;padding:0;height:0;overflow:visible;"></p>
				</div>
				</div><br/>
				
				<div class="form-group">
					<label class="control-label col-md-3" for="country">Country</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="country" id="country" placeholder="e.g. Singapore" value="<?=$country?>" onblur="input_validation('country',1,45)">
					<p id="country_validation" style="visibility:hidden;margin:0;padding:0;height:0;overflow:visible;"></p>
				</div>
				</div><br/>
				
				<div class="form-group">
					<label class="control-label col-md-3" for="city">City</label>
				<div class="col-md-9"> 
					<input type="text" class="form-control" name="city" id="city" placeholder="e.g. Los Angeles" value="<?=$city?>" onblur="input_validation('city',1,45)">
					<p id="city_validation" style="visibility:hidden;margin:0;padding:0;height:0;overflow:visible;"></p>
				</div>
				</div><br/>

				<div class="form-group">
					<label class="control-label col-md-3" for="email">Email</label>
				<div class="col-md-9"> 
					<input type="email" class="form-control" name="email" id="email" placeholder="e.g. you@example.org" value="<?=$email?>" onblur="input_validation('email',1,45)">
					<p id="email_validation" style="visibility:hidden;margin:0;padding:0;height:0;overflow:visible;"></p>
				</div>
				</div><br/>

				<div class="form-group">
					<label class="control-label col-md-3" for="password">Password</label>
				<div class="col-md-9"> 
					<input type="password" class="form-control" name="password" id="password" placeholder="e.g. ********" value="<?=$password?>" onblur="password_validation()">
					<p id="password_validation" style="visibility:hidden;margin:0;padding:0;height:0;overflow:visible;"></p>
				</div>
				</div><br/>
	
				<div class="form-group"> 
					<div class="col-md-offset-9 col-md-3 text-right">
						<input type="submit" name="update" id="update" value="Update" class="btn btn-success" style="background-color:#35AA84;padding:0.375em 1.375em;">
					</div>
				</div>
				<div class="col-md-offset-6.5 col-md-5.5 text-right" style="color:#FF0000;"><?=$formerror?></div>
			</form>
			
			<div class="text-right"><small>Already have an account? <a href="../../login.php">Log in</a></small></div>

		</div>

	</div>

<?php
include "../../includes/footer.php";
?>