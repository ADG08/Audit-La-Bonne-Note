<?php

require('../connectSQL.php');

session_start();

$Id = isset($_SESSION['profil']['IdUtilisateur'])?($_SESSION['profil']['IdUtilisateur']):'';

$lat = $_REQUEST["lat"];
$lng = $_REQUEST["lng"];


$res = array();

$stmt = $pdo->query("SELECT * FROM `localisation` WHERE Longitude = '$lng' AND Latitude = '$lat' ");
while ($row = $stmt->fetch()) {
    array_push($res, $row['IdUtilisateur']);
}
foreach($res as &$x){
    $stmt = $pdo->query("DELETE FROM favori WHERE IdEleve = $Id AND IdProf = $x");
}
echo "fait";

?>
