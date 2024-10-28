<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="prof.css" />
  <script src="recupEleve.js"></script>
  <title>Document</title>
</head>

<body>
  <div class="rec">
    <a href="../Profil/profil.php"><button class="Profil" >Profil</button></a>
    <a href="../Prof/prof.php"><button class="liste" >Listes</button></a>
    <form action="prof.php" method="post"><button class="boutton" name="deco" value="1">Déconnexion</button></form>
  </div>
  <div class="content">

    <div class="potential">
      <h3 class="title">Demandes</h3>
      <div class="eleves">

      </div>
    </div>

    <div class="suivie">
      <h3 class="title">Élèves suivis</h3>
      <div class="eleves">
      </div>
    </div>

  </div>
</body>

</html>