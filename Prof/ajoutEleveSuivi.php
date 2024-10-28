<?php

require('../connectSQL.php');

session_start();


$IdProf = isset($_SESSION['profil']['IdUtilisateur'])?($_SESSION['profil']['IdUtilisateur']):'';

$Email = $_REQUEST["Email"];

$stmt = $pdo->query("SELECT * FROM `utilisateurs` where Email='$Email'");
$row = $stmt->fetch();
$IdEleve = $row['IdUtilisateur'];


$stmt = $pdo->query("DELETE FROM potentiel WHERE IdEleve = $IdEleve");
$stmt = $pdo->query("INSERT INTO suivi (IdProf, IdEleve) VALUES ($IdProf, $IdEleve)");

?>
