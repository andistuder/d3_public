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

    $("#slider").cycle({
        fx: 'fade',
		speed: 2500,
        pause: 1,
        pager: '#slider_nav',
        next:   '#nextBtn',
        prev:   '#prevBtn'
    });

    $("#slider_home").cycle({
        fx: 'fade',
		speed: 2500,
        pause: 1
	});

    $('#content.home').parents('.container').addClass("home")
    $('#content.home').parents('#main').find('#breadcrumb').hide()
    $('#content.home').parents('#main').find('#prev_next_bar').hide()


    $(".vimeo_link a").click(function(){
        $('#vimeo_player').show();
        $('#slider').hide();
        $('#prevBtn').hide();
        $('#nextBtn').hide();
        $(".vimeo_link a").addClass('current');
        $('#slider').cycle('pause');
        $("#slider_nav a").removeClass('activeSlide');
    });

    $("#slider_nav a").click(function(){
        $('#slider').cycle('resume');
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
            split_str = $('.show_more').attr("href").split("/")
            page = parseInt(split_str.pop());
            split_str.join('/')
            $('.show_more').attr("href", split_str.join('/')+"/"+parseInt(page+1));
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

        $(".hitarea").each(function(){
            if ($(this).text() == "-") {
                $(this).click();
            }
        });

        $('#viewport').animate({height: $(".page.intro").css('height')}, 100, function(){
            $('#viewport').scrollTo(".page.intro", 500);
        });

    });

    // user guide specific
    var max_height = 0;
    if ($('#user_guide').length > 0) {

        $("#chapters").show();

        max_height = calculateWindowHeight();

        $(".page").first().height(max_height);
        $(".page").last().height(max_height);
        $('#viewport').height(max_height);
        $('#user_guide').height(max_height);

        $(".page").first().show();
        $(".page").show();

        $(".chapter").click(function(){
            var action = $(this).parent().children(".hitarea").text();
            $('.hitarea').text("+");

            $(this).parent().children(".hitarea").text(action == "+" ? "-" : "+");
            var target = "." + $(this).parent().attr("id");


            $('#viewport').animate({height: $(target).css('height')}, 100, function(){
                $('#viewport').scrollTo(target, 1000);
            });

        });

        $(".hitarea").click(function(){
            var action = $(this).text();
            $('.hitarea').text("+");
            $(this).parent().children(".hitarea").text(action == "+" ? "-" : "+");
        });

        var url = $.url().segment();
        var parent_category = url[url.length - 2]
        $("#"+parent_category+" .hitarea").click();
    }


    $('.expander a.driver').click(function(){
        var text = $(this).text();

        if ($(this).parent(".more").length > 0) {
            $(this).text($(this).parents(".section").find(".body").is(":visible") ? "SHOW" : "HIDE");
        } else {
            $(this).parent().find(".more a").text($(this).parents(".section").find(".body").is(":visible") ? "SHOW" : "HIDE");
        }

        if ($(this).parents(".section").find(".body").is(":visible")) {
            $(this).parents(".section").find(".more a").css("backgroundImage", "url(/assets/arrow_white_long.png)");
        } else {
            $(this).parents(".section").find(".more a").css("backgroundImage", "url(/assets/arrow_white_long_down.png)");
        }


        $(this).parents(".section").find(".body").slideToggle();

    });

    // do this AFTER we calc the page heights
    $('#chapter_detail .body').hide();

    $("#enquiryForm").validate();

    $('.expander .read_more a').click(function(){

        if ($(this).parents(".section").find(".body").is(":visible")) {
            $(this).css("backgroundImage", "url(/assets/arrow_white_long.png)");
        } else {
            $(this).css("backgroundImage", "url(/assets/arrow_white_long_down.png)");
        }

        $(this).parents(".section").find(".body").slideToggle();
    });

    $('.controls_open a').click(function(){
            $(this).parents('.work_flow_item').find(".overlay").slideToggle();
    });

    $('.controls_close a').click(function(){
        $(this).parents('.overlay').slideUp();
    });

    $('#breadcrumb ul a').each(function(){
        if ($(this).attr("href") == window.location.pathname) {
            $(this).addClass('current');
        }
    });
});

function calculateWindowHeight(){
    var MAX_IMAGE_HEIGHT = 400;
    var PADDING = 50;
    var max_page_height = 0;
    var page_height = 0;
    $('.page').each(function(index) {
        page_height = $(this).height();
        page_height += $(this).find("img").length * (MAX_IMAGE_HEIGHT +PADDING);
        max_page_height = page_height > max_page_height ? page_height : max_page_height;
    });

    return max_page_height;
}
