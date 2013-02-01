/*$(function () {
	    $.jBar({
	        type: 'fixed', // fixed/static
	        delay: '1000', // Entrance delay (milliseconds)
	        backgroundColor: '#DB5903', // Background Color
	        borderColor: '#FFF', // Background Color
	        buttonTextColor: '#FFF', // Button Text
	        buttonColor: '#333', // Button Color
	        buttonColorHover: '#222', // Button Color Hover
	        calltoAction: 'jBar Plugin! A simple and lightweight notification banner.', // Call to action text
	        buttonText: 'Download it!', // Button Text
	        buttonLink: 'http://www.toddmotto.com/jbar-plugin-the-jquery-call-to-action-bar' // Hyperlink from button
	    });
	});*/

function timeRangesClick( obj ) {
  var _parent = $( obj ).parent();
  var _disabled = $( _parent ).find('a[disabled="disabled"]');
  $( _disabled ).removeAttr( 'disabled' );
  $( obj ).attr( 'disabled', 'disabled' );
}
