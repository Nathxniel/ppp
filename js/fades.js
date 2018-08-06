function fade(seconds) {
  $('body').css('display', 'none');
  $('body').fadeIn(seconds * 1000);
}

function fadeIn(seconds) {
  $(document).ready(function(){
    /*
  var sites = 3;
  var rand = Math.floor((Math.random() * sites) + 1);
  var backtext = '<img id="face" alt-text="me" src="./pictures/face-ass.jpg"></img><h1 id="dotcom">nathaniel oshunniyi</h1></a>';

  // dailytelegram, icl ai, komi
    if (rand == 1) {
      backtext = '<a href="https://thedailytelegram.co.uk">'
               + backtext;

    } else if (rand == 2) {
      backtext = '<a href="https://komimagazine.club">'
               + backtext;

    } else if (rand == 3) {
      backtext = '<a href="http://www.mlsoc.ai/">'
               + backtext;

    };
    $('.title').html(backtext);
    */
  fade(seconds);
  });
}
