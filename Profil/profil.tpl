<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profil - La Bonne Note</title>
        <link rel="stylesheet" href="profil.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/ac2f7dafa4.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="profil.js"></script>
    </head>

    <body>
        <div class="rec">
            <a href="../Profil/profil.php"><button class="Profil" >Profil</button></a>
            <a href="../Prof/prof.php"><button class="liste" >Listes</button></a>
            <form action="profil.php" method="post"><button class="boutton" name="deco" value="1">Déconnexion</button></form>
        </div>
        <div class="container">
            <div class="titre"><h2>Profil du professeur</h2></div>
                <div class="info-simp">
                    <div class="card-body">
                        <div class="champ">
                            <div class="titre-champ">
                                <h5>Nom</h5>
                            </div>
                            <div >
                                <p class="nom"></p>
                            </div>
                        </div>
                        <hr>
                        <div class="champ">
                            <div class="titre-champ">
                                <h5>Prénom</h5>
                            </div>
                            <div >
                                <p class="prenom"></p>
                            </div>
                        </div>
                        <hr>
                        <div class="champ">
                            <div class="titre-champ">
                                <h5>Email</h5>
                            </div>
                            <div >
                                <p class="email"></p>
                            </div>
                        </div>
                        <hr>               
                    </div>
                </div>
                <div class="info-supp">
                    <div class="champ">
                        <div class="titre-champ">
                            <h5>Matière</h5>
                        </div>
                        <div >
                            <p class="matiere"></p>
                        </div>
                    </div>
                    <hr>
                    <div class="champ">
                        <div class="titre-champ">
                            <h5>Niveau</h5>
                        </div>
                        <div >
                            <p class="niveau"></p>
                        </div>
                    </div>
                    <hr>
                    <div class="champ">
                        <div class="titre-champ">
                            <h5>Adresse</h5>
                        </div>
                        <div >
                            <p class="adresse"></p>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </body>

</html>