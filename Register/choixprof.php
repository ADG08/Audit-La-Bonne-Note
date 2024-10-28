<?php

require('../connectSQL.php');

if(session_status() !== PHP_SESSION_ACTIVE) session_start();

$id = isset($_SESSION['profil']['Id'])?($_SESSION['profil']['Id']):'';
$id = intval($id);


/*ajout dans la base de donnée*/
if (count($_POST) == 0){
    require "choixprof.tpl";
}else{
    
    $matiere = $_POST['matiere'];
    $niveau = $_POST['niveau'];
    echo $matiere;
    echo $niveau;

    $stmt = $pdo->query("INSERT INTO `infoprof`(`IdProf`, `IdNiveau`, `IdMatiere`) VALUES('$id', '$niveau', '$matiere')");
    $url = "../Login/login.php";
    header("Location:" . $url);
}
