<?php
	include 'mysql_config.php';
	$con = new mysqli($servername, $username, $password, $dbname);
	$con->query("update counter set counter=counter+1");
	$result = $con->query("select counter from counter");
	echo $result->fetch_assoc()['counter'];
?>