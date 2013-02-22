function showJBar( _url ) {
	    $.jBar({
	        type: 'fixed', // fixed/static
	        delay: '1000', // Entrance delay (milliseconds)
	        backgroundColor: '#DB5903', // Background Color
	        borderColor: '#309EEB', // Background Color
	        buttonTextColor: '#FFF', // Button Text
	        buttonColor: '#333', // Button Color
	        buttonColorHover: '#222', // Button Color Hover
	        calltoAction: ' A simple and lightweight notification banner.', // Call to action text
	        buttonText: 'Try It Out!', // Button Text
	        buttonLink: _url // Hyperlink from button
	    });
	}

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

/* default theme in manage bar start */

$(function () {
$('.defaultred').click(function(){
	  $(".nav_preview").css({"background" : "#EB583C" })
	  $(".message").css({"color" : "#fff" })
    $('#bar_bg_color').val( "#EB583C" )
    $('#bar_text_color').val( "#fff" )
	});

$('.defaultblue').click(function(){
	  $(".nav_preview").css({"background" : "#309EEB" })
	  $(".message").css({"color" : "#fff" })
    $('#bar_bg_color').val( "#309EEB" )
    $('#bar_text_color').val( "#fff" )
  });

$('.defaultcheers').click(function(){
	  $(".nav_preview").css({"background" : "#F0E1D1" })
	  $(".message").css({"color" : "#000" })
    $('#bar_bg_color').val( "#F0E1D1" )
    $('#bar_text_color').val( "#000" )
	});

$('.defaultfrog').click(function(){
	  $(".nav_preview").css({"background" : "#EDEDED" })
	  $(".message").css({"color" : "#000" })
    $('#bar_bg_color').val( "#EDEDED" )
    $('#bar_text_color').val( "#000" )
	});
});

/* default theme in manage bar end */

/* input text append start */
$(function () {
	$(".message_textbox").keyup(function(){
		$(".message").html($('.message_textbox').val());
	})

	$(".nav_linktext").keyup(function(){
		$(".message_link").html($('.nav_linktext').val());
	})

});

$(function () {
    $(".on, .off").click(function () {
        $(".enable").removeClass("enable");
        $(this).addClass("enable");
    });
});

function attachColorPicker ( _element, _color) {
  $( '#' + _element ).ColorPicker({
    color: _color,
    onShow: function (colpkr) {
      $(colpkr).fadeIn(500);
      return false;
    },
    onHide: function (colpkr) {
      $(colpkr).fadeOut(500);
      return false;
    },
    onChange: function (hsb, hex, rgb) {
      $( '#' + _element ).css('backgroundColor', '#' + hex);
      if( _element == 'bar-color') {
        $( '.' + _element ).css('backgroundColor', '#' + hex);
        $('#bar_bg_color').val( '#' + hex );
      }
      else if( _element == 'text-color' ) {
        $( '.' + _element ).css('color', '#' + hex);
        $('#bar_text_color').val( '#' + hex );
      }
      else if( _element == 'link-color' ) {
        $( '.message_link' ).css('color', '#' + hex);
        $('#bar_link_text_color').val( '#' + hex );
      }
      else if( _element == 'link-bg-color' ) {
        $( '.message_link' ).css('backgroundColor', '#' + hex);
        $('#bar_link_bg_color').val( '#' + hex );
      }
    }
  });
}
