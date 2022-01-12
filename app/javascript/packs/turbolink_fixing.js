// Fix Ajax jQuery not working at first time
$(document).on('turbolinks:load', function() {
  $('.refresh').click(function() {

    setTimeout(function(){
      console.log("refreshing...")
        location.reload(true); 
    }, 50);

  });
});
