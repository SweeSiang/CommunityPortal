<?php
session_start();
session_destroy();
header("Location:/m5project/public/index.php");
?>