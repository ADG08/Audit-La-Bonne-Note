<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - La Bonne Note</title>
    
    <link rel="shortcut icon" href="" type="image/x-icon" />
    <link rel="stylesheet" href="choixprof.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/ac2f7dafa4.js" crossorigin="anonymous"></script>
</head>
<body>

    <div class="container">
        <h2>Matière et niveau</h2>
        
        <div class="separer">
            <div class="image">
                <img src="./img/study.jpg" alt="">
            </div>

            <form name="formulaire" action="choixprof.php" method="post">
                <div class="input-box">
                    <option value="default">Choisissez la matière que vous souhaitez enseigner</option>
                    <select name="matiere" id="matiere">
                        <?php
                            require "../connectSQL.php";
                            $stmt = $pdo->query("SELECT * FROM `matière`");
                            while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                echo "<option value='" . $row['IdMatiere'] . "'>" . $row['NomMatiere'] . "</option>";
                            }
                        ?>
                    </select>
                </div>

                <div class="input-box">
                    <option value="default">Choisissez le niveau de vos cours</option>
                    <select name="niveau" id="niveau">
                        <?php
                            require "../connectSQL.php";
                            $stmt = $pdo->query("SELECT * FROM `niveau`");
                            while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                echo "<option value='" . $row['IdNiveau'] . "'>" . $row['NomNiveau'] . "</option>";
                            }
                        ?>
                    </select>
                </div>
                
                <div class="input-box boutton">
                    <input type="submit" value="Valider ">
                </div>
            </form>
        </div>  
    </div>
    
</body>
</html>