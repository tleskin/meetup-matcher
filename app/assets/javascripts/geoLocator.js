$(document).ready(function(){
  navigator.geolocation.getCurrentPosition(function(position){

    var location = {
      lat: position.coords.latitude,
      lon: position.coords.longitude
    }

    $.post('/geolocator', location)
      .then(function(feed) {
        console.log(feed);
      })
      .fail(function(message) {
        console.error(message);
      })

  })

});