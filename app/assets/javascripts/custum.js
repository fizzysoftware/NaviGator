$(function () {
	    $.jBar({
	        type: 'fixed', // fixed/static
	        delay: '1000', // Entrance delay (milliseconds)
	        backgroundColor: '#DB5903', // Background Color
	        borderColor: '#309EEB', // Background Color
	        buttonTextColor: '#FFF', // Button Text
	        buttonColor: '#333', // Button Color
	        buttonColorHover: '#222', // Button Color Hover
	        calltoAction: 'jBar Plugin! A simple and lightweight notification banner.', // Call to action text
	        buttonText: 'Download it!', // Button Text
	        buttonLink: '#' // Hyperlink from button
	    });
	});

function timeRangesClick( obj ) {
  var _parent = $( obj ).parent();
  var _disabled = $( _parent ).find('a[disabled="disabled"]');
  $( _disabled ).removeAttr( 'disabled' );
  $( obj ).attr( 'disabled', 'disabled' );
}

function tabClicked( _link ) {
  if( _link.id == "stats-link" )
    history.pushState("","","?view=stats")
  else
    history.pushState("","","?")
}

$(function () {
  $('.colorpicker').blur(function(){ $('.colorpicker').colorpicker('hide') } );
});
