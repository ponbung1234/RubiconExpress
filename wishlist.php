<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>The Rubicon Express</title>
</head>
<body>
<?php
require_once('menu.php');
?>

<div class="container" style="width:60%;">
    <h2 align="center">My wishlist</h2>
    <br>
    <?php
    $query2 = "SELECT * FROM wishlist ORDER BY wishlist_id";
    $result2 = mysqli_query($connect, $query2); ?>
    <form method="post" id="productsForm">
        <?php
        if (mysqli_num_rows($result2) > 0):
            while ($row2 = mysqli_fetch_array($result2)):
                $product_id = $row2['product_id'];
                $query = "SELECT * FROM product WHERE product_id = $product_id";
                $result = mysqli_query($connect, $query);
                $row = mysqli_fetch_array($result);
                ?>
                <div class="col-md-4" style="display: none;">
                    <div style="border: 1px solid #eaeaec; margin: -1px 19px 3px -1px; box-shadow: 0 1px 15px rgba(0,0,0,0.05); padding:10px;"
                         align="center">
                        <img src="<?php echo $row["image"]; ?>" class="img-responsive" style="max-height: 130px;">
                        <h5 class="text-info"><?php echo $row["name"]; ?></h5>
                        <h5 class="text-danger">฿<?php echo $row["price"]; ?></h5>
                        <button name="addButton" style="margin-top:5px;" class="btn btn-success"
                                value="<?php echo $row["product_id"]; ?>"> Add to Cart
                        </button>
                        <button name="removeButton" style="margin-top:5px;" class="btn btn-danger"
                                value="<?php echo $row["product_id"]; ?>"> Remove
                        </button>
                    </div>
                </div>
                <?php
            endwhile;
        endif;
        ?>
    </form>
</div>
</body>
</html>

<script>
    var productID, btnString = 'cart';

    $(document).ready(function () {
        $(".col-md-4").fadeIn("slow");
        initialLoad();
    });

    function initialLoad() {
        $('button[name="removeButton"]').click(function () {
            productID = $(this).val();
            btnString = 'remove';
        });

        $('button[name="addButton"]').click(function () {
            productID = $(this).val();
            btnString = 'cart';
        });

        // Attach a submit handler to the form
        $("#productsForm").submit(function (event) {
            // Stop form from submitting normally
            event.preventDefault();

            var posting;
            if (btnString === 'cart')
                posting = $.post("php-action/add-cart.php", {hidden_id: productID});
            else
                posting = $.post("php-action/remove-wishlist.php", {hidden_id: productID});

            // Put the results in a div
            posting.done(function (data) {
                swal('Success!', data, 'success').then(function () {
                    location.reload();
                });
            });
        });
    }
</script>