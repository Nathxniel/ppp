function fade(seconds) {
  $('body').css('display', 'none');
  $('body').fadeIn(seconds * 1000);
}

function fadeIn(seconds) {
  $(document).ready(function(){
    fade(seconds);
  });
}
