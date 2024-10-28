<?php

require('../connectSQL.php');

session_start();

$res = array();
$result = array();


$id = isset($_SESSION['profil']['IdUtilisateur'])?($_SESSION['profil']['IdUtilisateur']):'';


$stmt = $pdo->query("SELECT * FROM `potentiel` where IdProf=$id");
while ($row = $stmt->fetch()) {
    array_push($res, $row['IdEleve']."\n");
}


foreach($res as &$test){
    $stmt = $pdo->query("SELECT * FROM `utilisateurs` where IdUtilisateur=$test");
    $row = $stmt->fetch();
    
    array_push($result, array("nom"=> $row['Nom'],"prenom"=> $row['Prénom'],"email" => $row['Email']));
}

echo json_encode($result);

?>
