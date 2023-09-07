console.log("js connected");

var navMenu = document.querySelector(".nav-menu");
var navBtn = document.querySelector(".nav-menu-open");

$(window).resize(function(){
	  if(window.innerWidth > 720){
	    navMenu.classList.remove("opened");
	    navBtn.classList.remove("toggled");
	  }
	});

const toggleNavMenu = () => {
	navBtn.classList.toggle("toggled");
	navMenu.classList.toggle("opened");
}