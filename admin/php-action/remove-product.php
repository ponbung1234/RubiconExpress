<?php
include_once '../../dbconfig.php';

$id = $_POST['product_id'];
$query = "SELECT * FROM product WHERE product_id= $id";
$query2 = "DELETE FROM product WHERE product_id= $id";
$result = mysqli_query($connect, $query);
$row = mysqli_fetch_array($result);
unlink("../../" . $row["image"]);

if ($connect->query($query2) === TRUE)
    echo "success";
else
    echo "Error: " . $query . "<br>" . $connect->error;

$connect->close();