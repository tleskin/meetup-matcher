$(document).ready(function(){
  navigator.geolocation.getCurrentPosition(function(position){

    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    $.ajax({type: 'GET',
            url: '/meetup?lat=' + latitude + '&lon=' + longitude,
            data: {lat: latitude, lon: longitude},
            success: function(feed) {
              document.write(feed);
            },
            failure:function(message){
              alert(message);
            }
      });

  })

});
