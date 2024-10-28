$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "getProfil.php",
        success: function (result) {
            console.log(JSON.parse(result))
            var values = JSON.parse(result)

            $(".nom").text(values[0].Nom)
            $(".prenom").text(values[0].Prénom)
            $(".email").text(values[0].Email)
            $(".matiere").text(values[0].NomMatiere)
            $(".niveau").text(values[0].NomNiveau)
            $(".adresse").text(values[0].Adresse)

        },
        error: function (err) {
          console.error(err);
        },
      });
})