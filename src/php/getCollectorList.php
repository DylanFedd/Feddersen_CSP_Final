<?php

require_once "config.php";

$json = file_get_contents("php://input");
$data = json_decode($json, true);

$session = $data["session"];
session_id($session);
session_start();
$auth = isset($_SESSION['auth']);

$conn = new mysqli($hn,$un,$pw,$db);

if($auth) {
    $id = $_SESSION["id"];

    if($conn->connect_error) {
        $res["status"] = "error";
        $res["status_message"] = "MySQL connection error";
    }
    else {
        $collectorlistResults = $conn->query("SELECT ItemName,CollectorItemID,ItemCollected,ItemBrand FROM collectorlist INNER JOIN items ON items.ItemID = collectorlist.ItemID WHERE id = $id");

        if($collectorlistResults) {
            $res["collectorlist"] = $collectorlistResults -> fetch_all(MYSQLI_ASSOC);
            $res["status"] = "success";
        }
        else {
            $res["status"] = "errror";
            $res["status_message"] = "failed to fetch data";
        }
    }
}
else {
    $res["status_message"] = "Not logged in";
    $res["status"] = "errror";
}

echo json_encode($res);

?>