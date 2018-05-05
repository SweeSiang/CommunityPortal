<!-- Navigation Bar -->
<?php 
   if(isset($_SESSION["valid"]))
   {
?>
<!DOCTYPE html>
<html>

<head>

	<title><?php echo $pageTitle ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://localhost/m5project/public/bs/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://localhost/m5project/public/bs/js/bootstrap.min.js"></script>

</head>

<body>

	<nav class="navbar navbar-default" style="background-color:#FFFFFF;border-color:#63666A;border-radius:0;margin-bottom:0;">

		<div class="container">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="background:#35AA84;">
					<span class="icon-bar" style="background:#FFFFFF;"></span>
					<span class="icon-bar" style="background:#FFFFFF;"></span>
					<span class="icon-bar" style="background:#FFFFFF;"></span>                             
				</button>
				<a href="http://localhost/m5project/public/index.php" class="navbar-left"><img src="http://localhost/m5project/public/images/example.png"></a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="http://localhost/m5project/public/modules/user/user_list.php">Users</a></li>
					<li><a href="#">Posts</a></li>
				</ul>
				<form class="navbar-form text-center">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search...">
					</div>
				<ul class="nav navbar-nav navbar-right">
					<a href="#" class="nav-item nav-link"><img src="http://localhost/m5project/public/images/message.png" style="margin-right:0.438em;"></a>
					<a href="http://localhost/m5project/public/modules/user/update_profile.php" class="nav-item nav-link"><button type="button" class="btn" style="background-color:#FFFFFF;color:#35AA84;border-color:#35AA84;padding:0.375em 1.5em;">Profile</button></a>
					<a href="http://localhost/m5project/public/logout.php" class="nav-item nav-link"><button type="button" class="btn" style="background-color:#35AA84;color:#FFFFFF;border-color:#FFFFFF;padding:0.375em 1.375em;">Log Out</button></a>
				</ul>
				</form>
			</div>

		</div>

	</nav>
<?php 
   } else
   {
?>
<!DOCTYPE html>
<html>

<head>

	<title><?php echo $pageTitle ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://localhost/m5project/public/bs/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://localhost/m5project/public/bs/js/bootstrap.min.js"></script>

</head>

<body>

	<nav class="navbar navbar-default" style="background-color:#FFFFFF;border-color:#63666A;border-radius:0;margin-bottom:0;">

		<div class="container">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="background:#35AA84;">
					<span class="icon-bar" style="background:#FFFFFF;"></span>
					<span class="icon-bar" style="background:#FFFFFF;"></span>
					<span class="icon-bar" style="background:#FFFFFF;"></span>                             
				</button>
				<a href="http://localhost/m5project/public/index.php" class="navbar-left"><img src="http://localhost/m5project/public/images/example.png"></a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="#">Users</a></li>
					<li><a href="#">Posts</a></li>
				</ul>
				<form class="navbar-form text-center">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search...">
					</div>
				<ul class="nav navbar-nav navbar-right">
					<a href="#" class="nav-item nav-link"><img src="http://localhost/m5project/public/images/message.png" style="margin-right:0.438em;"></a>
					<a href="http://localhost/m5project/public/login.php" class="nav-item nav-link"><button type="button" class="btn" style="background-color:#FFFFFF;color:#35AA84;border-color:#35AA84;padding:0.375em 1.5em;">Log In</button></a>
					<a href="http://localhost/m5project/public/modules/user/registration.php" class="nav-item nav-link"><button type="button" class="btn" style="background-color:#FFFFFF;color:#35AA84;border-color:#35AA84;padding:0.375em 1.375em;">Sign Up</button></a>
				</ul>
				</form> 
			</div>

		</div>

	</nav>
<?php 
   } 
?>