<!-- <?php

// if (isset($_GET['fid']))
//     echo $_GET['fid'];
?>
 -->
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>The Rubicon Express</title>
    <link rel="stylesheet" type="text/css" href="vendor/css/product.css">
    <link rel="stylesheet" type="text/css" href="vendor/css/comment.css">
</head>
<body>
    <?php
require_once('menu.php');

    $editid = $_GET['pid'];
    $q = "SELECT * FROM product WHERE product_id = '$editid'";
    $result = $connect->query($q);
    if(!$result){
        echo "Cannot get current record<br>".$q;
        exit();
    }
    $row = mysqli_fetch_array($result);
?>



<div class="container" style="width:60%;">

    <h1><?php echo $row["name"]; ?>
    <span class="price-new text-danger">฿<?php echo $row["price"]; ?></span>
    </h1>
                                    <br>
    <img src="<?php echo $row["image"]; ?>" class="img-responsive"
                                 alt="Product Image"
                                 style="width:50%; text-align: center" />
                                 <br>
     <h4>&emsp;<?php echo $row["description"]; ?></h4>
     <br>
<?php 
require_once('comment.php')
 ?>


</div>




</body>
</html>


