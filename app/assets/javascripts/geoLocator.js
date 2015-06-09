$(document).ready(function(){
  navigator.geolocation.getCurrentPosition(function(position){

    // var latitude  = position.coords.latitude;
    // var longitude = position.coords.longitude;

    var location = {
      lat: position.coords.latitude,
      lon: position.coords.longitude
    }

    // $.ajax({type: 'POST',
    //         url: '/geolocator',
    //         data: {lat: latitude, lon: longitude},
    //         success: function(feed) {
    //           console.log(feed);
    //         },
    //         failure:function(message){
    //           alert(message);
    //         }
    //   });

    $.post('/geolocator', location)
      .then(function(feed) {
        console.log(feed);
      })
      .fail(function(message) {
        console.error(message);
      })
      
  })

});
