<!doctype html>
<html>
<head>

</head>

<body>
<?php
require_once('navbar.php');
require_once('../dbconfig.php');

if (isset($_POST['isDelivered'])) {
    $id = $_POST['isDelivered'];
    $sql = "UPDATE orders SET isDelivered = 1 WHERE order_id = $id";

    if ($connect->query($sql) === FALSE)
        echo "Error updating record: " . $connect->error;
}
?>
<link rel="stylesheet" type="text/css" href="../vendor/css/dataTables.bootstrap.min.css">
<script src="../vendor/js/jquery.dataTables.min.js"></script>
<script src="../vendor/js/dataTables.bootstrap.min.js"></script>
<br>
<form method="post" id="deliveryForm">
    <div class="container">
        <div class="table-responsive">
            <table class="table table-hover" id="deliveryTable">
                <thead>
                <tr>
                    <th>Order date</th>
                    <th>Customer name</th>
                    <th>Product name</th>
                    <th>Quantity</th>
                    <th>Address</th>
                    <th>Delivery status</th>
                </tr>
                </thead>
                <tbody>

                <?php
                $query = "SELECT order_id, orderDate, c.name as cu_name, p.name as p_name, quantity, address, isDelivered
                          FROM orders o join customer c on c.cu_id = o.cu_id
                          join product p on p.product_id = o.product_id";
                $result = mysqli_query($connect, $query);
                if (mysqli_num_rows($result) > 0):
                    ?>
                    <input type="hidden" value="<?= $row['order_id'] ?>">
                    <?php
                    while ($row = mysqli_fetch_array($result)):
                        if ($row['isDelivered'] == 1)
                            $isDelivered = true;
                        else
                            $isDelivered = false;
                        ?>
                        <tr>
                            <td><?= $row['orderDate'] ?></td>
                            <td><?= $row['cu_name'] ?></td>
                            <td><?= $row['p_name'] ?></td>
                            <td><?= $row['quantity'] ?></td>
                            <td><?= $row['address'] ?></td>
                            <td>
                                <button name="isDelivered" value="<?= $row['order_id'] ?>" class="
                            <?php if ($isDelivered) echo "btn btn-success";
                                else echo "btn btn-danger"; ?>"
                                    <?php if ($isDelivered) echo "disabled" ?>>
                                <?php if ($isDelivered) echo "Delivered";
                                else echo "Not delivered"; ?></td>
                        </tr>
                    <?php endwhile; ?>
                <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</form>
</body>
</html>

<script>
    $('#menu1').addClass('active');
    $('#deliveryTable').DataTable();
</script>
