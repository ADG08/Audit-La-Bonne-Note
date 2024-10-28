<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="login.css">
  <title>Login - La Bonne Note</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/ac2f7dafa4.js" crossorigin="anonymous"></script>
</head>

<body>
  <div class="container">
    <h1>Connecte-toi simplement !</h1>

    <div class="separator">
      <div class="image"><img src="./imgConnexion.jpg" alt="image décorative"></img></div>

      <form id="connexion" action="login.php" method="post">
        <div class="elements">
          <input class="mail" type="text" name="email" value="<?php echo $email; ?>" placeholder="E-mail : exemple@gmail.com">
          <i class="fa-regular fa-envelope icon"></i>
        </div>
        <div class="elements">
          <input class="password" type="password" name="passw" value="<?php echo $passw; ?>" placeholder="Mot de passe">
          <i class="fa-solid fa-lock icon"></i>
          <i class="fa-regular fa-eye-slash showHide"></i>
        </div>
        <div class="elements">
          <input class="boutton" type="submit" value="Se connecter"></input>
        </div>
        <div class="text">
          <small>Pas encore inscrit(e) ? <a href="../Register/register.php">S'inscrire</a> </small>
          <?php if ($error == 2){$msg = "Identifiant ou mot de passe incorrect.";
      echo '<p style="color: red;  margin-right : 30%">'.$msg.'</p>';
      }?>
        </div>
      </form>
      
    </div>
  </div>
<script src="login.js"></script>
</body>

</html>