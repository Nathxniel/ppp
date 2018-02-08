function growBox(width, height, hspeed, unit) {
  var box = document.getElementById('box');
  
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
      box.style.width = w + unit;
      box.style.height = h + unit;
    }
    //end if
  }
}

function prepPage() {
  if (window.matchMedia("(max-width: 800px)").matches) {
    growBox(500, 400, 20, 'px');
    // growBox(90, 90, 2, '%');

  } else {
    growBox(800, 600, 30, 'px');
    // growBox(90, 90, 2, '%');

  }
}

function prepPort() {
  if (window.matchMedia("(max-width: 800px)").matches) {
    growBox(504, 754, 20, 'px');
    // growBox(90, 90, 2, '%');

  } else {
    growBox(904, 1355, 30, 'px');
    // growBox(90, 90, 2, '%');

  }
}

function procPortfolio() {
  prepPort();
  var DynamicBackground = 'background-image: url(pictures/trippy.jpg);';
  DynamicBackground += 'background-repeat: repeat-x;';
  DynamicBackground += 'background-color: rgb(100, 100, 100);';
  DynamicBackground += 'background-position: 0px 0px;';
  DynamicBackground += 'animation: movement 40s linear infinite;';
  
  document.getElementById('backdrop').style.cssText
    = DynamicBackground;
  document.getElementById('videodrop').style.cssText
    = 'visibility: hidden;';

  document.getElementById('titlebar').innerHTML 
    = '<a href=https://www.ammmanagement.com/modelsgallery/nathaniel-oshunniyi/>PORTFOLIO</a>';
  document.getElementById('titlebar').style.cssText 
    = 'font-style: italic; color: rgb(255, 255, 255); text-decoration: overline underline';
  document.getElementById('leaveFor').innerHTML 
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>home</a>';
}

function procTwitter() {
  prepPage();
  var DynamicBackground = "background-color: rgb(85, 172, 238);";

  document.getElementById('backdrop').style.cssText
		= DynamicBackground;
  document.getElementById('videodrop').innerHTML
    = '<source src="' + randomVid() + '" type="video/mp4"></source>';

  document.getElementById('titlebar').innerHTML 
    = '<a href=https://twitter.com/n_oshunniyi>twitter @n_oshunniyi</a>';
  document.getElementById('titlebar').style.cssText 
    = 'border: 1px white solid;display: inline;background: white;border-radius: 10px;opacity: 0.5;';
  document.getElementById('leaveFor').innerHTML 
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>home</a>';
}

function procLinkedin() {
  growBox(255, 361, 20, 'px');
  var DynamicBackground = "background-color: rgb(0, 123, 181);";

  document.getElementById('backdrop').style.cssText
    = DynamicBackground;
  document.getElementById('videodrop').style.cssText
    = 'visibility: hidden;';

  document.getElementById('titlebar').innerHTML 
    = '<a href=https://www.linkedin.com/in/nathxniel/>connect on linkedin</a>'; 
  document.getElementById('titlebar').style.cssText 
    = 'font-style: normal; color: black; text-decoration: none';
  document.getElementById('leaveFor').innerHTML 
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>home</a>';   
}

function procAbout() {
  growBox(400, 380, 20, 'px');
  var DynamicBackground = 'background-image: url(pictures/teamRocket.png);';
  DynamicBackground += 'background-size: cover;';
  DynamicBackground += 'background-color: rgb(255,192,203);';
  
  document.getElementById('backdrop').style.cssText
    = DynamicBackground;
  document.getElementById('videodrop').style.cssText
    = 'visibility: hidden;';

  document.getElementById('titlebar').innerHTML 
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>back to home</a>';
  document.getElementById('titlebar').style.cssText 
    = 'font-style: normal; color: black; text-decoration: none';
  document.getElementById('leaveFor').innerHTML 
    = '<a href=site/map.html>site map</a>';  
}

function procGithub() {
  growBox(500, 400, 20, 'px');
  var DynamicBackground = 'background-color: gray;';
  
  document.getElementById('backdrop').style.cssText 
    = DynamicBackground;
  document.getElementById('videodrop').style.cssText
    = 'visibility: hidden;';

  document.getElementById('titlebar').style.cssText 
    = 'font-style: normal; color: white; text-decoration: none;';
  document.getElementById('titlebar').innerHTML 
    = '<a href=https://github.com/Nathxniel/ppp>ppp project on gitHub</a>'; 
  document.getElementById('leaveFor').innerHTML 
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>home</a>';
}

function procFacebook() {
  growBox(505, 605, 20, 'px');
  var DynamicBackground = 'background-color: rgb(59, 89, 152);';
  DynamicBackground += 'background-image: url(' + randomML() + ');';
  DynamicBackground += 'background-size: cover;';
  
  document.getElementById('backdrop').style.cssText
    = DynamicBackground;
  document.getElementById('videodrop').style.cssText
    = 'visibility: hidden;';

  document.getElementById('titlebar').style.cssText 
    = 'border: 1px white solid;display: inline;background: white;border-radius: 10px;opacity: 0.5;';
  document.getElementById('titlebar').innerHTML
    = '<a href=https://www.facebook.com/ICLML/>ICL ML</a>';
  document.getElementById('leaveFor').innerHTML
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>home</a>';
}

function randomML() {
  var rand = Math.floor((Math.random() * 7) + 1);
  return 'media/ai' + rand + '.gif';
}

function randomVid() {
  var rand = Math.floor((Math.random() * 5) + 1);
  return 'media/vid' + rand + '.mp4';
}