<?php

require('../connectSQL.php');

session_start();

$Id = isset($_SESSION['profil']['IdUtilisateur'])?($_SESSION['profil']['IdUtilisateur']):'';
$idProf = $_REQUEST['idProf'];


$stmt = $pdo->query("SELECT * FROM `potentiel` WHERE potentiel.IdEleve = $Id AND potentiel.IdProf = $idProf");
$row = $stmt->fetch();
$row['IdProf'];

if($row['IdProf'] == null){
    $stmt = $pdo->query("SELECT * FROM `suivi` WHERE suivi.IdEleve = $Id AND suivi.IdProf = $idProf");
    $res = $stmt->fetch();

    

    if($res['IdProf'] == null){
        echo "";
    }else{
        echo "su";
    }
}else{
    echo "po";
}



?>
