jQuery(function ($) {


    /* ----------------------------------------------------------- */
    /*  1. Superslides Slider
     /* ----------------------------------------------------------- */
    jQuery('#slides').superslides({
        animation: 'slide',
        play: '5000'
    });


    /* ----------------------------------------------------------- */
    /*  2. Fixed Top Menubar
     /* ----------------------------------------------------------- */

    // For fixed top bar
    $(window).scroll(function () {
        if ($(window).scrollTop() > 100 /*or $(window).height()*/) {
            $(".navbar-fixed-top").addClass('past-main');
        } else {
            $(".navbar-fixed-top").removeClass('past-main');
        }
    });
    /* ----------------------------------------------------------- */
    /*  3. Wow smooth animation
     /* ----------------------------------------------------------- */

    wow = new WOW(
            {
                animateClass: 'animated',
                offset: 100
            }
    );
    wow.init();

    /* ----------------------------------------------------------- */
    /*  4. SCROLL TOP BUTTON
     /* ----------------------------------------------------------- */

    //Check to see if the window is top if not then display button

    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.scrollToTop').fadeIn();
        } else {
            $('.scrollToTop').fadeOut();
        }
    });

    //Click event to scroll to top

    $('.scrollToTop').click(function () {
        $('html, body').animate({scrollTop: 0}, 800);
        return false;
    });


    /* ----------------------------------------------------------- */
    /*  5. PRELOADER 
     /* ----------------------------------------------------------- */

    jQuery(window).load(function () { // makes sure the whole site is loaded
        $('#status').fadeOut(); // will first fade out the loading animation
        $('#preloader').delay(100).fadeOut('slow'); // will fade out the white DIV that covers the website.
        $('body').delay(100).css({'overflow': 'visible'});
    });
});
/* ----------------------------------------------------------- */
/*  6. REVIEWS
 /* ----------------------------------------------------------- */
$("#owl-reviews").owlCarousel({
    singleItem: true,
    pagination: true,
    autoHeight: true
});

/* ----------------------------------------------------------- */
/*  7. SEARCH
 /* ----------------------------------------------------------- */
$(function () {
    $("#searchButton").click(function () {
        $('#searchBox').addClass('popup-box-on');
    });

    $("#removeClass").click(function () {
        $('#searchBox').removeClass('popup-box-on');
    });
});

/* ----------------------------------------------------------- */
/*  7. BLOG
 /* ----------------------------------------------------------- */

$(document).ready(function () {
    $(window).resize(function () {
        if ($(window).width() < 1182) {
            $("#blog-text").remove().insertAfter($("#blog-img"));
        } else {
            $("#blog-text").remove().insertBefore($("#blog-img"));
        }
    });
});

/* ----------------------------------------------------------- */
/*  7. PARTNERS
 /* ----------------------------------------------------------- */

$("#owl-partners").owlCarousel({
    items: 5,
    itemsDesktop: [1199, 3],
    itemsDesktopSmall: [980, 2],
    itemsTablet: [768, 2],
    autoPlay: 5000,
    stopOnHover: true,
    pagination: false
});
/* ----------------------------------------------------------- */
/*  8. BREADCRUMB
 /* ----------------------------------------------------------- */
$(document).ready(function () {
    $('#brand-link').css({'height': $('#brand-information').innerHeight()});
    $(window).resize(function () {
        if ($(window).width() > 991) {
            $('#brand-link').css({'height': $('#brand-information').innerHeight()});
        } else {
            $('#brand-link').css({'height': "auto"});
        }
    });
    $(this).find('.brand .link li').hover(function () {
        $(this).children('a').css({'color': "#000", 'font-weight': "bold"});
    });
    $(this).find('.brand .link li').focus(function () {
        $(this).children('a').css({'color': "#000", 'font-weight': "bold"});
    });
    $(this).find('.brand .link li').mouseleave(function () {
        $(this).children('a').css({'color': "#FFF", 'font-weight': "normal"});
    });
});
/* ----------------------------------------------------------- */
/*  9. SWAP IMAGE OF PRODUCT 
 /* ----------------------------------------------------------- */

$('.thumbs img').click(function () {
    var thmb = this;
    var src = this.src;
    $('.main_pic img').fadeOut(400, function () {
        $(this).fadeIn(400)[0].src = src;
    });
});

$(document).ready(function () {
    var tn_array = Array();
    var newsrc;
    var index;
    $('.thumbs img').each(function () {
        tn_array.push($(this).attr('src'));
    });
    var size = tn_array.length;
    var src = $('.main_pic img').attr('src');
    for (var i = 0; i < size - 1; i++) {
        if (src === tn_array[i]) {
            index = i;
        }
    }
    $('#next span.icon').click(function () {
        index += 1;
        if (index === size) {
            index = 0;
        }
        newsrc = tn_array[index];
        $('.main_pic img').fadeOut(400, function () {
            $(this).fadeIn(400)[0].src = newsrc;
        });
    });
    $('#previous span.icon').click(function () {
        index -= 1;
        if (index <= 0) {
            index = size -1;
        }
        newsrc = tn_array[index];
        $('.main_pic img').fadeOut(400, function () {
            $(this).fadeIn(400)[0].src = newsrc;
        });
    });
});