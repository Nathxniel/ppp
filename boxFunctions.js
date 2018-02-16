var NAME;
var OUTLINK;
var title;
var background;
var video;
// box
var navbar;

// history.pushState(null, null, document.title);
// window.addEventListener('popstate', function () {
//     history.pushState(null, null, document.title);
// });

const defaultNavbar = "";
const defaultOutlink = "<a href=index.html>home</a>";
const noVideo = "visibility: hidden;";

function isMobileDevice() {
  return ((window.matchMedia("(max-width: 800px)").matches) ||
    (/mobile/i.test(navigator.userAgent)) ||
    ("ontouchstart" in window) ||
    (window.DocumentTouch && document instanceof DocumentTouch) ||
    ((hash["touch"] && hash["touch"].offsetTop) === 9)
    );
}

function growBox(width, height, hspeed, unit) {
  var box = document.getElementById("box");
  var w = 0;
  var h = 0;
  var wspeed = (width / height) * hspeed;
  var id = setInterval(frame, 10);
  function frame() {
    if (h >= height) {
      clearInterval(id);
    } else {
      h += hspeed;
      w += wspeed;
      box.style.width  = w + unit;
      box.style.height = h + unit;
    }
    //end if
  }
}

function prepPage() {
  if (window.matchMedia("(max-width: 800px)").matches) {
    growBox(500, 1000, 20, "px");
  } else {
    growBox(800, 600, 30, "px");
  }
}

function prepPort() {
  if (window.matchMedia("(max-width: 800px)").matches) {
    growBox(504, 754, 50, "px");
  } else {
    growBox(904, 1355, 50, "px");
  }

  fadeIn(2);
}

function fade(seconds) {
  $('body').css('display', 'none');
  $('body').fadeIn(seconds * 1000);
}

function fadeIn(seconds) {
  $(document).ready(function(){
    fade(seconds);
  });
}

function procPortfolio() {
  NAME =  "<a href=https://www.ammmanagement.com/modelsgallery/";
  NAME += "nathaniel-oshunniyi/ target=_blank>PORTFOLIO</a>";

  OUTLINK = defaultOutlink;

  title =  "font-style: italic; color: pink;";
  title += "text-decoration: overline underline";

  background = "background-color: black;";

  video  = noVideo;
  navbar = defaultNavbar;

  editStyle(NAME, OUTLINK, title, background, video, navbar);
  prepPort();
}

function procTwitter() {
  NAME =  "<a href=https://twitter.com/n_oshunniyi>";
  NAME += "twitter @n_oshunniyi</a>";

  OUTLINK = defaultOutlink;

  title =  "border: 1px white solid; display: inline;";
  title += "background: white; border-radius: 10px; opacity: 0.5;";

  background = "background-color: rgb(85, 172, 238);";

  video =  "<source src='" + randomVid() + "' type='video/mp4'>";
  video += "</source>";

  navbar = defaultNavbar;

  editStyle(NAME, OUTLINK, title, background, video, navbar);
  prepPage();
}

function procLinkedin() {
  NAME =  "<a href=https://www.linkedin.com/in/nathxniel/>";
  NAME += "connect on linkedin</a>"; 

  OUTLINK = defaultOutlink;
  title = "font-style: normal; color: black; text-decoration: none";

  background =  "background-color: rgb(0, 123, 181);";
  background += "background-image: url(pictures/Network.jpg);";
  background += "background-size: cover;";

  video  = noVideo;
  navbar = defaultNavbar;

  editStyle(NAME, OUTLINK, title, background, video, navbar);
  growBox(255, 361, 20, "px");
}

function procAbout() {
  NAME    = "<a href=index.html>back to home</a>";
  OUTLINK = "<a href=site/map.html>site map</a>";
  title = "font-style: normal; color: black; text-decoration: none";

  background =  "background-image: url(pictures/teamRocket.png);";
  background += "background-size: cover;";
  background += "background-color: pink;";

  video  = noVideo;
  navbar = defaultNavbar;

  editStyle(NAME, OUTLINK, title, background, video, navbar);
  growBox(400, 380, 20, "px");
}

function procGithub() {
  NAME = "<a href=https://github.com/Nathxniel/ppp>";
  NAME += "ppp project on gitHub</a>";

  OUTLINK = defaultOutlink;

  title =  "font-style: normal; color: white;";
  title += "text-decoration: none;";

  background = "background-color: gray;";

  video  = noVideo;
  navbar = defaultNavbar;

  editStyle(NAME, OUTLINK, title, background, video, navbar);
  growBox(500, 400, 20, "px");
}

function procFacebook() {
  NAME    = "<a href=https://www.facebook.com/ICLML/>ICL ML</a>";
  OUTLINK = defaultOutlink;

  title =  "border: 1px white solid; display: inline;";
  title += "background: white; border-radius: 10px; opacity: 0.5;";

  background = "background-color: rgb(59, 89, 152);";
  background += "background-image: url(" + randomGif() + ");";
  background += "background-size: cover;";
  
  video  = noVideo;
  navbar = defaultNavbar;

  editStyle(NAME, OUTLINK, title, background, video, navbar);
  growBox(505, 605, 20, "px");
}

function editStyle(NAME, OUTLINK, title, background, video, navbar) {
  document.getElementById("titlebar").innerHTML      = NAME;
  document.getElementById("leaveFor").innerHTML      = OUTLINK;
  document.getElementById("titlebar").style.cssText  = title;
  document.getElementById("backdrop").style.cssText  = background;
  document.getElementById("videodrop").innerHTML     = video;
}

function randomGif() {
  var rand = Math.floor((Math.random() * 7) + 1);
  return "media/ai" + rand + ".gif";
}

function randomVid() {
  var rand = Math.floor((Math.random() * 5) + 1);
  return "media/vid" + rand + ".mp4";
}
