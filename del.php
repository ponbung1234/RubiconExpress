<?php
$did = $_GET['delid'];
$lo = $_GET['fid'];
require('comment_con.php');

$q = "DELETE FROM comment WHERE com_id ='$did'";
$result = $connect->query($q);

if(!$result){
	echo "Delete not success";
}
else{
	header("Location: food-info.php?fid=$lo");
}

?>