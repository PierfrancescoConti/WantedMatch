// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require bootstrap
//= require_tree .


function settaStemmaB(){
	var s='<img name="stemma" src="https://upload.wikimedia.org/wikipedia/it/0/07/Fc_barcelona.png" value="Barcellona" height=200 width=200></img>';
	document.getElementById("foto").innerHTML = s;
	document.getElementById("a").innerHTML = "<input id='team_logo'  name='team[logo]' type='text' class='hidden' value='https://upload.wikimedia.org/wikipedia/it/0/07/Fc_barcelona.png'>";
}

function settaStemmaRM(){
	var s='<img src="https://upload.wikimedia.org/wikipedia/it/thumb/0/0c/Real_Madrid_CF_logo.svg/732px-Real_Madrid_CF_logo.svg.png" value="Real_Madrid" height=200 width=200></img>';
	document.getElementById("foto").innerHTML = s;
	document.getElementById("a").innerHTML = "<input id='team_logo'  name='team[logo]' type='text' class='hidden' value='https://upload.wikimedia.org/wikipedia/it/thumb/0/0c/Real_Madrid_CF_logo.svg/732px-Real_Madrid_CF_logo.svg.png' %>";
}

function settaStemmaJ(){
	var s='<img src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Juventus_FC_2017_logo_%28negative%29.jpg" value="Juve" height=200 width=200></img>';
	document.getElementById("foto").innerHTML = s;
	document.getElementById("a").innerHTML = "<input id='team_logo'  name='team[logo]' type='text' class='hidden' value='https://upload.wikimedia.org/wikipedia/commons/f/fa/Juventus_FC_2017_logo_%28negative%29.jpg' %>";
}

function settaStemmaR(){
	var s='<img src="https://upload.wikimedia.org/wikipedia/it/0/0e/AS_Roma_Logo_2017.svg" value="Roma" height=200 width=200></img>';
	document.getElementById("foto").innerHTML = s;
	document.getElementById("a").innerHTML = "<input id='team_logo'  name='team[logo]' type='text' class='hidden' value='https://upload.wikimedia.org/wikipedia/it/0/0e/AS_Roma_Logo_2017.svg' %>";
}

function settaStemmaN(){
	var s='<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/S.S.C._Napoli_logo.svg/1024px-S.S.C._Napoli_logo.svg.png" value="Napoli" height=200 width=200></img>';
	document.getElementById("foto").innerHTML = s;
	document.getElementById("a").innerHTML = "<input id='team_logo'  name='team[logo]' type='text' class='hidden' value='https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/S.S.C._Napoli_logo.svg/1024px-S.S.C._Napoli_logo.svg.png'>";
}

// CHOOSE TEAM

function choose_team(id){
	var s='Choosen team: ';
	s=s+id;
	document.getElementById("mess").innerHTML = s;
	document.getElementById("match_team1").value = id;
}



//POPUP
function popup() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
}
