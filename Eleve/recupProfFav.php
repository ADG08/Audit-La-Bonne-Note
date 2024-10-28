<?php

require('../connectSQL.php');

session_start();

$res = array();


$id = isset($_SESSION['profil']['IdUtilisateur'])?($_SESSION['profil']['IdUtilisateur']):'';


$stmt = $pdo->query("SELECT * FROM favori, utilisateurs, infosup, localisation where favori.IdEleve = $id AND infosup.IdUtilisateur = favori.IdProf AND  infosup.IdUtilisateur =  utilisateurs.IdUtilisateur AND utilisateurs.IdUtilisateur = localisation.IdUtilisateur");
while ($row = $stmt->fetch()) {
      array_push($res, $row);
  }

echo json_encode($res);



?>
