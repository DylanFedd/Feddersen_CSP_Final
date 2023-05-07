<?php

require_once "config.php";

$json = file_get_contents("php://input");
$data = json_decode($json, true);

$session = $data["session"];
session_id($session);
session_start();

$auth = $_SESSION["auth"];

$itemID = $data["itemID"];
$id = $_SESSION["id"];

if ($auth) {
    $conn = new mysqli($hn,$un,$pw,$db);

    if($conn->connect_error) {
        $res["status"] = "error";
        $res["status_message"] = "MySQL connection error";
    }
    else {
        $stmt = $conn->prepare("INSERT INTO collectorlist(id,itemID) VALUES (?,?)");
        $stmt->bind_param("ii",$id,$itemID);

        if($stmt->execute()) {
            $res["status"] = "success";
        }
        else {
            $res["status"] = "error";
            $res["status_message"] = $stmt->error;
        }
    }
}
else {
    $res["status"] = "erros";
    $res["status_message"] = "Not authenticated.";
}

echo json_encode($res);

?>