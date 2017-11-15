 <?php 
require('dbconfig.php');
if(isset($_POST['submit'])){
	$name=$_SESSION['name'];
	$comment=$_POST['comment'];
	$submit=$_POST['submit'];
	if($name&&$comment)
	{
		$q = "INSERT INTO comment (com_name,com_comment,food_id) VALUE ('$name','$comment','$editid')";
		$result = $connect->query($q);
	}
	else
	{
		echo "Please fill out";
	}

}
 ?>


<!DOCTYPE html>
<html>
<head>
	<title>Comment Box</title>
	<link rel="stylesheet" type="text/css" href="/MainProject/comment/vendor/css/comment.css">
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/script.js"></script>
</head>
<body>
	<!-- Comment Box -->
 	<?php

 		if (!isset($_SESSION["cu_id"]))
 		{
 			echo "login first!!";
 		}
 		else
 		{
 	?>
 			<form action="food-info.php?fid=<?=$row['food_id']?>" method="POST">
            <table>
                <tr>
                    <td>User: </td>
                    <td><?= $_SESSION['name']; ?></td>
                </tr>

                <tr><td colspan="2">Comment: </td></tr>
                
                <tr><td colspan="2"><textarea  name="comment" placeholder="Write the review here!"  ></textarea></td></tr>
            	
                <tr><td colspan="2"><input  type="submit" name="submit" value="comment" ></input></td></tr>
            </table>
        	</form>
		

    <?php
 		}
 	?>






	<div class="wrapper">
		<div class="page-data">
			<?php echo $row["name"]; ?>
		</div>
		<div class="comment-wrapper">

			<h3 class="comment-title">Review</h3>


			<div class="comment-list">
				<ul class="comment-holder-ul">
<?php 

$q = "select com_id,com_name,com_comment from comment WHERE food_id = '$editid'";
$result = $connect->query($q);
while ($row = $result->fetch_array()) {
	# code...
 ?>
					<li class="comment-holder" id="_1">
						<div class="user-img">
							<img src="images/programmer.png" class="user-img-pic" />
							
						</div>
						<div class="comment-body">


							<div class="username-field">
								<?=$row['com_name']?>
							</div>
							<div class="comment-text">
								<?=$row['com_comment']?>

							</div>
						</div>
			<?php

			if ($delcom == $row['com_name']) {
			?>
						<div class="comment-button-holder">
							<ul>
								<li class="delete-btn">
									

									<?php
										echo '<a href="del.php?delid='.$row["com_id"].'&fid='.$editid.'">';
					                ?>
					                X
					            	</a>
								</li>
							</ul>
						</div>
			<?php
			}
			?>

					</li>
<?php } ?>

				</ul>


			</div>

		</div>


	</div>
	<br>
	<br>

</body>
</html>