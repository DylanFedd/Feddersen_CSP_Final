<?php

require_once("config.php");

$json = file_get_contents("php://input");
$data = json_decode($json, true);

$sessionID = $data["sessionID"];

session_start($sessionID);

session_destroy();

?>