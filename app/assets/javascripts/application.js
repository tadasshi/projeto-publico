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
//= require jquery_ujs
//  require turbolinks
//= require_self
//= require_tree .

app = angular.module('masteringpnl', []);

$("#new_newsletter").on("ajax:success", function(e, data, status, xhr) {
    $('#newsletter_success').modal();
    return $(this).find("input[type=text],input[type=email], textarea").val("");
}).on("ajax:error", function(e, xhr, status, error) {
    $('#newsletter_error').modal();
    return $("input[type=text], textarea").val("");
});