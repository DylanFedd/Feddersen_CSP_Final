<?php

require_once "config.php";

$json = file_get_contents("php://input");
$data = json_decode($json, true);

$ItemCollected = (int)$data["ItemCollected"];
$CollectorItemID = $data["CollectorItemID"];

$conn = new mysqli($hn,$un,$pw,$db);

if($conn->connect_error) {
    $res["status"] = "error";
    $res["status_message"] = "MySQL connection error";
}
else {
    $stmt = $conn->prepare("UPDATE collectorlist SET ItemCollected = ? WHERE CollectorItemID = ?");
    $stmt->bind_param("ii",$ItemCollected,$CollectorItemID);

    if($stmt->execute()) {
        $res["status"] = "success";
        $res["status_message"] = "data updated";
    }
    else {
        $res["status"] = "error";
        $res["status_message"] = "data failed to update";
    }
}

echo json_encode($res);

?>