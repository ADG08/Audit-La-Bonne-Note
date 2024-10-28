<?php
session_start();

if(isset($_POST["deco"])) {
    session_destroy();
    $url = "../Login/login.php";
    header("Location:" . $url);
}

if(isset($_SESSION['profil'])) {
    require("eleve.tpl");
}else {
    $url = "../Login/login.php";
    header("Location:" . $url);
}
?>