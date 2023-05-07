<?php

require_once "config.php";

$json = file_get_contents("php://input");
$data = json_decode($json, true);

$sessionID = $data["sessionID"];
session_id($sessionID);
session_start();

$id = $_SESSION["id"];
$oldPassword = $data["oldPassword"];
$newPassword = $data["newPassword"];

$conn = new mysqli($hn,$un,$pw,$db);

if($conn->connect_error) {
    $res["status"] = "error";
    $res["status_message"] = "MySQL connection error";
}
else {
    $result = $conn->query("SELECT password FROM users WHERE id=$id");
    $row = $result->fetch_array(MYSQLI_ASSOC);

    if(password_verify($oldPassword,$row["password"])) {
        $newPassword = password_hash($newPassword, PASSWORD_DEFAULT);
        $stmt = $conn->prepare("UPDATE users SET password = ? WHERE id = ?");
        $stmt->bind_param("si",$newPassword,$id);

        if($stmt->execute()) {
            $res["status"] = "success";
            $res["status_message"] = "data updated";
        }
        else {
            $res["status"] = "error";
            $res["status_message"] = "data failed to update";
        }
    }
    else {
        $res["status"] = "error";
        $res["status_message"] = "bad password";
    }
}

echo json_encode($res);

?>