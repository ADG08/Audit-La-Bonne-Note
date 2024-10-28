<?php
  session_start();

  $email = isset($_POST['email'])?($_POST['email']):'';
  $passw = isset($_POST['passw'])?($_POST['passw']):'';
  $msg = '0';

  

  if(count($_POST)==0) {
    $error = 0;
  require("login.tpl");
  }
  else{
    $profil = array();
    if(!verif_ident($email,$passw,$profil)){
      $error = 2;
      require("login.tpl");
     
    }
    else{
      $_SESSION['profil'] = $profil;
      $url = "../redirect.php";
      header("Location:" . $url);
    }
  }

  function verif_ident($email, $passw, array &$profil) {
    require('../connectSQL.php');
    
    // Requête SQL vulnérable (concaténation directe des variables)
    $sql = "SELECT * FROM `utilisateurs` WHERE email='$email' AND Password='$passw'";
    
    try {
        $commande = $pdo->query($sql); // Utilisation de query() qui est vulnérable
        $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo utf8_encode("Erreur SQL : " . $e->getMessage() . "\n");
        die();
    }

    if (count($resultat) == 0) return false;
    else {
        $profil = $resultat[0];
        return true;
    }
}

?>