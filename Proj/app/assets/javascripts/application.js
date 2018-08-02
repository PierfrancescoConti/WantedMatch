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
//= require_tree .

var global_stemma= "../Immagini/Stemmi/punto-interrogativo.png";


function settaStemmaB(){
	var s='<img name="stemma" src="../Immagini/Stemmi/Barcellona.jpg" value="Barcellona" height=200 width=200></img>';
	document.getElementById("foto").innerHTML = s;
	global_stemma= "../Immagini/Stemmi/Barcellona.jpg";
}

function settaStemmaRM(){
	var s='<img src="../Immagini/Stemmi/Real_Madrid.jpg" value="Real_Madrid" height=200 width=200></img>';
	document.getElementById("foto").innerHTML = s;
	global_stemma= "../Immagini/Stemmi/Real_Madrid.jpg";
}

function settaStemmaJ(){
	var s='<img src="../Immagini/Stemmi/Juve.jpg" value="Juve" height=200 width=200></img>';
	document.getElementById("foto").innerHTML = s;
	global_stemma= "../Immagini/Stemmi/Juve.jpg";
}

function settaStemmaR(){
	var s='<img src="../Immagini/Stemmi/Roma.jpg" value="Roma" height=200 width=200></img>';
	document.getElementById("foto").innerHTML = s;
	global_stemma= "../Immagini/Stemmi/Roma.jpg";
}

function settaStemmaN(){
	var s='<img src="../Immagini/Stemmi/Napoli.jpg" value="Napoli" height=200 width=200></img>';
	document.getElementById("foto").innerHTML = s;
	global_stemma= "../Immagini/Stemmi/Napoli.jpg";
}

//POPUP
function popup() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
}
