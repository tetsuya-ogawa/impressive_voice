// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require admin-lte/bootstrap/js/bootstrap
//= require admin-lte/dist/js/app.js
//= require cocoon
//= require select2
//= require jquery.sidr.min
//= require_tree .


$(function() {
    $('.date').datepicker({
        format: 'yy/mm/dd',
        locale: 'ja'
    });
});

console.log('test');

$('.search').select2({
    width: 130
});

$(function(){
    $("#get").click(function(){
        alert($("#number_person").val());
        return false;
    });
});

$(function(){
    $(".search_start").click(function(){
        setTimeout(function(){
            $('.search').select2({
                width: 130
            })
        },0);
    })
});