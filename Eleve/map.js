$(document).ready(function () {
  var favoriIcon = L.icon({
    iconUrl:
      "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png",
    shadowUrl:
      "https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png",
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41],
  });

  var defaultIcon = L.icon({
    iconUrl:
      "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png",
    shadowUrl:
      "https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png",
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41],
  });
  L.mar;

  var map = L.map("maDiv").setView([48.856614, 2.3522219], 12);

  L.tileLayer(
    "https://{s}.tile.thunderforest.com/neighbourhood/{z}/{x}/{y}.png?apikey={apikey}",
    {
      attribution:
        '&copy; <a href="http://www.thunderforest.com/">Thunderforest</a>, &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
      apikey: "33252f8dc3c04591be177e3af63865d0",
      maxZoom: 22,
    }
  ).addTo(map);

  //
  var x = [];
  var index = [];

  for (let i = 0; i < arrondissements.features.length; i++) {
    var v = L.geoJson(arrondissements.features[i]).addTo(map)

    index.push(arrondissements.features[i].properties.c_ar);

    for (let y = 0; y < index.length; y++) {
      if (index[y] == arrondissements.features[i].properties.c_ar) {
        $(v).click({ param: y }, focus);
      }
    }
    x.push(v);
  }
  for (let y = 0; y < arrondissements.features.length; y++) {
    x[y].setStyle({
      fillColor: "#68D89B",
      weight: 1,
      color: "#2C6E49",
      opacity: 1,
    });
  }

  var prof = [];

  function focus(event) {
    for (let y = 0; y < arrondissements.features.length; y++) {
      x[y].setStyle({
        fillColor: "#68D89B",
        weight: 1,
        color: "#2C6E49",
        opacity: 1,
      });

      x[y].setStyle({ opacity: 0.4 });

      if (y != event.data.param) {
        x[event.data.param].setStyle({ opacity: 1 });
      }
    }
    x[event.data.param].setStyle({
      fillColor: "#BCFFDB",
      weight: 2,
      color: "#2C6E49",
      opacity: 1,
    });

    console.log(index[event.data.param]);

    $.ajax({
      type: "POST",
      url: "recupProf.php",
      data: {
        arr: index[event.data.param],
      },
      success: function (res) {
        console.log(JSON.parse(res))

        prof.forEach((element) => {
          map.removeLayer(element);
        });

        var result = JSON.parse(res);
        result.forEach((element) => {
          $.ajax({
            type: "POST",
            url: "verifStatus.php",
            data: {
              idProf: element.IdUtilisateur,
            },
            success: function (result) {

              var text;

              if (result == "") {
                console.log("rien")
                text = "Demander un cours"
              } else if (result == "po") {
                console.log("po")
                text = "En attende de validation"
              } else {
                console.log("sui")
                text = "Suivi"
              }

              


              var x = L.marker([element.Latitude, element.Longitude], {
                icon: defaultIcon,
              })
                .bindPopup('<h3>' + element.Nom + " " + element.Prénom + "</h3><br>" + '<p class="infoProf"></p><br><button class="suivie">' + text + '</button><br><button class="like">Ajouter aux fav</button>')
                .addTo(map)
                .on("click", clickZoom);

              prof.push(x);
            },
            error: function (err) {
              console.error(err);
            },
          });

        });
      },
      error: function (err) {
        console.error(err);
      },
    });
  }

  $.ajax({
    type: "POST",
    url: "recupProfFav.php",
    success: function (res) {
      console.log(res);

      JSON.parse(res).forEach((id) => {
        $.ajax({
          type: "POST",
          url: "verifStatus.php",
          data: {
            idProf: id.IdUtilisateur,
          },
          success: function (result) {
            console.log(result);

            var text;

            if (result == "") {
              console.log("rien")
              text = "Demander un cours"
            } else if (result == "po") {
              console.log("po")
              text = "En attende de validation"
            } else {
              console.log("sui")
              text = "Déjà suivi"
            }

            if (result == "su") {


              JSON.parse(res).forEach((element) => {
                L.marker([element.Latitude, element.Longitude], {
                  icon: favoriIcon,
                })
                  .bindPopup(
                    '<h3>' + element.Nom + " " + element.Prénom + "</h3><br>" + '<p class="infoProf"></p><br><button class="dejaSuivi">' + text + '</button><br><button class="like">Enlever des fav</button>'
                  )
                  .addTo(map)
                  .on("click", clickZoom);

                console.log(result);


              });
            } else {

              JSON.parse(res).forEach((element) => {
                L.marker([element.Latitude, element.Longitude], {
                  icon: favoriIcon,
                })
                  .bindPopup(
                    '<h3>' + element.Nom + " " + element.Prénom + "</h3><br>" + '<p class="infoProf"></p><br><button class="suivie">' + text + '</button><br><button class="like">Enlever des fav</button>'
                  )
                  .addTo(map)
                  .on("click", clickZoom);

                console.log(result);


              });
            }
            
          },
          error: function (err) {
            console.error(err);
          },
        });

      });
    },
    error: function (err) {
      console.error(err);
    },
  });


  function liker(event) {
    console.log(event.data.param)
    if (event.data.param) {
      $.ajax({
        type: "POST",
        url: "delikeProf.php",
        data: {
          lng: event.data.lng,
          lat: event.data.lat
        },
        success: function (res) {
          window.location.reload()
        },
        error: function (err) {
          console.error(err);
        },
      });
    } else {
      $.ajax({
        type: "POST",
        url: "likeProf.php",
        data: {
          lng: event.data.lng,
          lat: event.data.lat
        },
        success: function (res) {
          window.location.reload()
        },
        error: function (err) {
          console.error(err);
        },
      });
    }

  }

  function suivie(event) {
    $.ajax({
      type: "POST",
      url: "demanderCours.php",
      data: {
        lng: event.data.lng,
        lat: event.data.lat
      },
      success: function (res) {
        window.location.reload()
      },
      error: function (err) {
        console.error(err);
      },
    });
  }

  function arretSuivi(event) {
    $.ajax({
      type: "POST",
      url: "arretSuivi.php",
      data: {
        lng: event.data.lng,
        lat: event.data.lat
      },
      success: function (res) {
        window.location.reload()
      },
      error: function (err) {
        console.error(err);
      },
    });
  }




  //smooth click
  function clickZoom(e) {

    console.log(e)
    map.panTo(this.getLatLng());

    if (e.target._icon.currentSrc == "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png") {
      $(".like").click({ lat: e.target._latlng.lat, lng: e.target._latlng.lng, param: true }, liker)
    } else {
      $(".like").click({ lat: e.target._latlng.lat, lng: e.target._latlng.lng, param: false }, liker)
    }

    $.ajax({
      type: "POST",
      url: "recupInfoProf.php",
      data: {
        lat: e.target._latlng.lat,
        lng: e.target._latlng.lng
      },
      success: function (res) {
        $(".infoProf").text( JSON.parse(res)[0] + " pour " + JSON.parse(res)[1] )
      },
      error: function (err) {
        console.error(err);
      },
    })


    $(".suivie").click({ lat: e.target._latlng.lat, lng: e.target._latlng.lng }, suivie)

    $(".dejaSuivi").click({ lat: e.target._latlng.lat, lng: e.target._latlng.lng }, arretSuivi)
  }
});
