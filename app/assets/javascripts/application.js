// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){

	$('.guzik').click(function () {

    	$('.wysun').slideToggle('slow');

   		$('.guzik').toggleClass('guzikk');

	});
	
	$('#m_home').hover(function () {
    		$('#textlogo').html('Home');
  		},
	 	function () {
    		$('#textlogo').html('HitchKot');
	  	}
	);
	
		$('#m_profil').hover(function () {
    		$('#textlogo').html('Profil');
  		},
	 	function () {
    		$('#textlogo').html('HitchKot');
	  	}
	);
	
		$('#m_wyszukaj').hover(function () {
    		$('#textlogo').html('Wyszukaj');
  		},
	 	function () {
    		$('#textlogo').html('HitchKot');
	  	}
	);
	
		$('#m_lista').hover(function () {
    		$('#textlogo').html('Lista filmów');
  		},
	 	function () {
    		$('#textlogo').html('HitchKot');
	  	}
	);
	
		$('#m_pomoc').hover(function () {
    		$('#textlogo').html('Pomoc');
  		},
	 	function () {
    		$('#textlogo').html('HitchKot');
	  	}
	);
	
		$('#m_wyloguj').hover(function () {
    		$('#textlogo').html('Wyloguj się');
  		},
	 	function () {
    		$('#textlogo').html('HitchKot');
	  	}
	);
	
		$('#m_zaloguj').hover(function () {
    		$('#textlogo').html('Home');
  		},
	 	function () {
    		$('#textlogo').html('Zaloguj się');
	  	}
	);
	
});
		