<?php
session_start();
require_once '../../includes/autoload.php';

use classes\business\UserManager;
use classes\entity\User;

$pageTitle = "User List";
ob_start();
include '../../includes/security.php';
include '../../includes/header.php';

$output = "";
$deletebutton = "";

$UM=new UserManager();
$users=$UM->getAllUsers();

if(isset($users)) {
	$output .= "<tr>
		<thead>
		<th></th>
		<th><b>Id</b></th>
		<th><b>First Name</b></th>
		<th><b>Last Name</b></th>
		<th><b>Company</b></th>
		<th><b>Country</b></th>
		<th><b>City</b></th>		
		<th><b>Email</b></th>
		</thead>
		</tr>";
	foreach ($users as $user) {
		if($user!=null) {
			$output .= "<tr>
				<td><input type='checkbox' name='num[]' value='$user->id' style='visibility:hidden'></td>
				<td>$user->id</td>
				<td>$user->firstName</td>
				<td>$user->lastName</td>
				<td>$user->company</td>
				<td>$user->country</td>
				<td>$user->city</td>
				<td>$user->email</td>
				<td><a href='edit.php?userid=$user->id' style='visibility:hidden'>Edit</a></td>
			</tr>";
		}
	}
}

if(isset($_SESSION["admin"])) {
	$deletebutton .= "<input type='submit' name='delete' value='Delete'>";
}

if(isset($_POST['search'])) {
	$firstName=$_POST["firstName"];
	$lastName=$_POST["lastName"];
	$company=$_POST["company"];
	$country=$_POST["country"];
	$city=$_POST["city"];
	$UM=new UserManager();
	$users=$UM->getSomeUsers($firstName, $lastName, $company, $country, $city);
	if(isset($users)) {
		$output = "<tr>
		<thead>
		<th></th>
		<th><b>Id</b></th>
		<th><b>First Name</b></th>
		<th><b>Last Name</b></th>
		<th><b>Company</b></th>
		<th><b>Country</b></th>
		<th><b>City</b></th>		
		<th><b>Email</b></th>
		</thead>
		</tr>";
		foreach ($users as $user) {
			if($user!=null) {
			$output .= "<tr>
				<td><input type='checkbox' name='num[]' value='$user->id' style='visibility:hidden'></td>
				<td>$user->id</td>
				<td>$user->firstName</td>
				<td>$user->lastName</td>
				<td>$user->company</td>
				<td>$user->country</td>
				<td>$user->city</td>
				<td>$user->email</td>
			</tr>";
			}
		}
	}
}

if(isset($_POST['delete'])) {
	$checked = $_POST['num'];
	$UM=new UserManager();
	$UM->deleteAccount($checked);
	header("location: " . $_SERVER['PHP_SELF']);
}
?>

	<div class = "container">
		<br/>
		<form class="form-inline" action = "<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="post">
			<div class="form-group">
			<p><p><label for="firstName">First Name&nbsp;</label>
			<input class="form-control" type="text" name="firstName" size="10";>
			<label for="lastName">Last Name&nbsp;</label>
			<input class="form-control" type="text" name="lastName" size="10">
			<label for="company">Company&nbsp;</label>
			<input class="form-control" type="text" name="company" size="10">
			<label for="country">Country&nbsp;</label>
			<input class="form-control" type="text" name="country" size="10">
			<label for="lastname">City&nbsp;</label>
			<input class="form-control" type="text" name="city" size="10"></p>
			<div class="text-center"> 
			<input type="submit" name="search" value="Search">
			<input type="reset" value="Clear Search">
			</div> 
			</p>
		<table class="table">
			<?php echo $output;?>
		</table>
			<?php echo $deletebutton;?>
			</div>
		</form>
		<br/>
	</div>

<?php
include '../../includes/footer.php';
?>

<?php
if(isset($_SESSION["admin"])) {
	echo "<script>
	var inputs = document.getElementsByTagName('input');
	var edits = document.getElementsByTagName('a');
	for(var i = 0; i < inputs.length; i++) {
		if(inputs[i].type == 'checkbox') {
			inputs[i].style.visibility = 'visible';
		}			
	}
	for(var i = 0; i < edits.length; i++) {
		if(edits[i].style.visibility == 'hidden') {
			edits[i].style.visibility = 'visible';
		}			
	}	
	</script>";
}
?>