<?php
include_once '../dbconfig.php';
session_start();
$cu_id = $_SESSION["cu_id"];

if (isset($_POST['action'])) {
    if ($_POST['action'] == "checkout") {
        echo "Echo from cart-action.php";
    } else if ($_POST['action'] == "updateQty")
        updateQuantity($connect, $cu_id);
    else {
        $product_id = $_POST['product_id'];
        $sql = "DELETE FROM cart where product_id = $product_id and cu_id = $cu_id";

        if ($connect->query($sql) === TRUE) {
            echo "The selected product has been removed from cart";
        } else {
            echo "Error: " . $sql . "<br>" . $connect->error;
        }
    }
} else
    echo "No data is received.";

function updateQuantity($connect, $cu_id)
{
    $number = count($_POST["productID"]);

    if ($number > 0) {
        for ($i = 0; $i < $number; $i++) {
            $id = mysqli_real_escape_string($connect, $_POST["productID"][$i]);
            $qty = mysqli_real_escape_string($connect, $_POST["quantity"][$i]);
            $sql = "UPDATE cart SET quantity = '$qty' WHERE product_id = '$id' and cu_id = $cu_id";
            mysqli_query($connect, $sql);
        }

        if ($connect->query($sql) === TRUE) {
            echo "Successfully updated total price!";
        } else {
            echo "Error: " . $sql . "<br>" . $connect->error;
        }
    }
}