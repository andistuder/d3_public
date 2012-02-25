// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-treeview/jquery.cookie.js
//= require jquery-treeview/jquery.treeview.js
//= require jquery.url.js
//= require_tree .

var grid_image = $('#container').css("background-image");
var grid_size = $('#container').css("background-size");


//borrowed from jQuery easing plugin
//http://gsgd.co.uk/sandbox/jquery.easing.php
$.easing.elasout = function(x, t, b, c, d) {
    var s=1.70158;var p=0;var a=c;
    if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
    if (a < Math.abs(c)) { a=c; var s=p/4; }
    else var s = p/(2*Math.PI) * Math.asin (c/a);
    return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
};

$(document).ready(function(){
    $('#container').css("background", "transparent");

    $('.hide_grid').click(function(){
        $('#container').css("background", "transparent");
    });

    $('.show_grid').click(function(){
        $('#container').css("background-image", grid_image);
        $('#container').css("background-size", grid_size);
    });

    $("#slider").easySlider({
//        auto: true,
		continuous: true,
        numeric: true,
        numericId: "silder_nav",
        pause: 3000
	});


    $(".vimeo_link a").click(function(){
        $('#vimeo_player').toggle();
        $('#slider').toggle();
        $('#prevBtn').toggle();
        $('#nextBtn').toggle();
        $(".vimeo_link a").toggleClass('current');
        //$("#silder_nav li").removeClass('current');
    });

    $("#silder_nav a").click(function(){
        $('#vimeo_player').hide();
        $('#slider').show();
        $('#prevBtn').show();
        $('#nextBtn').show();
        $(".vimeo_link a").removeClass('current');
    });

    $('.show_more').bind('ajax:success', function(event, data, status, xhr) {
        if (xhr.status == 200) {
            $('.more_news').last().replaceWith(data);
            $('.more_news_wrapper').last().slideDown();

            $('html, body').animate({scrollTop: $('.more_news_wrapper').last().offset().top - 0}, 500);

            var page = 0;
            page = parseInt($('.show_more').attr("href").split("/").pop());
            $('.show_more').attr("href", "/news/next/"+parseInt(page+1));
        }

        if (xhr.status == "204"){
            $('.read_more').fadeOut();
            $('#no_data_found').fadeIn();
        }

    }).bind("ajax:error", function(evt, xhr, status, error){
        $('#message_content').html("There was an error fetching more content");
        $('#message').slideDown();
        $('#message_content').fadeIn();

    });

    $("#chapters").treeview({
        collapsed: true,
        unique: true
    });

    $("#user_guide_home").click(function(){
        $('#viewport').scrollTo(".page.intro", 500, {easing:'elasout',onAfter:function(){
            $('#viewport').animate({height: $(".page.intro").css('height')}, 500);
        }});
    });

    // user guide specific
    var max_height = 0;
    if ($('#user_guide').length > 0) {
        max_height = calculateWindowHeight();
        $('#viewport').height(max_height);
        $('#user_guide').height(max_height);
        $(".page").first().height(max_height);
        $(".page").last().height(max_height);

        var url = $.url().segment();
        var parent_category = url[url.length - 2]
        $("#"+parent_category+" .hitarea").click();


        $(".chapter").click(function(){
            var action = $(this).parent().children(".hitarea").text();
            $('.hitarea').text("+");

            $(this).parent().children(".hitarea").text(action == "+" ? "-" : "+");
            var target = "." + $(this).parent().attr("id");

            $('#viewport').scrollTo(target, 1000, {easing:'elasout',onAfter:function(){
                $('#viewport').animate({height: $(target).css('height')}, 500);
            }});

        });


    }

});

function calculateWindowHeight(){
    var max_page_height = 0;
    var page_height = 0;
    $('.page').each(function(index) {
        page_height = $(this).height();
        max_page_height = page_height > max_page_height ? page_height : max_page_height;
    });

    return max_page_height;
}
