<?php
session_start();
require_once "includes/autoload.php";
$pageTitle = "ABC Jobs";
include "includes/header.php";
?>

	<div class="container-fluid" style="padding:0;">

		<div class="jumbotron" style="background-image:url('images/heroBackground.png');background-size:cover;border-radius:0;">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h2 style="color:#FFFFFF;"><strong>ABC Jobs is a Software Developer Community</strong></h2><br/>
							<p style="color:#FFFFFF;font-size:1.125em;">Connect with tech pros around the world to learn, share knowledge, and build your career</p><br/>
							<a href="modules/user/registration.php"><button type="button" class="btn btn-success" style="background-color:#35AA84;padding:0.375em 1.375em;">Sign Up</button></a>
					</div>
					<div class="col-md-6">
						<img src="images/community.png" class="img-responsive">
					</div>
				</div>
			</div>
		</div>
	</div>

	<h3 class="text-center" style="color:#35AA84;"><strong>Connect with Pros</strong></h3>
	<p class="text-center">By joining us, you will have a chance to interact with top programmers worldwide</p><br/>

	<div class="container">

		<div class="row">

			<div class="col-md-6">
				<div class="panel" style="box-shadow:0.25em 0.25em #F0F0F0;">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4">
								<img src="images/proudFace.png" class="img-responsive">
							</div>
							<div class="col-md-8" style="font-size:0.9em;">
								<p style="padding:0.8em 0;"><strong>Jeff Szczepanski</strong></p>
								<p style="color:#9FA6AD;">Head of Software Engineering, IBM</p>
								<p style="padding:0.8em 0;">"Thousands of developers out there are being deprived of the opportunity to put their talents and coding prowess to use. Well, not anymore."</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="panel" style="box-shadow:0.25em 0.25em #F0F0F0;">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4">
								<img src="images/smilingFace.png" class="img-responsive">
							</div>
							<div class="col-md-8" style="font-size:0.9em;">
								<p style="padding:0.8em 0;"><strong>Tony Almeida</strong></p>
								<p style="color:#9FA6AD;">Senior Software Engineer, Facebook</p>
								<p style="padding:0.8em 0;">"A website with a great community. Whenever I feel like I need any help, this is where I go. If you have a programming question, ABC Jobs is probably the best place to ask."</p>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<h3 class="text-center" style="color:#35AA84;"><strong>How It Works</strong></h3>
		<p class="text-center">Everyone here is committed to making the Internet a better place</p><br/>

		<div class="row" style="margin-bottom:10em;">

			<div class="col-md-4">
				<img src="images/questions.png" class="img-responsive" style="border:0.1em solid #35AA84;"><br/>
				<p class="text-center" style="color:#35AA84;"><strong>Ask Questions</strong></p>
				<p class="text-justify" style="font-size:0.9em;">Read a curated collection of the best solutions to common coding problems and receive help from professionals within hours.</p>
			</div>

			<div class="col-md-4">
				<img src="images/answers.png" class="img-responsive" style="border:0.1em solid #35AA84;"><br/>
				<p class="text-center" style="color:#35AA84;"><strong>Post Answers</strong></p>
				<p class="text-justify" style="font-size:0.9em;">Enrich the lives of other developers and build your reputation to become a trusted expert in the community.</p>
			</div>

			<div class="col-md-4">
				<img src="images/jobs.png" class="img-responsive" style="border:0.1em solid #35AA84;"><br/>
				<p class="text-center" style="color:#35AA84;"><strong>Match Jobs</strong></p>
				<p class="text-justify" style="font-size:0.9em;">Source, attract and recruit talent on the platform filled with experts and enthuasists who are passionate about software development.</p>
			</div>

		</div>

	</div>

<?php
include "includes/footer.php";
?>