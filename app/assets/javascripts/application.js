// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-material-design
//= require underscore
//= require gmaps/google
//= require_tree .

$(function () {
    "use strict";
    var $bgobj = $(".ha-bg-parallax"); // assigning the object
    $(window).on("scroll", function () {
        var yPos = -($(window).scrollTop() / $bgobj.data('speed'));
        // Put together our final background position
        var coords = '100% ' + yPos + 'px';
        // Move the background
        $bgobj.css({ backgroundPosition: coords });
    });
        $('div.product-chooser').not('.disabled').find('div.product-chooser-item').on('click', function(){
		$(this).parent().parent().find('div.product-chooser-item').removeClass('selected');
		$(this).addClass('selected');
		$(this).find('input[type="radio"]').prop("checked", true);
	});
});

$(document).on('scroll', function (e) {
    $('.navbar').css('opacity', ($(document).scrollTop() / 500));
});
