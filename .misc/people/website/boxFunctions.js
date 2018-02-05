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
    growBox(500, 900, 20, 'px');
    // growBox(90, 90, 2, '%');

  } else {
    growBox(900, 900, 30, 'px');
    // growBox(90, 90, 2, '%');

  }
}

function procPortfolio() {
  prepPort();
  var DynamicBackground = "background-color: black"
  document.getElementById('backdrop').style.cssText
    = DynamicBackground;
  document.getElementById('titlebar').style.color 
    = 'white';
  document.getElementById('titlebar').innerHTML 
    = '<a href=https://www.ammmanagement.com/modelsgallery/nathaniel-oshunniyi/>modelling portfolio</a>';
  document.getElementById('leaveFor').innerHTML 
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>home</a>';
}

function procTwitter() { 
  prepPage();
  document.getElementById('backdrop').style.backgroundColor 
		= 'cyan'; // wavey picture or something
	document.getElementById('titlebar').innerHTML 
		= '<a href=https://twitter.com/n_oshunniyi>twitter @n_oshunniyi</a>';
  document.getElementById('leaveFor').innerHTML 
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>home</a>';
}

function procLinkedin() {
  prepPage();
  document.getElementById('backdrop').style.backgroundColor 
    = 'blue';
  document.getElementById('titlebar').innerHTML 
    = '<a href=https://www.linkedin.com/in/nathxniel/>connect on linkedin</a>'; 
  document.getElementById('leaveFor').innerHTML 
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>home</a>';   
}

function procAbout() {
  growBox(400, 400, 20, 'px');
  var DynamicBackground = 'background-image: url(pictures/teamRocket.png);' 
  DynamicBackground += 'background-position: 0px 0px;'
  DynamicBackground += 'animation: movement 20s linear infinite;';
  document.getElementById('backdrop').style.cssText
    = DynamicBackground;
  document.getElementById('titlebar').innerHTML 
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>back to home</a>';
  document.getElementById('leaveFor').innerHTML 
    = '<a href=site/map.html>site map</a>';  
}

function procGithub() {
  prepPage();
  document.getElementById('backdrop').style.backgroundColor 
    = 'grey';
  document.getElementById('titlebar').innerHTML 
    = '<a href=https://github.com/Nathxniel/ppp>ppp project on gitHub</a>'; 
  document.getElementById('leaveFor').innerHTML 
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>home</a>';
}

function procFacebook() {
  growBox(505, 605, 20, 'px');
  document.getElementById('backdrop').style.backgroundColor
    = 'dark blue';
  document.getElementById('titlebar').innerHTML
    = '<a href=https://www.facebook.com/ICLML/>ICL ML on FaceBook</a>';
  document.getElementById('leaveFor').innerHTML
    = '<a href=index.html onclick=growBox(400, 400, 20, "px")>home</a>';
}