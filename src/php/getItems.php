<?php

require_once "config.php";

$conn = new mysqli($hn,$un,$pw,$db);

if($conn->connect_error) {
    $res["status"] = "error";
    $res["status_message"] = "MySQL connection error";
}
else {
    $result = $conn -> query("SELECT ItemName,ItemID FROM items");
    $res["items"] = $result -> fetch_all(MYSQLI_ASSOC);
}

echo json_encode($res);

?>