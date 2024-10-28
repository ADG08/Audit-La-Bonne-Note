<?php

require('../connectSQL.php');

session_start(); 

$lat = $_REQUEST["lat"];
$lng = $_REQUEST["lng"];


$stmt = $pdo->query("SELECT * FROM `localisation` WHERE Longitude = '$lng' AND Latitude = '$lat' ");
$row = $stmt->fetch();
$idProf = $row['IdUtilisateur'];

$stmt = $pdo->query("SELECT * from InfoProf where IdProf = $idProf");
$res = $stmt->fetch();
$nomMat = $res['IdMatiere'];
$nomNiv = $res['IdNiveau'];

$result = array();

$stmt = $pdo->query("SELECT * FROM matière where IdMatiere = '$nomMat' " );

$mat = $stmt->fetch();

array_push($result, $mat['NomMatiere']);

$stmt = $pdo->query("SELECT * from niveau where IdNiveau = '$nomNiv' ");

$niv = $stmt->fetch();

array_push($result, $niv['NomNiveau']);

echo json_encode($result);

?>