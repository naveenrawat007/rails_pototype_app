$(document).ready(function () {
  var markers = [];
  var map;
  initMap();
  function initMap() {
    var position = {lat: 30.083158, lng: 78.263740}
    map = new google.maps.Map(document.getElementById('map'), {
      center: position,
      zoom: 9
    });
  }

  $.ajax({
    url: "/maps",
    type: "GET",
    dataType: "json",
    success: function(res){
      setMarker(res)
    }
  });

  var poly = new google.maps.Polyline({
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 3
  });
  poly.setMap(map);

  map.addListener('click', addLatLng )

  function addLatLng(e){
    var path = poly.getPath()
    path.push(e.latLng)
    marker = new google.maps.Marker({
      position: e.latLng,
      map: map,
      draggable: true
    })
  }

  map.addListener(marker,'dragend', function (e) {
    a = marker.getPosition()
    console.log(a);
  })




  function setMarker(markerarray){
    for (var i = 0; i < markerarray.length; i++) {
        new google.maps.Marker({
          position: markerarray[i],
          map: map,
          draggable: true,
        })
    }
  }

})
