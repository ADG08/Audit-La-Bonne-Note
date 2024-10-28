<?php

require('../connectSQL.php');

session_start();

$res = array();
$result = array();


$id = isset($_SESSION['profil']['IdUtilisateur'])?($_SESSION['profil']['IdUtilisateur']):'';

$arr = $_REQUEST["arr"];


$stmt = $pdo->query("SELECT * FROM `infosup` WHERE infosup.IdUtilisateur NOT IN(SELECT favori.IdProf FROM favori where favori.IdEleve = $id) AND infosup.Prof = 1 AND infosup.Arrondissement = $arr");
while ($row = $stmt->fetch()) {
    array_push($res, $row['IdUtilisateur']);
}

foreach($res as &$x){
    $stmt = $pdo->query("SELECT * FROM utilisateurs, infosup, localisation WHERE infosup.IdUtilisateur = '$x' AND  infosup.IdUtilisateur =  utilisateurs.IdUtilisateur AND utilisateurs.IdUtilisateur = localisation.IdUtilisateur");
    while ($row = $stmt->fetch()) {
        array_push($result, $row);
    }
}

echo json_encode($result);

?>
