<?php
	include 'mysql_config.php';
	$con = new mysqli($servername, $username, $password, $dbname);
	$result = $con->query("select counter from counter");
	echo $result->fetch_assoc()['counter'];
?>