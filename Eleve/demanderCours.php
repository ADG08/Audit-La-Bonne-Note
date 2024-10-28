<?php

require('../connectSQL.php');

session_start();

$Id = isset($_SESSION['profil']['IdUtilisateur'])?($_SESSION['profil']['IdUtilisateur']):'';

$lat = $_REQUEST["lat"];
$lng = $_REQUEST["lng"];


$stmt = $pdo->query("SELECT * FROM `localisation` WHERE Longitude = '$lng' AND Latitude = '$lat' ");
$row = $stmt->fetch();
$prof = $row['IdUtilisateur'];

$stmt = $pdo->query("SELECT * FROM `potentiel` WHERE IdProf = '$prof' AND IdEleve = '$Id' ");
$res = $stmt->fetch();
if ($res['IdProf'] == null){
    $stmt = $pdo->query("INSERT INTO potentiel (IdProf, IdEleve) VALUES ('$prof', $Id)");
}else{
    $stmt = $pdo->query("DELETE FROM potentiel WHERE IdEleve = $Id AND IdProf = $prof");
}

?>
