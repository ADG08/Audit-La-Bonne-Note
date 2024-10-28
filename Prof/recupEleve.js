var firstContentSuivie = '<div class="container"><div class="nom"><h3>'
var lastContentSuivie = '</h3>'





$(document).ready(function () {


    $.ajax({
        type: "POST",
        url: "recupEleveSuivi.php",
        success: function (res) {
            var resultat = JSON.parse(res)

            resultat.forEach(element => {
                var result = firstContentSuivie + element.nom + " " + element.prenom + lastContentSuivie + "<h3>" +element.email + lastContentSuivie;
                $(".suivie .eleves").append(result);

            });
        },
        error: function (err) {
            console.error(err);
        },
    });


    $.ajax({
        type: "POST",
        url: "recupElevePotentiel.php",
        success: function (res) {

            var resultat = JSON.parse(res)

            console.log(resultat);

            resultat.forEach(element => {
                var leReste = '</div><div class="icones"><img src="../Prof/icones/check.svg" alt="check image to accept" class="valider"><img src="../Prof/icones/cross.svg" alt="check image to refuse" class="del"></div></div >'

                var result = firstContentSuivie + element.nom + " " + element.prenom + lastContentSuivie + "<p class='email'>" + element.email + "</p>" + leReste;
                $(".potential .eleves").append(result);

                $('.valider').click(valider)
                $('.del').click(del)

            });
        },
        error: function (err) {
            console.error(err);
        },
    });



    function valider() {
        var resu = $(".email").text()
        $.ajax({
            type: "POST",
            url: "ajoutEleveSuivi.php",
            data: {
                "Email": resu
            },
            success: function (res) {
                window.location.reload()
                console.log(res)

            },
            error: function (err) {
                console.error(err);
            },
        });

    }

    function del() {
        var resu = $(".email").text()
        $.ajax({
            type: "POST",
            url: "deleteElevePotentiel.php",
            data: {
                "Email": resu
            },
            success: function (res) {
                window.location.reload()
                console.log(res)

            },
            error: function (err) {
                console.error(err);
            },
        });
    }

})