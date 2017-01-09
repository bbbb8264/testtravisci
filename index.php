<?php
	include 'mysql_config.php';
	$con = new mysqli($servername, $username, $password, $dbname);
?>
<!DOCTYPE html>
<html>
<head>
	<title>Counter</title>
	<script src="jquery-3.1.1.min.js"></script>
	<script>
		function plusone(){
			$.ajax({
				method: "GET",
				url: "plusone.php",
			}).done(function( msg ) {
				$("#number").html(msg);
			});
		}
		setInterval(function(){
			$.ajax({
				method: "GET",
				url: "getcount.php",
			}).done(function( msg ) {
				$("#number").html(msg);
			});
		},50);
	</script>
</head>
<body>
	Current Number:<span id="number">
	<?php
		$result = $con->query("select counter from counter");
		echo $result->fetch_assoc()['counter'];
	?></span>
	<br><button onclick="plusone()">plus 1</button>
</body>
</html>