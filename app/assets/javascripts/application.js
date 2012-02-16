// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var grid_image = jQuery('#container').css("background-image");
var grid_size = jQuery('#container').css("background-size");

jQuery(document).ready(function(){
    jQuery('#container').css("background", "transparent");

    jQuery('.hide_grid').click(function(){
        jQuery('#container').css("background", "transparent");
    });

    jQuery('.show_grid').click(function(){
        jQuery('#container').css("background-image", grid_image);
        jQuery('#container').css("background-size", grid_size);
    });

    jQuery("#slider").easySlider({
        auto: true,
		continuous: true,
        numeric: true,
        numericId: "silder_nav",
        pause: 3000
	});


    jQuery(".vimeo_link a").click(function(){
        $('#vimeo_player').toggle();
        $('#slider').toggle();
        $('#prevBtn').toggle();
        $('#nextBtn').toggle();
        $(".vimeo_link a").toggleClass('current');
        $("#silder_nav li").removeClass('current');

    });

    jQuery("#silder_nav a").click(function(){
        $('#vimeo_player').hide();
        $('#slider').show();
        $('#prevBtn').show();
        $('#nextBtn').show();
        $(".vimeo_link a").removeClass('current');
    });
});