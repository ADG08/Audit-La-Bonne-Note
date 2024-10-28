<?php

session_start();

$id = isset($_SESSION['profil']['IdUtilisateur'])?($_SESSION['profil']['IdUtilisateur']):'';

$pdo = require_once './connectSQL.php';
$stmt = $pdo->query("SELECT * FROM infosup where IdUtilisateur=$id");
$prof = $stmt->fetch();
$res = $prof['Prof'];



if($res==1){
  $url = "./Prof/prof.php";
  header("Location:" . $url);
}else{
  $url = "./Eleve/eleve.php";
  header("Location:" . $url);
}

?>